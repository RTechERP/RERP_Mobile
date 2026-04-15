// Date: 15/04/2026 - Dev: NQHung
// Nội dung/Chức năng: BLoC quản lý đăng ký văn phòng phẩm - list, add slips, submit
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/stationery_model.dart';
import '../../data/repository/stationery_repo.dart';

part 'stationery_event.dart';
part 'stationery_state.dart';
part 'stationery_bloc.g.dart';
part 'stationery_bloc.freezed.dart';

@injectable
class StationeryBloc extends BaseBloc<StationeryEvent, StationeryState> {
  final LogUtils _log;
  final AuthRepo _authRepo;
  final StationeryRepo _stationeryRepo;

  StationeryBloc(this._stationeryRepo, this._authRepo, this._log)
      : super(StationeryState.init()) {
    on<StationeryEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        initAdd: () => _onInitAdd(emit),
        selectSupply: (slipIndex, supply) =>
            _onSelectSupply(emit, slipIndex: slipIndex, supply: supply),
        updateQuantity: (slipIndex, quantity) =>
            _onUpdateQuantity(emit, slipIndex: slipIndex, quantity: quantity),
        toggleExceedsLimit: (slipIndex, exceeds) =>
            _onToggleExceedsLimit(emit, slipIndex: slipIndex, exceeds: exceeds),
        updateReason: (slipIndex, reason) =>
            _onUpdateReason(emit, slipIndex: slipIndex, reason: reason),
        updateNote: (slipIndex, note) =>
            _onUpdateNote(emit, slipIndex: slipIndex, note: note),
        addSlip: () => _onAddSlip(emit),
        removeSlip: (slipIndex) =>
            _onRemoveSlip(emit, slipIndex: slipIndex),
        submitStationery: () => _onSubmit(emit),
        clearSubmitState: () => _onClearSubmitState(emit),
      );
    });
  }

  /// Public method: cập nhật ngày đăng ký (gọi trực tiếp từ UI, không qua event).
  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  void updateDateRegister(DateTime date) {
    if (isClosed) return;
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    emit(state.copyWith(dateRegister: date));
  }

  /// Public method: load chi tiết đơn VPP khi mở màn detail.
  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  Future<void> loadDetail(StationeryItem item) async {
    if (isClosed) return;
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      stationeryDetail: const [],
    ));

    // Fake chi tiết VPP — thay bằng API call khi có backend
    final fakeDetails = [
      StationeryDetailItem(
        id: 1,
        officeSupplyId: 1,
        officeSupplyName: 'Bút bi Thiên Long',
        code: 'VPP001',
        quantity: 5,
        unit: 'Cây',
        exceedsLimit: false,
      ),
      StationeryDetailItem(
        id: 2,
        officeSupplyId: 2,
        officeSupplyName: 'Giấy A4',
        code: 'VPP002',
        quantity: 10,
        unit: 'Ram',
        exceedsLimit: true,
        reason: 'Hết giấy trong kho',
      ),
    ];

    await Future.delayed(const Duration(milliseconds: 300));

    if (isClosed) return;
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    emit(state.copyWith(
      status: BaseStateStatus.success,
      stationeryDetail: fakeDetails,
    ));
  }

  bool _isSubmitting = false;

  //---(Init)---//
  Future<void> _onInit(Emitter<StationeryState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    await Future.delayed(const Duration(milliseconds: 500));

    final fakeData = [
      StationeryItem(
        employeeIdRequest: 1,
        userName: 'Nguyễn Văn An',
        dateRequest: DateTime.now().subtract(const Duration(days: 2)),
        isApproved: false,
        fullNameApproved: 'Trần Thị Bình',
        departmentName: 'Phòng Kỹ thuật',
        dateApproved: DateTime.now().add(const Duration(hours: 2)),
      ),
      StationeryItem(
        employeeIdRequest: 2,
        userName: 'Lê Hoàng Cường',
        dateRequest: DateTime.now().subtract(const Duration(days: 5)),
        isApproved: true,
        fullNameApproved: 'Phạm Minh Đức',
        departmentName: 'Phòng Nhân sự',
        dateApproved: DateTime.now().subtract(const Duration(days: 4)),
        isAdminApproved: true,
        dateAdminApproved: DateTime.now().subtract(const Duration(days: 3)),
      ),
      StationeryItem(
        employeeIdRequest: 3,
        userName: 'Phạm Thị Dung',
        dateRequest: DateTime.now().subtract(const Duration(days: 1)),
        isApproved: false,
        fullNameApproved: null,
        departmentName: 'Phòng Marketing',
        dateApproved: null,
      ),
      StationeryItem(
        employeeIdRequest: 4,
        userName: 'Hoàng Văn Em',
        dateRequest: DateTime.now().subtract(const Duration(days: 7)),
        isApproved: true,
        fullNameApproved: 'Ngô Thị Hoa',
        departmentName: 'Phòng Tài chính',
        dateApproved: DateTime.now().subtract(const Duration(days: 6)),
        isAdminApproved: true,
        dateAdminApproved: DateTime.now().subtract(const Duration(days: 5)),
      ),
      StationeryItem(
        employeeIdRequest: 5,
        userName: 'Vũ Thị Fa',
        dateRequest: DateTime.now(),
        isApproved: false,
        fullNameApproved: 'Đặng Văn Giỏi',
        departmentName: 'Phòng Kinh doanh',
        dateApproved: DateTime.now().add(const Duration(hours: 1)),
      ),
    ];

    emit(state.copyWith(
      status: BaseStateStatus.success,
      stationery: fakeData,
    ));
  }

  //---(InitAdd)---//
  Future<void> _onInitAdd(Emitter<StationeryState> emit) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      slips: [const StationerySlip()],
      dateRegister: DateTime.now(),
    ));

    // Fake supply list
    final fakeSupply = [
      const StationerySupplyItem(
        codeRTC: 'VPP001',
        nameNCC: 'Bút bi Thiên Long',
        unit: 'Cây',
        requestLimit: 10,
      ),
      const StationerySupplyItem(
        codeRTC: 'VPP002',
        nameNCC: 'Giấy A4',
        unit: 'Ram',
        requestLimit: 5,
      ),
      const StationerySupplyItem(
        codeRTC: 'VPP003',
        nameNCC: 'Bìa hồ nhựa',
        unit: 'Cuốn',
        requestLimit: 20,
      ),
      const StationerySupplyItem(
        codeRTC: 'VPP004',
        nameNCC: 'Kẹp giấy 24ly',
        unit: 'Hộp',
        requestLimit: 10,
      ),
      const StationerySupplyItem(
        codeRTC: 'VPP005',
        nameNCC: 'Thước kẻ 30cm',
        unit: 'Cây',
        requestLimit: 5,
      ),
    ];

    await Future.delayed(const Duration(milliseconds: 300));

    emit(state.copyWith(
      status: BaseStateStatus.success,
      stationerySupply: fakeSupply,
    ));
  }

  //---(Slip Management)---//
  _onSelectSupply(
    Emitter<StationeryState> emit, {
    required int slipIndex,
    required StationerySupplyItem supply,
  }) {
    final slips = List<StationerySlip>.from(state.slips);
    if (slipIndex < 0 || slipIndex >= slips.length) return;
    slips[slipIndex] = slips[slipIndex].copyWith(supply: supply);
    emit(state.copyWith(slips: slips));
  }

  _onUpdateQuantity(
    Emitter<StationeryState> emit, {
    required int slipIndex,
    required int quantity,
  }) {
    final slips = List<StationerySlip>.from(state.slips);
    if (slipIndex < 0 || slipIndex >= slips.length) return;
    slips[slipIndex] = slips[slipIndex].copyWith(quantity: quantity);
    emit(state.copyWith(slips: slips));
  }

  _onToggleExceedsLimit(
    Emitter<StationeryState> emit, {
    required int slipIndex,
    required bool exceeds,
  }) {
    final slips = List<StationerySlip>.from(state.slips);
    if (slipIndex < 0 || slipIndex >= slips.length) return;
    slips[slipIndex] = slips[slipIndex].copyWith(exceedsLimit: exceeds);
    emit(state.copyWith(slips: slips));
  }

  _onUpdateReason(
    Emitter<StationeryState> emit, {
    required int slipIndex,
    required String reason,
  }) {
    final slips = List<StationerySlip>.from(state.slips);
    if (slipIndex < 0 || slipIndex >= slips.length) return;
    slips[slipIndex] = slips[slipIndex].copyWith(reason: reason);
    emit(state.copyWith(slips: slips));
  }

  _onUpdateNote(
    Emitter<StationeryState> emit, {
    required int slipIndex,
    required String note,
  }) {
    final slips = List<StationerySlip>.from(state.slips);
    if (slipIndex < 0 || slipIndex >= slips.length) return;
    slips[slipIndex] = slips[slipIndex].copyWith(note: note);
    emit(state.copyWith(slips: slips));
  }

  _onAddSlip(Emitter<StationeryState> emit) {
    final slips = List<StationerySlip>.from(state.slips)..add(const StationerySlip());
    emit(state.copyWith(slips: slips));
  }

  _onRemoveSlip(Emitter<StationeryState> emit, {required int slipIndex}) {
    final slips = List<StationerySlip>.from(state.slips);
    if (slipIndex < 0 || slipIndex >= slips.length) return;
    if (slips.length <= 1) return; // Giữ ít nhất 1 slip
    slips.removeAt(slipIndex);
    emit(state.copyWith(slips: slips));
  }

  //---(Submit)---//
  Future<void> _onSubmit(Emitter<StationeryState> emit) async {
    if (_isSubmitting) return;
    _isSubmitting = true;

    emit(state.copyWith(
      isSubmitting: true,
      submitSuccess: false,
      message: null,
    ));

    // Validate: mỗi slip phải có supply được chọn
    final hasEmptySlip = state.slips.any((s) => s.supply == null);
    if (hasEmptySlip) {
      emit(state.copyWith(
        isSubmitting: false,
        status: BaseStateStatus.failed,
        message: 'Vui lòng chọn văn phòng phẩm cho tất cả các dòng.',
      ));
      _isSubmitting = false;
      return;
    }

    await Future.delayed(const Duration(milliseconds: 500));

    emit(state.copyWith(
      isSubmitting: false,
      submitSuccess: true,
      status: BaseStateStatus.success,
      message: 'Đăng ký văn phòng phẩm thành công.',
    ));

    _isSubmitting = false;
  }

  _onClearSubmitState(Emitter<StationeryState> emit) {
    emit(state.copyWith(
      isSubmitting: false,
      submitSuccess: false,
      message: null,
    ));
  }
}
