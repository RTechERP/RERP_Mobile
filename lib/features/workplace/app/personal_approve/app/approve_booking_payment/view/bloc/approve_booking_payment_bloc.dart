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
        loadDetail: (id, isAccommodation) =>
            _onLoadDetail(emit, id, isAccommodation),
        toggleSelection: (id) => _onToggleSelection(emit, id),
        selectAll: () => _onSelectAll(emit),
        clearSelection: () async => emit(state.copyWith(selectedIds: {})),
        approveSelected: (note) =>
            _onSubmitApproval(emit, isApproved: true, note: note),
        rejectSelected: (reason) =>
            _onSubmitApproval(emit, isApproved: false, reason: reason),
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

    final steps = stepsRes.getOrElse(() => const []);
    emit(state.copyWith(
      steps: steps,
      departments: departmentsRes.getOrElse(() => const []),
      employees: employeesRes.getOrElse(() => const []),
      // Mặc định lọc sẵn bước TBP HR duyệt; giữ lựa chọn cũ nếu đã có.
      selectedStep: state.selectedStep ?? _defaultStep(steps),
    ));

    await _fetch(emit, pageIndex: 1);
  }

  /// Mã bước duyệt (`ApproverCode`) của TBP HR, được chọn sẵn khi mở màn.
  static const String _defaultStepCode = 'TBPHR';

  /// Bước TBP HR trong [steps]; `null` nếu BE không trả về bước này.
  ApproveBookingPaymentStep? _defaultStep(
    List<ApproveBookingPaymentStep> steps,
  ) {
    for (final step in steps) {
      if (step.code == _defaultStepCode) return step;
    }
    return null;
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

  //---(Detail)---//

  /// Gọi song song get-by-id và get-logs cho BottomSheet chi tiết. Chi tiết
  /// lỗi → báo lỗi có nút thử lại; lịch sử duyệt lỗi không chặn UI, fallback
  /// danh sách rỗng. [isAccommodation] chọn API Công tác phí hoặc Chi phí
  /// phương tiện.
  Future<void> _onLoadDetail(
    Emitter<ApproveBookingPaymentState> emit,
    int id,
    bool isAccommodation,
  ) async {
    emit(state.copyWith(
      isLoadingDetail: true,
      detail: null,
      logs: const [],
      detailError: null,
    ));

    final (detailRes, logsRes) = await (
      _repo.getById(id: id, isAccommodation: isAccommodation),
      _repo.getLogs(paymentOrderId: id, isAccommodation: isAccommodation),
    ).wait;
    if (emit.isDone) return;

    detailRes.fold(
      (err) {
        _log.logE('❌ getById failed: $err');
        emit(state.copyWith(
          isLoadingDetail: false,
          detailError: err.getErrorMessage,
        ));
      },
      (detail) => emit(state.copyWith(
        isLoadingDetail: false,
        detail: detail,
        logs: logsRes.getOrElse(() => const []),
        detailError: null,
      )),
    );
  }

  //---(Selection)---//

  Future<void> _onToggleSelection(
    Emitter<ApproveBookingPaymentState> emit,
    int id,
  ) async {
    final next = Set<int>.from(state.selectedIds);
    if (!next.remove(id)) next.add(id);
    emit(state.copyWith(selectedIds: next));
  }

  /// Chỉ phiếu Công tác phí mới có API TBP duyệt nên chỉ chọn các phiếu đó.
  Future<void> _onSelectAll(Emitter<ApproveBookingPaymentState> emit) async {
    final ids = state.visibleItems
        .where((i) => i.isAccommodation)
        .map((i) => i.id)
        .toSet();
    emit(state.copyWith(selectedIds: ids));
  }

  //---(Approve / Reject)---//

  /// Gọi lần lượt API `appoved-tbp` cho từng phiếu đã chọn rồi tải lại danh
  /// sách. Phiếu lỗi vẫn được giữ chọn để user thử lại; [approveError] chứa
  /// thông báo khi có ít nhất một phiếu lỗi.
  Future<void> _onSubmitApproval(
    Emitter<ApproveBookingPaymentState> emit, {
    required bool isApproved,
    String? note,
    String? reason,
  }) async {
    final ids = state.selectedIds.toList();
    if (ids.isEmpty || state.isApproving) return;

    emit(state.copyWith(isApproving: true, approveError: null));

    final failed = <int>{};
    String? firstError;
    for (final id in ids) {
      final res = await _repo.approveTbp(
        paymentOrderId: id,
        isApproved: isApproved,
        note: note,
        reasonCancel: reason,
      );
      res.fold((err) {
        _log.logE('❌ approveTbp id=$id failed: $err');
        failed.add(id);
        firstError ??= err.getErrorMessage;
      }, (_) {});
    }
    if (emit.isDone) return;

    emit(state.copyWith(
      isApproving: false,
      selectedIds: failed,
      approveError: failed.isEmpty
          ? null
          : '${failed.length}/${ids.length} phiếu thất bại: $firstError',
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
