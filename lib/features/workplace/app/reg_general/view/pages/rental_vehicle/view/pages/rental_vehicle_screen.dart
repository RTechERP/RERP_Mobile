// Date: 16/10/2026
// Nội dung/Chức năng: Màn hình danh sách yêu cầu thuê xe tải.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../data/datasource/models/rental_vehicle_model.dart';
import '../bloc/rental_vehicle_bloc.dart';
import '../widgets/filter_sheet.dart';
import '../widgets/list_header.dart';
import '../widgets/rental_vehicle_card.dart';
import 'rental_vehicle_add_screen.dart';
import 'rental_vehicle_update_screen.dart';

class RentalVehicleScreen extends StatefulWidget {
  const RentalVehicleScreen({super.key});

  @override
  State<RentalVehicleScreen> createState() => _RentalVehicleScreenState();
}

class _RentalVehicleScreenState
    extends
        BaseState<
          RentalVehicleScreen,
          RentalVehicleEvent,
          RentalVehicleState,
          RentalVehicleBloc
        > {
  @override
  void initState() {
    super.initState();
    bloc.add(const RentalVehicleEvent.init());
    // Load employees, departments, projects để sẵn sàng khi mở add screen.
    bloc.add(const RentalVehicleEvent.loadAll());
  }

  void _openDateRangePicker() {
    final now = DateTime.now();
    final initialStart =
        bloc.state.dateStart ?? DateTime(now.year, now.month, 1);
    final initialEnd =
        bloc.state.dateEnd ?? DateTime(now.year, now.month + 1, 0, 23, 59, 59);

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: initialStart,
        initialEnd: initialEnd,
        onApply: (start, end) {
          bloc.add(
            RentalVehicleEvent.changeDateRange(
              dateStart: start,
              dateEnd: DateTime(end.year, end.month, end.day, 23, 59, 59),
            ),
          );
        },
      ),
    );
  }

  /// Mở bottom-sheet chứa bộ lọc (text search + 3 dropdown).
  void _openFilterSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => BlocProvider.value(
        value: bloc,
        child: const FilterSheet(),
      ),
    );
  }

  /// Hiện dialog xác nhận xoá. Nếu user xác nhận → dispatch event delete.
  Future<void> _confirmDelete(int id) async {
    final confirmed = await DialogService.showConfirmDelete(context: context);
    if (!confirmed) return;
    bloc.add(RentalVehicleEvent.delete(id: id));
  }

  /// Mở màn update với item được chọn.
  Future<void> _openUpdate(RentalVehicleItem item) async {
    final reload = await context.push<bool?>(
      RouteNames.rentalVehicleUpdate,
      extra: RentalVehicleUpdateScreen(
        item: item,
        employees: bloc.state.employees,
        projects: bloc.state.projects,
      ),
    );
    if (!mounted) return;
    if (reload == true) {
      bloc.add(const RentalVehicleEvent.init());
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Thuê xe tải'),
        onBackTap: () => onBack(context),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month),
            tooltip: 'Lọc ngày',
            onPressed: _openDateRangePicker,
          ),
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            tooltip: 'Bộ lọc',
            onPressed: _openFilterSheet,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryERP,
        foregroundColor: Colors.white,
        onPressed: () async {
          // Tính nextStt từ state hiện tại (max(stt) + 1).
          int nextStt = 1;
          for (final item in bloc.state.rentalVehicles) {
            final stt = item.stt ?? 0;
            if (stt >= nextStt) nextStt = stt + 1;
          }

          final reload = await context.push<bool?>(
            RouteNames.rentalVehicleAdd,
            extra: RentalVehicleAddScreen(
              employees: bloc.state.employees,
              projects: bloc.state.projects,
              initialNextStt: nextStt,
            ),
          );
          if (!mounted) return;
          if (reload == true) {
            bloc.add(const RentalVehicleEvent.init());
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: MultiBlocListener(
        listeners: [
          BlocListener<RentalVehicleBloc, RentalVehicleState>(
            listenWhen: (prev, curr) =>
                prev.deleteSuccess != curr.deleteSuccess &&
                curr.deleteSuccess,
            listener: (context, state) {
              if (!mounted) return;
              showMessage(
                context,
                'Xoá yêu cầu thuê xe tải thành công',
                type: SnackBarType.success,
              );
            },
          ),
          BlocListener<RentalVehicleBloc, RentalVehicleState>(
            listenWhen: (prev, curr) =>
                prev.message != curr.message &&
                curr.message != null &&
                curr.message!.isNotEmpty &&
                !curr.deleteSuccess,
            listener: (context, state) {
              if (!mounted) return;
              if (state.deletingId == null) {
                showMessage(context, state.message!, type: SnackBarType.error);
              }
            },
          ),
        ],
        child: BlocBuilder<RentalVehicleBloc, RentalVehicleState>(
          buildWhen: (prev, curr) =>
              prev.status != curr.status ||
              prev.rentalVehicles.length != curr.rentalVehicles.length ||
              prev.dateStart != curr.dateStart ||
              prev.dateEnd != curr.dateEnd ||
              prev.keyword != curr.keyword ||
              prev.selectedDepartmentId != curr.selectedDepartmentId ||
              prev.selectedRequesterId != curr.selectedRequesterId ||
              prev.selectedBookerId != curr.selectedBookerId,
          builder: (context, state) {
            return Column(
              children: [
                if (state.dateStart != null && state.dateEnd != null)
                  ListHeader(
                    total: state.rentalVehicles.length,
                    dateStart: state.dateStart,
                    dateEnd: state.dateEnd,
                    isSearching: state.keyword.trim().isNotEmpty,
                  ),
                Expanded(child: _buildBody(state)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(RentalVehicleState state) {
    if (state.status == BaseStateStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == BaseStateStatus.failed) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.error, width: 320),
            const SizedBox(height: 12),
            const Text('Tải dữ liệu thất bại'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => bloc.add(const RentalVehicleEvent.init()),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    if (state.rentalVehicles.isEmpty) {
      return Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImages.missing, width: 320),
              const SizedBox(height: 12),
              const Text('Không có yêu cầu thuê xe tải'),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(const RentalVehicleEvent.init());
      },
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: state.rentalVehicles.length,
        separatorBuilder: (_, _) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = state.rentalVehicles[index];
          final id = item.id ?? 0;
          return Slidable(
            key: ValueKey('rental_vehicle_$id'),
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              extentRatio: 0.22,
              children: [
                SlidableAction(
                  onPressed: (_) => _confirmDelete(id),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete_outline,
                  label: 'Xoá',
                  borderRadius: BorderRadius.circular(12),
                ),
              ],
            ),
            child: RentalVehicleCard(
              item: item,
              onTap: id == 0 ? null : () => _openUpdate(item),
              onDelete: id == 0 ? null : () => _confirmDelete(id),
            ),
          );
        },
      ),
    );
  }
}
