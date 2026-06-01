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
import '../bloc/idea_registration_bloc.dart';
import '../widgets/idea_registration_card.dart';

class IdeaRegistrationScreen extends StatefulWidget {
  const IdeaRegistrationScreen({super.key});

  @override
  State<IdeaRegistrationScreen> createState() => _IdeaRegistrationScreenState();
}

class _IdeaRegistrationScreenState
    extends
        BaseState<
          IdeaRegistrationScreen,
          IdeaRegistrationEvent,
          IdeaRegistrationState,
          IdeaRegistrationBloc
        > {
  @override
  void initState() {
    super.initState();
    bloc.add(const IdeaRegistrationEvent.init());
  }

  void _showDatePicker() {
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
              bloc.add(
                IdeaRegistrationEvent.changeDateRange(
                  dateStart: start,
                  dateEnd: end,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<IdeaRegistrationBloc, IdeaRegistrationState>(
      listenWhen: (prev, curr) =>
          prev.status != curr.status ||
          prev.message != curr.message ||
          prev.deleteSuccess != curr.deleteSuccess,
      listener: (context, state) {
        if (state.deleteSuccess) {
          context.showMessage(
            'Xoá ý tưởng thành công',
            type: SnackBarType.success,
          );
          bloc.add(const IdeaRegistrationEvent.clearDeleteSuccess());
        } else if (state.status == BaseStateStatus.failed &&
            state.message != null) {
          context.showMessage(state.message!, type: SnackBarType.error);
        }
      },
      child: BlocBuilder<IdeaRegistrationBloc, IdeaRegistrationState>(
        buildWhen: (prev, curr) =>
            prev.status != curr.status ||
            prev.items.length != curr.items.length,
        builder: (context, state) {
          return BaseScaffold(
            appBar: AppBarCommon(
              title: const Text('Đăng ký ý tưởng'),
              onBackTap: () => context.pop(),
              actions: [
                IconButton(
                  icon: const Icon(Icons.calendar_month),
                  tooltip: 'Chọn ngày',
                  onPressed: () => _showDatePicker(),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primaryERP,
              child: const Icon(Icons.add, color: Colors.white),
              onPressed: () async {
                final result = await context.push<bool>(
                  RouteNames.ideaRegistrationAdd,
                );
                if (result == true) {
                  bloc.add(const IdeaRegistrationEvent.refresh());
                }
              },
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
  Widget _buildBody(BuildContext context, IdeaRegistrationState state) {
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
                bloc.add(const IdeaRegistrationEvent.init());
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
              'Chưa có ý tưởng cải tiến nào',
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
          return InkWell(
            key: ValueKey('idea_${item.id}'),
            onTap: () {
              if (item.id != null) {
                context.push(RouteNames.ideaRegistrationEdit, extra: item);
              }
            },
            borderRadius: BorderRadius.circular(12),
            child: IdeaRegistrationCard(item: item),
          );
        },
      ),
    );
  }

  Future<void> _onRefresh() async {
    bloc.add(const IdeaRegistrationEvent.refresh());
    await Future.delayed(const Duration(milliseconds: 500));
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
