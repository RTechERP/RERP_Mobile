import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/bloc/bloc_status.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/booking_vehicle_model.dart';
import '../../data/datasource/models/booking_vehicle_passenger_form_shift.dart';
import '../../data/datasource/models/booking_vehicle_deliver_form_shift.dart';
import '../../data/datasource/models/booking_vehicle_receiver_form_shift.dart';
import '../../data/repository/booking_vehicle_repository.dart';
import '../bloc/booking_vehicle_bloc.dart';
import '../booking_vehicle_form_field_registry.dart';
import '../booking_vehicle_item_form_prefill.dart';
import '../booking_vehicle_passenger_go_payload.dart';
import '../widgets/forms/index.dart';
import '../widgets/infos/index.dart';

class BookingVehicleAddScreen extends StatefulWidget {
  const BookingVehicleAddScreen({
    super.key,
    this.existingBookingItem,
    this.copiedItemId,
    this.copiedBookingTypeGroup,
    this.copiedData,
  });

  /// Khi khác null: màn sửa — prefill từ item, submit gửi kèm `ID` bản ghi.
  final BookingVehicleItem? existingBookingItem;

  /// Dữ liệu sao chép từ "Sao chép tạo mới" (truyền từ route extra).
  final int? copiedItemId;
  final int? copiedBookingTypeGroup;
  final Map<String, dynamic>? copiedData;

  @override
  State<BookingVehicleAddScreen> createState() =>
      _BookingVehicleAddScreenState();
}

