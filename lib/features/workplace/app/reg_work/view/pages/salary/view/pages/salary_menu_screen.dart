import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../bloc/salary_bloc.dart';

class SalaryMenuScreen extends StatefulWidget {
  const SalaryMenuScreen({super.key});

  @override
  State<SalaryMenuScreen> createState() => _SalaryMenuScreenState();
}

class _SalaryMenuScreenState
    extends BaseState<SalaryMenuScreen, SalaryEvent, SalaryState, SalaryBloc> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(const SalaryEvent.initMenu());
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('Tổng hợp công lương', style: AppStyles.headingTitle2),
        onBackTap: () => onBack(context),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lương',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.heading,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.85,
                    children: [
                      _MenuTile(
                        icon: Icons.summarize_outlined,
                        title: 'Tổng hợp',
                        color: AppColors.stateInfoColor,
                        onTap: () => context.push(RouteNames.salarySummary),
                      ),
                      _MenuTile(
                        icon: Icons.fingerprint,
                        title: 'Vân tay',
                        color: AppColors.purpleA500,
                        onTap: () => context.push(RouteNames.salaryFingerprint),
                      ),
                      _MenuTile(
                        icon: Icons.access_time_filled_outlined,
                        title: 'Chấm công',
                        color: AppColors.orangeA500,
                        onTap: () => context.push(RouteNames.salaryAttendance),
                      ),
                      _MenuTile(
                        icon: Icons.payments_outlined,
                        title: 'Bảng lương',
                        color: AppColors.greenA500,
                        onTap: () => context.push(RouteNames.salaryPayslip),
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

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final Color color;
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
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: AppStyles.caption1.copyWith(
              color: AppColors.heading,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
