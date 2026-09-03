// Date: 15/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình danh sách đăng ký văn phòng phẩm

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../../data/datasource/models/stationery_model.dart';
import '../bloc/stationery_bloc.dart';
import '../widgets/stationery_card.dart';

class StationeryScreen extends StatefulWidget {
  const StationeryScreen({super.key});

  @override
  State<StationeryScreen> createState() => _StationeryScreenState();
}

class _StationeryScreenState
    extends
        BaseState<
          StationeryScreen,
          StationeryEvent,
          StationeryState,
          StationeryBloc
        > {
  @override
  void initState() {
    super.initState();
    bloc.add(const StationeryEvent.init());
  }

  /// Mở chi tiết; reload list khi detail pop `true` (sau sửa hoặc xóa thành công).
  Future<void> _openDetail(StationeryItem item) async {
    final result = await context.push<bool?>(
      RouteNames.stationeryDetail,
      extra: item,
    );
    if (result == true && mounted) {
      bloc.add(const StationeryEvent.init());
    }
  }

  void _openAdd() async {
    final result = await context.push<bool?>(RouteNames.stationeryAdd);
    if (result == true && mounted) {
      bloc.add(const StationeryEvent.init());
    }
  }

  void _showDeleteConfirm(StationeryItem item) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: Text('Bạn có chắc muốn xóa phiếu này không?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              bloc.add(StationeryEvent.deleteStationery(itemId: item.id ?? 0));
            },
            child: const Text('Xóa', style: TextStyle(color: AppColors.alert)),
          ),
        ],
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    final now = DateTime.now();
    final monthStart = DateTime(now.year, now.month, 1);
    final monthEnd = DateTime(now.year, now.month + 1, 0);

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: bloc.state.selectedMonth ?? monthStart,
        initialEnd: bloc.state.selectedMonth != null
            ? DateTime(
                bloc.state.selectedMonth!.year,
                bloc.state.selectedMonth!.month + 1,
                0,
              )
            : monthEnd,
        onApply: (start, end) {
          final month = DateTime(start.year, start.month, 1);
          bloc.add(StationeryEvent.changeMonth(month: month));
        },
      ),
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocConsumer<StationeryBloc, StationeryState>(
      listenWhen: (prev, curr) =>
          prev.deleteSuccess != curr.deleteSuccess ||
          prev.status != curr.status,
      listener: (context, state) {
        if (state.status == BaseStateStatus.failed && state.message != null) {
          context.showMessage(state.message!, type: SnackBarType.error);
        }
        if (state.deleteSuccess) {
          context.showMessage(
            'Xóa phiếu thành công.',
            type: SnackBarType.success,
          );
          bloc.add(const StationeryEvent.init());
        }
      },
      builder: (context, state) {
        return BaseScaffold(
          appBar: AppBarCommon(
            title: const Text('Văn phòng phẩm'),
            onBackTap: () => onBack(context),
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_month),
                tooltip: 'Chọn tháng',
                onPressed: () => _showDatePicker(context),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryERP,
            foregroundColor: Colors.white,
            onPressed: _openAdd,
            child: const Icon(Icons.add),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: _MonthHeader(month: state.selectedMonth),
              ),
              Expanded(child: _buildBody(context, state)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, StationeryState state) {
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
          ],
        ),
      );
    }

    if (state.stationery.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.missing, width: 320),
            const SizedBox(height: 12),
            const Text('Không có bản ghi nào'),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: state.stationery.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = state.stationery[index];
        return Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.25,
            children: [
              SlidableAction(
                onPressed: (_) => _showDeleteConfirm(item),
                backgroundColor: AppColors.alert,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Xóa',
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
              ),
            ],
          ),
          child: StationeryCard(item: item, onTap: () => _openDetail(item)),
        );
      },
    );
  }
}

class _MonthHeader extends StatelessWidget {
  const _MonthHeader({required this.month});

  final DateTime? month;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.white),
      child: Text(
        month != null
            ? DateFormat('MM/yyyy').format(month!)
            : DateFormat('MM/yyyy').format(DateTime.now()),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
