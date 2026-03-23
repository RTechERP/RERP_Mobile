import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../../common/widgets/form/index.dart';
import '../../../data/datasource/models/booking_vehicle_model.dart';

/// API `ApprovedTBP` dùng **EmployeeID**; `ID` là khóa bảng approver (hay lệch nhau).
int _approvedTbpStoredValue(ApproverItem item) => item.employeeId ?? item.id;

/// Người duyệt TBP + mô tả phát sinh (chỉ hiện khi [visible]).
/// **Đăng ký người về** không dùng card này.
class BookingVehicleProblemArisesCard extends StatelessWidget {
  const BookingVehicleProblemArisesCard({
    super.key,
    required this.approvers,
    required this.visible,
  });

  final List<ApproverItem> approvers;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      maintainState: true,
      maintainAnimation: true,
      maintainSize: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FormCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormBuilderField<String>(
                  name: 'approved_tbp',
                  initialValue: '',
                  builder: (_) => const SizedBox.shrink(),
                ),
                GestureDetector(
                  onTap: () async {
                    await openSelectBottomSheet<ApproverItem>(
                      context: context,
                      title: 'Chọn người duyệt TBP',
                      items: approvers,
                      displayText: (a) =>
                          '${a.code ?? ''} - ${a.fullName ?? ''}'.trim(),
                      onSelected: (item) {
                        final form = context.findAncestorStateOfType<
                            FormBuilderState>();
                        final line =
                            '${item.code ?? ''} - ${item.fullName ?? ''}'
                                .trim();
                        form?.fields['approved_tbp']?.didChange(
                          _approvedTbpStoredValue(item).toString(),
                        );
                        form?.fields['approved_tbp_text']?.didChange(line);
                      },
                    );
                  },
                  child: AbsorbPointer(
                    child: FormInputField(
                      icon: Icons.verified_user_outlined,
                      nameForm: 'approved_tbp_text',
                      nameTextField: 'approved_tbp_text_field',
                      label: 'Người duyệt TBP',
                      readOnly: true,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                FormInputField(
                  icon: Icons.report_problem_outlined,
                  nameForm: 'problem_arises',
                  nameTextField: 'problem_arises_text',
                  label: 'Vấn đề phát sinh',
                  maxLines: 3,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
