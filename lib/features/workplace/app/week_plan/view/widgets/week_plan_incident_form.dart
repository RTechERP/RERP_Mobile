import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/week_plan_model.dart';

class _SeverityLevel {
  const _SeverityLevel(this.id, this.name, this.color);
  final int id;
  final String name;
  final Color color;
}

/// Widget form cho một sự kiện phát sinh.
class WeekPlanIncidentForm extends StatefulWidget {
  const WeekPlanIncidentForm({
    super.key,
    required this.index,
    required this.incident,
    required this.onChanged,
    required this.onDelete,
  });

  final int index;
  final WeekPlanIncidentItem incident;
  final ValueChanged<WeekPlanIncidentItem> onChanged;
  final VoidCallback onDelete;

  @override
  State<WeekPlanIncidentForm> createState() => _WeekPlanIncidentFormState();
}

class _WeekPlanIncidentFormState extends State<WeekPlanIncidentForm> {
  late TextEditingController _descController;
  bool _isExpanded = true;

  int? _typeId;
  String? _typeName;
  int? _severityId;
  String? _severityName;

  static const _severityLevels = [
    _SeverityLevel(1, 'Thấp', Color(0xFF33B469)),
    _SeverityLevel(2, 'Trung bình', Color(0xFFEBBC2E)),
    _SeverityLevel(3, 'Cao', Color(0xFFFF9F43)),
    _SeverityLevel(4, 'Nghiêm trọng', Color(0xFFED3A3A)),
  ];

  @override
  void initState() {
    super.initState();
    _descController = TextEditingController(text: widget.incident.description);
    _typeId = widget.incident.type;
    _typeName = widget.incident.typeName;
    _severityId = widget.incident.severity;
    _severityName = widget.incident.severityName;
  }

  void _notifyChange() {
    widget.onChanged(WeekPlanIncidentItem(
      id: widget.incident.id,
      description: _descController.text,
      type: _typeId,
      typeName: _typeName,
      severity: _severityId,
      severityName: _severityName,
      reportedAt: widget.incident.reportedAt,
    ));
  }
  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

  Color get _severityColor {
    for (final s in _severityLevels) {
      if (s.id == _severityId) return s.color;
    }
    return AppColors.hintText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: _severityId != null
                    ? _severityColor.withValues(alpha: 0.1)
                    : AppColors.warning.withValues(alpha: 0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  AnimatedRotation(
                    turns: _isExpanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(Icons.chevron_right, size: 20, color: _severityColor),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.warning_amber_outlined, size: 16, color: _severityColor),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Phát sinh ${widget.index + 1}',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: _severityColor),
                    ),
                  ),
                  if (_severityId != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: _severityColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        _severityName ?? '',
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: _severityColor),
                      ),
                    ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: widget.onDelete,
                    icon: Icon(Icons.delete_outline, size: 20, color: AppColors.alert),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                    tooltip: 'Xoá phát sinh',
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: Padding(
              padding: const EdgeInsets.all(12),
              child: FormInputField(
                nameForm: 'incident_desc_${widget.index}',
                nameTextField: 'incident_desc_field_${widget.index}',
                label: 'Mô tả',
                icon: Icons.description_outlined,
                controller: _descController,
                onChanged: (_) => _notifyChange(),
                autoExpand: true,
              ),
            ),
            secondChild: const SizedBox.shrink(),
            crossFadeState: _isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}