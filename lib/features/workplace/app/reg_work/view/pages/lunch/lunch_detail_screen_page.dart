import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
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

              FormActions(
                mode: _isEditing
                    ? FormActionMode.edit
                    : FormActionMode.view,
                onView: () =>
                    DialogService.showCancelLunch(context: context),
                onCancel: _cancelEdit,
                onSave: _save,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
