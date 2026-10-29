import 'package:flutter/material.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../data/datasource/models/lead_marketing_model.dart';
import 'lead_marketing_stage_style.dart';

/// Bottom sheet bộ lọc danh sách phiếu lead của CRM.
///
/// Ba tiêu chí chọn (Nguồn / NV Marketing / NV Sale) dùng chung bottom sheet
/// chọn có sẵn của project là [openSelectBottomSheet], nên có ô tìm kiếm và
/// tự cuộn tới lựa chọn hiện tại.
///
/// Giai đoạn được chọn bằng dải status chip kèm badge số phiếu tương ứng.
///
/// Kết quả trả về qua [onApply]; [onClear] đưa toàn bộ tiêu chí về mặc định.
class LeadMarketingFilterSheet extends StatefulWidget {
  const LeadMarketingFilterSheet({
    super.key,
    required this.sources,
    required this.marketingEmployees,
    required this.saleEmployees,
    required this.selectedSourceId,
    required this.selectedMarketingEmployeeId,
    required this.selectedSaleEmployeeId,
    required this.includeOpen,
    required this.selectedStage,
    required this.stageCounts,
    required this.onApply,
    required this.onClear,
  });

  /// Danh sách nguồn lead có thể chọn.
  final List<LeadSource> sources;

  /// Danh sách nhân viên marketing có thể chọn.
  final List<LeadEmployee> marketingEmployees;

  /// Danh sách nhân viên sale có thể chọn.
  final List<LeadEmployee> saleEmployees;

  /// ID nguồn lead đang chọn (`0` = tất cả).
  final int selectedSourceId;

  /// ID nhân viên marketing đang chọn (`0` = tất cả).
  final int selectedMarketingEmployeeId;

  /// ID nhân viên sale đang chọn (`0` = tất cả).
  final int selectedSaleEmployeeId;

  /// Trạng thái checkbox `Luôn hiện lead đang mở`.
  final bool includeOpen;

  /// Giai đoạn đang chọn (null = tất cả).
  final LeadStage? selectedStage;

  /// Số phiếu lead theo từng giai đoạn (key null = tất cả).
  final Map<LeadStage?, int> stageCounts;

  /// Trả về lựa chọn của người dùng.
  final void Function(
    int sourceId,
    int marketingEmployeeId,
    int saleEmployeeId,
    bool includeOpen,
    LeadStage? stage,
  ) onApply;

  /// Xóa toàn bộ bộ lọc.
  final VoidCallback onClear;

  @override
  State<LeadMarketingFilterSheet> createState() =>
      _LeadMarketingFilterSheetState();
}

/// Mở bottom sheet bộ lọc phiếu lead.
///
/// Đây là form filter tuỳ chỉnh (nhiều tiêu chí + checkbox) nên dùng
/// `showModalBottomSheet`; các picker 1 chọn bên trong dùng chung
/// [openSelectBottomSheet] của project.
Future<void> showLeadMarketingFilterSheet({
  required BuildContext context,
  required List<LeadSource> sources,
  required List<LeadEmployee> marketingEmployees,
  required List<LeadEmployee> saleEmployees,
  required int selectedSourceId,
  required int selectedMarketingEmployeeId,
  required int selectedSaleEmployeeId,
  required bool includeOpen,
  required LeadStage? selectedStage,
  required Map<LeadStage?, int> stageCounts,
  required void Function(
    int sourceId,
    int marketingEmployeeId,
    int saleEmployeeId,
    bool includeOpen,
    LeadStage? stage,
  ) onApply,
  required VoidCallback onClear,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => LeadMarketingFilterSheet(
      sources: sources,
      marketingEmployees: marketingEmployees,
      saleEmployees: saleEmployees,
      selectedSourceId: selectedSourceId,
      selectedMarketingEmployeeId: selectedMarketingEmployeeId,
      selectedSaleEmployeeId: selectedSaleEmployeeId,
      includeOpen: includeOpen,
      selectedStage: selectedStage,
      stageCounts: stageCounts,
      onApply: onApply,
      onClear: onClear,
    ),
  );
}

class _LeadMarketingFilterSheetState extends State<LeadMarketingFilterSheet> {
  late int _sourceId;
  late int _marketingEmployeeId;
  late int _saleEmployeeId;
  late bool _includeOpen;
  late LeadStage? _stage;

  @override
  void initState() {
    super.initState();
    _sourceId = widget.selectedSourceId;
    _marketingEmployeeId = widget.selectedMarketingEmployeeId;
    _saleEmployeeId = widget.selectedSaleEmployeeId;
    _includeOpen = widget.includeOpen;
    _stage = widget.selectedStage;
  }

  /// Tên nguồn lead đang chọn, null nghĩa là chưa chọn.
  String? get _sourceName {
    if (_sourceId == 0) return null;
    final match = widget.sources.where((s) => s.id == _sourceId);
    if (match.isEmpty) return null;
    final name = (match.first.name ?? '').trim();
    return name.isEmpty ? 'Nguồn ${match.first.id}' : name;
  }

