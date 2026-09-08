import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
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

  TestTableBloc(this._log, this._repo, this._authRepo)
      : super(TestTableState.init()) {
    on<TestTableEvent>(
      (event, emit) async {
        await event.when(
          // ===== Danh sách =====
          init: () => _onInit(emit),
          refresh: () => _onRefresh(emit),
          changeKeyword: (keyword) =>
              _onChangeKeyword(emit, keyword: keyword),

          // ===== Form đăng ký =====
          initAdd: () => _onInitAdd(emit),
          updateForm: (
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
          ) =>
              _onUpdateForm(
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
        );
      },
      transformer: (events, mapper) => events.asyncExpand(mapper),
    );
  }

  // =================================================================
  // ============== Danh sách (màn List) ============================
  // =================================================================

  Future<void> _onInit(Emitter<TestTableState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading, message: null));
    // Lấy currentUser trước để BE lọc theo employeeId.
    await _ensureCurrentUser(emit);
    await _fetchTestCards(emit);
    // Tải luôn lookup data để màn add dùng được ngay khi user bấm "Thêm".
    await _ensureLookupData(emit);
  }

  Future<void> _onRefresh(Emitter<TestTableState> emit) async {
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
    final result = await _repo.getTestCardItem(
      keyword: state.keyword,
      employeeId: state.currentUser?.employeeId ?? 0,
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

    emit(state.copyWith(
      testTable: testTable,
      employee: employee,
      project: project,
      approver: approver,
      lookupFetched: true,
    ));
    return false;
  }

  // =================================================================
  // ============== Form đăng ký (màn Add) ==========================
  // =================================================================

  Future<void> _onInitAdd(Emitter<TestTableState> emit) async {
    emit(state.copyWith(
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
    ));

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

    emit(state.copyWith(
      currentUser: user ?? state.currentUser,
      formData: newForm,
      status: BaseStateStatus.success,
    ));
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
    emit(state.copyWith(
      formData: next.copyWith(
        // Khi clear testTableId → clear luôn machine đã chọn.
        clearSelectedMachineIds: clearTestTableId,
      ),
      conflictMessage: conflictChanged ? null : state.conflictMessage,
      conflictPassed: conflictChanged ? false : state.conflictPassed,
      message: null,
      testMachines: clearTestTableId ? const [] : state.testMachines,
    ));

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
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: 'Vui lòng nhập đầy đủ thông tin trước khi kiểm tra.',
      ));
      return;
    }

    emit(state.copyWith(
      isSubmitting: true,
      status: BaseStateStatus.loading,
      message: null,
      conflictMessage: null,
      conflictPassed: false,
    ));

    final res = await _repo.checkConflict(payload: {
      'testTableId': form.testTableId,
      'startDate': _dateOnly(form.startDate!),
      'endDate': _dateOnly(form.endDate!),
    });

    await res.fold(
      (error) async {
        _log.logE('Check conflict failed: $error');
        emit(state.copyWith(
          isSubmitting: false,
          status: BaseStateStatus.failed,
          conflictPassed: false,
          conflictMessage: null,
          message: error.getErrorMessage,
        ));
      },
      (message) async {
        // BE trả về message trong `data` (string). Nếu rỗng coi như trùng.
        final hasConflict = (message ?? '').trim().isNotEmpty &&
            !_isNoConflict(message);
        emit(state.copyWith(
          isSubmitting: false,
          status: hasConflict
              ? BaseStateStatus.failed
              : BaseStateStatus.success,
          conflictMessage: message,
          conflictPassed: !hasConflict,
          message: hasConflict ? message : 'Không trùng lặp, có thể lưu phiếu.',
        ));
      },
    );
  }

  Future<void> _onSubmitRegistration(Emitter<TestTableState> emit) async {
    if (_isSavingRegistration) return;
    _isSavingRegistration = true;

    final form = state.formData;
    if (!form.isReady) {
      _isSavingRegistration = false;
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: 'Vui lòng nhập đầy đủ thông tin trước khi lưu.',
      ));
      return;
    }

    try {
      emit(state.copyWith(
        isSubmitting: true,
        status: BaseStateStatus.loading,
        message: null,
        conflictMessage: null,
      ));

      // Bước 1: gọi check-conflict trước.
      final conflictRes = await _repo.checkConflict(payload: {
        'testTableId': form.testTableId,
        'startDate': _dateOnly(form.startDate!),
        'endDate': _dateOnly(form.endDate!),
      });

      final conflictError = conflictRes.fold(
        (error) => error,
        (_) => null,
      );
      if (conflictError != null) {
        _log.logE('Check conflict failed (pre-save): $conflictError');
        emit(state.copyWith(
          isSubmitting: false,
          status: BaseStateStatus.failed,
          submitSuccess: false,
          conflictPassed: false,
          conflictMessage: conflictError.getErrorMessage,
          message: conflictError.getErrorMessage,
        ));
        return;
      }

      final conflictMessage = conflictRes.getOrElse(() => null);
      final hasConflict = (conflictMessage ?? '').trim().isNotEmpty &&
          !_isNoConflict(conflictMessage);

      if (hasConflict) {
        emit(state.copyWith(
          isSubmitting: false,
          status: BaseStateStatus.failed,
          submitSuccess: false,
          conflictPassed: false,
          conflictMessage: conflictMessage,
          message: conflictMessage,
        ));
        return;
      }

      // Bước 2: pass → save registration.
      // Lưu ý: API yêu cầu `MachineIDs` là List<int>, không phải chuỗi CSV.
      final payload = <String, dynamic>{
        'ID': 0,
        'No': 1,
        'Type': 1,
        'Status': 0,
        'IsDelete': false,
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
          emit(state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            submitSuccess: false,
            conflictPassed: true,
            message: error.getErrorMessage,
          ));
        },
        (createdId) async {
          _log.logI('Save registration success: id=$createdId');
          emit(state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.success,
            submitSuccess: true,
            conflictPassed: true,
            createdId: createdId,
            message: 'Đăng ký bàn test thành công',
          ));
        },
      );
    } catch (e) {
      _log.logE('Save registration exception: $e');
      emit(state.copyWith(
        isSubmitting: false,
        status: BaseStateStatus.failed,
        submitSuccess: false,
        message: 'Có lỗi xảy ra, vui lòng thử lại',
      ));
    } finally {
      _isSavingRegistration = false;
    }
  }

  _onResetSubmitFlags(Emitter<TestTableState> emit) {
    emit(state.copyWith(
      submitSuccess: false,
      createdId: 0,
      conflictMessage: null,
      conflictPassed: false,
      isSubmitting: false,
      message: null,
      status: BaseStateStatus.init,
    ));
  }

  // =================================================================
  // ============== Máy test (theo bàn test đã chọn) ================
  // =================================================================

  Future<void> _onLoadTestMachines(
    Emitter<TestTableState> emit, {
    required int testTableId,
  }) async {
    emit(state.copyWith(
      isLoadingTestMachines: true,
      testMachines: const [],
    ));

    final res = await _repo.getTestMachineByTable(testTableId: testTableId);
    res.fold(
      (error) {
        _log.logE('Load test machines failed: $error');
        emit(state.copyWith(
          isLoadingTestMachines: false,
          testMachines: const [],
        ));
      },
      (machines) {
        emit(state.copyWith(
          isLoadingTestMachines: false,
          testMachines: machines,
        ));
      },
    );
  }

  // =================================================================
  // ===================== Helpers ===================================
  // =================================================================

  /// Format DateTime thành `yyyy-MM-dd` cho payload (bỏ phần giờ).
  String _dateOnly(DateTime d) {
    final dd = DateTime(d.year, d.month, d.day);
    final mm = dd.month.toString().padLeft(2, '0');
    final day = dd.day.toString().padLeft(2, '0');
    return '${dd.year}-$mm-$day';
  }

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