class _BookingVehicleAddScreenState
    extends
        BaseState<
          BookingVehicleAddScreen,
          BookingVehicleEvent,
          BookingVehicleState,
          BookingVehicleBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();

  /// Key để force touch type_transport field sau patchValue
  /// (FormBuilderField không tự sync sau patchValue nếu listener chưa attach).
  final _typeTransportKey = GlobalKey<FormBuilderFieldState>();

  /// Thứ tự ưu tiên validate field: theo layout form từ trên xuống dưới.
  /// passengerGo: main form → passenger rows (index 0..n).
  static const List<String> _passengerGoPriority = [
    'project',
    'time_need_present',
    'location_address',
    'provinces',
    'address',
    'time_depart',
    'starting_point',
    'return_point',
    'destination_address',
    'return_address',
    'type_transport',
    // passenger rows: employee pick, then manual fields
    'passenger_employee_0',
    'passenger_department_0',
    'passenger_code_0',
    'passenger_full_name_0',
    'passenger_contact_phone_0',
  ];

  /// passengerReturn: main form → passenger rows (index 0..n).
  static const List<String> _passengerReturnPriority = [
    'project',
    'time_need_present',
    'location_address',
    'provinces',
    'address',
    'time_return',
    'return_point',
    'return_address',
    'type_transport',
    'passenger_employee_0',
    'passenger_department_0',
    'passenger_code_0',
    'passenger_full_name_0',
    'passenger_contact_phone_0',
  ];

  /// selfVehicle (Chủ động phương tiện): giống passengerGo nhưng không có return fields.
  static const List<String> _selfVehiclePriority = [
    'project',
    'time_need_present',
    'location_address',
    'provinces',
    'address',
    'time_depart',
    'starting_point',
    'destination_address',
    'type_transport',
    // passenger rows: employee pick, then manual fields
    'passenger_employee_0',
    'passenger_department_0',
    'passenger_code_0',
    'passenger_full_name_0',
    'passenger_contact_phone_0',
  ];

  /// commercialDelivery: main form → receiver/package rows (index 0..n).
  static const List<String> _commercialDeliveryPriority = [
    'project',
    'time_need_present',
    'location_address',
    'provinces',
    'address',
    'time_return',
    'return_point',
    'return_address',
    'type_transport',
    // receiver/package rows
    'receiver_employee_0',
    'receiver_name_0',
    'receiver_phone_number_0',
    'commercial_package_name_0',
    'package_size_0',
    'package_weight_0',
    'commercial_package_quantity_0',
  ];

  /// commercialPickupAndDemoPickup: main form → giver/package rows (index 0..n).
  static const List<String> _commercialPickupPriority = [
    'pickup_project',
    'pickup_need_arrive_time',
    'pickup_departure_time',
    'pickup_company',
    'pickup_province',
    'pickup_address',
    'type_transport',
    // giver/package rows
    'pickup_giver_employee_0',
    'pickup_giver_name_0',
    'pickup_giver_phone_number_0',
    'pickup_package_name_0',
    'pickup_package_size_0',
    'pickup_package_weight_0',
    'pickup_package_quantity_0',
  ];

  FormFieldState<String>? _bookingTypeField;

  /// Mapping bookingTypeGroup số → enum (dùng trong helper methods).
  _BookingVehicleTypeGroup _bookingTypeGroupEnum(int g) {
    switch (g) {
      case 1:
        return _BookingVehicleTypeGroup.passengerReturn;
      case 2:
        return _BookingVehicleTypeGroup.commercialDelivery;
      case 3:
        return _BookingVehicleTypeGroup.commercialPickupAndDemoPickup;
      case 4:
        return _BookingVehicleTypeGroup.selfVehicle;
      default:
        return _BookingVehicleTypeGroup.passengerGo;
    }
  }

  /// Tính visible của card Người duyệt / Lý do phát sinh từ bloc state.
  /// Add mode: hiện khi không phải người về và time_need_present == hôm nay.
  /// Edit mode: hiện khi bản ghi đang sửa là case phát sinh sẵn.
  bool _shouldShowProblemRuleCard(BookingVehicleState bvState) {
    if (_bookingTypeGroupEnum(bvState.bookingTypeGroup) ==
        _BookingVehicleTypeGroup.passengerReturn) {
      return false;
    }

    if (_isEditMode) {
      final item = widget.existingBookingItem;
      if (item == null) return false;
      final hasProblemArises = (item.problemArises ?? '').trim().isNotEmpty;
      return item.isProblemArises == true || hasProblemArises;
    }

    final group = _bookingTypeGroupEnum(bvState.bookingTypeGroup);
    final String needArriveField;
    if (group == _BookingVehicleTypeGroup.commercialPickupAndDemoPickup) {
      needArriveField = 'pickup_need_arrive_time';
    } else {
      needArriveField = 'time_need_present';
    }

    final needArrive = bvState.formFieldValues[needArriveField] as DateTime?;
    return ValidateHelper.bookingVehicleProblemArisesCardVisibleForUi(
      needArrive,
    );
  }

  int _bookingTypeGroupFromLabel(String label) {
    switch (label) {
      case 'Đăng ký người đi':
        return 0;
      case 'Đăng ký người về':
        return 1;
      case 'Đăng ký giao hàng thương mại':
      case 'Đăng ký giao hàng Demo/triển lãm':
        return 2;
      case 'Đăng ký lấy hàng thương mại':
      case 'Đăng ký lấy hàng Demo/triển lãm':
        return 3;
      case 'Chủ động phương tiện':
        return 4;
      default:
        return 0;
    }
  }

  /// Chặn apply edit prefill nhiều lần.
  bool _editPrefillApplied = false;

  /// Chặn apply copy nhiều lần.
  bool _copyApplied = false;

  bool get _isEditMode => widget.existingBookingItem != null;

  int? get _existingBookingId {
    final id = widget.existingBookingItem?.id;
    if (id == null || id <= 0) return null;
    return id;
  }

  /// Kiểm tra currentUser có departmentId thuộc nhóm Sale không.
  /// Các department được phép sử dụng "Chủ động phương tiện": [3, 28, 29, 30, 12, 13]
  bool _canUseSelfVehicle(int? deptId) {
    if (deptId == null) return false;
    const saleDepartmentIds = [3, 28, 29, 30, 12, 13];
    return saleDepartmentIds.contains(deptId);
  }

  @override
  void initState() {
    super.initState();

    // Dữ liệu copy từ "Sao chép tạo mới" — nhận qua constructor
    final copiedData = widget.copiedData;
    final copiedGroupNum = widget.copiedBookingTypeGroup;

    // Xác định group: ưu tiên copy > edit > mặc định "người đi"
    final isEdit = widget.existingBookingItem != null;
    int effectiveGroup;

    if (copiedData != null && copiedGroupNum != null) {
      effectiveGroup = copiedGroupNum;
    } else if (isEdit) {
      effectiveGroup = _bookingTypeGroupFromLabel(
        bookingVehicleEditBookingTypeLabel(widget.existingBookingItem!),
      );
    } else {
      effectiveGroup = 0;
    }

    // Đọc currentEmployee từ SharedPreferences NGAY
    BookingVehicleRepository.getCurrentUserCache().then((cached) {
      if (!mounted) return;
      if (cached != null) {
        bloc.add(BookingVehicleEvent.prefillCurrentEmployee(employee: cached));
      }
    });

    bloc.add(const BookingVehicleEvent.clearSubmitResult());
    bloc.add(const BookingVehicleEvent.initAdd());
    bloc.add(BookingVehicleEvent.changeBookingTypeGroup(group: effectiveGroup));

    // Fire init events theo mode
    if (isEdit) {
      _fireInitEventsForEdit(effectiveGroup);
    } else if (copiedData != null) {
      _fireInitEventsForCopy(effectiveGroup);
    } else {
      bloc.add(const BookingVehicleEvent.initPassengerGoInfos());
    }

    // Apply prefill
    if (isEdit) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _tryApplyEditPrefill(context, bloc.state);
      });
    } else if (copiedData != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _applyCopyFromExtra(copiedData);
      });
    }
  }

  void _fireInitEventsForEdit(int group) {
    switch (_bookingTypeGroupEnum(group)) {
      case _BookingVehicleTypeGroup.passengerGo:
      case _BookingVehicleTypeGroup.passengerReturn:
      case _BookingVehicleTypeGroup.selfVehicle:
        bloc.add(const BookingVehicleEvent.initPassengerGoInfosForEdit());
        break;
      case _BookingVehicleTypeGroup.commercialDelivery:
        bloc.add(const BookingVehicleEvent.initCommercialReceiverInfos());
        bloc.add(const BookingVehicleEvent.preloadInitAdd());
        break;
      case _BookingVehicleTypeGroup.commercialPickupAndDemoPickup:
        bloc.add(const BookingVehicleEvent.initPickupGiverInfos());
        bloc.add(const BookingVehicleEvent.preloadInitAdd());
        break;
    }
  }

  void _fireInitEventsForCopy(int group) {
    switch (_bookingTypeGroupEnum(group)) {
      case _BookingVehicleTypeGroup.passengerGo:
      case _BookingVehicleTypeGroup.passengerReturn:
      case _BookingVehicleTypeGroup.selfVehicle:
        bloc.add(const BookingVehicleEvent.initPassengerGoInfos());
        bloc.add(const BookingVehicleEvent.preloadInitAdd());
        break;
      case _BookingVehicleTypeGroup.commercialDelivery:
        bloc.add(const BookingVehicleEvent.initCommercialReceiverInfos());
        bloc.add(const BookingVehicleEvent.preloadInitAdd());
        break;
      case _BookingVehicleTypeGroup.commercialPickupAndDemoPickup:
        bloc.add(const BookingVehicleEvent.initPickupGiverInfos());
        bloc.add(const BookingVehicleEvent.preloadInitAdd());
        break;
    }
  }

  void _applyCopyFromExtra(Map<String, dynamic> copiedData) {
    if (_copyApplied) return;

    // Nếu projects đã load xong → apply ngay (reactive flow của work_trip).
    if (bloc.state.status == BaseStateStatus.success &&
        bloc.state.projects.isNotEmpty) {
      _doApplyCopy(copiedData);
      return;
    }

    // Fallback: retry cho đến khi data sẵn sàng.
    _retryApplyCopy(copiedData);
  }

  void _doApplyCopy(Map<String, dynamic> copiedData) {
    _copyApplied = true;
    final patch = Map<String, dynamic>.from(copiedData);

    // Fire booking type group TRƯỚC khi patch form (để vehicle type dropdown hiển thị đúng)
    final groupRaw = patch.remove('_copied_booking_type_group');
    patch.remove('_copied_item_id');

    if (groupRaw is int) {
      bloc.add(BookingVehicleEvent.changeBookingTypeGroup(group: groupRaw));
    }

    // Đợi 1 frame để TypeForm mount xong rồi patchValue + force didChange.
    Future.delayed(Duration.zero, () {
      if (!mounted) return;

      final split = splitBookingVehicleFormAndInfo(patch);
      if (split.form.isNotEmpty) {
        bloc.add(BookingVehicleEvent.updateForm(values: split.form));
      }
      if (split.info.isNotEmpty) {
        bloc.add(BookingVehicleEvent.updateInfo(values: split.info));
      }
      _formKey.currentState?.patchValue(patch);
      final tv = patch['type_transport'] ?? patch['type_transport_text'];
      if (tv != null) {
        (_typeTransportKey.currentState as dynamic)?.didChange(tv);
      }
    });
  }

  /// Fallback khi chưa có data: retry mỗi 100ms cho đến khi projects load xong.
  void _retryApplyCopy(Map<String, dynamic> copiedData) {
    if (!mounted || _copyApplied) return;
    if (bloc.state.status != BaseStateStatus.success ||
        bloc.state.projects.isEmpty) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted && !_copyApplied) {
          _retryApplyCopy(copiedData);
        }
      });
      return;
    }

    _doApplyCopy(copiedData);
  }

  @override
  void dispose() {
    if (widget.existingBookingItem == null) {
      BookingVehicleRepository.clearInitAddCache();
    }
    super.dispose();
  }

  void _tryApplyEditPrefill(BuildContext context, BookingVehicleState state) {
    final edit = widget.existingBookingItem;
    if (edit == null || _editPrefillApplied) return;
    if (state.status != BaseStateStatus.success) return;
    if (state.projects.isEmpty) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _editPrefillApplied) return;

      // Fire booking type group TRƯỚC khi patch form
      final groupNum = _bookingTypeGroupFromLabel(
        bookingVehicleEditBookingTypeLabel(edit),
      );
      bloc.add(BookingVehicleEvent.changeBookingTypeGroup(group: groupNum));

      final patch = buildBookingVehicleEditFormPatch(
        edit,
        projects: state.projects,
      );

      // Đợi 1 frame để TypeForm mount xong rồi patchValue + force didChange.
      Future.delayed(Duration.zero, () {
        if (!mounted || _editPrefillApplied) return;

        final split = splitBookingVehicleFormAndInfo(patch);
        if (split.form.isNotEmpty) {
          bloc.add(BookingVehicleEvent.updateForm(values: split.form));
        }
        if (split.info.isNotEmpty) {
          bloc.add(BookingVehicleEvent.updateInfo(values: split.info));
        }
        _formKey.currentState?.patchValue(patch);
        final transportVal = patch['type_transport'];
        if (transportVal != null) {
          (_typeTransportKey.currentState as dynamic)?.didChange(transportVal);
        }
        _editPrefillApplied = true;
      });
    });
  }

  List<String>? _priorityFieldsForGroupInt(int? g) {
    if (g == null) return null;
    switch (_bookingTypeGroupEnum(g)) {
      case _BookingVehicleTypeGroup.passengerGo:
        return _passengerGoPriority;
      case _BookingVehicleTypeGroup.selfVehicle:
        return _selfVehiclePriority;
      case _BookingVehicleTypeGroup.passengerReturn:
        return _passengerReturnPriority;
      case _BookingVehicleTypeGroup.commercialDelivery:
        return _commercialDeliveryPriority;
      case _BookingVehicleTypeGroup.commercialPickupAndDemoPickup:
        return _commercialPickupPriority;
    }
  }

  void _onSubmitForm() {
    FocusScope.of(context).unfocus();

    final formState = _formKey.currentState;
    if (formState == null) return;

    print('📋 pre-saveAndValidate project="${formState.value['project']}"');

    final snapshotValues = <String, dynamic>{
      ...bloc.state.formFieldValues,
      ...bloc.state.infoFieldValues,
      ...formState.instantValue,
    };

    if (!formState.saveAndValidate()) {
      print('❌ saveAndValidate FAILED, formState.value now=${formState.value}');
      FormHelper.focusFirstError(
        formState: formState,
        priorityFields: _priorityFieldsForGroupInt(bloc.state.bookingTypeGroup),
      );
      return;
    }

    final savedValues = <String, dynamic>{
      ...snapshotValues,
      ...formState.value,
    };
    print('✅ saveAndValidate OK, saved project="${savedValues['project']}"');

    final g = bloc.state.bookingTypeGroup;
    final group = _bookingTypeGroupEnum(g);
    final editId = _existingBookingId;
    final createdOriginal = widget.existingBookingItem?.createdDate;

    if (createdOriginal != null) {
      savedValues[kBookingVehicleProblemRuleRegistrationKey] = createdOriginal;
    }

    switch (group) {
      case _BookingVehicleTypeGroup.passengerGo:
        bloc.add(
          BookingVehicleEvent.submitPassengerGo(
            formValues: savedValues,
            existingBookingId: editId,
          ),
        );
        break;
      case _BookingVehicleTypeGroup.selfVehicle:
        bloc.add(
          BookingVehicleEvent.submitSelfVehicle(
            formValues: savedValues,
            existingBookingId: editId,
          ),
        );
        break;
      case _BookingVehicleTypeGroup.passengerReturn:
        bloc.add(
          BookingVehicleEvent.submitPassengerReturn(
            formValues: savedValues,
            existingBookingId: editId,
          ),
        );
        break;
      case _BookingVehicleTypeGroup.commercialDelivery:
        bloc.add(
          BookingVehicleEvent.submitCommercialDelivery(
            formValues: savedValues,
            existingBookingId: editId,
          ),
        );
        break;
      case _BookingVehicleTypeGroup.commercialPickupAndDemoPickup:
        bloc.add(
          BookingVehicleEvent.submitCommercialPickup(
            formValues: savedValues,
            existingBookingId: editId,
          ),
        );
        break;
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<BookingVehicleBloc, BookingVehicleState>(
          listenWhen: (previous, current) =>
              previous.projects.length != current.projects.length ||
              previous.status != current.status,
          listener: (context, state) {
            // Apply edit prefill khi projects đã load (pattern giống work_trip).
            if (!_editPrefillApplied &&
                widget.existingBookingItem != null &&
                state.status == BaseStateStatus.success &&
                state.projects.isNotEmpty) {
              _tryApplyEditPrefill(context, state);
            }
            // Apply copy prefill khi projects đã load (pattern giống work_trip).
            if (!_copyApplied &&
                widget.copiedData != null &&
                state.status == BaseStateStatus.success &&
                state.projects.isNotEmpty) {
              _applyCopyFromExtra(widget.copiedData!);
            }
          },
          child: BlocListener<BookingVehicleBloc, BookingVehicleState>(
            listenWhen: (previous, current) =>
                previous.message != current.message &&
                current.message != null &&
                current.message!.isNotEmpty &&
                !current.isSubmitting &&
                !current.submitSuccess,
            listener: (context, state) {
              showMessage(context, state.message!, type: SnackBarType.error);
            },
            child: BlocListener<BookingVehicleBloc, BookingVehicleState>(
              listenWhen: (previous, current) =>
                  previous.submitSuccess != current.submitSuccess,
              listener: (context, state) {
                if (state.submitSuccess) {
                  showMessage(
                    context,
                    _isEditMode
                        ? 'Cập nhật đặt xe thành công'
                        : 'Tạo đặt xe thành công',
                    type: SnackBarType.success,
                  );
                  if (mounted) context.pop(true);
                }
              },
              child: BaseScaffold(
                appBar: AppBarCommon(
                  title: Text(_isEditMode ? 'Sửa đặt xe' : 'Tạo đặt xe'),
                ),
                body: BlocBuilder<BookingVehicleBloc, BookingVehicleState>(
                  buildWhen: (prev, curr) =>
                      prev.status != curr.status ||
                      prev.bookingTypeGroup != curr.bookingTypeGroup ||
                      prev.projects != curr.projects ||
                      prev.provinceDeparture != curr.provinceDeparture ||
                      prev.provinceArrives != curr.provinceArrives ||
                      prev.approver != curr.approver ||
                      prev.formFieldValues != curr.formFieldValues ||
                      prev.employee != curr.employee ||
                      prev.currentEmployee != curr.currentEmployee ||
                      prev.passengerGoLineCount != curr.passengerGoLineCount ||
                      prev.expandedPassengerGoIndex !=
                          curr.expandedPassengerGoIndex ||
                      prev.passengerGoFirstRowIsCurrentUserSlot !=
                          curr.passengerGoFirstRowIsCurrentUserSlot ||
                      prev.passengerFormGeneration !=
                          curr.passengerFormGeneration ||
                      prev.commercialReceiverLineCount !=
                          curr.commercialReceiverLineCount ||
                      prev.expandedCommercialDeliveryReceiverIndex !=
                          curr.expandedCommercialDeliveryReceiverIndex ||
                      prev.commercialReceiverFormGeneration !=
                          curr.commercialReceiverFormGeneration ||
                      prev.pickupGiverLineCount != curr.pickupGiverLineCount ||
                      prev.expandedPickupGiverIndex !=
                          curr.expandedPickupGiverIndex ||
                      prev.pickupGiverFormGeneration !=
                          curr.pickupGiverFormGeneration ||
                      prev.infoFieldValues != curr.infoFieldValues,
                  builder: (context, state) {
                    return FormBuilder(
                      key: _formKey,
                      initialValue: {
                        'booking_type': 'Đăng ký người đi',
                        'booking_type_text': 'Đăng ký người đi',
                        'type_transport': 'Ô tô, xe máy ...',
                        'type_transport_text': 'Ô tô, xe máy ...',
                        'starting_point': 'VP Hà Nội',
                        'return_point': 'Khác',
                        ...state.formFieldValues,
                        ...state.infoFieldValues,
                      },
                      onChanged: () {
                        final raw =
                            _formKey.currentState?.instantValue ?? const {};
                        final split = splitBookingVehicleFormAndInfo(raw);
                        if (split.form.isNotEmpty) {
                          bloc.add(
                            BookingVehicleEvent.updateForm(values: split.form),
                          );
                        }
                        if (split.info.isNotEmpty) {
                          bloc.add(
                            BookingVehicleEvent.updateInfo(values: split.info),
                          );
                        }
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(16),
                              children: [
                                /// ===== HÌNH THỨC ĐẶT =====
                                FormCard(
                                  child: GestureDetector(
                                    onTap: () {
                                      final deptId = bloc
                                          .state
                                          .currentEmployee
                                          ?.departmentId;

                                      final bookingTypeOptions = [
                                        'Đăng ký người đi',
                                        'Đăng ký người về',
                                        if (_canUseSelfVehicle(deptId))
                                          'Chủ động phương tiện',
                                        'Đăng ký giao hàng thương mại',
                                        'Đăng ký lấy hàng thương mại',
                                        'Đăng ký giao hàng Demo/triển lãm',
                                        'Đăng ký lấy hàng Demo/triển lãm',
                                      ];

                                      openSelectBottomSheet(
                                        context: context,
                                        title: 'Chọn hình thức đặt',
                                        items: bookingTypeOptions,
                                        onSelected: (item) {
                                          _bookingTypeField?.didChange(item);
                                          final groupNum =
                                              _bookingTypeGroupFromLabel(item);
                                          bloc.add(
                                            BookingVehicleEvent.changeBookingTypeGroup(
                                              group: groupNum,
                                            ),
                                          );

                                          // Group 0, 1, 4 dùng chung passengerGoInfos
                                          if (groupNum == 0 ||
                                              groupNum == 1 ||
                                              groupNum == 4) {
                                            bloc.add(
                                              const BookingVehicleEvent.initPassengerGoInfos(),
                                            );
                                          } else if (groupNum == 2) {
                                            bloc.add(
                                              const BookingVehicleEvent.initCommercialReceiverInfos(),
                                            );
                                            bloc.add(
                                              const BookingVehicleEvent.preloadInitAdd(),
                                            );
                                          } else if (groupNum == 3) {
                                            bloc.add(
                                              const BookingVehicleEvent.initPickupGiverInfos(),
                                            );
                                            bloc.add(
                                              const BookingVehicleEvent.preloadInitAdd(),
                                            );
                                          }
                                        },
                                        displayText: (item) => item,
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        nameForm: 'booking_type',
                                        nameTextField: 'booking_type_text',
                                        label: 'Hình thức đặt',
                                        onFieldCreated: (field) =>
                                            _bookingTypeField = field,
                                        icon: Icons.directions_car_outlined,
                                        isRequired: true,
                                        validator:
                                            FormBuilderValidators.required(
                                              errorText:
                                                  'Vui lòng chọn hình thức đặt',
                                            ),
                                        readOnly: true,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),

                                /// ===== NGƯỜI DUYỆT & LÝ DO PHÁT SINH =====
                                /// Chỉ hiện khi: không phải sửa, thời gian cần đến == hôm nay,
                                /// VÀ không phải form người về.
                                if (_shouldShowProblemRuleCard(state))
                                  BlocBuilder<
                                    BookingVehicleBloc,
                                    BookingVehicleState
                                  >(
                                    buildWhen: (prev, curr) =>
                                        prev.approver != curr.approver ||
                                        prev.formFieldValues !=
                                            curr.formFieldValues ||
                                        prev.infoFieldValues !=
                                            curr.infoFieldValues,
                                    builder: (context, bvState) {
                                      return FormCard(
                                        child: Column(
                                          children: [
                                            /// --- Người duyệt ---
                                            GestureDetector(
                                              onTap: () {
                                                // Ưu tiên in-memory cache (đã hydrate
                                                // từ màn list), fallback state.
                                                final fromCache =
                                                    BookingVehicleRepository
                                                        .approversSync;
                                                final approvers =
                                                    fromCache.isNotEmpty
                                                    ? fromCache
                                                    : bvState.approver;
                                                openSelectBottomSheet(
                                                  context: context,
                                                  title: 'Chọn người duyệt',
                                                  items: approvers,
                                                  onSelected: (item) {
                                                    final approverName =
                                                        item.fullName ?? '';
                                                    bloc.add(
                                                      BookingVehicleEvent.selectApprover(
                                                        employeeId:
                                                            item.employeeId ??
                                                            0,
                                                      ),
                                                    );
                                                    _formKey.currentState
                                                        ?.patchValue({
                                                          'approver':
                                                              (item.employeeId ??
                                                                      0)
                                                                  .toString(),
                                                          'approver_text':
                                                              approverName,
                                                          'approver_field':
                                                              approverName,
                                                        });
                                                  },
                                                  displayText: (item) =>
                                                      item.fullName ?? '',
                                                );
                                              },
                                              child: AbsorbPointer(
                                                child: FormBuilderField<String>(
                                                  name: 'approver',
                                                  validator:
                                                      FormBuilderValidators.required(
                                                        errorText:
                                                            'Vui lòng chọn người duyệt',
                                                      ),
                                                  builder: (field) {
                                                    return FormInputField(
                                                      nameForm:
                                                          'approver_field',
                                                      nameTextField:
                                                          'approver_text',
                                                      label: 'Người duyệt',
                                                      icon: Icons
                                                          .manage_accounts_outlined,
                                                      isRequired: true,
                                                      readOnly: true,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),

                                            /// --- Lý do phát sinh ---
                                            if (!_isEditMode ||
                                                ((widget
                                                            .existingBookingItem
                                                            ?.isProblemArises ==
                                                        true) ||
                                                    (widget
                                                            .existingBookingItem
                                                            ?.problemArises
                                                            ?.trim()
                                                            .isNotEmpty ==
                                                        true)))
                                              Column(
                                                children: [
                                                  const SizedBox(height: 12),
                                                  FormBuilderField<String>(
                                                    name: 'problem_field',
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value
                                                              .trim()
                                                              .isEmpty) {
                                                        return 'Vui lòng nhập lý do phát sinh';
                                                      }
                                                      return null;
                                                    },
                                                    builder: (field) {
                                                      return FormInputField(
                                                        nameForm:
                                                            'problem_rule_reason',
                                                        nameTextField:
                                                            'problem_rule_reason_text',
                                                        label:
                                                            'Lý do phát sinh',
                                                        icon: Icons
                                                            .report_problem_outlined,
                                                        isRequired: true,
                                                        autoExpand: true,
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                const SizedBox(height: 6),
                                ...[
                                  if (_bookingTypeGroupEnum(
                                            state.bookingTypeGroup,
                                          ) ==
                                          _BookingVehicleTypeGroup
                                              .passengerGo ||
                                      _bookingTypeGroupEnum(
                                            state.bookingTypeGroup,
                                          ) ==
                                          _BookingVehicleTypeGroup.selfVehicle)
                                    TypeFormPassengerGo(
                                      projects: state.projects,
                                      departureProvinces:
                                          state.provinceDeparture,
                                      arrivalProvinces: state.provinceArrives,
                                      formKey: _formKey,
                                      typeTransportKey: _typeTransportKey,
                                      isSelfVehicle:
                                          _bookingTypeGroupEnum(
                                            state.bookingTypeGroup,
                                          ) ==
                                          _BookingVehicleTypeGroup.selfVehicle,
                                    ),
                                  if (_bookingTypeGroupEnum(
                                            state.bookingTypeGroup,
                                          ) ==
                                          _BookingVehicleTypeGroup
                                              .passengerGo ||
                                      _bookingTypeGroupEnum(
                                            state.bookingTypeGroup,
                                          ) ==
                                          _BookingVehicleTypeGroup.selfVehicle)
                                    const SizedBox(height: 12),
                                  if (_bookingTypeGroupEnum(
                                            state.bookingTypeGroup,
                                          ) ==
                                          _BookingVehicleTypeGroup
                                              .passengerGo ||
                                      _bookingTypeGroupEnum(
                                            state.bookingTypeGroup,
                                          ) ==
                                          _BookingVehicleTypeGroup.selfVehicle)
                                    BlocBuilder<
                                      BookingVehicleBloc,
                                      BookingVehicleState
                                    >(
                                      buildWhen: (prev, curr) =>
                                          prev.employee != curr.employee ||
                                          prev.currentEmployee !=
                                              curr.currentEmployee ||
                                          prev.passengerGoLineCount !=
                                              curr.passengerGoLineCount ||
                                          prev.expandedPassengerGoIndex !=
                                              curr.expandedPassengerGoIndex ||
                                          prev.passengerGoFirstRowIsCurrentUserSlot !=
                                              curr.passengerGoFirstRowIsCurrentUserSlot ||
                                          prev.passengerFormGeneration !=
                                              curr.passengerFormGeneration ||
                                          prev.infoFieldValues !=
                                              curr.infoFieldValues,
                                      builder: (context, state) {
                                        final n = state.passengerGoLineCount;
                                        if (n <= 0) {
                                          return Center(
                                            child: TextButton.icon(
                                              onPressed: () {
                                                context
                                                    .read<BookingVehicleBloc>()
                                                    .add(
                                                      const BookingVehicleEvent.initPassengerGoInfos(),
                                                    );
                                                context
                                                    .read<BookingVehicleBloc>()
                                                    .add(
                                                      const BookingVehicleEvent.preloadInitAdd(),
                                                    );
                                              },
                                              icon: const Icon(
                                                Icons.person_add_outlined,
                                              ),
                                              label: const Text(
                                                'Thêm người đi',
                                              ),
                                            ),
                                          );
                                        }

                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            for (var i = 0; i < n; i++)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 8,
                                                ),
                                                child: PassengerInfoItem(
                                                  key: ValueKey(
                                                    'pass_line_${i}_${state.passengerFormGeneration}',
                                                  ),
                                                  index: i,
                                                  isExpanded:
                                                      state
                                                          .expandedPassengerGoIndex ==
                                                      i,
                                                  totalCount: n,
                                                  employeeOptions:
                                                      BookingVehicleRepository
                                                          .employeesSync
                                                          .isNotEmpty
                                                      ? BookingVehicleRepository
                                                            .employeesSync
                                                      : state.employee,
                                                  infoFieldValues:
                                                      state.infoFieldValues,
                                                  prefillEmployee:
                                                      i == 0 &&
                                                          state
                                                              .passengerGoFirstRowIsCurrentUserSlot
                                                      ? state.currentEmployee
                                                      : null,
                                                  generation: state
                                                      .passengerFormGeneration,
                                                  onToggleExpand: () {
                                                    bloc.add(
                                                      BookingVehicleEvent.expandPassengerGoInfo(
                                                        index: i,
                                                      ),
                                                    );
                                                  },
                                                  onDelete: () {
                                                    if (_formKey.currentState ==
                                                        null)
                                                      return;
                                                    final shifted =
                                                        BookingVehiclePassengerFormShift.computeShiftedFields(
                                                          form: _formKey
                                                              .currentState!,
                                                          deletedIndex: i,
                                                          oldLineCount: n,
                                                        );
                                                    _formKey.currentState
                                                        ?.patchValue(shifted);
                                                    bloc.add(
                                                      BookingVehicleEvent.deletePassengerGoInfo(
                                                        index: i,
                                                        shiftedFields: shifted,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),

                                            const SizedBox(height: 4),

                                            Center(
                                              child: InkResponse(
                                                onTap: () {
                                                  bloc.add(
                                                    const BookingVehicleEvent.addPassengerGoInfo(),
                                                  );
                                                },
                                                radius: 28,
                                                child: const Icon(
                                                  Icons.add_circle_outline,
                                                  size: 32,
                                                  color: AppColors.primaryERP,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),

                                  if (_bookingTypeGroupEnum(
                                        state.bookingTypeGroup,
                                      ) ==
                                      _BookingVehicleTypeGroup.passengerReturn)
                                    TypeFormPassengerReturn(
                                      projects: state.projects,
                                      departureProvinces:
                                          state.provinceDeparture,
                                      arrivalProvinces: state.provinceArrives,
                                      formKey: _formKey,
                                      typeTransportKey: _typeTransportKey,
                                    ),
                                  if (_bookingTypeGroupEnum(
                                        state.bookingTypeGroup,
                                      ) ==
                                      _BookingVehicleTypeGroup.passengerReturn)
                                    const SizedBox(height: 12),
                                  if (_bookingTypeGroupEnum(
                                        state.bookingTypeGroup,
                                      ) ==
                                      _BookingVehicleTypeGroup.passengerReturn)
                                    BlocBuilder<
                                      BookingVehicleBloc,
                                      BookingVehicleState
                                    >(
                                      buildWhen: (prev, curr) =>
                                          prev.employee != curr.employee ||
                                          prev.currentEmployee !=
                                              curr.currentEmployee ||
                                          prev.passengerGoLineCount !=
                                              curr.passengerGoLineCount ||
                                          prev.expandedPassengerGoIndex !=
                                              curr.expandedPassengerGoIndex ||
                                          prev.passengerGoFirstRowIsCurrentUserSlot !=
                                              curr.passengerGoFirstRowIsCurrentUserSlot ||
                                          prev.passengerFormGeneration !=
                                              curr.passengerFormGeneration ||
                                          prev.infoFieldValues !=
                                              curr.infoFieldValues,
                                      builder: (context, state) {
                                        final n = state.passengerGoLineCount;
                                        if (n <= 0) {
                                          return Center(
                                            child: TextButton.icon(
                                              onPressed: () {
                                                context
                                                    .read<BookingVehicleBloc>()
                                                    .add(
                                                      const BookingVehicleEvent.initPassengerGoInfos(),
                                                    );
                                                context
                                                    .read<BookingVehicleBloc>()
                                                    .add(
                                                      const BookingVehicleEvent.preloadInitAdd(),
                                                    );
                                              },
                                              icon: const Icon(
                                                Icons.person_add_outlined,
                                              ),
                                              label: const Text(
                                                'Thêm người đi',
                                              ),
                                            ),
                                          );
                                        }

                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            for (var i = 0; i < n; i++) ...[
                                              PassengerInfoItem(
                                                key: ValueKey(
                                                  'pass_line_${i}_${state.passengerFormGeneration}',
                                                ),
                                                index: i,
                                                isExpanded:
                                                    state
                                                        .expandedPassengerGoIndex ==
                                                    i,
                                                totalCount: n,
                                                employeeOptions:
                                                    BookingVehicleRepository
                                                        .employeesSync
                                                        .isNotEmpty
                                                    ? BookingVehicleRepository
                                                          .employeesSync
                                                    : state.employee,
                                                infoFieldValues:
                                                    state.infoFieldValues,
                                                prefillEmployee:
                                                    i == 0 &&
                                                        state
                                                            .passengerGoFirstRowIsCurrentUserSlot
                                                    ? state.currentEmployee
                                                    : null,
                                                generation: state
                                                    .passengerFormGeneration,
                                                onToggleExpand: () {
                                                  bloc.add(
                                                    BookingVehicleEvent.expandPassengerGoInfo(
                                                      index: i,
                                                    ),
                                                  );
                                                },
                                                onDelete: () {
                                                  if (_formKey.currentState ==
                                                      null)
                                                    return;
                                                  final shifted =
                                                      BookingVehiclePassengerFormShift.computeShiftedFields(
                                                        form: _formKey
                                                            .currentState!,
                                                        deletedIndex: i,
                                                        oldLineCount: n,
                                                      );
                                                  _formKey.currentState
                                                      ?.patchValue(shifted);
                                                  bloc.add(
                                                    BookingVehicleEvent.deletePassengerGoInfo(
                                                      index: i,
                                                      shiftedFields: shifted,
                                                    ),
                                                  );
                                                },
                                              ),
                                              if (i < n - 1)
                                                const SizedBox(height: 12),
                                            ],

                                            const SizedBox(height: 4),

                                            Center(
                                              child: InkResponse(
                                                onTap: () {
                                                  bloc.add(
                                                    const BookingVehicleEvent.addPassengerGoInfo(),
                                                  );
                                                },
                                                radius: 28,
                                                child: const Icon(
                                                  Icons.add_circle_outline,
                                                  size: 32,
                                                  color: AppColors.primaryERP,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  if (_bookingTypeGroupEnum(
                                        state.bookingTypeGroup,
                                      ) ==
                                      _BookingVehicleTypeGroup
                                          .commercialDelivery)
                                    TypeFormCommercialDelivery(
                                      projects: state.projects,
                                      departureProvinces:
                                          state.provinceDeparture,
                                      arrivalProvinces: state.provinceArrives,
                                      formKey: _formKey,
                                      typeTransportKey: _typeTransportKey,
                                    ),
                                  if (_bookingTypeGroupEnum(
                                        state.bookingTypeGroup,
                                      ) ==
                                      _BookingVehicleTypeGroup
                                          .commercialDelivery)
                                    const SizedBox(height: 12),
                                  if (_bookingTypeGroupEnum(
                                        state.bookingTypeGroup,
                                      ) ==
                                      _BookingVehicleTypeGroup
                                          .commercialDelivery)
                                    BlocBuilder<
                                      BookingVehicleBloc,
                                      BookingVehicleState
                                    >(
                                      buildWhen: (prev, curr) =>
                                          prev.employee != curr.employee ||
                                          prev.currentEmployee !=
                                              curr.currentEmployee ||
                                          prev.commercialReceiverLineCount !=
                                              curr.commercialReceiverLineCount ||
                                          prev.expandedCommercialDeliveryReceiverIndex !=
                                              curr.expandedCommercialDeliveryReceiverIndex ||
                                          prev.commercialReceiverFormGeneration !=
                                              curr.commercialReceiverFormGeneration ||
                                          prev.infoFieldValues !=
                                              curr.infoFieldValues,
                                      builder: (context, state) {
                                        final n =
                                            state.commercialReceiverLineCount;
                                        if (n <= 0) {
                                          return Center(
                                            child: TextButton.icon(
                                              onPressed: () {
                                                context
                                                    .read<BookingVehicleBloc>()
                                                    .add(
                                                      const BookingVehicleEvent.initCommercialReceiverInfos(),
                                                    );
                                                context
                                                    .read<BookingVehicleBloc>()
                                                    .add(
                                                      const BookingVehicleEvent.preloadInitAdd(),
                                                    );
                                              },
                                              icon: const Icon(
                                                Icons.person_add_outlined,
                                              ),
                                              label: const Text(
                                                'Thêm người nhận',
                                              ),
                                            ),
                                          );
                                        }

                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            for (var i = 0; i < n; i++)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 8,
                                                ),
                                                child: ReceiverPackageInfoItem(
                                                  key: ValueKey(
                                                    'recv_line_${i}_${state.commercialReceiverFormGeneration}',
                                                  ),
                                                  index: i,
                                                  isExpanded:
                                                      state
                                                          .expandedCommercialDeliveryReceiverIndex ==
                                                      i,
                                                  totalCount: n,
                                                  employeeOptions:
                                                      BookingVehicleRepository
                                                          .employeesSync
                                                          .isNotEmpty
                                                      ? BookingVehicleRepository
                                                            .employeesSync
                                                      : state.employee,
                                                  infoFieldValues:
                                                      state.infoFieldValues,
                                                  prefillEmployee: null,
                                                  generation: state
                                                      .commercialReceiverFormGeneration,
                                                  onToggleExpand: () {
                                                    bloc.add(
                                                      BookingVehicleEvent.expandCommercialReceiverInfo(
                                                        index: i,
                                                      ),
                                                    );
                                                  },
                                                  onDelete: () {
                                                    if (n <= 1) return;
                                                    if (_formKey.currentState ==
                                                        null)
                                                      return;
                                                    final shifted =
                                                        BookingVehicleReceiverFormShift.computeShiftedFields(
                                                          form: _formKey
                                                              .currentState!,
                                                          deletedIndex: i,
                                                          oldLineCount: n,
                                                        );
                                                    _formKey.currentState
                                                        ?.patchValue(shifted);
                                                    bloc.add(
                                                      BookingVehicleEvent.deleteCommercialReceiverInfo(
                                                        index: i,
                                                        shiftedFields: shifted,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),

                                            const SizedBox(height: 4),

                                            Center(
                                              child: InkResponse(
                                                onTap: () {
                                                  bloc.add(
                                                    const BookingVehicleEvent.addCommercialReceiverInfo(),
                                                  );
                                                },
                                                radius: 28,
                                                child: const Icon(
                                                  Icons.add_circle_outline,
                                                  size: 32,
                                                  color: AppColors.primaryERP,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  // Package đã nằm trong từng card "Người nhận".
                                  if (_bookingTypeGroupEnum(
                                        state.bookingTypeGroup,
                                      ) ==
                                      _BookingVehicleTypeGroup
                                          .commercialPickupAndDemoPickup)
                                    TypeFormReceiver(
                                      projects: state.projects,
                                      arrivalProvinces: state.provinceArrives,
                                      formKey: _formKey,
                                      typeTransportKey: _typeTransportKey,
                                    ),
                                  if (_bookingTypeGroupEnum(
                                        state.bookingTypeGroup,
                                      ) ==
                                      _BookingVehicleTypeGroup
                                          .commercialPickupAndDemoPickup)
                                    const SizedBox(height: 12),
                                  if (_bookingTypeGroupEnum(
                                        state.bookingTypeGroup,
                                      ) ==
                                      _BookingVehicleTypeGroup
                                          .commercialPickupAndDemoPickup)
                                    BlocBuilder<
                                      BookingVehicleBloc,
                                      BookingVehicleState
                                    >(
                                      buildWhen: (prev, curr) =>
                                          prev.employee != curr.employee ||
                                          prev.currentEmployee !=
                                              curr.currentEmployee ||
                                          prev.pickupGiverLineCount !=
                                              curr.pickupGiverLineCount ||
                                          prev.expandedPickupGiverIndex !=
                                              curr.expandedPickupGiverIndex ||
                                          prev.pickupGiverFormGeneration !=
                                              curr.pickupGiverFormGeneration ||
                                          prev.infoFieldValues !=
                                              curr.infoFieldValues,
                                      builder: (context, state) {
                                        final n = state.pickupGiverLineCount;
                                        if (n <= 0) {
                                          return Center(
                                            child: TextButton.icon(
                                              onPressed: () {
                                                context
                                                    .read<BookingVehicleBloc>()
                                                    .add(
                                                      const BookingVehicleEvent.initPickupGiverInfos(),
                                                    );
                                                context
                                                    .read<BookingVehicleBloc>()
                                                    .add(
                                                      const BookingVehicleEvent.preloadInitAdd(),
                                                    );
                                              },
                                              icon: const Icon(
                                                Icons.person_add_outlined,
                                              ),
                                              label: const Text(
                                                'Thêm người giao',
                                              ),
                                            ),
                                          );
                                        }

                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            for (var i = 0; i < n; i++)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 8,
                                                ),
                                                child: DeliverPackageInfoItem(
                                                  key: ValueKey(
                                                    'pickup_giver_${i}_${state.pickupGiverFormGeneration}',
                                                  ),
                                                  index: i,
                                                  isExpanded:
                                                      state
                                                          .expandedPickupGiverIndex ==
                                                      i,
                                                  totalCount: n,
                                                  employeeOptions:
                                                      BookingVehicleRepository
                                                          .employeesSync
                                                          .isNotEmpty
                                                      ? BookingVehicleRepository
                                                            .employeesSync
                                                      : state.employee,
                                                  infoFieldValues:
                                                      state.infoFieldValues,
                                                  prefillEmployee: null,
                                                  generation: state
                                                      .pickupGiverFormGeneration,
                                                  onToggleExpand: () {
                                                    bloc.add(
                                                      BookingVehicleEvent.expandPickupGiverInfo(
                                                        index: i,
                                                      ),
                                                    );
                                                  },
                                                  onDelete: () {
                                                    if (n <= 1) return;
                                                    if (_formKey.currentState ==
                                                        null)
                                                      return;
                                                    final shifted =
                                                        BookingVehicleDeliverFormShift.computeShiftedFields(
                                                          form: _formKey
                                                              .currentState!,
                                                          deletedIndex: i,
                                                          oldLineCount: n,
                                                        );
                                                    _formKey.currentState
                                                        ?.patchValue(shifted);
                                                    bloc.add(
                                                      BookingVehicleEvent.deletePickupGiverInfo(
                                                        index: i,
                                                        shiftedFields: shifted,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            const SizedBox(height: 4),
                                            Center(
                                              child: InkResponse(
                                                onTap: () {
                                                  bloc.add(
                                                    const BookingVehicleEvent.addPickupGiverInfo(),
                                                  );
                                                },
                                                radius: 28,
                                                child: const Icon(
                                                  Icons.add_circle_outline,
                                                  size: 32,
                                                  color: AppColors.primaryERP,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                ],
                              ],
                            ),
                          ),

                          /// ===== ACTIONS =====
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 8.0,
                            ),
                            child: FormActions(
                              mode: _isEditMode
                                  ? FormActionMode.edit
                                  : FormActionMode.add,
                              onSubmit: _isEditMode ? null : _onSubmitForm,
                              onSave: _isEditMode ? _onSubmitForm : null,
                              onCancel: _isEditMode
                                  ? () => context.pop()
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),

        /// ===== LOADING OVERLAY =====
        BlocBuilder<BookingVehicleBloc, BookingVehicleState>(
          buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
          builder: (context, state) {
            if (!state.isSubmitting) {
              return const SizedBox.shrink();
            }

            return Positioned.fill(
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
                  color: Colors.black.withValues(alpha: 0.45),
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    'assets/lotties/Loading.json',
                    width: 240,
                    height: 240,
                    repeat: true,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

enum _BookingVehicleTypeGroup {
  passengerGo,
  passengerReturn,
  commercialDelivery,
  commercialPickupAndDemoPickup,
  selfVehicle,
}
