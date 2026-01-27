import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/widgets/form/index.dart';

class LeaveDetailScreenPage extends StatefulWidget {
  const LeaveDetailScreenPage({super.key});

  @override
  State<LeaveDetailScreenPage> createState() => _LeaveDetailScreenPageState();
}

class _LeaveDetailScreenPageState extends State<LeaveDetailScreenPage> {
  bool _isEditing = false;

  void _toggleEdit(BuildContext context) {
    context.push('/regwork/leave/edit');
  }


  void _cancelEdit() {
    setState(() => _isEditing = false);
  }

  void _save() {
    // call API save here
    setState(() => _isEditing = false);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Chi tiết đơn xin nghỉ'),
        automaticallyImplyLeading: !_isEditing,
        actions: [
          IconButton(
            icon: Icon(
              _isEditing ? Icons.close : Icons.create_outlined,
            ),
            onPressed: () {
              _isEditing ? _cancelEdit() : _toggleEdit(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// ===== THÔNG TIN NGHỈ =====
                    FormCard(
                      title: 'Thông tin nghỉ phép',
                      child: Column(
                        children: const [
                          _InfoRow(
                            label: 'Loại nghỉ',
                            value: 'Nghỉ phép năm (P)',
                          ),
                          _InfoRow(
                            label: 'Ngày nghỉ',
                            value: '25/01/2026',
                          ),
                          _InfoRow(
                            label: 'Thời gian',
                            value: 'Cả ngày',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// ===== NGƯỜI KIỂM DUYỆT =====
                    FormCard(
                      title: 'Người kiểm duyệt',
                      child: const _InfoRow(
                        label: 'Người duyệt',
                        value: 'Quản lý trực tiếp',
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// ===== LÝ DO =====
                    FormCard(
                      title: 'Lý do nghỉ',
                      child: const Text(
                        'Gia đình có việc riêng cần giải quyết.',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// ===== ACTION =====
            SafeArea(
              top: false,
              child: _isEditing
                  ? _buildEditActions()
                  : _buildViewActions(),
            ),
          ],
        ),
      ),
    );
  }

  /// ===== VIEW MODE =====
  Widget _buildViewActions() {
    return OutlinedButton(
      onPressed: () {
        // DialogService.showCancelLeave(context: context);
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.red,
        side: const BorderSide(color: Colors.red),
        padding: const EdgeInsets.symmetric(vertical: 14),
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: const Text(
        'Huỷ đơn',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  /// ===== EDIT MODE =====
  Widget _buildEditActions() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: _cancelEdit,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              padding: const EdgeInsets.symmetric(vertical: 14),
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text('Huỷ'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: _save,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryERP,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              'Lưu',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
