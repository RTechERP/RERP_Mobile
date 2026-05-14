import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../bloc/salary_bloc.dart';

class ForgotPinScreen extends StatefulWidget {
  const ForgotPinScreen({super.key});

  @override
  State<ForgotPinScreen> createState() => _ForgotPinScreenState();
}

class _ForgotPinScreenState
    extends BaseState<ForgotPinScreen, SalaryEvent, SalaryState, SalaryBloc> {
  // Step 2
  final _otpController = TextEditingController();
  final _otpFocusNode = FocusNode();
  int _resendCountdown = 0;

  // Step 3
  final _newPinController = TextEditingController();
  final _confirmPinController = TextEditingController();
  final _newPinFocusNode = FocusNode();
  final _confirmPinFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(const SalaryEvent.forgotRequestOtp());
      _startResendCountdown();
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    _otpFocusNode.dispose();
    _newPinController.dispose();
    _confirmPinController.dispose();
    _newPinFocusNode.dispose();
    _confirmPinFocusNode.dispose();
    super.dispose();
  }

  @override
  bool listenWhen(SalaryState previous, SalaryState current) {
    return previous.forgotStep != current.forgotStep ||
        previous.forgotError != current.forgotError ||
        previous.forgotEmailMessage != current.forgotEmailMessage ||
        previous.forgotIsLoading != current.forgotIsLoading;
  }

  @override
  void listener(BuildContext context, SalaryState state) {
    if (state.forgotStep == -1) {
      showMessage(context, 'Đặt mã PIN thành công');
      context.pop(true);
    }
    if (state.forgotError != null) {
      showMessage(context, state.forgotError!, type: SnackBarType.error);
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      backgroundColor: AppColors.grey_bg,
      appBar: AppBarCommon(
        title: const Text('Quên mã PIN'),
        onBackTap: () {
          bloc.add(const SalaryEvent.forgotUpdateStep(0));
          onBack(context);
        },
      ),
      body: BlocBuilder<SalaryBloc, SalaryState>(
        bloc: bloc,
        builder: (context, state) {
          return Column(
            children: [
              _buildStepper(state.forgotStep),
              Expanded(child: _buildStepContent(state)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStepper(int step) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: EasyStepper(
        activeStep: step,
        stepShape: StepShape.circle,
        activeStepTextColor: AppColors.primaryERP,
        finishedStepTextColor: AppColors.primaryERP,
        activeStepBorderColor: AppColors.primaryERP,
        finishedStepBorderColor: AppColors.primaryERP,
        finishedStepBackgroundColor: AppColors.primaryERP,
        showLoadingAnimation: false,
        showStepBorder: true,
        stepRadius: 16,
        borderThickness: 2,
        internalPadding: 0,
        steps: [
          EasyStep(
            title: 'Gửi OTP',
            customStep: _buildStepCircle(0),
          ),
          EasyStep(
            title: 'Nhập OTP',
            customStep: _buildStepCircle(1),
          ),
          EasyStep(
            title: 'Đặt PIN mới',
            customStep: _buildStepCircle(2),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCircle(int index) {
    final isActive = index == bloc.state.forgotStep;
    final isFinished = index < bloc.state.forgotStep;

    return Container(
      width: 32.w,
      height: 32.w,
      decoration: BoxDecoration(
        color: isFinished
            ? AppColors.primaryERP
            : isActive
                ? AppColors.white
                : AppColors.bgCard,
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive || isFinished
              ? AppColors.primaryERP
              : AppColors.borderColor,
          width: 2,
        ),
      ),
      child: Center(
        child: isFinished
            ? Icon(
                Icons.check_rounded,
                size: 16.sp,
                color: AppColors.white,
              )
            : Text(
                '${index + 1}',
                style: AppStyles.body2.copyWith(
                  color: isActive ? AppColors.primaryERP : AppColors.gray,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }

  Widget _buildStepContent(SalaryState state) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          _buildStepCard(_getStepContent(state)),
        ],
      ),
    );
  }

  Widget _getStepContent(SalaryState state) {
    switch (state.forgotStep) {
      case 0:
        return _buildStep1(state);
      case 1:
        return _buildStep2(state);
      case 2:
        return _buildStep3(state);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildStepCard(Widget child) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  //---(Step 1)---//
  Widget _buildStep1(SalaryState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStepHeader(
          icon: Icons.send_rounded,
          title: 'Gửi mã OTP',
          subtitle: state.forgotEmailMessage?.isNotEmpty == true
              ? '${state.forgotEmailMessage}\nVui lòng nhập mã 6 số.'
              : 'Mã xác thực sẽ được gửi đến email đã đăng ký.',
        ),
        SizedBox(height: 24.h),
        _buildPrimaryButton(
          label: 'Gửi mã OTP',
          isLoading: state.forgotIsLoading,
          onTap: () =>
              bloc.add(const SalaryEvent.forgotRequestOtp()),
        ),
      ],
    );
  }

  //---(Step 2)---//
  Widget _buildStep2(SalaryState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStepHeader(
          icon: Icons.mark_email_read_outlined,
          title: 'Nhập mã OTP',
          subtitle: state.forgotEmailMessage?.isNotEmpty == true
              ? '${state.forgotEmailMessage}\nVui lòng nhập mã 6 số.'
              : 'Mã xác thực đã được gửi đến email.\nVui lòng nhập mã 6 số.',
        ),
        SizedBox(height: 24.h),
        _buildOtpInput(state),
        if (state.forgotError != null) ...[
          SizedBox(height: 12.h),
          _buildErrorMessage(state.forgotError!),
        ],
        SizedBox(height: 16.h),
        _buildResendRow(),
        SizedBox(height: 24.h),
        _buildPrimaryButton(
          label: 'Xác nhận OTP',
          isLoading: state.forgotIsLoading,
          onTap: () =>
              bloc.add(SalaryEvent.forgotValidateOtp(_otpController.text)),
        ),
      ],
    );
  }

  Widget _buildOtpInput(SalaryState state) {
    final defaultPinTheme = PinTheme(
      width: 44.w,
      height: 52.h,
      textStyle: AppStyles.headingTitle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        color: AppColors.heading,
      ),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: state.forgotError != null
              ? AppColors.alert
              : AppColors.borderColor,
          width: 1.5,
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: AppColors.primaryERP,
          width: 2.5,
        ),
      ),
    );

    return Center(
      child: Pinput(
        controller: _otpController,
        focusNode: _otpFocusNode,
        length: 6,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        autofocus: true,
        keyboardType: TextInputType.number,
        obscureText: false,
        showCursor: true,
        cursor: Container(
          margin: EdgeInsets.only(bottom: 6.h),
          width: 2,
          height: 24.h,
          decoration: BoxDecoration(
            color: AppColors.primaryERP,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        errorBuilder: (_, __) => const SizedBox.shrink(),
        onChanged: (value) {
          if (state.forgotError != null && value.isEmpty) return;
        },
        onCompleted: (_) {
          bloc.add(SalaryEvent.forgotValidateOtp(_otpController.text));
        },
      ),
    );
  }

  Widget _buildResendRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Bạn chưa nhận được mã?',
          style: AppStyles.body2.copyWith(color: AppColors.gray),
        ),
        SizedBox(width: 4.w),
        GestureDetector(
          onTap: _resendCountdown > 0
              ? null
              : () => bloc.add(const SalaryEvent.forgotResendOtp()),
          child: Text(
            _resendCountdown > 0 ? 'Gửi lại sau $_resendCountdown s' : 'Gửi lại',
            style: AppStyles.body2.copyWith(
              color: _resendCountdown > 0
                  ? AppColors.gray
                  : AppColors.primaryERP,
              fontWeight: FontWeight.w600,
              decoration:
                  _resendCountdown > 0 ? null : TextDecoration.underline,
              decorationColor: AppColors.primaryERP.withValues(alpha: 0.7),
            ),
          ),
        ),
      ],
    );
  }

  //---(Step 3)---//
  Widget _buildStep3(SalaryState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStepHeader(
          icon: Icons.lock_reset_rounded,
          title: 'Đặt mã PIN mới',
          subtitle: 'Nhập mã PIN mới gồm 6 chữ số và xác nhận.',
        ),
        SizedBox(height: 24.h),
        _buildPinField(
          label: 'Mã PIN mới',
          controller: _newPinController,
          focusNode: _newPinFocusNode,
          hint: '******',
          nextFocusNode: _confirmPinFocusNode,
        ),
        SizedBox(height: 16.h),
        _buildPinField(
          label: 'Xác nhận mã PIN',
          controller: _confirmPinController,
          focusNode: _confirmPinFocusNode,
          hint: '******',
          nextFocusNode: null,
        ),
        if (state.forgotError != null) ...[
          SizedBox(height: 12.h),
          _buildErrorMessage(state.forgotError!),
        ],
        SizedBox(height: 24.h),
        _buildPrimaryButton(
          label: 'Xác nhận đặt PIN',
          isLoading: state.forgotIsLoading,
          onTap: () {
            bloc.add(SalaryEvent.forgotResetPin(
              newPin: _newPinController.text,
              confirmPin: _confirmPinController.text,
            ));
          },
        ),
      ],
    );
  }

  Widget _buildPinField({
    required String label,
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hint,
    FocusNode? nextFocusNode,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.body2.copyWith(
            color: AppColors.heading,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: AppColors.borderColor, width: 1.4),
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            obscureText: true,
            maxLength: 6,
            textInputAction:
                nextFocusNode != null ? TextInputAction.next : TextInputAction.done,
            style: AppStyles.headingTitle.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
              color: AppColors.heading,
              letterSpacing: 8,
            ),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppStyles.headingTitle.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: AppColors.hintText,
                letterSpacing: 8,
              ),
              counterText: '',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
            ),
            onSubmitted: nextFocusNode != null
                ? (_) => nextFocusNode.requestFocus()
                : (_) {
                    bloc.add(SalaryEvent.forgotResetPin(
                      newPin: _newPinController.text,
                      confirmPin: _confirmPinController.text,
                    ));
                  },
          ),
        ),
      ],
    );
  }

  //---(Helper widgets)---//
  Widget _buildStepHeader({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        Container(
          width: 64.w,
          height: 64.w,
          decoration: BoxDecoration(
            color: AppColors.primaryERP.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 32.sp,
            color: AppColors.primaryERP,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          title,
          style: AppStyles.headingTitle.copyWith(
            color: AppColors.heading,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          style: AppStyles.body2.copyWith(
            color: AppColors.gray,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPrimaryButton({
    required String label,
    required VoidCallback onTap,
    bool isLoading = false,
  }) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        gradient: AppColors.gradientERP,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryERP.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14.r),
          onTap: isLoading ? null : onTap,
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation(AppColors.white),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 18.sp,
                        color: AppColors.white,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        label,
                        style: AppStyles.button1.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorMessage(String message) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.alert.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.alert.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 16.sp,
            color: AppColors.alert,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              message,
              style: AppStyles.body2.copyWith(
                color: AppColors.alert,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //---(Helper methods)---//
  void _startResendCountdown() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return false;
      setState(() {
        if (_resendCountdown > 0) {
          _resendCountdown--;
        }
      });
      return _resendCountdown > 0;
    });
  }
}
