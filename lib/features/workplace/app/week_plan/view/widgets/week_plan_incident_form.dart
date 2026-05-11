import 'package:flutter/material.dart';

import '../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/week_plan_model.dart';

class WeekPlanIncidentForm extends StatefulWidget {
  const WeekPlanIncidentForm({
    super.key,
    required this.index,
    required this.incident,
    required this.isExpanded,
    required this.onChanged,
    required this.onDelete,
    required this.onToggleExpand,
  });

  final int index;
  final WeekPlanIncidentItem incident;
  final bool isExpanded;
  final ValueChanged<WeekPlanIncidentItem> onChanged;
  final VoidCallback onDelete;
  final VoidCallback onToggleExpand;

  @override
  State<WeekPlanIncidentForm> createState() => _WeekPlanIncidentFormState();
}

class _WeekPlanIncidentFormState extends State<WeekPlanIncidentForm> {
  late TextEditingController _descController;
  late FocusNode _descFocusNode;
  bool _isTyping = false;

  // Debounce timer to sync text to BLoC without spamming on every keystroke.
  DateTime? _lastNotifyTime;
  static const _notifyDebounceMs = Duration(milliseconds: 800);

  @override
  void initState() {
    super.initState();
    _descController = TextEditingController(text: widget.incident.description);
    _descFocusNode = FocusNode();

    _descController.addListener(_onTextChanged);
    _descFocusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(WeekPlanIncidentForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Sync description nếu BLoC cập nhật từ bên ngoài (ví dụ: clear form).
    if (oldWidget.incident.description != widget.incident.description &&
        widget.incident.description != _descController.text) {
      _descController.text = widget.incident.description ?? '';
    }
    // Khi card bị collapse: đẩy text hiện tại xuống BLoC ngay.
    if (oldWidget.isExpanded && !widget.isExpanded) {
      _notifyChange();
    }
  }

  void _onTextChanged() {
    if (!_isTyping && _descController.text.isNotEmpty) {
      setState(() => _isTyping = true);
    }
    // Sync xuống BLoC với debounce — tránh spam event khi đang gõ.
    _debouncedNotifyChange();
  }

  void _debouncedNotifyChange() {
    final now = DateTime.now();
    final last = _lastNotifyTime;
    if (last != null && now.difference(last) < _notifyDebounceMs) return;
    _lastNotifyTime = now;
    _notifyChange();
  }

  void _onFocusChanged() {
    if (!_descFocusNode.hasFocus && _isTyping) {
      setState(() => _isTyping = false);
      _notifyChange();
    }
  }

  @override
  void dispose() {
    _descController.removeListener(_onTextChanged);
    _descFocusNode.removeListener(_onFocusChanged);
    _descController.dispose();
    _descFocusNode.dispose();
    super.dispose();
  }

  void _notifyChange() {
    // Chỉ notify khi text thực sự khác với incident hiện tại trong BLoC.
    final current = widget.incident.description ?? '';
    if (_descController.text == current) return;
    widget.onChanged(WeekPlanIncidentItem(
      id: widget.incident.id,
      description: _descController.text,
      type: widget.incident.type,
      typeName: widget.incident.typeName,
      severity: widget.incident.severity,
      severityName: widget.incident.severityName,
      reportedAt: widget.incident.reportedAt,
    ));
  }

  String get _previewText {
    if (_descController.text.isEmpty) return 'Chưa có nội dung';
    if (_descController.text.length <= 60) return _descController.text;
    return '${_descController.text.substring(0, 60)}...';
  }

  @override
  Widget build(BuildContext context) {
    final hasContent = _descController.text.isNotEmpty;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: hasContent
              ? AppColors.warning.withValues(alpha: 0.35)
              : AppColors.borderColor,
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.warning.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          InkWell(
            onTap: widget.onToggleExpand,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: hasContent
                    ? AppColors.warning.withValues(alpha: 0.07)
                    : AppColors.bgCard,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.warning.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.edit_note,
                      size: 18,
                      color: AppColors.warning,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phát sinh ${widget.index + 1}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppColors.heading,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _previewText,
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.gray,
                            fontStyle: hasContent ? FontStyle.normal : FontStyle.italic,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: widget.isExpanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(Icons.chevron_right, size: 20, color: AppColors.gray),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: widget.onDelete,
                    borderRadius: BorderRadius.circular(6),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.delete_outline,
                        size: 20,
                        color: AppColors.alert.withValues(alpha: 0.8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Expanded content
          AnimatedCrossFade(
            firstChild: Padding(
              padding: const EdgeInsets.all(14),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.bgCard,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: _isTyping
                        ? AppColors.warning.withValues(alpha: 0.5)
                        : AppColors.borderColor,
                    width: _isTyping ? 1.5 : 1,
                  ),
                ),
                child: TextField(
                  controller: _descController,
                  focusNode: _descFocusNode,
                  maxLines: 4,
                  minLines: 2,
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'Nhập nội dung phát sinh...',
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: AppColors.hintText,
                      fontStyle: FontStyle.italic,
                    ),
                    prefixIcon: Icon(
                      Icons.description_outlined,
                      size: 18,
                      color: _isTyping ? AppColors.warning : AppColors.hintText,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(12),
                    counterText: _descController.text.isEmpty
                        ? ''
                        : '${_descController.text.length} ký tự',
                    counterStyle: TextStyle(fontSize: 10, color: AppColors.hintText),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ),
            secondChild: const SizedBox.shrink(),
            crossFadeState: widget.isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
