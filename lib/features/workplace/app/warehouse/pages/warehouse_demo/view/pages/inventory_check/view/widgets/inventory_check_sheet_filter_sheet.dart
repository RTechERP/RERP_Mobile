import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/helpers/index.dart';
import 'package:rtc_erp/common/widgets/form/form_choice_group.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/bloc/inventory_check_bloc.dart';

/// Bottom sheet bộ lọc danh sách sản phẩm của phiếu kiểm kê.
///
/// Gồm: choice group chọn trạng thái kiểm kê (Tất cả / Đã kiểm / Chưa kiểm /
/// Chênh lệch) và ô chọn nhóm sản phẩm (hãng). Tìm kiếm đã chuyển lên icon
/// tìm kiếm trên AppBar nên không có ở đây.
class InventoryCheckSheetFilterSheet extends StatefulWidget {
  const InventoryCheckSheetFilterSheet({
    super.key,
    required this.initialFilter,
    required this.productGroups,
    required this.initialProductGroupId,
    required this.onApply,
  });

  /// Bộ lọc trạng thái đang được áp dụng.
  final InventoryCheckSheetFilter initialFilter;

  /// Danh sách nhóm sản phẩm (hãng) để chọn.
  final List<InventoryProductGroupRtc> productGroups;

  /// Id nhóm sản phẩm đang được chọn (null = không lọc theo nhóm).
  final int? initialProductGroupId;

  /// Áp dụng bộ lọc. [filter] null = không lọc trạng thái (hiển thị tất cả),
  /// [productGroupId] null = không lọc theo nhóm sản phẩm.
  final void Function({
    required InventoryCheckSheetFilter? filter,
    required int? productGroupId,
  })
  onApply;

  /// Mở sheet bộ lọc.
  static Future<void> show(
    BuildContext context, {
    required InventoryCheckSheetFilter initialFilter,
    required List<InventoryProductGroupRtc> productGroups,
    required int? initialProductGroupId,
    required void Function({
      required InventoryCheckSheetFilter? filter,
      required int? productGroupId,
    })
    onApply,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => InventoryCheckSheetFilterSheet(
        initialFilter: initialFilter,
        productGroups: productGroups,
        initialProductGroupId: initialProductGroupId,
        onApply: onApply,
      ),
    );
  }

  @override
  State<InventoryCheckSheetFilterSheet> createState() =>
      _InventoryCheckSheetFilterSheetState();
}

class _InventoryCheckSheetFilterSheetState
    extends State<InventoryCheckSheetFilterSheet> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  late InventoryCheckSheetFilter _filter;
  late int? _productGroupId;

  @override
  void initState() {
    super.initState();
    _filter = widget.initialFilter;
    _productGroupId = widget.initialProductGroupId;
  }

  /// Áp dụng bộ lọc và đóng sheet.
  void _apply() {
    widget.onApply(
      filter: _filter == InventoryCheckSheetFilter.all ? null : _filter,
      productGroupId: _productGroupId,
    );
    context.pop();
  }

  /// Mở sheet chọn nhóm sản phẩm (hãng) bằng `openSelectBottomSheet`.
  Future<void> _pickProductGroup() async {
    final groups = widget.productGroups;
    if (groups.isEmpty) return;

    InventoryProductGroupRtc? selected;
    for (final group in groups) {
      if (group.id == _productGroupId) {
        selected = group;
        break;
      }
    }

    await openSelectBottomSheet<InventoryProductGroupRtc>(
      context: context,
      title: 'Chọn nhóm sản phẩm',
      items: groups,
      hintText: 'Tìm theo mã hoặc tên nhóm...',
      displayText: (item) =>
          '${item.groupNo ?? ''} - ${item.groupName ?? ''}'.trim(),
      initialSelectedItem: selected,
      onSelected: (item) => setState(() => _productGroupId = item.id),
    );
  }

  /// Nhãn nhóm sản phẩm đang chọn.
  String _productGroupLabel() {
    final id = _productGroupId;
    if (id == null) return 'Tất cả nhóm sản phẩm';
    for (final group in widget.productGroups) {
      if (group.id == id) {
        final no = (group.groupNo ?? '').trim();
        final name = (group.groupName ?? '').trim();
        if (no.isEmpty) return name.isEmpty ? '--' : name;
        if (name.isEmpty) return no;
        return '$no - $name';
      }
    }
    return 'Tất cả nhóm sản phẩm';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.line,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Bộ lọc sản phẩm kiểm kê',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
              ),
            ),
            Flexible(
              child: FormBuilder(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  children: [
                    /// ===== NHÓM SẢN PHẨM (HÃNG) =====
                    const Text(
                      'Nhóm sản phẩm',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.heading,
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: _pickProductGroup,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.borderColor),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.category_outlined,
                              size: 18,
                              color: AppColors.gray,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _productGroupLabel(),
                                style: const TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.enableText,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              size: 18,
                              color: AppColors.gray,
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),

                    /// ===== TRẠNG THÁI KIỂM KÊ =====
                    FormChoiceGroup<InventoryCheckSheetFilter>(
                      name: 'inventory_check_sheet_filter',
                      label: 'Trạng thái kiểm kê',
                      icon: Icons.filter_alt_outlined,
                      initialValue: _filter,
                      columns: 2,
                      options: const [
                        FormChoiceOption(
                          value: InventoryCheckSheetFilter.all,
                          label: 'Tất cả',
                          selectedColor: AppColors.primaryERP,
                        ),
                        FormChoiceOption(
                          value: InventoryCheckSheetFilter.counted,
                          label: 'Đã kiểm',
                          selectedColor: AppColors.primaryERP,
                        ),
                        FormChoiceOption(
                          value: InventoryCheckSheetFilter.notCounted,
                          label: 'Chưa kiểm',
                          selectedColor: AppColors.primaryERP,
                        ),
                        FormChoiceOption(
                          value: InventoryCheckSheetFilter.difference,
                          label: 'Chênh lệch',
                          selectedColor: AppColors.primaryERP,
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _filter = value);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        widget.onApply(filter: null, productGroupId: null);
                        context.pop();
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primaryERP,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: AppColors.primaryERP),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Xóa lọc',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _apply,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryERP,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Áp dụng',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
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
}
