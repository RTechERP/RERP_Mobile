import 'package:flutter/material.dart';

import '../../app_theme/index.dart';
import '../../enums/index.dart';

class FormActions extends StatelessWidget {
  final FormActionMode mode;

  final VoidCallback? onView;
  final VoidCallback? onCancel;
  final VoidCallback? onSave;
  final VoidCallback? onSubmit;

  final String viewText;
  final String cancelText;
  final String saveText;
  final String submitText;

  const FormActions({
    super.key,
    required this.mode,
    this.onView,
    this.onCancel,
    this.onSave,
    this.onSubmit,
    this.viewText = 'Huỷ đơn',
    this.cancelText = 'Huỷ',
    this.saveText = 'Cập nhật',
    this.submitText = 'Lưu',
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: switch (mode) {
        FormActionMode.view => _buildView(),
        FormActionMode.edit => _buildEdit(),
        FormActionMode.add => _buildAdd(),
      },
    );
  }

  /// ===== VIEW MODE =====
  Widget _buildView() {
    return OutlinedButton(
      onPressed: onView,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.red,
        side: const BorderSide(color: Colors.red),
        padding: const EdgeInsets.symmetric(vertical: 14),
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Text(
        viewText,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  /// ===== EDIT MODE =====
  Widget _buildEdit() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onCancel,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              padding: const EdgeInsets.symmetric(vertical: 14),
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(cancelText),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: onSave,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryERP,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(
              saveText,
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// ===== ADD MODE =====
  Widget _buildAdd() {
    return ElevatedButton(
      onPressed: onSubmit,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryERP,
        padding: const EdgeInsets.symmetric(vertical: 14),
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Text(
        submitText,
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
