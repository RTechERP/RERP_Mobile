// Bloc cho màn Duyệt ĐNTT Đặt xe / Nhà nghỉ.
// Quản lý danh sách ĐNTT phân trang + bộ lọc (ngày, phòng ban, người tạo,
// từ khoá).

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../data/datasource/models/approve_booking_payment_model.dart';
import '../../data/repository/approve_booking_payment_repo.dart';

part 'approve_booking_payment_event.dart';
part 'approve_booking_payment_state.dart';
part 'approve_booking_payment_bloc.g.dart';
part 'approve_booking_payment_bloc.freezed.dart';

@injectable
class ApproveBookingPaymentBloc
    extends BaseBloc<ApproveBookingPaymentEvent, ApproveBookingPaymentState> {
  final LogUtils _log;
  final ApproveBookingPaymentRepo _repo;

  ApproveBookingPaymentBloc(this._repo, this._log)
      : super(ApproveBookingPaymentState.init()) {
    on<ApproveBookingPaymentEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        refresh: () => _onRefresh(emit),
        loadMore: () => _onLoadMore(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        applyFilter: (typeName, step, department, employee, keyword) =>
            _onApplyFilter(
          emit,
          typeName: typeName,
          step: step,
          department: department,
          employee: employee,
          keyword: keyword,
        ),
        resetFilter: () => _onResetFilter(emit),
      );
    });
  }

  //---(Init)---//

  /// Tải song song 3 bộ lookup (bước duyệt, phòng ban, nhân viên) rồi tải
  /// trang đầu của danh sách. Lỗi lookup không chặn UI, fallback list rỗng.
  Future<void> _onInit(Emitter<ApproveBookingPaymentState> emit) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      message: null,
      dateStart: state.dateStart ?? ApproveBookingPaymentState.defaultStart(),
      dateEnd: state.dateEnd ?? ApproveBookingPaymentState.defaultEnd(),
    ));

    final (stepsRes, departmentsRes, employeesRes) = await (
      _repo.getApproveSteps(),
      _repo.getDepartments(),
      _repo.getEmployees(),
    ).wait;
    if (emit.isDone) return;

    emit(state.copyWith(
      steps: stepsRes.getOrElse(() => const []),
      departments: departmentsRes.getOrElse(() => const []),
      employees: employeesRes.getOrElse(() => const []),
    ));

    await _fetch(emit, pageIndex: 1);
  }

  //---(Refresh / Load more)---//

  /// Pull-to-refresh: tải lại từ trang 1, giữ nguyên list cũ cho tới khi xong.
  Future<void> _onRefresh(Emitter<ApproveBookingPaymentState> emit) async {
    emit(state.copyWith(isRefreshing: true, message: null));
    await _fetch(emit, pageIndex: 1);
  }

  /// Tải trang kế tiếp khi user cuộn gần cuối danh sách.
  Future<void> _onLoadMore(Emitter<ApproveBookingPaymentState> emit) async {
    if (!state.hasMore || state.isLoadingMore || state.isRefreshing) return;
    emit(state.copyWith(isLoadingMore: true));
    await _fetch(emit, pageIndex: state.pageIndex + 1);
  }

  //---(Filter)---//

  Future<void> _onChangeDateRange(
    Emitter<ApproveBookingPaymentState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      dateStart: dateStart,
      dateEnd: dateEnd,
      message: null,
    ));
    await _fetch(emit, pageIndex: 1);
  }

  /// Áp bộ lọc từ sheet. Bước duyệt, người tạo và từ khoá lọc ở server;
  /// phòng ban và loại nội dung lọc client-side vì payload API không có
  /// field tương ứng.
  Future<void> _onApplyFilter(
    Emitter<ApproveBookingPaymentState> emit, {
    required String? typeName,
    required ApproveBookingPaymentStep? step,
    required ApproveBookingPaymentDepartment? department,
    required ApproveBookingPaymentEmployee? employee,
    required String keyword,
  }) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      selectedTypeName: typeName,
      selectedStep: step,
      selectedDepartment: department,
      selectedEmployee: employee,
      keyword: keyword.trim(),
      message: null,
    ));
    await _fetch(emit, pageIndex: 1);
  }

  Future<void> _onResetFilter(
    Emitter<ApproveBookingPaymentState> emit,
  ) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      selectedTypeName: null,
      selectedStep: null,
      selectedDepartment: null,
      selectedEmployee: null,
      keyword: '',
      message: null,
    ));
    await _fetch(emit, pageIndex: 1);
  }

  //---(Fetch)---//

  /// Gọi `get-unified-list` cho [pageIndex]. Trang 1 thay thế list hiện tại,
  /// các trang sau nối thêm vào cuối.
  Future<void> _fetch(
    Emitter<ApproveBookingPaymentState> emit, {
    required int pageIndex,
  }) async {
    final start = state.dateStart ?? ApproveBookingPaymentState.defaultStart();
    final end = state.dateEnd ?? ApproveBookingPaymentState.defaultEnd();

    final payload = <String, dynamic>{
      'StartDate': _formatDate(start),
      'EndDate': _formatDate(end),
      'Status': null,
      'PaymentType': null,
      'ApproverEmployeeID': null,
      'ApproverCode': state.selectedStep?.code,
      'CreatedByEmployeeID': state.selectedEmployee?.id,
      'Keyword': state.keyword.isEmpty ? null : state.keyword,
      'TypeOrder': null,
      'PageIndex': pageIndex,
      'PageSize': ApproveBookingPaymentState.pageSize,
    };
    _log.logI('📋 fetch approveBookingPayment $payload');

    final res = await _repo.getUnifiedList(payload: payload);
    if (emit.isDone) return;

    res.fold(
      (err) {
        _log.logE('❌ getUnifiedList failed: $err');
        // Lỗi khi tải thêm / refresh: giữ list cũ, chỉ báo lỗi.
        final keepList = pageIndex > 1 || state.items.isNotEmpty;
        emit(state.copyWith(
          status: keepList ? state.status : BaseStateStatus.failed,
          message: err.getErrorMessage,
          isRefreshing: false,
          isLoadingMore: false,
        ));
      },
      (page) {
        _log.logI('✅ getUnifiedList page=$pageIndex count=${page.length}');
        final items = pageIndex == 1 ? page : [...state.items, ...page];
        final totalPage = page.isEmpty ? pageIndex : page.first.totalPage ?? 1;
        emit(state.copyWith(
          status: BaseStateStatus.success,
          items: items,
          pageIndex: pageIndex,
          hasMore: pageIndex < totalPage,
          totalRows: page.isEmpty ? 0 : page.first.totalRows ?? items.length,
          isRefreshing: false,
          isLoadingMore: false,
          message: null,
        ));
      },
    );
  }

  //---(Helpers)---//

  /// Định dạng ngày gửi lên API: `yyyy-MM-dd`.
  String _formatDate(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';
}
