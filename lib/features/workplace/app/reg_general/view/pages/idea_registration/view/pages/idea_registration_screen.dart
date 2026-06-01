import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/app_bar_common.dart';
import '../../../../../../../../../common/app_theme/app_colors.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/date_header.dart';
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
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
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
    return BlocConsumer<IdeaRegistrationBloc, IdeaRegistrationState>(
      listenWhen: (prev, curr) =>
          prev.status != curr.status || prev.message != curr.message,
      listener: (context, state) {
        if (state.status == BaseStateStatus.failed && state.message != null) {
          context.showMessage(state.message!, type: SnackBarType.error);
        }
      },
      builder: (context, state) {
        return BaseScaffold(
          appBar: AppBarCommon(
            title: const Text('Đăng ký ý tưởng'),
            onBackTap: () => onBack(context),
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_month),
                tooltip: 'Chọn ngày',
                onPressed: _showDatePicker,
              ),
            ],
          ),
          body: _buildBody(state),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryERP,
            foregroundColor: Colors.white,
            onPressed: () async {
              final result = await context.push<bool>(
                RouteNames.ideaRegistrationAdd,
              );
              if (result == true) {
                bloc.add(const IdeaRegistrationEvent.refresh());
              }
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  //---(_Body)---//
  Widget _buildBody(IdeaRegistrationState state) {
    if (state.status == BaseStateStatus.loading && state.items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == BaseStateStatus.failed && state.items.isEmpty) {
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

    if (state.items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.missing, width: 320),
            const SizedBox(height: 12),
            const Text('Chưa có ý tưởng cải tiến nào'),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 8),
      itemCount: state.items.length + 1,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        if (index == 0) {
          return DateHeader(dateStart: state.dateStart, dateEnd: state.dateEnd);
        }
        final item = state.items[index - 1];
        return IdeaRegistrationCard(item: item, onTap: () {});
      },
    );
  }
}
