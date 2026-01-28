import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../common/widgets/form/index.dart';

class LunchDetailScreenPage extends StatefulWidget {
  const LunchDetailScreenPage({super.key});

  @override
  State<LunchDetailScreenPage> createState() => _LunchDetailScreenPageState();
}

class _LunchDetailScreenPageState extends State<LunchDetailScreenPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isEditing = false;

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _cancelEdit() {
    _formKey.currentState?.reset();
    setState(() {
      _isEditing = false;
    });
  }

  void _save() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;
      debugPrint(values.toString());

      setState(() {
        _isEditing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Chi tiết cơm ca'),
        automaticallyImplyLeading: !_isEditing,
        actions: [
          IconButton(
            icon: Icon(
              _isEditing ? Icons.close : Icons.create_outlined,
            ),
            onPressed: () {
              _isEditing ? _cancelEdit() : _toggleEdit();
            },
          ),
        ],
      ),

        body: Padding(
        padding: const EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              /// ===== CARD: THÔNG TIN =====
              FormCard(
                title: 'Thông tin cơm ca',
                child: Column(
                  children: [
                    ReadonlyField(
                      value: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                      icon: Icons.calendar_today_outlined,
                    ),
                    const SizedBox(height: 12),
                    InputField(
                      enabled: _isEditing,
                      nameForm: 'regwork',
                      nameTextField: 'regwork_lunch_detail_quantity',
                      keyboardType: TextInputType.number,
                      label: 'Số lượng',
                      icon: Icons.confirmation_number_outlined,
                    ),

                    const SizedBox(height: 8),
                    LocationRadioGroup(enabled: _isEditing),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              /// ===== CARD: GHI CHÚ =====
              FormCard(
                title: 'Ghi chú',
                child:  InputField(
                  enabled: _isEditing,
                  nameForm: 'regwork',
                  nameTextField: 'regwork_lunch_detail_note',
                  label: 'Ghi chú',
                  icon: Icons.note_alt_outlined,
                  maxLines: 5,
                ),
              ),
              const Spacer(),

              _isEditing
                  ? _buildEditActions(context)
                  : _buildViewActions(context),
            ],
          ),
        ),
      ),
    );
  }

  /// ===== VIEW MODE =====
  Widget _buildViewActions(BuildContext context) {
    return OutlinedButton(
      onPressed: () =>  DialogService.showCancelLunch(context: context),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.red,
        side: const BorderSide(color: Colors.red),
        padding: const EdgeInsets.symmetric(vertical: 14),
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: const Text(
        'Huỷ phiếu',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  /// ===== EDIT MODE =====
  Widget _buildEditActions(BuildContext context) {
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