  /// Tên nhân viên marketing đang chọn, null nghĩa là chưa chọn.
  String? get _marketingName {
    if (_marketingEmployeeId == 0) return null;
    final match =
        widget.marketingEmployees.where((e) => e.id == _marketingEmployeeId);
    if (match.isEmpty) return null;
    return _employeeLabel(match.first);
  }

  /// Tên nhân viên sale đang chọn, null nghĩa là chưa chọn.
  String? get _saleName {
    if (_saleEmployeeId == 0) return null;
    final match = widget.saleEmployees.where((e) => e.id == _saleEmployeeId);
    if (match.isEmpty) return null;
    return _employeeLabel(match.first);
  }

  /// Mở bottom sheet chọn nguồn lead.
  Future<void> _pickSource() async {
    await openSelectBottomSheet<LeadSource>(
      context: context,
      title: 'Chọn nguồn lead',
      items: widget.sources,
      displayText: (s) => (s.name ?? '').trim().isEmpty
          ? 'Nguồn ${s.id}'
          : s.name!.trim(),
      hintText: 'Tìm nguồn lead...',
      secondaryActionLabel: 'Tất cả',
      onSecondaryAction: () => setState(() => _sourceId = 0),
      initialSelectedItem: widget.sources
          .where((s) => s.id == _sourceId)
          .firstOrNull,
      onSelected: (source) => setState(() => _sourceId = source.id ?? 0),
    );
  }

  /// Mở bottom sheet chọn nhân viên marketing.
  Future<void> _pickMarketingEmployee() async {
    await openSelectBottomSheet<LeadEmployee>(
      context: context,
      title: 'Chọn NV Marketing',
      items: widget.marketingEmployees,
      displayText: _employeeLabel,
      hintText: 'Tìm NV Marketing...',
      secondaryActionLabel: 'Tất cả',
      onSecondaryAction: () => setState(() => _marketingEmployeeId = 0),
      initialSelectedItem: widget.marketingEmployees
          .where((e) => e.id == _marketingEmployeeId)
          .firstOrNull,
      onSelected: (e) => setState(() => _marketingEmployeeId = e.id ?? 0),
    );
  }

  /// Mở bottom sheet chọn nhân viên sale.
  Future<void> _pickSaleEmployee() async {
    await openSelectBottomSheet<LeadEmployee>(
      context: context,
      title: 'Chọn NV Sale',
      items: widget.saleEmployees,
      displayText: _employeeLabel,
      hintText: 'Tìm NV Sale...',
      secondaryActionLabel: 'Tất cả',
      onSecondaryAction: () => setState(() => _saleEmployeeId = 0),
      initialSelectedItem: widget.saleEmployees
          .where((e) => e.id == _saleEmployeeId)
          .firstOrNull,
      onSelected: (e) => setState(() => _saleEmployeeId = e.id ?? 0),
    );
  }

