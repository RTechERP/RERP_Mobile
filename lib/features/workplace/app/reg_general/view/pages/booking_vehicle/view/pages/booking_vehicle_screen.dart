import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../bloc/booking_vehicle_bloc.dart';
import '../widgets/booking_vehicle_card.dart';
import '../widgets/date_header.dart';
import '../widgets/date_range_picker.dart';

class BookingVehicleScreen extends StatefulWidget {
  const BookingVehicleScreen({super.key});

  @override
  State<BookingVehicleScreen> createState() => _BookingVehicleScreenState();
}

class _BookingVehicleScreenState
    extends
        BaseState<
          BookingVehicleScreen,
          BookingVehicleEvent,
          BookingVehicleState,
          BookingVehicleBloc
        > {
  @override
  void initState() {
    super.initState();
    bloc.add(const BookingVehicleEvent.init());
    // Preload cache cho màn add ngay khi vào module list.
    bloc.add(const BookingVehicleEvent.preloadInitAdd());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<BookingVehicleBloc, BookingVehicleState>(
      listener: (context, state) {},
      child: BaseScaffold(
        appBar: AppBarCommon(
          title: const Text('Đặt xe'),
          onBackTap: () => onBack(context),
        ),
        body: BlocBuilder<BookingVehicleBloc, BookingVehicleState>(
          builder: (context, state) {
            if (state.status == BaseStateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.isDeleting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == BaseStateStatus.failed) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppImages.error, width: 320),
                    const SizedBox(height: 12),
                    const Text('Load dữ liệu thất bại'),
                  ],
                ),
              );
            }

            if (state.bookingVehicle.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppImages.missing, width: 320),
                    const SizedBox(height: 12),
                    const Text('Không có báo cáo'),
                  ],
                ),
              );
            }

            // final displayList = _isSearching ? _filteredReports : state.bookingVehicle;
            //
            // if (!_isSearching) {
            //   _filteredReports = state.reports;
            // }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: DateHeader(
                    dateStart: state.dateStart,
                    dateEnd: state.dateEnd,
                    // formatter: (d) => DateFormat('dd/MM/yyyy').format(d),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    itemCount: state.bookingVehicle.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = state.bookingVehicle[index];
                      return BookingVehicleCard(item: item);
                    },
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.menu,
          activeIcon: Icons.close,
          backgroundColor: AppColors.primaryERP,
          foregroundColor: Colors.white,
          spacing: 8,
          spaceBetweenChildren: 8,
          overlayOpacity: 0.3,

          children: [
            /// ===== THÊM =====
            SpeedDialChild(
              child: const Icon(Icons.add),
              label: 'Thêm',
              onTap: () async {
                final reload = await context.push(RouteNames.bookingVehicleAdd);

                if (reload == true) {
                  bloc.add(const BookingVehicleEvent.init());
                }
              },
            ),

            /// ===== LỌC THEO NGÀY =====
            SpeedDialChild(
              child: const Icon(Icons.date_range),
              label: 'Lọc ngày',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => DateRangePicker(
                    initialStart: bloc.state.dateStart,
                    initialEnd: bloc.state.dateEnd,
                    onApply: (start, end) {
                      // bloc.add(
                      //   BookingVehicleEvent.changeDateRange(
                      //     dateStart: start,
                      //     dateEnd: end,
                      //   ),
                      // );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
