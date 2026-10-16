// Date: 16/10/2026
// Nội dung/Chức năng: Màn hình danh sách yêu cầu thuê xe tải.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../bloc/rental_vehicle_bloc.dart';
import '../widgets/filter_sheet.dart';
import '../widgets/list_header.dart';
import '../widgets/rental_vehicle_card.dart';

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
    bloc.add(const RentalVehicleEvent.loadAll());
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
      body: BlocBuilder<RentalVehicleBloc, RentalVehicleState>(
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

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: state.rentalVehicles.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = state.rentalVehicles[index];
        return RentalVehicleCard(item: item);
      },
    );
  }
}