  /// Dải status chip giai đoạn, mỗi chip kèm badge số phiếu tương ứng.
  Widget _buildStageChips() {
    final stages = <LeadStage?>[null, ...LeadStage.values];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final stage in stages)
          _buildStageChip(stage, widget.stageCounts[stage] ?? 0),
      ],
    );
  }

  /// Một status chip giai đoạn kèm badge đếm số phiếu.
  Widget _buildStageChip(LeadStage? stage, int count) {
    final isSelected = _stage == stage;
    final color = _stageColor(stage);

    return GestureDetector(
      onTap: () => setState(() => _stage = stage),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? color : color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? color : color.withValues(alpha: 0.20),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[
              const Icon(
                Icons.check_circle,
                size: 13,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
            ],
            Text(
              stage?.label ?? 'Tất cả',
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                color: isSelected ? Colors.white : color,
                height: 1.2,
              ),
            ),
            const SizedBox(width: 6),
            // Badge số phiếu tương ứng với giai đoạn.
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withValues(alpha: 0.25)
                    : color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w800,
                  color: isSelected ? Colors.white : color,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Màu nhấn mạnh theo từng giai đoạn.
  ///
  /// Dùng chung [LeadStageStyle] với card danh sách nên chip giai đoạn
  /// trong filter và ngoài màn luôn cùng màu.
  Color _stageColor(LeadStage? stage) => LeadStageStyle.of(stage);

  @override
  Widget build(BuildContext context) {
    final hasFilter = _sourceId != 0 ||
        _marketingEmployeeId != 0 ||
        _saleEmployeeId != 0 ||
        _stage != null ||
        !_includeOpen;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Container(
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.gray.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 14),

            // ===== HEADER =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryERP.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.tune_rounded,
                      size: 20,
                      color: AppColors.primaryERP,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bộ lọc',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: AppColors.enableText,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Chọn tiêu chí để thu hẹp kết quả',
                          style: TextStyle(
                            fontSize: 11.5,
                            color: AppColors.gray,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (hasFilter)
                    GestureDetector(
                      onTap: _resetAll,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.alert.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.refresh,
                              size: 13,
                              color: AppColors.alert,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Đặt lại',
                              style: TextStyle(
                                fontSize: 11.5,
                                color: AppColors.alert,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ===== BODY =====
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _SectionLabel(
                      icon: Icons.flag_outlined,
                      label: 'Giai đoạn',
                    ),
                    const SizedBox(height: 8),
                    _buildStageChips(),
                    const SizedBox(height: 18),

                    const _SectionLabel(
                      icon: Icons.campaign_outlined,
                      label: 'Nguồn',
                    ),
                    const SizedBox(height: 8),
                    _FilterField(
                      icon: Icons.campaign_outlined,
                      placeholder: 'Chọn nguồn',
                      value: _sourceName,
                      onTap: _pickSource,
                    ),
                    const SizedBox(height: 14),

                    const _SectionLabel(
                      icon: Icons.support_agent_outlined,
                      label: 'NV Marketing',
                    ),
                    const SizedBox(height: 8),
                    _FilterField(
                      icon: Icons.support_agent_outlined,
                      placeholder: 'Chọn NV Marketing',
                      value: _marketingName,
                      onTap: _pickMarketingEmployee,
                    ),
                    const SizedBox(height: 14),

                    const _SectionLabel(
                      icon: Icons.handshake_outlined,
                      label: 'NV Sale',
                    ),
                    const SizedBox(height: 8),
                    _FilterField(
                      icon: Icons.handshake_outlined,
                      placeholder: 'Chọn NV Sale',
                      value: _saleName,
                      onTap: _pickSaleEmployee,
                    ),
                    const SizedBox(height: 16),

                    // Checkbox luôn hiện lead đang mở
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.all_inclusive_rounded,
                            size: 18,
                            color: AppColors.secondaryERP,
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text(
                              'Luôn hiện lead đang mở',
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w600,
                                color: AppColors.enableText,
                              ),
                            ),
                          ),
                          Checkbox(
                            value: _includeOpen,
                            activeColor: AppColors.primaryERP,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            onChanged: (value) =>
                                setState(() => _includeOpen = value ?? false),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // ===== FOOTER =====
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: AppColors.borderColor,
                    width: 0.6,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppColors.borderColor,
                          width: 1.2,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _resetAll,
                      child: const Text(
                        'Đặt lại',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.enableText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryERP,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        widget.onApply(
                          _sourceId,
                          _marketingEmployeeId,
                          _saleEmployeeId,
                          _includeOpen,
                          _stage,
                        );
                        Navigator.of(context).pop();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check, size: 18),
                          SizedBox(width: 6),
                          Text(
                            'Áp dụng',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Đặt lại toàn bộ tiêu chí về mặc định.
  void _resetAll() {
    setState(() {
      _sourceId = 0;
      _marketingEmployeeId = 0;
      _saleEmployeeId = 0;
      _includeOpen = true;
      _stage = null;
    });
    widget.onClear();
    Navigator.of(context).pop();
  }
}

/// Nhãn nhóm tiêu chí lọc.
class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15, color: AppColors.secondaryERP),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w700,
            color: AppColors.heading,
          ),
        ),
      ],
    );
  }
}

/// Một dòng lọc: icon + placeholder / giá trị đã chọn, chạm để mở picker.
class _FilterField extends StatelessWidget {
  const _FilterField({
    required this.icon,
    required this.placeholder,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final String placeholder;
  final String? value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hasValue = value != null && value!.isNotEmpty;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: hasValue
                ? AppColors.primaryERP.withValues(alpha: 0.08)
                : AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: hasValue
                  ? AppColors.primaryERP.withValues(alpha: 0.4)
                  : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: hasValue ? AppColors.primaryERP : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 16,
                  color: hasValue ? Colors.white : AppColors.gray,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  hasValue ? value! : placeholder,
                  style: TextStyle(
                    fontSize: 13.5,
                    color: hasValue
                        ? AppColors.enableText
                        : AppColors.gray,
                    fontWeight:
                        hasValue ? FontWeight.w600 : FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (hasValue)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Icon(
                    Icons.edit_outlined,
                    size: 16,
                    color: AppColors.primaryERP.withValues(alpha: 0.7),
                  ),
                )
              else
                const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.gray,
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Định dạng hiển thị nhân viên trong picker: `Code - FullName`.
String _employeeLabel(LeadEmployee e) {
  final code = (e.code ?? '').trim();
  final name = (e.fullName ?? '').trim();
  if (code.isEmpty && name.isEmpty) return '—';
  if (code.isEmpty) return name;
  if (name.isEmpty) return code;
  return '$code - $name';
}
