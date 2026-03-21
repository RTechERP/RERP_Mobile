import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/booking_vehicle_passenger_form_shift.dart';
import '../../data/datasource/models/booking_vehicle_deliver_form_shift.dart';
import '../../data/datasource/models/booking_vehicle_receiver_form_shift.dart';
import '../../data/repository/booking_vehicle_repository.dart';
import '../bloc/booking_vehicle_bloc.dart';
import '../widgets/forms/index.dart';
import '../widgets/infos/index.dart';

class BookingVehicleAddScreen extends StatefulWidget {
  const BookingVehicleAddScreen({super.key});

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

  FormFieldState<String>? _bookingTypeField;
  _BookingVehicleTypeGroup? _bookingTypeGroup;

  _BookingVehicleTypeGroup _mapBookingTypeToGroup(String bookingType) {
    switch (bookingType) {
      case 'Đăng ký người đi':
        return _BookingVehicleTypeGroup.passengerGo;
      case 'Đăng ký người về':
        return _BookingVehicleTypeGroup.passengerReturn;
      case 'Đăng ký giao hàng thương mại':
      case 'Đăng ký giao hàng Demo/triển lãm':
        return _BookingVehicleTypeGroup.commercialDelivery;
      case 'Đăng ký lấy hàng thương mại':
      case 'Đăng ký lấy hàng Demo/triển lãm':
        return _BookingVehicleTypeGroup.commercialPickupAndDemoPickup;
      default:
        return _BookingVehicleTypeGroup.passengerGo;
    }
  }

  @override
  void initState() {
    super.initState();
    _bookingTypeGroup = _BookingVehicleTypeGroup.passengerGo;
    bloc.add(const BookingVehicleEvent.initAdd());
    bloc.add(const BookingVehicleEvent.initPassengerGoInfos());
  }

