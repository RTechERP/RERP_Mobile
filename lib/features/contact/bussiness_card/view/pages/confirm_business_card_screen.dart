import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../common/app_theme/index.dart';
import '../../../../../base/network/errors/extension.dart';
import '../../../../../common/utils/snack_bar_helper.dart';
import '../../data/datasource/models/business_card_model.dart';

/// Màn hình xác nhận danh thiếp sau khi scan.
/// Hiển thị các thông tin đã quét và cho phép chỉnh sửa trước khi lưu.
class ConfirmBusinessCardScreen extends StatefulWidget {
  final Map<String, String> scannedData;

  const ConfirmBusinessCardScreen({
    super.key,
    required this.scannedData,
  });

  @override
  State<ConfirmBusinessCardScreen> createState() => _ConfirmBusinessCardScreenState();
}

class _ConfirmBusinessCardScreenState extends State<ConfirmBusinessCardScreen> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _companyController;
  late TextEditingController _addressController;
  late TextEditingController _positionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _extractField('FN') ?? _extractField('NAME'));
    _phoneController = TextEditingController(text: _extractField('TEL') ?? _extractField('PHONE'));
    _emailController = TextEditingController(text: _extractField('EMAIL'));
    _companyController = TextEditingController(text: _extractField('ORG') ?? _extractField('COMPANY'));
    _addressController = TextEditingController(text: _extractField('ADR') ?? _extractField('ADDRESS'));
    _positionController = TextEditingController(text: _extractField('TITLE') ?? _extractField('ROLE'));
  }

  String? _extractField(String key) {
    return widget.scannedData[key.toUpperCase()] ?? widget.scannedData[key];
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _companyController.dispose();
    _addressController.dispose();
    _positionController.dispose();
    super.dispose();
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    context.showMessage('Đã sao chép', type: SnackBarType.success);
  }

  void _confirmAndSave() {
    if (_nameController.text.trim().isEmpty) {
      context.showMessage('Vui lòng nhập tên', type: SnackBarType.error);
      return;
    }

    final result = BusinessCardModel(
      fullName: _nameController.text.trim(),
      sdtCaNhan: _phoneController.text.trim(),
      emailCongTy: _emailController.text.trim(),
      companyName: _companyController.text.trim(),
      address: _addressController.text.trim(),
      chucVu: _positionController.text.trim(),
      isFavorite: false,
    );

    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.heading),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Xác nhận danh thiếp',
          style: TextStyle(
            color: AppColors.heading,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: _nameController,
            builder: (context, value, _) {
              final enabled = value.text.trim().isNotEmpty;
              return IconButton(
                icon: Icon(
                  Icons.check,
                  color: enabled
                      ? AppColors.primaryERP
                      : AppColors.gray.withValues(alpha: 0.4),
                  size: 28,
                ),
                onPressed: enabled ? _confirmAndSave : null,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1A1A1A).withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: AppColors.gradientERP,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.credit_card_outlined,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Thông tin đã quét',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.gray,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Kiểm tra và chỉnh sửa thông tin trước khi lưu',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.hintText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Form fields
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1A1A1A).withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFE8EAF0), width: 0.5),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.edit_note, size: 18, color: AppColors.secondaryERP),
                        SizedBox(width: 8),
                        Text(
                          'Thông tin cá nhân',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.heading,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildTextField(
                    controller: _nameController,
                    label: 'Họ và tên',
                    icon: Icons.person_outline,
                    isRequired: true,
                  ),
                  _buildTextField(
                    controller: _phoneController,
                    label: 'Số điện thoại',
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                  ),
                  _buildTextField(
                    controller: _emailController,
                    label: 'Email',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _buildTextField(
                    controller: _positionController,
                    label: 'Chức vụ',
                    icon: Icons.work_outline,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Company info
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1A1A1A).withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFE8EAF0), width: 0.5),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.business_outlined, size: 18, color: AppColors.secondaryERP),
                        SizedBox(width: 8),
                        Text(
                          'Thông tin công ty',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.heading,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildTextField(
                    controller: _companyController,
                    label: 'Tên công ty',
                    icon: Icons.domain_outlined,
                  ),
                  _buildTextField(
                    controller: _addressController,
                    label: 'Địa chỉ',
                    icon: Icons.location_on_outlined,
                    autoExpand: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    bool autoExpand = false,
    bool isRequired = false,
  }) {
    final copyIcon = IconButton(
      icon: const Icon(
        Icons.copy_outlined,
        size: 18,
        color: AppColors.gray,
      ),
      tooltip: 'Sao chép',
      onPressed: () => _copyToClipboard(controller.text),
      visualDensity: VisualDensity.compact,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: AppColors.gray),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.gray,
                ),
              ),
              if (isRequired)
                const Text(
                  ' *',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            minLines: 1,
            maxLines: autoExpand ? null : 1,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFE8EAF0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFE8EAF0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.primaryERP),
              ),
              filled: true,
              fillColor: const Color(0xFFF8F9FB),
              suffixIcon: ValueListenableBuilder<TextEditingValue>(
                valueListenable: controller,
                builder: (context, value, _) {
                  if (value.text.isEmpty) return const SizedBox.shrink();
                  return copyIcon;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
