import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/datasource/models/user_model.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/test_table_model.dart';
import '../../data/repository/test_table_repo.dart';

part 'test_table_event.dart';
part 'test_table_state.dart';
part 'test_table_bloc.g.dart';
part 'test_table_bloc.freezed.dart';

/// Bloc danh sách và form đăng ký bàn test ESL.
@injectable
class TestTableBloc extends BaseBloc<TestTableEvent, TestTableState> {
  final LogUtils _log;
  final TestTableRepo _repo;
  final AuthRepo _authRepo;

  /// Cờ chống submit trùng — tương tự pattern TechBloc.
  bool _isSavingRegistration = false;

  /// Key cache cho QR lookup — tránh xử lý trùng input khi camera detect
  /// cùng QR nhiều lần liên tiếp. Không đưa vào state vì chỉ là cache
  /// nội bộ của bloc.
  String? _lastQrLookupKey;

  TestTableBloc(this._log, this._repo, this._authRepo)
    : super(TestTableState.init()) {
    on<TestTableEvent>((event, emit) async {
      await event.when(
        // ===== Danh sách =====
        init: () => _onInit(emit),
        refresh: () => _onRefresh(emit),
        changeKeyword: (keyword) => _onChangeKeyword(emit, keyword: keyword),
        changeStatus: (status) => _onChangeStatus(emit, status: status),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),

        // ===== Form đăng ký =====
        initAdd: (prefillTestTableId) =>
            _onInitAdd(emit, prefillTestTableId: prefillTestTableId),
        updateForm:
            (
              project,
              testTableId,
              selectedMachineIds,
              ownerId,
              approverId,
              startDate,
              clearProject,
              clearTestTableId,
              clearSelectedMachineIds,
              clearOwnerId,
              clearApproverId,
              clearStartDate,
            ) => _onUpdateForm(
              emit,
              project: project,
              testTableId: testTableId,
              selectedMachineIds: selectedMachineIds,
              ownerId: ownerId,
              approverId: approverId,
              startDate: startDate,
              clearProject: clearProject,
              clearTestTableId: clearTestTableId,
              clearSelectedMachineIds: clearSelectedMachineIds,
              clearOwnerId: clearOwnerId,
              clearApproverId: clearApproverId,
              clearStartDate: clearStartDate,
            ),
        checkConflict: () => _onCheckConflict(emit),
        submitRegistration: () => _onSubmitRegistration(emit),
        resetSubmitFlags: () => _onResetSubmitFlags(emit),
        loadTestMachines: (testTableId) =>
            _onLoadTestMachines(emit, testTableId: testTableId),

        // ===== QR / Deep link =====
        findTestTableByBarcode: (barcode, tableSide) =>
            _onFindTestTableByBarcode(
              emit,
              barcode: barcode,
              tableSide: tableSide,
            ),

        // ===== Delete (swipe-to-delete) =====
        deleteCard: (masterId) => _onDeleteCard(emit, masterId: masterId),
        clearDeleteFeedback: () => _onClearDeleteFeedback(emit),

        // ===== Return (trả bàn) =====
        returnCard: (registrationId, returnBy) => _onReturnCard(
          emit,
          registrationId: registrationId,
          returnBy: returnBy,
        ),
        clearReturnFeedback: () => _onClearReturnFeedback(emit),

        // ===== Extend / Handover (gia hạn / bàn giao) =====
        extendHandoverSubmit:
            (registrationId, startDate, endDate, ownerId, approverId, type) =>
                _onExtendHandoverSubmit(
                  emit,
                  registrationId: registrationId,
                  startDate: startDate,
                  endDate: endDate,
                  ownerId: ownerId,
                  approverId: approverId,
                  type: type,
                ),
        clearExtendHandoverFeedback: () => _onClearExtendHandoverFeedback(emit),

        // ===== Edit =====
        initEdit: (registrationId, cardItem) => _onInitEdit(
          emit,
          registrationId: registrationId,
          cardItem: cardItem,
        ),
        editSubmit: () => _onEditSubmit(emit),
      );
    }, transformer: (events, mapper) => events.asyncExpand(mapper));
  }

  // =================================================================
  // ============== Danh sách (màn List) ============================
  // =================================================================

  Future<void> _onInit(Emitter<TestTableState> emit) async {
    _lastQrLookupKey = null;
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        message: null,
        // Reset lookup để buộc re-fetch → tránh bỏ qua list khi cache hit.
        lookupFetched: false,
      ),
    );
    // Lấy currentUser trước để BE lọc theo employeeId.
    await _ensureCurrentUser(emit);
    await _fetchTestCards(emit);
    // Tải luôn lookup data để màn add dùng được ngay khi user bấm "Thêm".
    await _ensureLookupData(emit);
  }

  Future<void> _onRefresh(Emitter<TestTableState> emit) async {
    _lastQrLookupKey = null;
    emit(state.copyWith(status: BaseStateStatus.loading, message: null));
    await _ensureCurrentUser(emit);
    await _fetchTestCards(emit);
  }

  Future<void> _onChangeKeyword(
    Emitter<TestTableState> emit, {
    required String keyword,
  }) async {
    emit(
      state.copyWith(
        keyword: keyword,
        status: BaseStateStatus.loading,
        message: null,
      ),
    );
    await _ensureCurrentUser(emit);
    await _fetchTestCards(emit);
  }

  Future<void> _onChangeStatus(
    Emitter<TestTableState> emit, {
    required int status,
  }) async {
    emit(
      state.copyWith(
        statusFilter: status,
        status: BaseStateStatus.loading,
        message: null,
      ),
    );
    await _fetchTestCards(emit);
  }

  Future<void> _onChangeDateRange(
    Emitter<TestTableState> emit, {
    DateTime? dateStart,
    DateTime? dateEnd,
  }) async {
    emit(
      state.copyWith(
        dateStart: dateStart,
        dateEnd: dateEnd,
        status: BaseStateStatus.loading,
        message: null,
      ),
    );
    await _fetchTestCards(emit);
  }

  /// Format DateTime thành `yyyy-MM-dd` cho query API (bỏ phần giờ).
  static String _dateOnly(DateTime d) {
    final dd = DateTime(d.year, d.month, d.day);
    final mm = dd.month.toString().padLeft(2, '0');
    final day = dd.day.toString().padLeft(2, '0');
    return '${dd.year}-$mm-$day';
  }

  /// Lấy currentUser nếu state chưa có (cache để khỏi gọi lại).
  /// Fail thì giữ nguyên currentUser=null — lúc đó BE sẽ trả tất cả phiếu.
  Future<void> _ensureCurrentUser(Emitter<TestTableState> emit) async {
    if (state.currentUser != null) return;
    final res = await _authRepo.getCurrentUser();
    final user = res.getOrElse(() => null);
    if (user != null) {
      emit(state.copyWith(currentUser: user));
    }
  }

  Future<void> _fetchTestCards(Emitter<TestTableState> emit) async {
    final start = state.dateStart;
    final end = state.dateEnd;
    final result = await _repo.getTestCardItem(
      keyword: state.keyword,
      employeeId: state.currentUser?.employeeId ?? 0,
      status: state.statusFilter,
      startDate: start == null ? '' : _dateOnly(start),
      endDate: end == null ? '' : _dateOnly(end),
    );

    await result.fold(
      (error) async {
        _log.logE('Get test tables failed: $error');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: error.getErrorMessage,
            testCard: const [],
          ),
        );
      },
      (items) async {
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            testCard: items,
            message: null,
          ),
        );
      },
    );
  }

  // =================================================================
  // ============== Lookup data (cache) ==============================
  // =================================================================

  /// Tải các lookup cần cho form add nếu chưa có.
  /// Trả về `true` nếu cache đã có sẵn, `false` nếu vừa tải xong.
  Future<bool> _ensureLookupData(Emitter<TestTableState> emit) async {
    if (state.lookupFetched) return true;

    // Tải 4 lookup song song; từng cái có thể fail độc lập — fallback [].
    final testTableRes = await _repo.getTestTableItem();
    final employeeRes = await _repo.getEmployeeInfoItem();
    final projectRes = await _repo.getProjectItem();
    final approverRes = await _repo.getApproverItem();

    final testTable = testTableRes.getOrElse(() => <TestTableItem>[]);
    final employee = employeeRes.getOrElse(() => <EmployeeInfoItem>[]);
    final project = projectRes.getOrElse(() => <ProjectItem>[]);
    final approver = approverRes.getOrElse(() => <ApproverItem>[]);

    emit(
      state.copyWith(
        testTable: testTable,
        employee: employee,
        project: project,
        approver: approver,
        lookupFetched: true,
      ),
    );
    return false;
  }

  // =================================================================
  // ============== Form đăng ký (màn Add) ==========================
  // =================================================================

  Future<void> _onInitAdd(
    Emitter<TestTableState> emit, {
    int? prefillTestTableId,
  }) async {
    emit(
      state.copyWith(
        conflictMessage: null,
        conflictPassed: false,
        submitSuccess: false,
        isSubmitting: false,
        testMachines: const [],
        isLoadingTestMachines: false,
        // Reset form data: clear machine đã chọn từ session trước.
        formData: state.formData.copyWith(
          clearSelectedMachineIds: true,
          clearTestTableId: true,
        ),
      ),
    );

    // 1. Đảm bảo đã có lookup data (cache từ list, hoặc tải mới).
    await _ensureLookupData(emit);

    // 2. Lấy currentUser để mặc định Người đăng ký (nếu form chưa có).
    User? user = state.currentUser;
    if (user == null) {
      final userRes = await _authRepo.getCurrentUser();
      user = userRes.getOrElse(() => null);
    }

    // 3. Auto-set owner = currentUser nếu form chưa chọn ai.
    var newForm = state.formData;
    if (user != null && newForm.ownerId == null) {
      newForm = newForm.copyWith(ownerId: user.employeeId);
    }

    // 4. Nếu có prefillTestTableId (vd từ QR scan), set luôn vào form.
    if (prefillTestTableId != null) {
      newForm = newForm.copyWith(testTableId: prefillTestTableId);
      // Đồng thời load máy test của bàn đó để UI hiển thị sẵn.
      add(TestTableEvent.loadTestMachines(testTableId: prefillTestTableId));
    }

    emit(
      state.copyWith(
        currentUser: user ?? state.currentUser,
        formData: newForm,
        status: BaseStateStatus.success,
      ),
    );
  }

  // =================================================================
  // ============== QR / Deep link ==================================
  // =================================================================

  /// Tra cứu bàn test theo [barcode] + [tableSide] trong cache lookup.
  /// So khớp `Barcode` không phân biệt hoa/thường, đã trim.
  /// Kết quả đổ vào `state.foundTestTable` + `state.qrLookupMessage`.
  /// Reset cả 2 field ở đầu handler để đảm bảo state thay đổi
  /// mỗi lần scan → `BlocListener` luôn trigger.
  /// Bỏ qua nếu cùng input với lần tra trước (camera detect cùng QR).
  Future<void> _onFindTestTableByBarcode(
    Emitter<TestTableState> emit, {
    required String barcode,
    required int tableSide,
  }) async {
    final normalized = barcode.trim().toLowerCase();
    final key = '$normalized|$tableSide';

    // Cùng input → bỏ qua để tránh emit thừa + gọi API lookup lặp.
    // Key sẽ được reset khi emit kết quả → cho phép user thử lại.
    if (_lastQrLookupKey == key) return;
    _lastQrLookupKey = key;

    // Reset ngay để state luôn thay đổi (kể cả khi kết quả giống lần trước).
    emit(state.copyWith(qrLookupMessage: null, foundTestTable: null));

    // Đảm bảo có lookup data để tra — gọi API nếu cache rỗng.
    await _ensureLookupData(emit);

    if (normalized.isEmpty) {
      emit(state.copyWith(qrLookupMessage: 'Mã QR không hợp lệ'));
      return;
    }

    final match = state.testTable.where((t) {
      final bc = (t.barcode ?? '').trim().toLowerCase();
      return bc == normalized && t.tableSide == tableSide;
    }).toList();

    if (match.isEmpty) {
      // Reset key để user có thể quét lại cùng QR.
      _lastQrLookupKey = null;
      emit(state.copyWith(qrLookupMessage: 'Không tìm thấy bàn test'));
      return;
    }

    final found = match.first;
    if (found.isRegistrated == 1) {
      // Reset key để user có thể quét lại sau khi bàn được giải phóng.
      _lastQrLookupKey = null;
      emit(
        state.copyWith(
          foundTestTable: found,
          qrLookupMessage: 'Bàn đang được sử dụng',
        ),
      );
      return;
    }

    // Thành công — không reset key, tránh navigate 2 lần.
    emit(state.copyWith(foundTestTable: found, qrLookupMessage: null));
  }

  _onUpdateForm(
    Emitter<TestTableState> emit, {
    ProjectItem? project,
    int? testTableId,
    List<int>? selectedMachineIds,
    int? ownerId,
    int? approverId,
    DateTime? startDate,
    bool clearProject = false,
    bool clearTestTableId = false,
    bool clearSelectedMachineIds = false,
    bool clearOwnerId = false,
    bool clearApproverId = false,
    bool clearStartDate = false,
  }) {
    final prev = state.formData;
    final nextProject = clearProject ? null : (project ?? prev.project);

    // `registrationContent` derive từ project.projectName — UI không nhập tay.
    final nextContent = nextProject?.projectName;

    final next = prev.copyWith(
      project: nextProject,
      testTableId: testTableId,
      selectedMachineIds: selectedMachineIds,
      ownerId: ownerId,
      approverId: approverId,
      startDate: startDate,
      registrationContent: nextContent,
      clearProject: clearProject,
      clearTestTableId: clearTestTableId,
      clearSelectedMachineIds: clearSelectedMachineIds,
      clearOwnerId: clearOwnerId,
      clearApproverId: clearApproverId,
      clearStartDate: clearStartDate,
      clearRegistrationContent: clearProject,
    );

    // Reset cờ conflict khi form đổi — phải check lại.
    final conflictChanged = prev != next;
    emit(
      state.copyWith(
        formData: next.copyWith(
          // Khi clear testTableId → clear luôn machine đã chọn.
          clearSelectedMachineIds: clearTestTableId,
        ),
        conflictMessage: conflictChanged ? null : state.conflictMessage,
        conflictPassed: conflictChanged ? false : state.conflictPassed,
        message: null,
        testMachines: clearTestTableId ? const [] : state.testMachines,
      ),
    );

    // Nếu testTableId đổi → tải máy test của bàn mới.
    final prevTableId = prev.testTableId;
    final nextTableId = next.testTableId;
    if (nextTableId != null && nextTableId != prevTableId) {
      // ignore: invalid_use_of_visible_for_testing_member
      add(TestTableEvent.loadTestMachines(testTableId: nextTableId));
    }
  }

  Future<void> _onCheckConflict(Emitter<TestTableState> emit) async {
    final form = state.formData;
    if (!form.isReady) {
      emit(
        state.copyWith(
          status: BaseStateStatus.failed,
          message: 'Vui lòng nhập đầy đủ thông tin trước khi kiểm tra.',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        isSubmitting: true,
        status: BaseStateStatus.loading,
        message: null,
        conflictMessage: null,
        conflictPassed: false,
      ),
    );

    final res = await _repo.checkConflict(
      payload: {
        'testTableId': form.testTableId,
        'startDate': _dateOnly(form.startDate!),
        'endDate': _dateOnly(form.endDate!),
      },
    );

    await res.fold(
      (error) async {
        _log.logE('Check conflict failed: $error');
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            conflictPassed: false,
            conflictMessage: null,
            message: error.getErrorMessage,
          ),
        );
      },
      (message) async {
        // BE trả về message trong `data` (string). Nếu rỗng coi như trùng.
        final hasConflict =
            (message ?? '').trim().isNotEmpty && !_isNoConflict(message);
        emit(
          state.copyWith(
            isSubmitting: false,
            status: hasConflict
                ? BaseStateStatus.failed
                : BaseStateStatus.success,
            conflictMessage: message,
            conflictPassed: !hasConflict,
            message: hasConflict
                ? message
                : 'Không trùng lặp, có thể lưu phiếu.',
          ),
        );
      },
    );
  }

  Future<void> _onSubmitRegistration(Emitter<TestTableState> emit) async {
    if (_isSavingRegistration) return;
    _isSavingRegistration = true;

    final form = state.formData;
    if (!form.isReady) {
      _isSavingRegistration = false;
      emit(
        state.copyWith(
          status: BaseStateStatus.failed,
          message: 'Vui lòng nhập đầy đủ thông tin trước khi lưu.',
        ),
      );
      return;
    }

    try {
      emit(
        state.copyWith(
          isSubmitting: true,
          status: BaseStateStatus.loading,
          message: null,
          conflictMessage: null,
        ),
      );

      // Bước 1: gọi check-conflict trước.
      final conflictRes = await _repo.checkConflict(
        payload: {
          'testTableId': form.testTableId,
          'startDate': _dateOnly(form.startDate!),
          'endDate': _dateOnly(form.endDate!),
        },
      );

      final conflictError = conflictRes.fold((error) => error, (_) => null);
      if (conflictError != null) {
        _log.logE('Check conflict failed (pre-save): $conflictError');
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            submitSuccess: false,
            conflictPassed: false,
            conflictMessage: conflictError.getErrorMessage,
            message: conflictError.getErrorMessage,
          ),
        );
        return;
      }

      final conflictMessage = conflictRes.getOrElse(() => null);
      final hasConflict =
          (conflictMessage ?? '').trim().isNotEmpty &&
          !_isNoConflict(conflictMessage);

      if (hasConflict) {
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            submitSuccess: false,
            conflictPassed: false,
            conflictMessage: conflictMessage,
            message: conflictMessage,
          ),
        );
        return;
      }

      // Bước 2: pass → save registration.
      // Lưu ý: API yêu cầu `MachineIDs` là List<int>, không phải chuỗi CSV.
      final payload = <String, dynamic>{
        'ID': form.editRegistrationId ?? 0,
        'No': form.editNo ?? 1,
        'Type': form.editType ?? 1,
        'Status': form.editStatus ?? 0,
        'IsDelete': form.editIsDelete,
        'ProjectID': form.project!.id,
        'ProjectCode': form.project!.projectCode,
        'TestTableID': form.testTableId,
        'MachineIDs': form.selectedMachineIds,
        'OwnerID': form.ownerId,
        'ApproverID': form.approverId,
        'StartDate': _dateOnly(form.startDate!),
        'EndDate': _dateOnly(form.endDate!),
        'RegistrationContent': form.registrationContent ?? '',
      };

      final res = await _repo.saveRegistration(payload: payload);

      await res.fold(
        (error) async {
          _log.logE('Save registration failed: $error');
          emit(
            state.copyWith(
              isSubmitting: false,
              status: BaseStateStatus.failed,
              submitSuccess: false,
              conflictPassed: true,
              message: error.getErrorMessage,
            ),
          );
        },
        (createdId) async {
          _log.logI('Save registration success: id=$createdId');
          emit(
            state.copyWith(
              isSubmitting: false,
              status: BaseStateStatus.success,
              submitSuccess: true,
              conflictPassed: true,
              createdId: createdId,
              message: 'Đăng ký bàn test thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('Save registration exception: $e');
      emit(
        state.copyWith(
          isSubmitting: false,
          status: BaseStateStatus.failed,
          submitSuccess: false,
          message: 'Có lỗi xảy ra, vui lòng thử lại',
        ),
      );
    } finally {
      _isSavingRegistration = false;
    }
  }

  _onResetSubmitFlags(Emitter<TestTableState> emit) {
    emit(
      state.copyWith(
        submitSuccess: false,
        createdId: 0,
        conflictMessage: null,
        conflictPassed: false,
        isSubmitting: false,
        message: null,
        status: BaseStateStatus.init,
      ),
    );
  }

  // =================================================================
  // ============== Xóa phiếu (swipe-to-delete) ====================
  // =================================================================

  /// Reset cờ deleteFeedback sau khi UI đã show snackbar.
  _onClearDeleteFeedback(Emitter<TestTableState> emit) {
    emit(
      state.copyWith(
        deleteSuccess: false,
        deleteError: null,
        isDeleting: false,
      ),
    );
  }

  /// Reset cờ returnFeedback sau khi UI đã show snackbar.
  _onClearReturnFeedback(Emitter<TestTableState> emit) {
    emit(state.copyWith(returnSuccess: false, returnError: null));
  }

  // ===== Return (trả bàn — chỉ phiếu đã duyệt) ===========
  // =================================================================

  /// Trả bàn test: gọi API return, refresh list khi thành công.
  Future<void> _onReturnCard(
    Emitter<TestTableState> emit, {
    required int registrationId,
    required int returnBy,
  }) async {
    if (state.returningIds.contains(registrationId)) return;

    final newReturningIds = {...state.returningIds, registrationId};
    emit(
      state.copyWith(
        returningIds: newReturningIds,
        returnError: null,
        returnSuccess: false,
      ),
    );

    final res = await _repo.returnRegistration(
      registrationId: registrationId,
      returnBy: returnBy,
    );
    res.fold(
      (error) {
        _log.logE('Return card failed: $error');
        final updatedReturning = {...state.returningIds}
          ..remove(registrationId);
        emit(
          state.copyWith(
            returningIds: updatedReturning,
            returnSuccess: false,
            returnError: error.getErrorMessage,
          ),
        );
      },
      (_) {
        _log.logI('Return card success: registrationId=$registrationId');
        final updatedReturning = {...state.returningIds}
          ..remove(registrationId);
        // Bỏ card khỏi list (vì đã trả → phiếu không còn trong danh sách chờ duyệt).
        final remainingCards = state.testCard
            .where((c) => c.id != registrationId)
            .toList();
        emit(
          state.copyWith(
            testCard: remainingCards,
            returningIds: updatedReturning,
            returnSuccess: true,
          ),
        );
      },
    );
  }

  // =================================================================
  // ============== Extend / Handover (chỉ phiếu đã duyệt) =========
  // =================================================================

  /// Gửi yêu cầu gia hạn / bàn giao — chờ duyệt (status = 0).
  /// Backend sẽ tạo detail mới và gắn vào cùng registrationId.
  Future<void> _onExtendHandoverSubmit(
    Emitter<TestTableState> emit, {
    required int registrationId,
    required String startDate,
    required String endDate,
    required int ownerId,
    required int approverId,
    required int type,
  }) async {
    emit(
      state.copyWith(
        isSubmitting: true,
        submitSuccess: false,
        extendHandoverSuccess: false,
        extendHandoverError: null,
        message: null,
      ),
    );

    final res = await _repo.extendHandoverRegistration(
      registrationId: registrationId,
      startDate: startDate,
      endDate: endDate,
      ownerId: ownerId,
      approverId: approverId,
      type: type,
    );
    res.fold(
      (error) {
        _log.logE('Extend/handover failed: $error');
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            extendHandoverSuccess: false,
            extendHandoverError: error.getErrorMessage,
          ),
        );
      },
      (_) {
        _log.logI(
          'Extend/handover success: registrationId=$registrationId, type=$type',
        );
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            extendHandoverSuccess: true,
          ),
        );
      },
    );
  }

  /// Reset cờ extendHandover feedback sau khi UI đã xử lý.
  _onClearExtendHandoverFeedback(Emitter<TestTableState> emit) {
    emit(
      state.copyWith(
        extendHandoverSuccess: false,
        extendHandoverError: null,
        message: null,
      ),
    );
  }

  // =================================================================
  // ============== Edit (màn edit) ================================
  // =================================================================

  /// Tải chi tiết phiếu card từ API và populate form data.
  Future<void> _onInitEdit(
    Emitter<TestTableState> emit, {
    required int registrationId,
    TestCardItem? cardItem,
  }) async {
    emit(
      state.copyWith(
        isLoadingDetail: true,
        status: BaseStateStatus.loading,
        message: null,
        testCardDetail: const [],
      ),
    );

    // 1. Đảm bảo đã có lookup data.
    await _ensureLookupData(emit);

    // 2. Gọi API lấy chi tiết phiếu card.
    final res = await _repo.getTestCardDetails(registrationId: registrationId);

    await res.fold(
      (error) async {
        _log.logE('Get test card detail failed: $error');
        emit(
          state.copyWith(
            isLoadingDetail: false,
            status: BaseStateStatus.failed,
            message: error.getErrorMessage,
          ),
        );
      },
      (details) async {
        if (details.isEmpty) {
          emit(
            state.copyWith(
              isLoadingDetail: false,
              status: BaseStateStatus.failed,
              message: 'Không tìm thấy chi tiết phiếu',
            ),
          );
          return;
        }

        // Lấy detail đầu tiên (thường chỉ có 1 item).
        final detail = details.first;

        // Ưu tiên lấy từ cardItem (list), fallback sang detail API.
        final projectId = detail.projectId ?? cardItem?.projectId;
        final projectCode = detail.projectCode ?? cardItem?.projectCode;
        final registrationContent =
            detail.registrationContent ?? cardItem?.registrationContent;
        final testTableId = detail.testTableId ?? cardItem?.testTableId;
        final ownerId = detail.ownerId ?? cardItem?.ownerId;
        final approverId = detail.approverId ?? cardItem?.approverId;

        // Tìm project từ cache lookup.
        final project = state.project.firstWhere(
          (p) => p.id == projectId,
          orElse: () => ProjectItem(
            id: projectId,
            projectCode: projectCode,
            projectName: registrationContent,
          ),
        );

        // Parse ngày.
        DateTime? startDate;
        if (detail.startDate != null) {
          startDate = DateTime(
            detail.startDate!.year,
            detail.startDate!.month,
            detail.startDate!.day,
          );
        } else if (cardItem?.registrationStartDate != null) {
          startDate = DateTime(
            cardItem!.registrationStartDate!.year,
            cardItem.registrationStartDate!.month,
            cardItem.registrationStartDate!.day,
          );
        }

        // Build form data từ detail.
        final formData = TestTableFormData(
          project: project,
          testTableId: testTableId,
          selectedMachineIds: detail.machineIds ?? const [],
          ownerId: ownerId,
          approverId: approverId,
          startDate: startDate,
          registrationContent: registrationContent,
          // Edit-specific fields
          editRegistrationId: registrationId,
          editDetailId: detail.id,
          editNo: detail.no,
          editType: detail.type,
          editStatus: detail.status,
          editIsDelete: detail.isDelete ?? false,
        );

        // Nếu có testTableId, load máy test.
        if (testTableId != null) {
          add(TestTableEvent.loadTestMachines(testTableId: testTableId));
        }

        emit(
          state.copyWith(
            isLoadingDetail: false,
            status: BaseStateStatus.success,
            testCardDetail: details,
            formData: formData,
            message: null,
          ),
        );
      },
    );
  }

  // =================================================================
  // ============== Edit Submit (cập nhật phiếu) =====================
  // =================================================================

  /// Submit cập nhật phiếu đăng ký từ màn edit.
  /// Pattern giống LunchBloc._onEditSubmit và _onSubmitRegistration (add).
  Future<void> _onEditSubmit(Emitter<TestTableState> emit) async {
    if (_isSavingRegistration) return;
    _isSavingRegistration = true;

    final form = state.formData;
    if (!form.isReady) {
      _isSavingRegistration = false;
      emit(
        state.copyWith(
          status: BaseStateStatus.failed,
          message: 'Vui lòng nhập đầy đủ thông tin trước khi lưu.',
        ),
      );
      return;
    }

    try {
      emit(
        state.copyWith(
          isSubmitting: true,
          status: BaseStateStatus.loading,
          submitSuccess: false,
          message: null,
          conflictMessage: null,
        ),
      );

      // Bước 1: gọi check-conflict trước (giống flow add).
      // Khi edit: truyền excludeDetailId để BE bỏ qua phiếu hiện tại,
      // tránh báo trùng lặp với chính nó.
      final conflictPayload = <String, dynamic>{
        'testTableId': form.testTableId,
        'startDate': _dateOnly(form.startDate!),
        'endDate': _dateOnly(form.endDate!),
      };
      if (form.isEditMode && form.editDetailId != null) {
        conflictPayload['excludeDetailId'] = form.editDetailId;
      }
      final conflictRes = await _repo.checkConflict(payload: conflictPayload);

      final conflictError = conflictRes.fold((error) => error, (_) => null);
      if (conflictError != null) {
        _log.logE('Check conflict failed (pre-save edit): $conflictError');
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            submitSuccess: false,
            conflictPassed: false,
            conflictMessage: conflictError.getErrorMessage,
            message: conflictError.getErrorMessage,
          ),
        );
        return;
      }

      final conflictMessage = conflictRes.getOrElse(() => null);
      final hasConflict =
          (conflictMessage ?? '').trim().isNotEmpty &&
          !_isNoConflict(conflictMessage);

      if (hasConflict) {
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            submitSuccess: false,
            conflictPassed: false,
            conflictMessage: conflictMessage,
            message: conflictMessage,
          ),
        );
        return;
      }

      // Bước 2: pass → save (update) registration.
      // Tính EndDate = StartDate + 7 ngày (theo payload BE yêu cầu).
      final startDate = form.startDate ?? DateTime.now();
      final endDate = DateTime(
        startDate.year,
        startDate.month,
        startDate.day,
      ).add(const Duration(days: 7));

      final payload = <String, dynamic>{
        'ID': form.editRegistrationId ?? 0,
        'TestTableID': form.testTableId,
        'OwnerID': form.ownerId,
        'ApproverID': form.approverId,
        'ProjectCode': form.project?.projectCode,
        'ProjectID': form.project?.id,
        'RegistrationContent':
            form.project?.projectName ?? form.registrationContent,
        'StartDate': DateFormat('yyyy-MM-dd').format(startDate),
        'EndDate': DateFormat('yyyy-MM-dd').format(endDate),
        'MachineIDs': form.selectedMachineIds,
        'IsDelete': form.editIsDelete,
        'Status': form.editStatus ?? 0,
        'Type': form.editType ?? 1,
        'No': form.editNo ?? 1,
      };

      _log.logI('Edit submit payload: $payload');

      final res = await _repo.saveRegistration(payload: payload);
      await res.fold(
        (error) async {
          _log.logE('Edit submit failed: $error');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: false,
              status: BaseStateStatus.failed,
              message: error.getErrorMessage,
            ),
          );
        },
        (_) async {
          _log.logI('Edit submit success');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              message: 'Cập nhật phiếu thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('Edit submit exception: $e');
      emit(
        state.copyWith(
          isSubmitting: false,
          submitSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Có lỗi xảy ra khi cập nhật phiếu',
        ),
      );
    } finally {
      _isSavingRegistration = false;
      _log.logI('End edit submit');
    }
  }

  /// Xóa phiếu đăng ký. Pattern giống LunchBloc: đánh dấu isDeleting,
  /// gọi API, cập nhật deleteSuccess khi xong.
  Future<void> _onDeleteCard(
    Emitter<TestTableState> emit, {
    required int masterId,
  }) async {
    if (state.isDeleting || state.deletingIds.contains(masterId)) return;

    final newDeletingIds = {...state.deletingIds, masterId};
    emit(
      state.copyWith(
        deletingIds: newDeletingIds,
        isDeleting: true,
        deleteError: null,
        deleteSuccess: false,
      ),
    );

    final res = await _repo.deleteRegistration(masterId: masterId);
    res.fold(
      (error) {
        _log.logE('Delete registration failed: $error');
        final updatedDeleting = {...state.deletingIds}..remove(masterId);
        emit(
          state.copyWith(
            deletingIds: updatedDeleting,
            isDeleting: false,
            deleteSuccess: false,
            deleteError: error.getErrorMessage,
            status: BaseStateStatus.failed,
          ),
        );
      },
      (_) {
        final updatedDeleting = {...state.deletingIds}..remove(masterId);
        // Bỏ card khỏi state ngay để tránh Slidable rebuild lại với cùng key.
        final remainingCards = state.testCard
            .where((c) => c.id != masterId)
            .toList();
        emit(
          state.copyWith(
            testCard: remainingCards,
            deletingIds: updatedDeleting,
            isDeleting: false,
            deleteSuccess: true,
            status: BaseStateStatus.success,
          ),
        );
      },
    );
  }

  // =================================================================
  // ============== Máy test (theo bàn test đã chọn) ================
  // =================================================================

  Future<void> _onLoadTestMachines(
    Emitter<TestTableState> emit, {
    required int testTableId,
  }) async {
    emit(state.copyWith(isLoadingTestMachines: true, testMachines: const []));

    final res = await _repo.getTestMachineByTable(testTableId: testTableId);
    res.fold(
      (error) {
        _log.logE('Load test machines failed: $error');
        emit(
          state.copyWith(isLoadingTestMachines: false, testMachines: const []),
        );
      },
      (machines) {
        emit(
          state.copyWith(isLoadingTestMachines: false, testMachines: machines),
        );
      },
    );
  }

  // =================================================================
  // ===================== Helpers ===================================
  // =================================================================

  /// Nhận diện message "không trùng lặp" từ BE.
  /// BE thường trả về: "Không trùng lặp", "Khong trung lap"...
  bool _isNoConflict(String? message) {
    if (message == null) return false;
    final m = message.toLowerCase().trim();
    return m.contains('không trùng') ||
        m.contains('khong trung') ||
        m.contains('không có xung đột') ||
        m.contains('ok') ||
        m == 'success';
  }
}