  @override
  void dispose() {
    // Giải phóng cache tạm của màn add khi rời màn.
    BookingVehicleRepository.clearInitAddCache();
    super.dispose();
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<BookingVehicleBloc, BookingVehicleState>(
          listenWhen: (previous, current) =>
              previous.submitSuccess != current.submitSuccess,
          listener: (context, state) {
            if (state.submitSuccess) {
              context.pop(true);
            }
          },
          child: BaseScaffold(
            appBar: AppBarCommon(title: const Text('Tạo báo cáo')),
            body: BlocBuilder<BookingVehicleBloc, BookingVehicleState>(
              buildWhen: (prev, curr) =>
                  prev.status != curr.status ||
                  prev.projects != curr.projects ||
                  prev.provinceDeparture != curr.provinceDeparture ||
                  prev.provinceArrives != curr.provinceArrives ||
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
                      curr.pickupGiverFormGeneration,
              builder: (context, state) {
                return FormBuilder(
                  key: _formKey,
                  initialValue: const {
                    'booking_type': 'Đăng ký người đi',
                    'booking_type_text': 'Đăng ký người đi',
                    // Mặc định: cả "xuất phát" và "điểm về" đều là "Khác"
                    // để người dùng nhập cụ thể.
                    'starting_point': 'Khác',
                    'return_point': 'Khác',
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
                                      final group =
                                          _mapBookingTypeToGroup(item);
                                      setState(() {
                                        _bookingTypeGroup = group;
                                      });

                                      if (group ==
                                              _BookingVehicleTypeGroup.passengerGo ||
                                          group ==
                                              _BookingVehicleTypeGroup
                                                  .passengerReturn) {
                                        bloc.add(
                                          const BookingVehicleEvent
                                              .initPassengerGoInfos(),
                                        );
                                      } else if (group ==
                                          _BookingVehicleTypeGroup
                                              .commercialDelivery) {
                                        bloc.add(
                                          const BookingVehicleEvent
                                              .initCommercialReceiverInfos(),
                                        );
                                        bloc.add(
                                          const BookingVehicleEvent
                                              .preloadInitAdd(),
                                        );
                                      } else if (group ==
                                          _BookingVehicleTypeGroup
                                              .commercialPickupAndDemoPickup) {
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
                                    readOnly: true,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            ...[
                              if (_bookingTypeGroup ==
                                  _BookingVehicleTypeGroup.passengerGo)
                                TypeFormPassengerGo(
                                  projects: state.projects,
                                  departureProvinces:
                                      state.provinceDeparture,
                                  arrivalProvinces: state.provinceArrives,
                                ),
                              if (_bookingTypeGroup ==
                                  _BookingVehicleTypeGroup.passengerGo)
                                const SizedBox(height: 12),
                              if (_bookingTypeGroup ==
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
                                          curr.passengerFormGeneration,
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
                                              prefillEmployee: i == 0 &&
                                                      state
                                                          .passengerGoFirstRowIsCurrentUserSlot
                                                  ? state.currentEmployee
                                                  : null,
                                              onToggleExpand: () {
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .expandPassengerGoInfo(
                                                    index: i,
                                                  ),
                                                );
                                              },
                                              onDelete: () {
                                                BookingVehiclePassengerFormShift
                                                    .afterDeleteAt(
                                                  _formKey.currentState,
                                                  deletedIndex: i,
                                                  oldLineCount: n,
                                                );
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .deletePassengerGoInfo(
                                                    index: i,
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
                              if (_bookingTypeGroup ==
                                  _BookingVehicleTypeGroup.passengerReturn)
                                TypeFormPassengerReturn(
                                  projects: state.projects,
                                  departureProvinces:
                                      state.provinceDeparture,
                                  arrivalProvinces: state.provinceArrives,
                                ),
                              if (_bookingTypeGroup ==
                                  _BookingVehicleTypeGroup.passengerReturn)
                                const SizedBox(height: 12),
                              if (_bookingTypeGroup ==
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
                                          curr.passengerFormGeneration,
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
                                              prefillEmployee: i == 0 &&
                                                      state
                                                          .passengerGoFirstRowIsCurrentUserSlot
                                                  ? state.currentEmployee
                                                  : null,
                                              onToggleExpand: () {
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .expandPassengerGoInfo(
                                                    index: i,
                                                  ),
                                                );
                                              },
                                              onDelete: () {
                                                BookingVehiclePassengerFormShift
                                                    .afterDeleteAt(
                                                  _formKey.currentState,
                                                  deletedIndex: i,
                                                  oldLineCount: n,
                                                );
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .deletePassengerGoInfo(
                                                    index: i,
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
                              if (_bookingTypeGroup ==
                                  _BookingVehicleTypeGroup.commercialDelivery)
                                TypeFormCommercialDelivery(
                                  projects: state.projects,
                                  departureProvinces:
                                      state.provinceDeparture,
                                  arrivalProvinces: state.provinceArrives,
                                ),
                              if (_bookingTypeGroup ==
                                  _BookingVehicleTypeGroup.commercialDelivery)
                                const SizedBox(height: 12),
                              if (_bookingTypeGroup ==
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
                                          curr.commercialReceiverFormGeneration,
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
                                              prefillEmployee: null,
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
                                                BookingVehicleReceiverFormShift
                                                    .afterDeleteAt(
                                                  _formKey.currentState,
                                                  deletedIndex: i,
                                                  oldLineCount: n,
                                                );
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .deleteCommercialReceiverInfo(
                                                    index: i,
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
                              if (_bookingTypeGroup ==
                                  _BookingVehicleTypeGroup
                                      .commercialPickupAndDemoPickup)
                                TypeFormReceiver(
                                  projects: state.projects,
                                  arrivalProvinces: state.provinceArrives,
                                ),
                              if (_bookingTypeGroup ==
                                  _BookingVehicleTypeGroup
                                      .commercialPickupAndDemoPickup)
                                const SizedBox(height: 12),
                              if (_bookingTypeGroup ==
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
                                          curr.pickupGiverFormGeneration,
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
                                              prefillEmployee: null,
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
                                                BookingVehicleDeliverFormShift
                                                    .afterDeleteAt(
                                                  _formKey.currentState,
                                                  deletedIndex: i,
                                                  oldLineCount: n,
                                                );
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .deletePickupGiverInfo(
                                                    index: i,
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
                          mode: FormActionMode.add,
                          onSubmit: () {
                            FocusScope.of(context).unfocus();

                            // final error = ValidateHelper.validateMeetingRoom(
                            //   date: _selectedDate,
                            //   startTime: _startTime,
                            //   endTime: _endTime,
                            //   roomId: bloc.state.selectedRoomId,
                            //   departmentId: bloc.state.departmentId,
                            //   content: _contentController.text,
                            // );
                            //
                            // if (error != null) {
                            //   context.showMessage(
                            //     error,
                            //     type: SnackBarType.error,
                            //   );
                            //   return;
                            // }
                            //
                            // bloc.add(
                            //   MeetingRoomEvent.submitRoom(
                            //     startTime: _startTime!,
                            //     endTime: _endTime!,
                            //     dateRegister: _selectedDate!,
                            //   ),
                            // );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
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
                  color: Colors.black.withOpacity(0.45),
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
