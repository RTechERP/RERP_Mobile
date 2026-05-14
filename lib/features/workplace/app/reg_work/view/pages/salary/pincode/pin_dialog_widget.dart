import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../../../../routes/route_names.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../view/bloc/salary_bloc.dart';
import 'pin_input_controller.dart';

class PinDialogWidget extends StatefulWidget {
  const PinDialogWidget({
    super.key,
    required this.controller,
    required this.state,
    required this.onSubmit,
    required this.onCancel,
    this.pinRetryCount = 0,
    this.isPinLocked = false,
  });

  final PinInputController controller;
  final SalaryState state;
  final void Function(String pin) onSubmit;
  final VoidCallback onCancel;
  final int pinRetryCount;
  final bool isPinLocked;

  @override
  State<PinDialogWidget> createState() => _PinDialogWidgetState();
}

class _PinDialogWidgetState extends State<PinDialogWidget>
    with SingleTickerProviderStateMixin {
  late TextEditingController _pinputController;
  late FocusNode _focusNode;
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _pinputController = TextEditingController();
    _focusNode = FocusNode();

    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _pinputController.dispose();
    _focusNode.dispose();
    _shakeController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(PinDialogWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.pinError != null &&
        oldWidget.state.pinError != widget.state.pinError) {
      _pinputController.clear();
      _shakeController.forward(from: 0);
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: AnimatedBuilder(
        animation: _shakeAnimation,
        builder: (context, child) {
          final shake = math.sin(_shakeAnimation.value * math.pi * 4) * 6;
          return Transform.translate(
            offset: Offset(shake, 0),
            child: child,
          );
        },
        child: Container(
          width: double.maxFinite,
          constraints: BoxConstraints(maxWidth: 320.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryERP.withValues(alpha: 0.15),
                blurRadius: 28,
                offset: const Offset(0, 12),
              ),
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(),
                SizedBox(height: 28.h),
                _buildPinInput(),
                SizedBox(height: 24.h),
                _buildActions(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final isLocked = widget.isPinLocked;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 24.h,
        bottom: 20.h,
        left: 20.w,
        right: 20.w,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isLocked
              ? [
            AppColors.alert,
            AppColors.alert.withValues(alpha: 0.85),
            const Color(0xFFE74C3C),
          ]
              : [
            AppColors.primaryERP,
            AppColors.primaryERP.withValues(alpha: 0.85),
            AppColors.secondaryERP,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.18),
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  isLocked ? Icons.lock_clock_rounded : Icons.lock_rounded,
                  size: 28,
                  color: AppColors.white,
                ),
                if (!isLocked)
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 2),
                      ),
                      child: Icon(
                        Icons.check_rounded,
                        size: 10,
                        color: AppColors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            isLocked ? 'Đã bị khóa' : 'Xác thực bảo mật',
            style: AppStyles.headingTitle5.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            isLocked
                ? 'Bạn đã nhập sai quá nhiều lần'
                : 'Nhập mã PIN để tiếp tục',
            style: AppStyles.body2.copyWith(
              color: AppColors.white.withValues(alpha: 0.82),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPinInput() {
    final isLocked = widget.isPinLocked;

    if (isLocked) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.alert.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: AppColors.alert.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                size: 40,
                color: AppColors.alert,
              ),
              SizedBox(height: 10.h),
              Text(
                'Đã nhập sai ${widget.pinRetryCount} lần',
                style: AppStyles.body1.copyWith(
                  color: AppColors.alert,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6.h),
              Text(
                'Vui lòng liên hệ HR hoặc thử lại',
                style: AppStyles.body2.copyWith(
                  color: AppColors.alert.withValues(alpha: 0.8),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return _buildPinInputContent();
  }

  Widget _buildPinInputContent() {
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
          color: AppColors.borderColor,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColors.redA200.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: AppColors.alert,
          width: 2,
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
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryERP.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Pinput(
            controller: _pinputController,
            focusNode: _focusNode,
            length: 6,
            defaultPinTheme: defaultPinTheme,
            errorPinTheme: errorPinTheme,
            focusedPinTheme: focusedPinTheme,
            autofocus: true,
            keyboardType: TextInputType.number,
            obscureText: true,
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
              if (widget.state.pinError != null && value.isEmpty) return;
              if (value.length == 6) {
                widget.onSubmit(value);
              }
            },
            onCompleted: (value) {
              widget.onSubmit(value);
            },
          ),
          SizedBox(height: 12.h),
          _buildRetryHint(),
        ],
      ),
    );
  }

  Widget _buildRetryHint() {
    final remaining = 3 - widget.pinRetryCount;
    if (remaining <= 0) return const SizedBox.shrink();

    if (remaining == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            size: 13,
            color: AppColors.alert,
          ),
          SizedBox(width: 4.w),
          Text(
            'Còn $remaining lần nhập',
            style: AppStyles.caption1.copyWith(
              color: AppColors.alert,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.info_outline_rounded,
          size: 13,
          color: AppColors.gray,
        ),
        SizedBox(width: 4.w),
        Text(
          'Còn $remaining lần nhập',
          style: AppStyles.caption1.copyWith(
            color: AppColors.gray,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
  Widget _buildActions() {
    final isLocked = widget.isPinLocked;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: isLocked
          ? Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 46.h,
                  child: _ActionButton(
                    label: 'Đóng',
                    onTap: widget.onCancel,
                    isPrimary: true,
                  ),
                ),
                SizedBox(height: 8.h),
                _buildForgotPinLink(),
              ],
            )
          : Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _ActionButton(
                        label: 'Huỷ',
                        onTap: widget.onCancel,
                        isPrimary: false,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      flex: 2,
                      child: _ActionButton(
                        label: 'Xác nhận',
                        onTap: _pinputController.text.length == 6
                            ? () => widget.onSubmit(_pinputController.text)
                            : null,
                        isPrimary: true,
                        isLoading: widget.state.isVerifyingPin,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                _buildForgotPinLink(),
              ],
            ),
    );
  }

  Widget _buildForgotPinLink() {
    return GestureDetector(
      onTap: () {
        widget.onCancel();
        context.push(RouteNames.salaryForgotPin);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: AppColors.secondaryERP.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.secondaryERP.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.help_outline_rounded,
              size: 16.sp,
              color: AppColors.secondaryERP,
            ),
            SizedBox(width: 6.w),
            Text(
              'Quên mã PIN?',
              style: AppStyles.body2.copyWith(
                color: AppColors.secondaryERP,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.onTap,
    required this.isPrimary,
    this.isLoading = false,
    this.isLocked = false,
  });

  final String label;
  final VoidCallback? onTap;
  final bool isPrimary;
  final bool isLoading;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    if (isPrimary) {
      return Container(
        height: 46.h,
        decoration: BoxDecoration(
          gradient: isLocked
              ? LinearGradient(
                  colors: [
                    AppColors.alert,
                    AppColors.alert.withValues(alpha: 0.85),
                  ],
                )
              : onTap != null
                  ? AppColors.gradientERP
                  : null,
          color: onTap == null && !isLocked ? AppColors.disableBorderButton : null,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: onTap != null && !isLocked
              ? [
                  BoxShadow(
                    color: AppColors.primaryERP.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12.r),
            onTap: onTap,
            child: Center(
              child: isLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        valueColor: AlwaysStoppedAnimation(AppColors.white),
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isLocked) ...[
                          Icon(
                            Icons.close_rounded,
                            size: 16,
                            color: AppColors.white,
                          ),
                          SizedBox(width: 6.w),
                        ] else if (onTap != null) ...[
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 16,
                            color: AppColors.white,
                          ),
                          SizedBox(width: 4.w),
                        ],
                        Text(
                          label,
                          style: AppStyles.button1.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      );
    }

    return Container(
      height: 46.h,
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.borderColor, width: 1.2),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: AppStyles.button1.copyWith(
                color: AppColors.gray,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
