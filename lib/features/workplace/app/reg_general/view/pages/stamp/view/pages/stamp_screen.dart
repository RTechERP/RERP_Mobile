// Date: 04/06/2026
// Nội dung/Chức năng: Màn hình danh sách đăng ký dấu

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../../../../../../../../common/widgets/date_header.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../../data/datasource/models/stamp_model.dart';
import '../bloc/stamp_bloc.dart';
import '../widgets/stamp_card.dart';

class StampScreen extends StatefulWidget {
  const StampScreen({super.key});

  @override
  State<StampScreen> createState() => _StampScreenState();
}

class _StampScreenState
    extends BaseState<StampScreen, StampEvent, StampState, StampBloc> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const StampEvent.init());
    });
  }

  Future<void> _openAdd(BuildContext context) async {
    final reload = await context.push<bool?>(RouteNames.stampAdd);
    if (!mounted) return;
    if (reload == true) bloc.add(const StampEvent.init());
  }

  Future<void> _openDetail(BuildContext context, StampItem item) async {
    if (item.id == null) return;
    final reload = await context.push<bool?>(
      RouteNames.stampDetail,
      extra: item,
    );
    if (!mounted) return;
    if (reload == true) bloc.add(const StampEvent.init());
  }

  Future<void> _showDeleteConfirm(BuildContext context, StampItem item) async {
    final confirmed = await DialogService.showConfirmDelete(context: context);
    if (!mounted || !confirmed || item.id == null) return;
    bloc.add(StampEvent.deleteStamp(id: item.id!));
  }

  void _showDatePicker(BuildContext context) {
    final now = DateTime.now();
    final dayStart = DateTime(now.year, now.month, now.day);
    final dayEnd = DateTime(now.year, now.month, now.day, 23, 59, 59);

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: bloc.state.dateStart ?? dayStart,
        initialEnd: bloc.state.dateEnd ?? dayEnd,
        onApply: (start, end) {
          bloc.add(StampEvent.changeDateRange(dateStart: start, dateEnd: end));
        },
      ),
    );
  }

  @override
  bool listenWhen(StampState previous, StampState current) {
    return previous.deleteSuccess != current.deleteSuccess ||
        previous.status != current.status ||
        previous.message != current.message;
  }

  @override
  void listener(BuildContext context, StampState state) {
    if (state.deleteSuccess) {
      context.showMessage('Xóa thành công', type: SnackBarType.success);
      bloc.add(const StampEvent.clearDeleteState());
      return;
    }
    if (state.status == BaseStateStatus.failed &&
        (state.message ?? '').isNotEmpty) {
      context.showMessage(state.message!, type: SnackBarType.error);
      bloc.add(const StampEvent.clearDeleteState());
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<StampBloc, StampState>(
      bloc: bloc,
      builder: (context, state) {
        return BaseScaffold(
          appBar: AppBarCommon(
            title: const Text('Đăng ký đóng dấu'),
            onBackTap: () => onBack(context),
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_month),
                tooltip: 'Chọn ngày',
                onPressed: () => _showDatePicker(context),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryERP,
            foregroundColor: Colors.white,
            onPressed: () => _openAdd(context),
            child: const Icon(Icons.add),
          ),
          body: Column(
            children: [
              DateHeader(dateStart: state.dateStart, dateEnd: state.dateEnd),
              Expanded(child: _buildBody(context, state)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, StampState state) {
    if (state.status == BaseStateStatus.loading && state.stamps.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == BaseStateStatus.failed && state.stamps.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.error, width: 320),
            const SizedBox(height: 12),
            Text(state.message ?? 'Tải dữ liệu thất bại'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => bloc.add(const StampEvent.init()),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    if (state.stamps.isEmpty) {
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

    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(const StampEvent.init());
        await bloc.stream.firstWhere(
          (s) => s.status != BaseStateStatus.loading,
        );
      },
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: state.stamps.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = state.stamps[index];
          return Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.25,
              children: [
                SlidableAction(
                  onPressed: (_) => _showDeleteConfirm(context, item),
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
            child: StampCard(
              item: item,
              onTap: () => _openDetail(context, item),
            ),
          );
        },
      ),
    );
  }
}
