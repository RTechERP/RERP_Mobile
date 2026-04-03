import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/extensions/number_extension.dart';
import '../../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../data/datasource/models/work_trip_model.dart';
import 'work_trip_add_constants.dart';

/// Standalone function – gọi qua [DialogService.showVehicle].
Future<List<WorkTripVehicleEntry>?> showWorkTripVehicleDialog({
  required BuildContext context,
  required List<WorkTripTypeVehicle> vehicleTypes,
  List<WorkTripVehicleEntry> initialEntries = const [],
}) {
  return showDialog<List<WorkTripVehicleEntry>>(
    context: context,
    builder: (_) => _WorkTripVehicleDialog(
      vehicleTypes: vehicleTypes,
      initialEntries: initialEntries,
    ),
  );
}

// ─────────────────────────────────────────────────────────────────────────────

class _WorkTripVehicleDialog extends StatefulWidget {
  const _WorkTripVehicleDialog({
    required this.vehicleTypes,
    required this.initialEntries,
  });

  final List<WorkTripTypeVehicle> vehicleTypes;
  final List<WorkTripVehicleEntry> initialEntries;

  @override
  State<_WorkTripVehicleDialog> createState() =>
      _WorkTripVehicleDialogState();
}

class _WorkTripVehicleDialogState extends State<_WorkTripVehicleDialog> {
  late final List<_VehicleRow> _rows;
  String? _errorMessage;
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    _rows = widget.initialEntries
        .map((e) => _VehicleRow.fromEntry(e))
        .toList();
    if (_rows.isEmpty) _rows.add(_VehicleRow());
  }

  void _addRow() {
    setState(() {
      _errorMessage = null;
      _rows.add(_VehicleRow());
    });
  }

  void _removeRow(int index) {
    if (_rows.length <= 1) return;
    setState(() {
      _errorMessage = null;
      _rows.removeAt(index);
    });
  }

  Future<void> _pickVehicleType(int rowIndex) async {
    if (widget.vehicleTypes.isEmpty) return;
    await openSelectBottomSheet<WorkTripTypeVehicle>(
      context: context,
      title: 'Chọn phương tiện',
      items: widget.vehicleTypes.where((e) => e.isDeleted != true).toList(),
      displayText: (v) => v.vehicleName ?? '',
      onSelected: (v) {
        setState(() {
          _errorMessage = null;
          _rows[rowIndex] = _rows[rowIndex].copyWith(
            vehicleTypeId: v.id,
            vehicleName: v.vehicleName ?? '',
            cost: v.cost ?? 0,
            editCost: v.editCost ?? false,
            // reset customName khi đổi loại
            customName: '',
          );
        });
      },
    );
  }

  void _onNoteChanged(int index, String value) {
    _rows[index].noteController.text = value;
  }

  void _onCustomNameChanged(int index, String value) {
    // Đột biến trực tiếp – không tạo row mới để tránh đổi controller
    _rows[index].customName = value;
    // Rebuild nhỏ để cập nhật border/errorText sau khi đã bấm Lưu
    if (_submitted) setState(() {});
  }

  bool _validate() {
    setState(() => _submitted = true);
    for (var i = 0; i < _rows.length; i++) {
      final row = _rows[i];
      if (row.vehicleTypeId == null) continue;
      if (row.isCustom && row.customNameController.text.trim().isEmpty) {
        setState(() {
          _errorMessage =
              'Vui lòng nhập tên phương tiện cho mục ${i + 1}';
        });
        return false;
      }
    }
    setState(() => _errorMessage = null);
    return true;
  }

  void _onSave() {
    if (!_validate()) return;

    final entries = _rows
        .where((r) => r.vehicleTypeId != null)
        .map((r) => WorkTripVehicleEntry(
              vehicleTypeId: r.vehicleTypeId!,
              vehicleName: r.vehicleName,
              cost: r.cost,
              editCost: r.editCost,
              note: r.noteController.text.trim(),
              customName: r.customNameController.text.trim(),
            ))
        .toList();
    Navigator.of(context).pop(entries);
  }

  @override
  void dispose() {
    for (final row in _rows) {
      row.noteController.dispose();
      row.customNameController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Header ──────────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
            child: Row(
              children: [
                const Icon(Icons.directions_car_outlined, size: 20),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Phương tiện di chuyển',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(null),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // ── Vehicle rows ─────────────────────────────────────────────────
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.50,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                children: [
                  for (var i = 0; i < _rows.length; i++)
                    _VehicleRowWidget(
                      key: ValueKey(_rows[i].id),
                      row: _rows[i],
                      index: i,
                      canRemove: _rows.length > 1,
                      submitted: _submitted,
                      onPickVehicle: () => _pickVehicleType(i),
                      onRemove: () => _removeRow(i),
                      onNoteChanged: (v) => _onNoteChanged(i, v),
                      onCustomNameChanged: (v) => _onCustomNameChanged(i, v),
                    ),

                  // ── Error message ────────────────────────────────────────
                  if (_errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: Row(
                        children: [
                          const Icon(Icons.error_outline,
                              size: 16, color: Colors.red),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              _errorMessage!,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),

          // ── Add row button ───────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: _addRow,
                icon: const Icon(Icons.add_circle_outline, size: 18),
                label: const Text('Thêm phương tiện'),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primaryERP,
                ),
              ),
            ),
          ),

          const Divider(height: 1),

          // ── Actions ──────────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(null),
                    child: const Text('Huỷ'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: _onSave,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primaryERP,
                    ),
                    child: const Text('Lưu'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _VehicleRow {
  _VehicleRow({
    String? id,
    this.vehicleTypeId,
    this.vehicleName = '',
    this.cost = 0,
    this.editCost = false,
    String? note,
    String? customName,
  })  : id = id ?? DateTime.now().microsecondsSinceEpoch.toString(),
        noteController = TextEditingController(text: note ?? ''),
        customNameController =
            TextEditingController(text: customName ?? ''),
        customName = customName ?? '';

  factory _VehicleRow.fromEntry(WorkTripVehicleEntry e) => _VehicleRow(
        vehicleTypeId: e.vehicleTypeId,
        vehicleName: e.vehicleName,
        cost: e.cost,
        editCost: e.editCost,
        note: e.note,
        customName: e.customName,
      );

  final String id;
  int? vehicleTypeId;
  String vehicleName;
  double cost;
  bool editCost;
  String customName;
  final TextEditingController noteController;
  final TextEditingController customNameController;

  bool get isCustom =>
      vehicleName.toLowerCase().contains('khác') ||
      vehicleName.toLowerCase().contains('khac') ||
      vehicleName.toLowerCase().contains('other');

  _VehicleRow copyWith({
    int? vehicleTypeId,
    String? vehicleName,
    double? cost,
    bool? editCost,
    String? note,
    String? customName,
  }) {
    final row = _VehicleRow(
      id: id,
      vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
      vehicleName: vehicleName ?? this.vehicleName,
      cost: cost ?? this.cost,
      editCost: editCost ?? this.editCost,
      note: note ?? noteController.text,
      customName: customName ?? this.customName,
    );
    return row;
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _VehicleRowWidget extends StatelessWidget {
  const _VehicleRowWidget({
    super.key,
    required this.row,
    required this.index,
    required this.canRemove,
    required this.submitted,
    required this.onPickVehicle,
    required this.onRemove,
    required this.onNoteChanged,
    required this.onCustomNameChanged,
  });

  final _VehicleRow row;
  final int index;
  final bool canRemove;
  final bool submitted;
  final VoidCallback onPickVehicle;
  final VoidCallback onRemove;
  final ValueChanged<String> onNoteChanged;
  final ValueChanged<String> onCustomNameChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Row header ──────────────────────────────────────────────────
          Row(
            children: [
              Text(
                'Phương tiện ${index + 1}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              const Spacer(),
              if (canRemove)
                GestureDetector(
                  onTap: onRemove,
                  child: const Icon(
                    Icons.close,
                    size: 18,
                    color: Colors.redAccent,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),

          // ── Vehicle type picker ─────────────────────────────────────────
          GestureDetector(
            onTap: onPickVehicle,
            child: _InputDisplay(
              icon: Icons.directions_car_outlined,
              label: 'Phương tiện',
              value: row.vehicleName.isEmpty ? null : row.vehicleName,
              hint: 'Chọn phương tiện',
              showArrow: true,
            ),
          ),

          // ── Custom name (chỉ hiện khi chọn "Phương tiện khác") ──────────
          if (row.isCustom) ...[
            const SizedBox(height: 8),
            TextFormField(
              controller: row.customNameController,
              onChanged: onCustomNameChanged,
              maxLines: 1,
              inputFormatters: [LengthLimitingTextInputFormatter(100)],
              decoration: InputDecoration(
                labelText: 'Tên phương tiện *',
                hintText: 'Nhập tên phương tiện',
                prefixIcon:
                    const Icon(Icons.drive_eta_outlined, size: 20),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: submitted &&
                            row.customNameController.text.trim().isEmpty
                        ? Colors.red.shade300
                        : Colors.grey.shade300,
                  ),
                ),
                errorText: submitted &&
                        row.customNameController.text.trim().isEmpty
                    ? 'Vui lòng nhập tên phương tiện'
                    : null,
              ),
            ),
          ],
          const SizedBox(height: 8),

          // ── Cost (readonly) ─────────────────────────────────────────────
          _InputDisplay(
            icon: Icons.payments_outlined,
            label: 'Chi phí',
            value: row.cost > 0 ? '${row.cost.toInt().formatVND} đ' : '0 đ',
            isReadonly: true,
          ),
          const SizedBox(height: 8),

          // ── Note ────────────────────────────────────────────────────────
          TextFormField(
            controller: row.noteController,
            onChanged: onNoteChanged,
            maxLines: 2,
            inputFormatters: [LengthLimitingTextInputFormatter(200)],
            decoration: InputDecoration(
              labelText: 'Ghi chú',
              prefixIcon: const Icon(Icons.note_alt_outlined, size: 20),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _InputDisplay extends StatelessWidget {
  const _InputDisplay({
    required this.icon,
    required this.label,
    this.value,
    this.hint,
    this.isReadonly = false,
    this.showArrow = false,
  });

  final IconData icon;
  final String label;
  final String? value;
  final String? hint;
  final bool isReadonly;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: isReadonly ? Colors.grey.shade100 : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  value ?? hint ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    color: value != null ? Colors.black87 : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          if (showArrow)
            Icon(Icons.keyboard_arrow_down,
                color: Colors.grey.shade500, size: 20),
        ],
      ),
    );
  }
}
