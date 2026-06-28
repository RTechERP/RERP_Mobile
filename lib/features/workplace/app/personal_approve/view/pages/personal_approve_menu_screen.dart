import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../base/bloc/index.dart';
import '../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../base/widgets/base_widget.dart';
import '../../../../../../common/app_theme/index.dart';
import '../../../../../../common/utils/dialog/index.dart';
import '../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../routes/route_names.dart';

import '../bloc/personal_approve_menu_bloc.dart';

/// Menu Phê duyệt - hiển thị cho user không phải Senior.
///
/// Lưu ý: user là Senior đã được workspace_bloc resolve và navigate thẳng
/// sang `personalApproveSeniorTimesheet`, không qua menu này.
class PersonalApproveMenuScreen extends StatefulWidget {
  const PersonalApproveMenuScreen({super.key});

  @override
  State<PersonalApproveMenuScreen> createState() =>
      _PersonalApproveMenuScreenState();
}

class _PersonalApproveMenuScreenState extends BaseState<
    PersonalApproveMenuScreen,
    PersonalApproveMenuEvent,
    PersonalApproveMenuState,
    PersonalApproveMenuBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const PersonalApproveMenuEvent.init());
  }

  @override
  void listener(BuildContext context, PersonalApproveMenuState state) {
    super.listener(context, state);

    if (state.status == BaseStateStatus.failed) {
      DialogService.showToastFailed(
        context: context,
        mess: state.message ?? 'Load user failed',
      );
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('Phê duyệt', style: AppStyles.headingTitle2),
        onBackTap: () => onBack(context),
      ),
      body: _buildMenuContent(context),
    );
  }

  Widget _buildMenuContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Duyệt công',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 13,
                    childAspectRatio: 1,
                    children: [
                      _MenuTile(
                        icon: Icons.schedule_outlined,
                        title: 'Duyệt công',
                        onTap: () =>
                            context.push(RouteNames.personalApproveTimesheet),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Widget menu tile cho Personal Approve grid.
class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primaryERP, size: 24),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: AppStyles.caption1,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}