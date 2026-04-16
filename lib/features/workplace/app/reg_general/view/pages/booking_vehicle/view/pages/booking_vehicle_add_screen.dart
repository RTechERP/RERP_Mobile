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
  });

  /// Khi khác null: màn sửa — prefill từ item, submit gửi kèm `ID` bản ghi.
  final BookingVehicleItem? existingBookingItem;

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
      default:
        return _BookingVehicleTypeGroup.passengerGo;
    }
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
      default:
        return 0;
    }
  }

  /// Lưu currentEmployee từ SharedPreferences để prefill form ngay lần render đầu.
  BookingVehiclePersonalItem? _cachedCurrentEmployee;

  /// Chặn apply edit prefill nhiều lần.
  bool _editPrefillApplied = false;

  bool get _isEditMode => widget.existingBookingItem != null;

  int? get _existingBookingId {
    final id = widget.existingBookingItem?.id;
    if (id == null || id <= 0) return null;
    return id;
  }

  @override
  void initState() {
    final edit = widget.existingBookingItem;
    if (edit != null) {
      bloc.add(
        BookingVehicleEvent.changeBookingTypeGroup(
          group: _bookingTypeGroupFromLabel(
            bookingVehicleEditBookingTypeLabel(edit),
          ),
        ),
      );
    }
    super.initState();

    // Đọc currentEmployee từ SharedPreferences NGAY — prefill form không cần chờ API.
    BookingVehicleRepository.getCurrentUserCache().then((cached) {
      if (!mounted) return;
      _cachedCurrentEmployee = cached;
      if (cached != null) {
        bloc.add(BookingVehicleEvent.prefillCurrentEmployee(employee: cached));
      }
    });

    bloc.add(const BookingVehicleEvent.clearSubmitResult());
    bloc.add(const BookingVehicleEvent.initAdd());
    if (edit != null) {
      final g = bloc.state.bookingTypeGroup;
      switch (_bookingTypeGroupEnum(g)) {
        case _BookingVehicleTypeGroup.passengerGo:
        case _BookingVehicleTypeGroup.passengerReturn:
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
    } else {
      bloc.add(const BookingVehicleEvent.initPassengerGoInfos());
    }
    if (edit != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _tryApplyEditPrefill(context, bloc.state);
      });
    }
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
      final patch = buildBookingVehicleEditFormPatch(
        edit,
        projects: state.projects,
      );
      final split = splitBookingVehicleFormAndInfo(patch);
      if (split.form.isNotEmpty) {
        bloc.add(BookingVehicleEvent.updateForm(values: split.form));
      }
      if (split.info.isNotEmpty) {
        bloc.add(BookingVehicleEvent.updateInfo(values: split.info));
      }
      _formKey.currentState?.patchValue(patch);
      _editPrefillApplied = true;
    });
  }

  List<String>? _priorityFieldsForGroupInt(int? g) {
    if (g == null) return null;
    switch (_bookingTypeGroupEnum(g)) {
      case _BookingVehicleTypeGroup.passengerGo:
        return _passengerGoPriority;
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

    final values = Map<String, dynamic>.from(formState.value);
    final g = bloc.state.bookingTypeGroup;
    final group = _bookingTypeGroupEnum(g);
    final editId = _existingBookingId;
    final createdOriginal = widget.existingBookingItem?.createdDate;

    if (!formState.saveAndValidate()) {
      FormHelper.focusFirstError(
        formState: formState,
        priorityFields: _priorityFieldsForGroupInt(bloc.state.bookingTypeGroup),
      );
      return;
    }

    if (createdOriginal != null) {
      values[kBookingVehicleProblemRuleRegistrationKey] = createdOriginal;
    }

    switch (group) {
      case _BookingVehicleTypeGroup.passengerGo:
        bloc.add(
          BookingVehicleEvent.submitPassengerGo(
            formValues: values,
            existingBookingId: editId,
          ),
        );
        break;
      case _BookingVehicleTypeGroup.passengerReturn:
        bloc.add(
          BookingVehicleEvent.submitPassengerReturn(
            formValues: values,
            existingBookingId: editId,
          ),
        );
        break;
      case _BookingVehicleTypeGroup.commercialDelivery:
        bloc.add(
          BookingVehicleEvent.submitCommercialDelivery(
            formValues: values,
            existingBookingId: editId,
          ),
        );
        break;
      case _BookingVehicleTypeGroup.commercialPickupAndDemoPickup:
        bloc.add(
          BookingVehicleEvent.submitCommercialPickup(
            formValues: values,
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
              widget.existingBookingItem != null &&
              !_editPrefillApplied &&
              current.status == BaseStateStatus.success &&
              current.projects.isNotEmpty,
          listener: (context, state) {
            _tryApplyEditPrefill(context, state);
          },
          child: BlocListener<BookingVehicleBloc, BookingVehicleState>(
            listenWhen: (previous, current) =>
                previous.message != current.message &&
                current.message != null &&
                current.message!.isNotEmpty &&
                !current.isSubmitting &&
                !current.submitSuccess,
            listener: (context, state) {
              showMessage(
                context,
                state.message!,
                type: SnackBarType.error,
              );
            },
            child: BlocListener<BookingVehicleBloc, BookingVehicleState>(
              listenWhen: (previous, current) =>
                  previous.submitSuccess != current.submitSuccess,
              listener: (context, state) {
                if (state.submitSuccess) {
                  context.pop(true);
                }
              },
              child: BaseScaffold(
                appBar: AppBarCommon(
                  title: Text(
                    _isEditMode ? 'Sửa đặt xe' : 'Tạo đặt xe',
                  ),
                ),
                body: BlocBuilder<BookingVehicleBloc, BookingVehicleState>(
                  buildWhen: (prev, curr) =>
                  prev.status != curr.status ||
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
                  prev.infoFieldValues != curr.infoFieldValues ||
                  prev.bookingTypeGroup != curr.bookingTypeGroup,
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
                            /// ===== TÊN CUỘC HỌP =====
                            FormCard(
                              child: GestureDetector(
                                onTap: () {
                                  openSelectBottomSheet(
                                    context: context,
                                    title: 'Chọn hình thức đặt',
                                    items: const [
                                      'Đăng ký người đi',
                                      'Đăng ký người về',
                                      'Đăng ký giao hàng thương mại',
                                      'Đăng ký lấy hàng thương mại',
                                      'Đăng ký giao hàng Demo/triển lãm',
                                      'Đăng ký lấy hàng Demo/triển lãm',
                                    ],
                                    onSelected: (item) {
                                      _bookingTypeField?.didChange(item);
                                      final groupNum = _bookingTypeGroupFromLabel(item);
                                      bloc.add(
                                        BookingVehicleEvent.changeBookingTypeGroup(
                                          group: groupNum,
                                        ),
                                      );

                                      if (groupNum == 0 || groupNum == 1) {
                                        bloc.add(
                                          const BookingVehicleEvent
                                              .initPassengerGoInfos(),
                                        );
                                      } else if (groupNum == 2) {
                                        bloc.add(
                                          const BookingVehicleEvent
                                              .initCommercialReceiverInfos(),
                                        );
                                        bloc.add(
                                          const BookingVehicleEvent
                                              .preloadInitAdd(),
                                        );
                                      } else if (groupNum == 3) {
                                        bloc.add(
                                          const BookingVehicleEvent
                                              .initPickupGiverInfos(),
                                        );
                                        bloc.add(
                                          const BookingVehicleEvent
                                              .preloadInitAdd(),
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
                                    validator: FormBuilderValidators.required(
                                      errorText: 'Vui lòng chọn hình thức đặt',
                                    ),
                                    readOnly: true,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            ...[
                              if (_bookingTypeGroupEnum(state.bookingTypeGroup) ==
                                  _BookingVehicleTypeGroup.passengerGo)
                                TypeFormPassengerGo(
                                  projects: state.projects,
                                  departureProvinces:
                                      state.provinceDeparture,
                                  arrivalProvinces: state.provinceArrives,
                                ),
                              if (_bookingTypeGroupEnum(state.bookingTypeGroup) ==
                                  _BookingVehicleTypeGroup.passengerGo)
                                const SizedBox(height: 12),
                              if (_bookingTypeGroupEnum(state.bookingTypeGroup) ==
                                  _BookingVehicleTypeGroup.passengerGo)
                                BlocBuilder<BookingVehicleBloc,
                                    BookingVehicleState>(
                                  buildWhen: (prev, curr) =>
                                      prev.employee != curr.employee ||
                                      prev.currentEmployee != curr.currentEmployee ||
                                      prev.passengerGoLineCount !=
                                          curr.passengerGoLineCount ||
                                      prev.expandedPassengerGoIndex !=
                                          curr.expandedPassengerGoIndex ||
                                      prev.passengerGoFirstRowIsCurrentUserSlot !=
                                          curr.passengerGoFirstRowIsCurrentUserSlot ||
                                      prev.passengerFormGeneration !=
                                          curr.passengerFormGeneration ||
                                      prev.infoFieldValues != curr.infoFieldValues,
                                  builder: (context, state) {
                                    final n = state.passengerGoLineCount;
                                    if (n <= 0) {
                                      return Center(
                                        child: TextButton.icon(
                                          onPressed: () {
                                            context
                                                .read<BookingVehicleBloc>()
                                                .add(
                                                  const BookingVehicleEvent
                                                      .initPassengerGoInfos(),
                                                );
                                            context
                                                .read<BookingVehicleBloc>()
                                                .add(
                                                  const BookingVehicleEvent
                                                      .preloadInitAdd(),
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
                                                state.expandedPassengerGoIndex ==
                                                    i,
                                            totalCount: n,
                                            employeeOptions: state.employee,
                                            infoFieldValues: state.infoFieldValues,
                                            prefillEmployee: i == 0 &&
                                                    state
                                                        .passengerGoFirstRowIsCurrentUserSlot
                                                ? state.currentEmployee
                                                : null,
                                            generation:
                                                state.passengerFormGeneration,
                                            onToggleExpand: () {
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .expandPassengerGoInfo(
                                                    index: i,
                                                  ),
                                                );
                                              },
                                              onDelete: () {
                                                if (_formKey.currentState == null) return;
                                                final shifted =
                                                    BookingVehiclePassengerFormShift
                                                        .computeShiftedFields(
                                                  form: _formKey.currentState!,
                                                  deletedIndex: i,
                                                  oldLineCount: n,
                                                );
                                                _formKey.currentState
                                                    ?.patchValue(shifted);
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .deletePassengerGoInfo(
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
                                                const BookingVehicleEvent
                                                    .addPassengerGoInfo(),
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
                              if (_bookingTypeGroupEnum(state.bookingTypeGroup) ==
                                  _BookingVehicleTypeGroup.passengerReturn)
                                TypeFormPassengerReturn(
                                  projects: state.projects,
                                  departureProvinces:
                                      state.provinceDeparture,
                                  arrivalProvinces: state.provinceArrives,
                                ),
                              if (_bookingTypeGroupEnum(state.bookingTypeGroup) ==
                                  _BookingVehicleTypeGroup.passengerReturn)
                                const SizedBox(height: 12),
                              if (_bookingTypeGroupEnum(state.bookingTypeGroup) ==
                                  _BookingVehicleTypeGroup.passengerReturn)
                                BlocBuilder<BookingVehicleBloc,
                                    BookingVehicleState>(
                                  buildWhen: (prev, curr) =>
                                      prev.employee != curr.employee ||
                                      prev.currentEmployee != curr.currentEmployee ||
                                      prev.passengerGoLineCount !=
                                          curr.passengerGoLineCount ||
                                      prev.expandedPassengerGoIndex !=
                                          curr.expandedPassengerGoIndex ||
                                      prev.passengerGoFirstRowIsCurrentUserSlot !=
                                          curr.passengerGoFirstRowIsCurrentUserSlot ||
                                      prev.passengerFormGeneration !=
                                          curr.passengerFormGeneration ||
                                      prev.infoFieldValues != curr.infoFieldValues,
                                  builder: (context, state) {
                                    final n = state.passengerGoLineCount;
                                    if (n <= 0) {
                                      return Center(
                                        child: TextButton.icon(
                                          onPressed: () {
                                            context
                                                .read<BookingVehicleBloc>()
                                                .add(
                                                  const BookingVehicleEvent
                                                      .initPassengerGoInfos(),
                                                );
                                            context
                                                .read<BookingVehicleBloc>()
                                                .add(
                                                  const BookingVehicleEvent
                                                      .preloadInitAdd(),
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
                                                state.expandedPassengerGoIndex ==
                                                    i,
                                            totalCount: n,
                                            employeeOptions: state.employee,
                                            infoFieldValues: state.infoFieldValues,
                                            prefillEmployee: i == 0 &&
                                                    state
                                                        .passengerGoFirstRowIsCurrentUserSlot
                                                ? state.currentEmployee
                                                : null,
                                            generation:
                                                state.passengerFormGeneration,
                                            onToggleExpand: () {
                                              bloc.add(
                                                BookingVehicleEvent
                                                    .expandPassengerGoInfo(
                                                  index: i,
                                                ),
                                              );
                                            },
                                            onDelete: () {
                                              if (_formKey.currentState == null) return;
                                              final shifted =
                                                  BookingVehiclePassengerFormShift
                                                      .computeShiftedFields(
                                                form: _formKey.currentState!,
                                                deletedIndex: i,
                                                oldLineCount: n,
                                              );
                                              _formKey.currentState
                                                  ?.patchValue(shifted);
                                              bloc.add(
                                                BookingVehicleEvent
                                                    .deletePassengerGoInfo(
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
                                                const BookingVehicleEvent
                                                    .addPassengerGoInfo(),
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
                              if (_bookingTypeGroupEnum(state.bookingTypeGroup) ==
                                  _BookingVehicleTypeGroup.commercialDelivery)
                                TypeFormCommercialDelivery(
                                  projects: state.projects,
                                  departureProvinces:
                                      state.provinceDeparture,
                                  arrivalProvinces: state.provinceArrives,
                                ),
                              if (_bookingTypeGroupEnum(state.bookingTypeGroup) ==
                                  _BookingVehicleTypeGroup.commercialDelivery)
                                const SizedBox(height: 12),
                              if (_bookingTypeGroupEnum(state.bookingTypeGroup) ==
                                  _BookingVehicleTypeGroup.commercialDelivery)
                                BlocBuilder<BookingVehicleBloc,
                                    BookingVehicleState>(
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
                                      prev.infoFieldValues != curr.infoFieldValues,
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
                                                  const BookingVehicleEvent
                                                      .initCommercialReceiverInfos(),
                                                );
                                            context
                                                .read<BookingVehicleBloc>()
                                                .add(
                                                  const BookingVehicleEvent
                                                      .preloadInitAdd(),
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
                                              isExpanded: state
                                                      .expandedCommercialDeliveryReceiverIndex ==
                                                  i,
                                              totalCount: n,
                                              employeeOptions: state.employee,
                                              infoFieldValues: state.infoFieldValues,
                                              prefillEmployee: null,
                                              generation:
                                                  state.commercialReceiverFormGeneration,
                                              onToggleExpand: () {
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .expandCommercialReceiverInfo(
                                                    index: i,
                                                  ),
                                                );
                                              },
                                              onDelete: () {
                                                if (n <= 1) return;
                                                if (_formKey.currentState == null) return;
                                                final shifted =
                                                    BookingVehicleReceiverFormShift
                                                        .computeShiftedFields(
                                                  form: _formKey.currentState!,
                                                  deletedIndex: i,
                                                  oldLineCount: n,
                                                );
                                                _formKey.currentState
                                                    ?.patchValue(shifted);
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .deleteCommercialReceiverInfo(
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
                                                const BookingVehicleEvent
                                                    .addCommercialReceiverInfo(),
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
                              if (_bookingTypeGroupEnum(state.bookingTypeGroup) ==
                                  _BookingVehicleTypeGroup
                                      .commercialPickupAndDemoPickup)
                                TypeFormReceiver(
                                  projects: state.projects,
                                  arrivalProvinces: state.provinceArrives,
                                ),
                              if (_bookingTypeGroupEnum(state.bookingTypeGroup) ==
                                  _BookingVehicleTypeGroup
                                      .commercialPickupAndDemoPickup)
                                const SizedBox(height: 12),
                              if (_bookingTypeGroupEnum(state.bookingTypeGroup) ==
                                  _BookingVehicleTypeGroup
                                      .commercialPickupAndDemoPickup)
                                BlocBuilder<BookingVehicleBloc,
                                    BookingVehicleState>(
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
                                      prev.infoFieldValues != curr.infoFieldValues,
                                  builder: (context, state) {
                                    final n = state.pickupGiverLineCount;
                                    if (n <= 0) {
                                      return Center(
                                        child: TextButton.icon(
                                          onPressed: () {
                                            context
                                                .read<BookingVehicleBloc>()
                                                .add(
                                                  const BookingVehicleEvent
                                                      .initPickupGiverInfos(),
                                                );
                                            context
                                                .read<BookingVehicleBloc>()
                                                .add(
                                                  const BookingVehicleEvent
                                                      .preloadInitAdd(),
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
                                              isExpanded: state
                                                      .expandedPickupGiverIndex ==
                                                  i,
                                              totalCount: n,
                                              employeeOptions: state.employee,
                                              infoFieldValues: state.infoFieldValues,
                                              prefillEmployee: null,
                                              generation:
                                                  state.pickupGiverFormGeneration,
                                              onToggleExpand: () {
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .expandPickupGiverInfo(
                                                    index: i,
                                                  ),
                                                );
                                              },
                                              onDelete: () {
                                                if (n <= 1) return;
                                                if (_formKey.currentState == null) return;
                                                final shifted =
                                                    BookingVehicleDeliverFormShift
                                                        .computeShiftedFields(
                                                  form: _formKey.currentState!,
                                                  deletedIndex: i,
                                                  oldLineCount: n,
                                                );
                                                _formKey.currentState
                                                    ?.patchValue(shifted);
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .deletePickupGiverInfo(
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
                                                const BookingVehicleEvent
                                                    .addPickupGiverInfo(),
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
                          onCancel:
                              _isEditMode ? () => context.pop() : null,
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
}
