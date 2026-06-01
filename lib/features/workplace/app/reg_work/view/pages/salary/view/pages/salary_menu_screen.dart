import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/services/custom_toast.dart';
import '../../../../../../../../../common/utils/dialog/dialog_service.dart';
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
  bool _pinChecked = false;
  bool _pinVerified = false;
  bool _intentToCancel = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(const SalaryEvent.initMenu());
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (result == true) {
          setState(() {
            _pinChecked = false;
            _pinVerified = false;
          });
          bloc.add(const SalaryEvent.initMenu());
        }
      },
      child: BlocListener<SalaryBloc, SalaryState>(
        listenWhen: (prev, curr) =>
            !_intentToCancel &&
            (prev.isVerifyingPin != curr.isVerifyingPin ||
                prev.hasPin != curr.hasPin ||
                prev.pinVerified != curr.pinVerified ||
                prev.pinError != curr.pinError),
        listener: (context, state) {
          if (_pinChecked || _intentToCancel) return;

          if (!state.isVerifyingPin && state.hasPin && !state.pinVerified) {
            _pinChecked = true;
            _showPinDialog(context);
          } else if (!state.isVerifyingPin && !state.hasPin) {
            _pinVerified = true;
            _pinChecked = true;
          }
        },
        child: BaseScaffold(
          appBar: AppBarCommon(
            title: Text(
              'Tổng hợp công - lương',
              style: AppStyles.headingTitle2,
            ),
            onBackTap: () => onBack(context),
          ),
          body: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<SalaryBloc, SalaryState>(
      buildWhen: (prev, curr) => prev.isVerifyingPin != curr.isVerifyingPin,
      builder: (context, state) {
        if (state.isVerifyingPin && !_pinChecked) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!_pinVerified && !state.isVerifyingPin) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_outline, size: 64, color: AppColors.gray),
                SizedBox(height: 16),
                Text(
                  'Đang xác thực mã PIN...',
                  style: AppStyles.body2.copyWith(color: AppColors.gray),
                ),
              ],
            ),
          );
        }

        return _buildMenuContent(context);
      },
    );
  }

  Widget _buildMenuContent(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      onTap: () => _navigateWithPinCheck(
                        context,
                        RouteNames.salarySummary,
                      ),
                    ),
                    _MenuTile(
                      icon: Icons.fingerprint,
                      title: 'Vân tay',
                      color: AppColors.purpleA500,
                      onTap: () => _navigateWithPinCheck(
                        context,
                        RouteNames.salaryFingerprint,
                      ),
                    ),
                    _MenuTile(
                      icon: Icons.access_time_filled_outlined,
                      title: 'Chấm công',
                      color: AppColors.orangeA500,
                      onTap: () => _navigateWithPinCheck(
                        context,
                        RouteNames.salaryAttendance,
                      ),
                    ),
                    _MenuTile(
                      icon: Icons.payments_outlined,
                      title: 'Bảng lương',
                      color: AppColors.greenA500,
                      onTap: () => _navigateWithPinCheck(
                        context,
                        RouteNames.salaryPayslip,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateWithPinCheck(BuildContext context, String route) {
    if (!_pinVerified) {
      CustomToast.showToastWithoutAppIcon(
        context: context,
        message: 'Vui long xac thuc ma PIN truoc',
      );
      return;
    }
    context.push(route);
  }

  Future<void> _showPinDialog(BuildContext context) async {
    final result = await DialogService.showPinDialog(context: context);
    if (result == true) {
      setState(() {
        _pinVerified = true;
        _intentToCancel = false;
      });
    } else if (result == false) {
      _intentToCancel = true;
    }
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
