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
import '../../data/repository/booking_vehicle_repository.dart';
import '../bloc/booking_vehicle_bloc.dart';
import '../widgets/passenger_go_info_item.dart';
import '../widgets/type_form_commercial_and_demo_pickup.dart';
import '../widgets/type_form_demo_delivery.dart';
import '../widgets/type_form_passenger_go.dart';
import '../widgets/type_form_passenger_return.dart';
import '../widgets/type_form_commercial_delivery.dart';
import '../widgets/commercial_receiver_package_info_item.dart';

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
        return _BookingVehicleTypeGroup.commercialDelivery;
      case 'Đăng ký lấy hàng thương mại':
      case 'Đăng ký lấy hàng Demo/triển lãm':
        return _BookingVehicleTypeGroup.commercialPickupAndDemoPickup;
      case 'Đăng ký giao hàng Demo/triển lãm':
        return _BookingVehicleTypeGroup.demoDelivery;
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
                  prev.currentEmployee != curr.currentEmployee,
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
                                      prev.passengerGoInfos !=
                                          curr.passengerGoInfos ||
                                      prev.expandedPassengerGoIndex !=
                                          curr.expandedPassengerGoIndex,
                                  builder: (context, state) {
                                    final items = state.passengerGoInfos;
                                    if (items.isEmpty) {
                                      return const SizedBox.shrink();
                                    }

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...items.asMap().entries.map((e) {
                                          final itemId = e.value;
                                          final isExpanded =
                                              state.expandedPassengerGoIndex ==
                                                  itemId;

                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 8,
                                            ),
                                            child:
                                            PassengerGoInfoItem(
                                              key: ValueKey(itemId),
                                              index: itemId,
                                              isExpanded: isExpanded,
                                              totalCount:
                                                  state.passengerGoInfos
                                                      .length,
                                              employeeOptions: state.employee,
                                              prefillEmployee:
                                                  itemId == 0
                                                      ? state.currentEmployee
                                                      : null,
                                              onToggleExpand: () {
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .expandPassengerGoInfo(
                                                    index: itemId,
                                                  ),
                                                );
                                              },
                                              onDelete: () {
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .deletePassengerGoInfo(
                                                    index: itemId,
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        }),

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
                                      prev.passengerGoInfos !=
                                          curr.passengerGoInfos ||
                                      prev.expandedPassengerGoIndex !=
                                          curr.expandedPassengerGoIndex,
                                  builder: (context, state) {
                                    final items = state.passengerGoInfos;
                                    if (items.isEmpty) {
                                      return const SizedBox.shrink();
                                    }

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...items.asMap().entries.map((e) {
                                          final itemId = e.value;
                                          final isExpanded =
                                              state.expandedPassengerGoIndex ==
                                                  itemId;

                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 8,
                                            ),
                                            child: PassengerGoInfoItem(
                                              key: ValueKey(itemId),
                                              index: itemId,
                                              isExpanded: isExpanded,
                                              totalCount:
                                                  state.passengerGoInfos
                                                      .length,
                                              employeeOptions: state.employee,
                                              prefillEmployee:
                                                  itemId == 0
                                                      ? state.currentEmployee
                                                      : null,
                                              onToggleExpand: () {
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .expandPassengerGoInfo(
                                                    index: itemId,
                                                  ),
                                                );
                                              },
                                              onDelete: () {
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .deletePassengerGoInfo(
                                                    index: itemId,
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        }),

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
                                      prev.commercialDeliveryReceiverInfos !=
                                          curr.commercialDeliveryReceiverInfos ||
                                      prev.expandedCommercialDeliveryReceiverIndex !=
                                          curr.expandedCommercialDeliveryReceiverIndex,
                                  builder: (context, state) {
                                    final items =
                                        state.commercialDeliveryReceiverInfos;
                                    if (items.isEmpty) {
                                      // UI-first: luôn hiển thị ngay 1 card người nhận
                                      // kể cả khi initAdd/API vẫn đang chạy ngầm.
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommercialReceiverPackageInfoItem(
                                            key: const ValueKey(
                                              'commercial_receiver_fallback_0',
                                            ),
                                            index: 0,
                                            isExpanded: true,
                                            totalCount: 1,
                                            employeeOptions: state.employee,
                                            prefillEmployee: null,
                                            onToggleExpand: () {},
                                            onDelete: null,
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
                                    }

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...items.asMap().entries.map((e) {
                                          final itemId = e.value;
                                          final isExpanded =
                                              state
                                                      .expandedCommercialDeliveryReceiverIndex ==
                                                  itemId;

                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 8,
                                            ),
                                            child:
                                                CommercialReceiverPackageInfoItem(
                                              key: ValueKey(itemId),
                                              index: itemId,
                                              isExpanded: isExpanded,
                                              totalCount:
                                                  state.commercialDeliveryReceiverInfos
                                                      .length,
                                              employeeOptions: state.employee,
                                              prefillEmployee: null,
                                              onToggleExpand: () {
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .expandCommercialReceiverInfo(
                                                    index: itemId,
                                                  ),
                                                );
                                              },
                                              onDelete: () {
                                                bloc.add(
                                                  BookingVehicleEvent
                                                      .deleteCommercialReceiverInfo(
                                                    index: itemId,
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        }),

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
                                const TypeFormCommercialAndDemoPickup(),
                              if (_bookingTypeGroup ==
                                  _BookingVehicleTypeGroup.demoDelivery)
                                const TypeFormDemoDelivery(),
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
  demoDelivery,
}
