import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../bloc/work_requirement_bloc.dart';
import '../widgets/work_requirement_card.dart';

class WorkRequirementScreen extends StatefulWidget {
  const WorkRequirementScreen({super.key});

  @override
  State<WorkRequirementScreen> createState() => _WorkRequirementScreenState();
}

class _WorkRequirementScreenState
    extends BaseState<
        WorkRequirementScreen,
        WorkRequirementEvent,
        WorkRequirementState,
        WorkRequirementBloc> {

  @override
  void initState() {
    super.initState();
    bloc.add(const WorkRequirementEvent.init());
  }

  Future<void> _onRefresh() async {
    bloc.add(const WorkRequirementEvent.refresh());
    await Future.delayed(const Duration(milliseconds: 500));
  }

  void _showDateRangePicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: DateRangePicker(
            initialStart: bloc.state.dateStart,
            initialEnd: bloc.state.dateEnd,
            onApply: (start, end) {
              bloc.add(WorkRequirementEvent.changeDateRange(
                dateStart: start,
                dateEnd: end,
              ));
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<WorkRequirementBloc, WorkRequirementState>(
      listenWhen: (prev, curr) =>
          prev.status != curr.status || prev.message != curr.message,
      listener: (context, state) {
        if (state.status == BaseStateStatus.failed &&
            state.message != null) {
          context.showMessage(state.message!, type: SnackBarType.error);
        }
      },
      child: BlocBuilder<WorkRequirementBloc, WorkRequirementState>(
        buildWhen: (prev, curr) =>
            prev.status != curr.status || prev.items.length != curr.items.length,
        builder: (context, state) {
          return BaseScaffold(
            appBar: AppBarCommon(
              title: const Text('Yêu cầu công việc'),
              onBackTap: () => context.pop(),
              actions: [
                IconButton(
                  icon: const Icon(Icons.calendar_month),
                  tooltip: 'Chọn ngày',
                  onPressed: () => _showDateRangePicker(),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final result = await context.push<bool>(
                  RouteNames.workRequirementAdd,
                );
                if (result == true) {
                  bloc.add(const WorkRequirementEvent.refresh());
                }
              },
              backgroundColor: AppColors.primaryERP,
              child: const Icon(Icons.add, color: Colors.white),
            ),
            body: Column(
              children: [
                if (state.dateStart != null)
                  _DateHeader(
                    dateStart: state.dateStart,
                    dateEnd: state.dateEnd,
                  ),
                Expanded(child: _buildBody(context, state)),
              ],
            ),
          );
        },
      ),
    );
  }

  //---(_Body)---//
  Widget _buildBody(BuildContext context, WorkRequirementState state) {
    if (state.status == BaseStateStatus.loading && state.items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == BaseStateStatus.failed && state.items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.error, width: 280),
            const SizedBox(height: 12),
            Text(
              state.message ?? 'Tải dữ liệu thất bại',
              style: const TextStyle(color: AppColors.gray),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                bloc.add(const WorkRequirementEvent.init());
              },
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
              ),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    if (state.items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.missing, width: 280),
            const SizedBox(height: 12),
            const Text(
              'Không có yêu cầu công việc nào',
              style: TextStyle(color: AppColors.gray),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _onRefresh,
      color: AppColors.primaryERP,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: state.items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = state.items[index];
          return WorkRequirementCard(
            item: item,
            onTap: () {
              context.push(
                RouteNames.workRequirementDetail,
                extra: item.id, // int - ID của yêu cầu công việc
              );
            },
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Date Header
// ---------------------------------------------------------------------------

class _DateHeader extends StatelessWidget {
  final DateTime? dateStart;
  final DateTime? dateEnd;

  const _DateHeader({this.dateStart, this.dateEnd});

  String _format(DateTime d) {
    return '${d.day.toString().padLeft(2, '0')}/'
        '${d.month.toString().padLeft(2, '0')}/'
        '${d.year}';
  }

  @override
  Widget build(BuildContext context) {
    String text;

    if (dateStart != null && dateEnd != null) {
      final s = dateStart!;
      final e = dateEnd!;
      if (s.year == e.year && s.month == e.month && s.day == e.day) {
        text = 'Ngày: ${_format(s)}';
      } else {
        text = 'Từ: ${_format(s)} - Đến: ${_format(e)}';
      }
    } else if (dateStart != null) {
      text = 'Ngày: ${_format(dateStart!)}';
    } else {
      text = 'Tất cả';
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
