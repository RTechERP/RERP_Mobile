// Date: 15/04/2026 - Dev: NQHung
// Nội dung/Chức năng: BLoC quản lý đăng ký văn phòng phẩm - list, add slips, submit
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
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
        initEdit: (item, details) =>
            _onInitEdit(emit, item: item, details: details),
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
        submitStationery: (dateRegister) =>
            _onSubmit(emit, dateRegister: dateRegister),
        clearSubmitState: () => _onClearSubmitState(emit),
        changeMonth: (month) => _onChangeMonth(emit, month: month),
        deleteStationery: (itemId) => _onDelete(emit, itemId: itemId),
      );
    });
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

    final res = await _stationeryRepo.getStationeryDetailItem(
      officeSupplyRequestsId: item.id ?? 0,
    );

    await res.fold(
      (err) async {
        _log.logE('loadDetail failed: $err');
        if (isClosed) return;
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (details) async {
        _log.logI('loadDetail success: ${details.length} items');
        if (isClosed) return;
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        emit(state.copyWith(
          status: BaseStateStatus.success,
          stationeryDetail: details,
        ));
      },
    );
  }

  bool _isSubmitting = false;

  //---(Init)---//
  Future<void> _onInit(Emitter<StationeryState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final now = DateTime.now();
    final monthInput = DateTime(now.year, now.month, 1).toIso8601String();

    emit(state.copyWith(
      selectedMonth: DateTime(now.year, now.month, 1),
    ));

    final res = await _stationeryRepo.getStationeryItem(
      keyword: '',
      monthInput: monthInput,
      departmentId: 0,
    );

    await res.fold(
      (err) async {
        _log.logE('_onInit failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (data) async {
        _log.logI('_onInit success: ${data.length} items');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          stationery: data,
          deleteSuccess: false,
        ));
      },
    );
  }

  //---(ChangeMonth)---//
  Future<void> _onChangeMonth(Emitter<StationeryState> emit, {required DateTime month}) async {
    final monthInput = DateTime(month.year, month.month, 1).toIso8601String();

    emit(state.copyWith(
      status: BaseStateStatus.loading,
      selectedMonth: DateTime(month.year, month.month, 1),
    ));

    final res = await _stationeryRepo.getStationeryItem(
      keyword: '',
      monthInput: monthInput,
      departmentId: 0,
    );

    await res.fold(
      (err) async {
        _log.logE('_onChangeMonth failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (data) async {
        _log.logI('_onChangeMonth success: ${data.length} items');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          stationery: data,
          deleteSuccess: false,
        ));
      },
    );
  }

  //---(InitAdd)---//
  //---(InitAdd)---//
  Future<void> _onInitAdd(Emitter<StationeryState> emit) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      slips: [const StationerySlip()],
      supplyRequiredValidated: false,
    ));

    // Lấy isAdmin từ currentUser
    final userRes = await _authRepo.getCurrentUser();
    final user = userRes.getOrElse(() => null);
    final isAdmin = user?.isAdmin ?? false;

    final res = await _stationeryRepo.getSupplyItem();

    await res.fold(
      (err) async {
        _log.logE('_onInitAdd supply failed: $err');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
          isAdmin: isAdmin,
        ));
      },
      (supplies) async {
        _log.logI('_onInitAdd supply success: ${supplies.length} items, isAdmin=$isAdmin');
        if (supplies.isNotEmpty) {
          _log.logI('First supply: Unit=${supplies.first.unit}, RequestLimit=${supplies.first.requestLimit}');
        }
        emit(state.copyWith(
          status: BaseStateStatus.success,
          stationerySupply: supplies,
          isAdmin: isAdmin,
        ));
      },
    );
  }

  //---(InitEdit)---//
  Future<void> _onInitEdit(
    Emitter<StationeryState> emit, {
    required StationeryItem item,
    required List<StationeryDetailItem> details,
  }) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      slips: [const StationerySlip()],
      editItemId: item.id,
      supplyRequiredValidated: false,
    ));

    // Convert detail items sang slips
    final slips = details.map((d) {
      final supplyItem = StationerySupplyItem(
        codeRTC: d.code,
        nameNCC: d.officeSupplyName,
        unit: d.unit,
      );
      return StationerySlip(
        supply: supplyItem,
        quantity: d.quantity ?? 1,
        receivedQuantity: d.quantityReceived ?? 0,
        exceedsLimit: d.exceedsLimit ?? false,
        reason: d.reason ?? '',
        note: d.note ?? '',
        detailId: d.id,
      );
    }).toList();

    if (slips.isEmpty) {
      slips.add(const StationerySlip());
    }

    // Lấy isAdmin từ currentUser
    final userRes = await _authRepo.getCurrentUser();
    final user = userRes.getOrElse(() => null);
    final isAdmin = user?.isAdmin ?? false;

    final res = await _stationeryRepo.getSupplyItem();

    await res.fold(
      (err) async {
        _log.logE('_onInitEdit supply failed: $err');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
          slips: slips,
          isAdmin: isAdmin,
        ));
      },
      (supplies) async {
        _log.logI('_onInitEdit supply success: ${supplies.length} items, isAdmin=$isAdmin');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          slips: slips,
          stationerySupply: supplies,
          isAdmin: isAdmin,
        ));
      },
    );
  }

  //---(Slip Management)---//
  _onSelectSupply(
    Emitter<StationeryState> emit, {
    required int slipIndex,
    required StationerySupplyItem supply,
  }) {
    final slips = List<StationerySlip>.from(state.slips);
    if (slipIndex < 0 || slipIndex >= slips.length) return;

    final limit = supply.requestLimit;
    final qty = slips[slipIndex].quantity;
    final exceeds = limit != null && limit > 0 && qty > limit;
    _log.logI('_onSelectSupply: limit=$limit, qty=$qty, exceeds=$exceeds');

    slips[slipIndex] = slips[slipIndex].copyWith(
      supply: supply,
      unit: supply.unit ?? '-',
      receivedQuantity: supply.requestLimit ?? 0,
      exceedsLimit: exceeds,
      reason: exceeds ? slips[slipIndex].reason : '',
    );
    emit(state.copyWith(slips: slips, supplyRequiredValidated: false));
  }

  _onUpdateQuantity(
    Emitter<StationeryState> emit, {
    required int slipIndex,
    required int quantity,
  }) {
    final slips = List<StationerySlip>.from(state.slips);
    if (slipIndex < 0 || slipIndex >= slips.length) return;

    final limit = slips[slipIndex].supply?.requestLimit;
    final exceeds = limit != null && quantity > limit;

    slips[slipIndex] = slips[slipIndex].copyWith(
      quantity: quantity,
      exceedsLimit: exceeds,
      reason: exceeds ? slips[slipIndex].reason : '',
    );
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
    if (slips.length <= 1) return;
    slips.removeAt(slipIndex);
    emit(state.copyWith(slips: slips));
  }

  //---(Submit)---//
  Future<void> _onSubmit(Emitter<StationeryState> emit, {required DateTime dateRegister}) async {
    if (_isSubmitting) return;
    _isSubmitting = true;

    emit(state.copyWith(
      isSubmitting: true,
      submitSuccess: false,
      message: null,
    ));

    // Lấy user trước — chỉ isAdmin = true mới bỏ deadline
    final userRes = await _authRepo.getCurrentUser();
    final user = userRes.getOrElse(() => null);

    if (user == null) {
      _log.logE('_onSubmit: no current user');
      emit(state.copyWith(
        isSubmitting: false,
        status: BaseStateStatus.failed,
        message: 'Không lấy được thông tin người dùng.',
      ));
      _isSubmitting = false;
      return;
    }

    final isAdmin = user.isAdmin == true;

    // Deadline: chỉ kiểm tra ngày 1–5 khi KHÔNG phải admin
    if (!isAdmin && dateRegister.day > 5) {
      emit(state.copyWith(
        isSubmitting: false,
        status: BaseStateStatus.failed,
        message: 'Hiện tại đã quá thời hạn đăng ký!',
      ));
      _isSubmitting = false;
      return;
    }

    // VPP bắt buộc — vẫn validate cho admin
    final hasEmptySlip = state.slips.any((s) => s.supply == null);
    if (hasEmptySlip) {
      emit(state.copyWith(
        isSubmitting: false,
        status: BaseStateStatus.failed,
        message: 'Vui lòng chọn văn phòng phẩm cho tất cả các dòng.',
        supplyRequiredValidated: true,
      ));
      _isSubmitting = false;
      return;
    }

    // Số lượng phải >= 1 — vẫn validate cho admin
    final hasInvalidQty = state.slips.any((s) => s.quantity < 1);
    if (hasInvalidQty) {
      emit(state.copyWith(
        isSubmitting: false,
        status: BaseStateStatus.failed,
        message: 'Số lượng phải lớn hơn hoặc bằng 1.',
      ));
      _isSubmitting = false;
      return;
    }

    // Lý do vượt định mức — vẫn validate cho admin
    final hasEmptyReason = state.slips.any((s) => s.exceedsLimit && s.reason.trim().isEmpty);
    if (hasEmptyReason) {
      emit(state.copyWith(
        isSubmitting: false,
        status: BaseStateStatus.failed,
        message: 'Vui lòng nhập lý do vượt định mức cho các dòng có yêu cầu.',
      ));
      _isSubmitting = false;
      return;
    }

    final payload = _buildPayload(user.employeeId, user.departmentId, dateRegister: dateRegister);

    final saveRes = await _stationeryRepo.saveStationery(payload: payload);

    await saveRes.fold(
      (err) async {
        _log.logE('_onSubmit failed: $err');
        emit(state.copyWith(
          isSubmitting: false,
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (_) async {
        _log.logI('_onSubmit success');
        emit(state.copyWith(
          isSubmitting: false,
          submitSuccess: true,
          status: BaseStateStatus.success,
          message: 'Đăng ký văn phòng phẩm thành công.',
        ));
      },
    );

    _isSubmitting = false;
  }

  Map<String, dynamic> _buildPayload(int employeeId, int departmentId, {required DateTime dateRegister}) {
    final details = state.slips.map((s) {
      return {
        'ID': s.detailId ?? 0,
        'OfficeSupplyRequestsID': 0,
        'EmployeeID': employeeId,
        'OfficeSupplyID': s.supply?.id ?? 0,
        'Quantity': s.quantity,
        'QuantityReceived': s.receivedQuantity,
        'ExceedsLimit': s.exceedsLimit,
        'Reason': s.reason,
        'Note': s.note,
      };
    }).toList();

    return {
      'OfficeSupplyRequest': {
        'ID': state.editItemId ?? 0,
        'EmployeeIDRequest': employeeId,
        'DateRequest': dateRegister.toIso8601String(),
        'DepartmentID': departmentId,
        'IsApproved': false,
        'IsAdminApproved': false,
        'IsDeleted': false,
      },
      'OfficeSupplyRequestsDetails': details,
    };
  }

  _onClearSubmitState(Emitter<StationeryState> emit) {
    emit(state.copyWith(
      isSubmitting: false,
      submitSuccess: false,
      message: null,
    ));
  }

  //---(Delete)---//
  bool _isDeleting = false;

  Future<void> _onDelete(Emitter<StationeryState> emit, {required int itemId}) async {
    if (_isDeleting) return;
    _isDeleting = true;

    emit(state.copyWith(
      isDeleting: true,
      message: null,
    ));

    // Payload xóa: IsDeleted = true, không cần details
    final payload = <String, dynamic>{
      'OfficeSupplyRequest': {
        'ID': itemId,
        'IsDeleted': true,
      },
      'OfficeSupplyRequestsDetails': <Map<String, dynamic>>[],
    };

    final saveRes = await _stationeryRepo.saveStationery(payload: payload);

    await saveRes.fold(
      (err) async {
        _log.logE('_onDelete failed: $err');
        emit(state.copyWith(
          isDeleting: false,
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (_) async {
        _log.logI('_onDelete success: itemId=$itemId');
        emit(state.copyWith(
          isDeleting: false,
          deleteSuccess: true,
          status: BaseStateStatus.removeSuccess,
          message: 'Xóa phiếu thành công.',
        ));
      },
    );

    _isDeleting = false;
  }
}
