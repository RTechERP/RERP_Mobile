import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

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
  });

  final PinInputController controller;
  final SalaryState state;
  final void Function(String pin) onSubmit;
  final VoidCallback onCancel;

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(),
              SizedBox(height: 28.h),
              _buildPinInput(),
              if (widget.state.pinError != null) ...[
                SizedBox(height: 14.h),
                _buildError(),
              ],
              SizedBox(height: 24.h),
              _buildActions(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
          colors: [
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
                  Icons.lock_rounded,
                  size: 28,
                  color: AppColors.white,
                ),
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
            'Xác thực bảo mật',
            style: AppStyles.headingTitle5.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Nhập mã PIN để tiếp tục',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.info_outline_rounded,
                size: 13,
                color: AppColors.gray,
              ),
              SizedBox(width: 4.w),
              Text(
                'Mã PIN gồm 6 chữ số',
                style: AppStyles.caption1.copyWith(
                  color: AppColors.gray,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildError() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
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
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: AppColors.alert.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.error_outline_rounded,
              size: 12,
              color: AppColors.alert,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              widget.state.pinError!,
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

  Widget _buildActions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
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
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.onTap,
    required this.isPrimary,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onTap;
  final bool isPrimary;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isPrimary) {
      return Container(
        height: 46.h,
        decoration: BoxDecoration(
          gradient: onTap != null ? AppColors.gradientERP : null,
          color: onTap == null ? AppColors.disableBorderButton : null,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: onTap != null
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
                        Text(
                          label,
                          style: AppStyles.button1.copyWith(
                            color: onTap != null
                                ? AppColors.white
                                : AppColors.textTertiaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (onTap != null) ...[
                          SizedBox(width: 4.w),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 16,
                            color: AppColors.white,
                          ),
                        ],
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
