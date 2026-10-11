// Bloc cho màn Đặt phòng nhà nghỉ.
// Quản lý danh sách phiếu (theo khoảng ngày, lọc project/employee).

import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import 'package:collection/collection.dart';
import 'package:rtc_erp/features/auth/data/repository/auth_repository.dart';
import '../../data/datasource/models/booking_guest_house_model.dart';
import '../../data/repository/booking_guest_house_repo.dart';

part 'booking_guest_house_event.dart';
part 'booking_guest_house_state.dart';
part 'booking_guest_house_bloc.g.dart';
part 'booking_guest_house_bloc.freezed.dart';

@injectable
class BookingGuestHouseBloc
    extends BaseBloc<BookingGuestHouseEvent, BookingGuestHouseState> {
  final LogUtils _log;
  final BookingGuestHouseRepo _repo;

  BookingGuestHouseBloc(this._repo, this._log)
    : super(BookingGuestHouseState.init()) {
    on<BookingGuestHouseEvent>((event, emit) async {
      await event.when(
        init: (dateStart, dateEnd) => _onInit(
          emit,
          dateStart: dateStart,
          dateEnd: dateEnd,
        ),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        changeFilterText: (filterText) =>
            _onChangeFilterText(emit, filterText: filterText),
        refresh: () => _onRefresh(emit),
        loadFilters: () => _onLoadFilters(emit),
        changeProjectFilter: (project) =>
            _onChangeProjectFilter(emit, project: project),
        changeEmployeeFilter: (employee) =>
            _onChangeEmployeeFilter(emit, employee: employee),
        submit: (payload) => _onSubmit(emit, payload: payload),
        deleteBooking: (id) => _onDeleteBooking(emit, id: id),
        loadDetail: (id) => _onLoadDetail(emit, id: id),
        submitAdvance: (payload) => _onSubmitAdvance(emit, payload: payload),
        submitAdvanceForm: (
          accommodationBookingId,
          approvedTbpId,
          projectId,
          companyId,
          companyName,
          departmentName,
          reason,
          transferType,
          bankAccount,
          bankListId,
          bankName,
          totalAmount,
          note,
        ) =>
            _onSubmitAdvanceForm(
          emit,
          accommodationBookingId: accommodationBookingId,
          approvedTbpId: approvedTbpId,
          projectId: projectId,
          companyId: companyId,
          companyName: companyName,
          departmentName: departmentName,
          reason: reason,
          transferType: transferType,
          bankAccount: bankAccount,
          bankListId: bankListId,
          bankName: bankName,
          totalAmount: totalAmount,
          note: note,
        ),
        clearAdvanceSubmitState: () async => _onClearAdvanceSubmitState(emit),
      );
    });
  }

  //---(Init)---//

  Future<void> _onInit(
    Emitter<BookingGuestHouseState> emit, {
    DateTime? dateStart,
    DateTime? dateEnd,
  }) async {
    emit(state.copyWith(status: BaseStateStatus.loading, message: null));

    final start = dateStart ?? _defaultDateStart();
    final end = dateEnd ?? _defaultDateEnd();

    await _fetch(
      emit,
      dateStart: start,
      dateEnd: end,
      filterText: state.filterText,
    );
  }

  //---(Change Date Range)---//

  Future<void> _onChangeDateRange(
    Emitter<BookingGuestHouseState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    final normalizedStart = _dateOnly(dateStart);
    final normalizedEnd = _endOfDay(dateEnd);

    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        dateStart: normalizedStart,
        dateEnd: normalizedEnd,
        message: null,
      ),
    );

    await _fetch(
      emit,
      dateStart: normalizedStart,
      dateEnd: normalizedEnd,
      filterText: state.filterText,
    );
  }

  //---(Change Filter Text)---//

  Future<void> _onChangeFilterText(
    Emitter<BookingGuestHouseState> emit, {
    required String filterText,
  }) async {
    if (filterText == state.filterText) return;

    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        filterText: filterText,
        message: null,
      ),
    );

    final start = state.dateStart ?? _defaultDateStart();
    final end = state.dateEnd ?? _defaultDateEnd();

    await _fetch(
      emit,
      dateStart: start,
      dateEnd: end,
      filterText: filterText,
    );
  }

  //---(Refresh)---//

  Future<void> _onRefresh(Emitter<BookingGuestHouseState> emit) async {
    final start = state.dateStart ?? _defaultDateStart();
    final end = state.dateEnd ?? _defaultDateEnd();

    emit(state.copyWith(isRefreshing: true, message: null));

    await _fetch(
      emit,
      dateStart: start,
      dateEnd: end,
      filterText: state.filterText,
      onSuccessExtra: (bookings) => emit(
        state.copyWith(bookings: bookings, isRefreshing: false),
      ),
      onFailureExtra: () => emit(state.copyWith(isRefreshing: false)),
    );
  }

  //---(Load Filters)---//

  Future<void> _onLoadFilters(Emitter<BookingGuestHouseState> emit) async {
    emit(state.copyWith(isLoadingFilters: true));

    // Gọi song song 5 API: dự án + nhân viên + tỉnh/thành +
    // công ty (TaxCompany) + ngân hàng (banklist).
    final projectRes = await _repo.getProjects();
    final employeeRes = await _repo.getEmployees();
    final provinceRes = await _repo.getProvinces();
    final taxCompanyRes = await _repo.getTaxCompanies();
    final bankRes = await _repo.getBankList();

    List<ProjectFilterItem> projects = [];
    List<EmployeeFilterItem> employees = [];
    List<ProvinceFilterItem> provinces = [];
    List<TaxCompanyItem> taxCompanies = [];
    List<BankItem> banks = [];

    projectRes.fold(
      (err) => _log.logE('❌ getProjects failed: $err'),
      (data) => projects = data,
    );

    employeeRes.fold(
      (err) => _log.logE('❌ getEmployees failed: $err'),
      (data) => employees = data,
    );

    provinceRes.fold(
      (err) => _log.logE('❌ getProvinces failed: $err'),
      (data) => provinces = data,
    );

    taxCompanyRes.fold(
      (err) => _log.logE('❌ getTaxCompanies failed: $err'),
      (data) => taxCompanies = data,
    );

    bankRes.fold(
      (err) => _log.logE('❌ getBankList failed: $err'),
      (data) => banks = data,
    );

    emit(state.copyWith(
      isLoadingFilters: false,
      projects: projects,
      employees: employees,
      provinces: provinces,
      taxCompanies: taxCompanies,
      banks: banks,
    ));
  }

  //---(Change Project Filter)---//

  Future<void> _onChangeProjectFilter(
    Emitter<BookingGuestHouseState> emit, {
    required ProjectFilterItem? project,
  }) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        selectedProject: project,
        selectedEmployee: null, // reset employee when project changes
        message: null,
      ),
    );

    final start = state.dateStart ?? _defaultDateStart();
    final end = state.dateEnd ?? _defaultDateEnd();

    await _fetch(
      emit,
      dateStart: start,
      dateEnd: end,
      filterText: state.filterText,
    );
  }

  //---(Change Employee Filter)---//

  Future<void> _onChangeEmployeeFilter(
    Emitter<BookingGuestHouseState> emit, {
    required EmployeeFilterItem? employee,
  }) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        selectedEmployee: employee,
        selectedProject: null, // reset project when employee changes
        message: null,
      ),
    );

    final start = state.dateStart ?? _defaultDateStart();
    final end = state.dateEnd ?? _defaultDateEnd();

    await _fetch(
      emit,
      dateStart: start,
      dateEnd: end,
      filterText: state.filterText,
    );
  }

  //---(Fetch)---//

  /// Gọi repo và emit kết quả về state.
  /// [onSuccessExtra]/[onFailureExtra] dùng để update thêm các cờ
  /// (vd: tắt `isRefreshing` khi pull-to-refresh) sau khi đã set status.
  Future<void> _fetch(
    Emitter<BookingGuestHouseState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
    required String filterText,
    void Function(List<BookingGuestHouseItem> bookings)? onSuccessExtra,
    VoidCallback? onFailureExtra,
  }) async {
    final startStr = _iso(dateStart);
    final endStr = _iso(dateEnd);

    // projectId: dùng ID của dự án đang chọn, hoặc 0 nếu không chọn.
    final projectId = state.selectedProject?.id ?? 0;
    // employeeId: dùng UserID của nhân viên đang chọn, hoặc 0 nếu không chọn.
    final employeeId = state.selectedEmployee?.userId ?? 0;

    _log.logI(
      '📋 fetch bookingGuestHouse dateStart=$startStr '
      'dateEnd=$endStr filterText="$filterText" '
      'projectId=$projectId employeeId=$employeeId',
    );

    final res = await _repo.getBookingGuestHouse(
      dateStart: startStr,
      dateEnd: endStr,
      projectId: projectId,
      employeeId: employeeId,
      filterText: filterText,
    );

    res.fold(
      (err) {
        _log.logE('❌ API failed: $err');
        onFailureExtra?.call();
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
            dateStart: dateStart,
            dateEnd: dateEnd,
          ),
        );
      },
      (bookings) {
        _log.logI('✅ API success - total: ${bookings.length}');
        onSuccessExtra?.call(bookings);
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            bookings: bookings,
            dateStart: dateStart,
            dateEnd: dateEnd,
            filterText: filterText,
            message: null,
          ),
        );
      },
    );
  }

  //---(Submit)---//

  /// Lưu phiếu đặt phòng nhà nghỉ — gọi API `/AccommodationBooking/save-data`.
  /// Payload là Map do UI build sẵn (đã chuẩn hoá theo schema server).
  Future<void> _onSubmit(
    Emitter<BookingGuestHouseState> emit, {
    required Map<String, dynamic> payload,
  }) async {
    emit(
      state.copyWith(
        isSubmitting: true,
        submitSuccess: false,
        lastSubmittedId: null,
        message: null,
      ),
    );

    _log.logI('📋 saveBookingGuestHouse payload: $payload');

    final res = await _repo.saveBookingGuestHouse(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('❌ saveBookingGuestHouse failed: $err');
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            message: err.getErrorMessage,
          ),
        );
      },
      (created) async {
        _log.logI('✅ saveBookingGuestHouse OK id=${created.id}');
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: true,
            lastSubmittedId: created.id,
            message: null,
          ),
        );
      },
    );
  }

  //---(Delete Booking)---//

  /// Xoá phiếu đặt phòng nhà nghỉ — gọi API `POST /AccommodationBooking/delete`
  /// với body `[id]`.
  ///
  /// Chỉ cho phép xoá phiếu do chính user đang đăng nhập tạo (`RegisterID` khớp
  /// `EmployeeID` của currentUser). Vượt quyền → trả message, không gọi API.
  ///
  /// Thành công → emit `deleteSuccess` + xoá luôn item khỏi `bookings` để list
  /// cập nhật tức thì (không gọi lại API). Thất bại → giữ nguyên danh sách và
  /// trả message cho UI hiển thị.
  Future<void> _onDeleteBooking(
    Emitter<BookingGuestHouseState> emit, {
    required int id,
  }) async {
    emit(state.copyWith(deleteSuccess: false, message: null));

    // Chặn xoá phiếu của người khác: RegisterID của phiếu phải bằng EmployeeID
    // của user đang đăng nhập.
    final target = state.bookings.firstWhereOrNull((b) => b.id == id);
    if (target == null) {
      emit(
        state.copyWith(
          deleteSuccess: false,
          message: 'Không tìm thấy phiếu cần xoá',
        ),
      );
      return;
    }

    final currentUser = await AuthRepository.getCurrentUser(log: _log);
    if (currentUser == null) {
      emit(
        state.copyWith(
          deleteSuccess: false,
          message: 'Không xác định được người đăng nhập, không thể xoá phiếu',
        ),
      );
      return;
    }

    if (target.registerId != currentUser.employeeId) {
      _log.logW(
        '⛔ Chặn xoá phiếu $id — RegisterID=${target.registerId} '
        '≠ currentUser.employeeId=${currentUser.employeeId}',
      );
      emit(
        state.copyWith(
          deleteSuccess: false,
          message: 'Bạn không thể xoá phiếu của người khác',
        ),
      );
      return;
    }

    _log.logI('🗑️ deleteBookingGuestHouse ids=[$id]');

    final res = await _repo.deleteBookingGuestHouse(ids: [id]);

    await res.fold(
      (err) async {
        _log.logE('❌ deleteBookingGuestHouse failed: $err');
        emit(
          state.copyWith(
            deleteSuccess: false,
            message: err.getErrorMessage,
          ),
        );
      },
      (_) async {
        _log.logI('✅ deleteBookingGuestHouse OK id=$id');
        emit(
          state.copyWith(
            deleteSuccess: true,
            bookings: state.bookings
                .where((b) => b.id != id)
                .toList(growable: false),
            message: null,
          ),
        );
      },
    );
  }

  //---(Helpers)---//

  DateTime _defaultDateStart() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, 1);
  }

  DateTime _defaultDateEnd() {
    final start = _defaultDateStart();
    final nextMonth = (start.month == 12)
        ? DateTime(start.year + 1, 1, 1)
        : DateTime(start.year, start.month + 1, 1);
    return nextMonth.subtract(const Duration(days: 1));
  }

  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  DateTime _endOfDay(DateTime d) =>
      DateTime(d.year, d.month, d.day, 23, 59, 59);

  /// Format ISO giống payload mẫu: `2026-09-30T17:00:00.000Z`.
  String _iso(DateTime d) {
    final utc = d.toUtc();
    final y = utc.year.toString().padLeft(4, '0');
    final m = utc.month.toString().padLeft(2, '0');
    final day = utc.day.toString().padLeft(2, '0');
    final h = utc.hour.toString().padLeft(2, '0');
    final mi = utc.minute.toString().padLeft(2, '0');
    final s = utc.second.toString().padLeft(2, '0');
    return '$y-$m-${day}T$h:$mi:$s.000Z';
  }

  //---(Load Detail)---//

  /// Tải chi tiết 1 phiếu (kèm danh sách người ở).
  /// API: GET `/AccommodationBooking/accommodation-booking-by-id?id=<id>`.
  Future<void> _onLoadDetail(
    Emitter<BookingGuestHouseState> emit, {
    required int id,
  }) async {
    emit(state.copyWith(
      isDetailLoading: true,
      detailMessage: null,
      detailData: null,
    ));

    final res = await _repo.getBookingGuestHouseById(id: id);

    res.fold(
      (err) {
        _log.logE('❌ getBookingGuestHouseById failed: $err');
        emit(state.copyWith(
          isDetailLoading: false,
          detailMessage: err.getErrorMessage,
          detailData: null,
        ));
      },
      (data) {
        _log.logI('✅ getBookingGuestHouseById OK id=$id persons=${data.persons.length}');
        emit(state.copyWith(
          isDetailLoading: false,
          detailData: data,
          detailMessage: null,
        ));
      },
    );
  }

  //---(Submit Advance — Đề nghị tạm ứng)---//

  /// Gửi đề nghị tạm ứng (ĐNTU) cho 1 phiếu.
  /// API: POST `/AccommodationBookingPaymentOrder/create-advance`.
  /// Payload do UI build sẵn (đã chuẩn hoá theo
  /// `AccommodationBookingAdvanceRequest` mục 4.6 spec).
  ///
  /// Khi BE trả `data.IsRecreated = true` → giữ nguyên master cũ (cùng mã
  /// ĐNTU) và reset luồng duyệt về bước TBP. UI sẽ dựa vào cờ này để
  /// hiển thị message "Đã tạo lại đề nghị tạm ứng".
  Future<void> _onSubmitAdvance(
    Emitter<BookingGuestHouseState> emit, {
    required Map<String, dynamic> payload,
  }) async {
    emit(
      state.copyWith(
        isSubmittingAdvance: true,
        advanceSuccess: false,
        lastAdvanceResponse: null,
        advanceMessage: null,
        message: null,
      ),
    );

    _log.logI('📋 createBookingGuestHouseAdvance payload: $payload');

    final res = await _repo.createBookingGuestHouseAdvance(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('❌ createBookingGuestHouseAdvance failed: $err');
        emit(
          state.copyWith(
            isSubmittingAdvance: false,
            advanceSuccess: false,
            message: err.getErrorMessage,
          ),
        );
      },
      (created) async {
        _log.logI(
          '✅ createBookingGuestHouseAdvance OK id=${created.id} '
          'code=${created.code} recreated=${created.isRecreated}',
        );
        emit(
          state.copyWith(
            isSubmittingAdvance: false,
            advanceSuccess: true,
            lastAdvanceResponse: created,
            message: null,
          ),
        );
      },
    );
  }

  //---(Submit Advance Form)---//

  /// Build payload `Map<String, dynamic>` từ 13 trường form rồi submit.
  /// Bloc tự resolve:
  /// - `currentUser` (qua `AuthRepository.getCurrentUser` — không cache).
  /// - `detailData` (state.detailData — UI load khi mở màn).
  /// - `BankName` (lookup trong `state.banks` theo `bankListId`).
  /// - Fallback ID (TBP, dự án, công ty) từ detail/currentUser.
  ///
  /// Validate toàn bộ ở bloc (nếu fail → emit `message` lỗi, KHÔNG
  /// gọi repo). Lỗi validate trả về qua `state.message` để UI hiển
  /// thị snackbar.
  Future<void> _onSubmitAdvanceForm(
    Emitter<BookingGuestHouseState> emit, {
    required int accommodationBookingId,
    int? approvedTbpId,
    int? projectId,
    int? companyId,
    required String companyName,
    required String departmentName,
    required String reason,
    required int transferType,
    required String bankAccount,
    required int bankListId,
    required String bankName,
    required int totalAmount,
    String? note,
  }) async {
    //---(Validate cơ bản)---//
    final missing = _validateAdvanceRequest(
      accommodationBookingId: accommodationBookingId,
      reason: reason,
      bankAccount: bankAccount,
      bankListId: bankListId,
      totalAmount: totalAmount,
      transferType: transferType,
      companyName: companyName,
      departmentName: departmentName,
    );
    if (missing != null) {
      emit(
        state.copyWith(
          isSubmittingAdvance: false,
          advanceSuccess: false,
          message: missing,
        ),
      );
      return;
    }

    //---(Resolve currentUser)---//
    final user = await AuthRepository.getCurrentUser(log: _log);
    if (user == null) {
      emit(
        state.copyWith(
          isSubmittingAdvance: false,
          advanceSuccess: false,
          message: 'Chưa xác định được người dùng, vui lòng thử lại',
        ),
      );
      return;
    }

    //---(Resolve detailData)---//
    final detail = state.detailData;
    if (detail == null) {
      emit(
        state.copyWith(
          isSubmittingAdvance: false,
          advanceSuccess: false,
          message: 'Chưa tải được thông tin phiếu, vui lòng thử lại',
        ),
      );
      return;
    }

    //---(Build payload theo schema mục 4.6)---//
    final effectiveTbpId = approvedTbpId ?? detail.info.approvedTBP ?? 0;
    final effectiveProjectId = projectId ?? detail.info.projectId ?? 0;
    final effectiveCompanyId = companyId ?? user.taxCompanyId;

    // BankName — ưu tiên lookup trong state.banks (chuẩn hoá), fallback
    // tên user thấy trên UI.
    final bank =
        state.banks.firstWhereOrNull((b) => b.id == bankListId);
    final effectiveBankName = (bank?.bankName ?? '').trim().isNotEmpty
        ? bank!.bankName!.trim()
        : bankName.trim();

    final payload = <String, dynamic>{
      'AccommodationBookingID': accommodationBookingId,
      'ApprovedTBPID': effectiveTbpId,
      'Reason': reason,
      'ProjectID': effectiveProjectId,
      'TransferType': transferType,
      'BankAccount': bankAccount,
      'BankListID': bankListId,
      'BankName': effectiveBankName,
      'TotalAmount': totalAmount,
      'Note': (note == null || note.trim().isEmpty) ? null : note.trim(),
      'CompanyID': effectiveCompanyId,
      'CompanyName': companyName,
      'DepartmentName': departmentName,
      // Người nhận = currentUser.FullName theo spec mục 4.6
      // (NV đăng ký chính là người nhận tạm ứng).
      'RecipientName': user.fullName.trim(),
    };

    //---(Gọi repo qua helper chung)---//
    await _submitAdvancePayload(emit, payload);
  }

  /// Validate 13 trường form — trả `null` nếu OK, ngược lại trả message
  /// lỗi tiếng Việt để UI hiển thị snackbar.
  String? _validateAdvanceRequest({
    required int accommodationBookingId,
    required String reason,
    required String bankAccount,
    required int bankListId,
    required int totalAmount,
    required int transferType,
    required String companyName,
    required String departmentName,
  }) {
    if (accommodationBookingId <= 0) return 'Thiếu ID phiếu đặt phòng';
    if (reason.trim().isEmpty) return 'Vui lòng nhập lý do';
    if (bankAccount.trim().isEmpty) return 'Vui lòng nhập số tài khoản';
    if (!RegExp(r'^[0-9]+$').hasMatch(bankAccount.trim())) {
      return 'Số tài khoản chỉ chứa chữ số';
    }
    if (bankListId <= 0) return 'Vui lòng chọn ngân hàng';
    if (totalAmount <= 0) return 'Số tiền tạm ứng không hợp lệ';
    if (transferType < 1 || transferType > 6) {
      return 'Loại chuyển khoản không hợp lệ';
    }
    if (companyName.trim().isEmpty) return 'Thiếu tên công ty';
    if (departmentName.trim().isEmpty) return 'Thiếu tên bộ phận';
    return null;
  }

  /// Phần chung — emit state + gọi repo (tách ra để
  /// `_onSubmitAdvance` (raw Map) và `_onSubmitAdvanceForm` (DTO) đều dùng
  /// được). Trả về `BookingGuestHouseAdvanceResponse?` qua emit; UI đọc
  /// qua `state.lastAdvanceResponse` + `state.advanceSuccess`.
  Future<void> _submitAdvancePayload(
    Emitter<BookingGuestHouseState> emit,
    Map<String, dynamic> payload,
  ) async {
    emit(
      state.copyWith(
        isSubmittingAdvance: true,
        advanceSuccess: false,
        lastAdvanceResponse: null,
        advanceMessage: null,
        message: null,
      ),
    );

    _log.logI('📋 createBookingGuestHouseAdvance payload: $payload');

    final res = await _repo.createBookingGuestHouseAdvance(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('❌ createBookingGuestHouseAdvance failed: $err');
        emit(
          state.copyWith(
            isSubmittingAdvance: false,
            advanceSuccess: false,
            message: err.getErrorMessage,
          ),
        );
      },
      (created) async {
        _log.logI(
          '✅ createBookingGuestHouseAdvance OK id=${created.id} '
          'code=${created.code} recreated=${created.isRecreated}',
        );
        emit(
          state.copyWith(
            isSubmittingAdvance: false,
            advanceSuccess: true,
            lastAdvanceResponse: created,
            message: null,
          ),
        );
      },
    );
  }

  //---(Clear Advance Submit State)---//

  /// Reset cờ `advanceSuccess` + `message` sau khi UI đã xử lý xong
  /// success (hiển thị toast + pop), để lần sau mở lại màn thấy form
  /// sạch sẽ. Pattern giống `_onClearSubmitState` của màn `lunch`.
  void _onClearAdvanceSubmitState(Emitter<BookingGuestHouseState> emit) {
    if (state.advanceSuccess || (state.message ?? '').isNotEmpty) {
      emit(state.copyWith(advanceSuccess: false, message: null));
    }
  }
}