// Bottom-sheet bộ lọc: từ khoá + Sản phẩm (mã/tên) + Trạng thái
// duyệt + Dự án + Nhà cung cấp.
// Danh sách gợi ý cho Dự án / Nhà cung cấp chỉ gồm các giá trị có
// thật trong `items` của tab đang chọn — tức đã nằm trong khoảng
// thời gian đang lọc.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/approve_purchasing_model.dart';
import '../bloc/approve_purchasing_bloc.dart';
import 'filter_field.dart';
import 'filter_section_label.dart';
import 'picker_sheet.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  late final TextEditingController _searchCtl;

  @override
  void initState() {
    super.initState();
    _searchCtl = TextEditingController(
      text: context.read<ApprovePurchasingBloc>().state.filter.searchKeyword,
    );
  }

  @override
  void dispose() {
    _searchCtl.dispose();
    super.dispose();
  }

  void _resetAll() {
    _searchCtl.clear();
    context.read<ApprovePurchasingBloc>().add(
      const ApprovePurchasingEvent.resetFilter(),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApprovePurchasingBloc, ApprovePurchasingState>(
      builder: (context, state) {
        final f = state.filter;

        // Chỉ gợi ý dự án / NCC thực sự xuất hiện trong `items` của tab
        // đang chọn (items đã được giới hạn theo khoảng ngày đang lọc).
        // Dựng map id → object để tra nhanh label của giá trị đang chọn
        // (giá trị có thể đã bị loại khỏi danh sách gợi ý sau khi
        // đổi khoảng ngày).
        final items = state.items;
        final projectById = <int, ProjectFilterItem>{};
        for (final it in items) {
          final pid = it.projectId;
          if (pid != null) {
            projectById.putIfAbsent(
              pid,
              () => ProjectFilterItem(
                id: pid,
                projectCode: it.projectCode,
                projectName: it.projectName,
              ),
            );
          }
        }
        final projects = state.projects
            .where((p) => p.id != null && projectById.containsKey(p.id))
            .toList();

        // Item không mang mã/tên NCC — chỉ có `supplierSaleId`. Vì vậy
        // danh sách gợi ý lấy từ API rồi lọc theo tập id thực sự có
        // trong `items` của khoảng thời gian đang lọc.
        final supplierIdsInItems = <int>{};
        for (final it in items) {
          final sid = it.supplierSaleId;
          if (sid != null) supplierIdsInItems.add(sid);
        }
        final suppliers = state.suppliers
            .where((s) => s.id != null && supplierIdsInItems.contains(s.id))
            .toList();

        // Label dự án — tra trong map trước (giữ label kể cả khi dự án
        // đã lọc ra khỏi gợi ý sau khi đổi khoảng ngày), fallback sang
        // list gợi ý.
        String? projectLabel;
        if (f.selectedProjectId != null) {
          ProjectFilterItem? p = projectById[f.selectedProjectId];
          p ??= projects.firstWhere(
            (e) => e.id == f.selectedProjectId,
            orElse: () => _emptyProject,
          );
          if (p != _emptyProject) {
            projectLabel = _projectDisplayLabel(p);
          }
        }

        // Label NCC — tra trong list API rồi map theo id.
        String? supplierLabel;
        if (f.selectedSupplierId != null) {
          final s = suppliers.firstWhere(
            (e) => e.id == f.selectedSupplierId,
            orElse: () => _emptySupplier,
          );
          if (s != _emptySupplier) {
            supplierLabel = _supplierDisplayLabel(s);
          }
        }

        return SafeArea(
          top: false,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ════════ HEADER ════════
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
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
                    ],
                  ),
                ),

                // ════════ DIVIDER ════════
                Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 4),
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                    ),
                  ),
                ),

                // ════════ BODY ════════
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ─── Từ khoá tìm kiếm ───
                        const FilterSectionLabel(
                          icon: Icons.search,
                          label: 'Từ khoá tìm kiếm',
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _searchCtl,
                          decoration: InputDecoration(
                            hintText: 'Mã SP, tên SP, ghi chú...',
                            hintStyle: const TextStyle(
                              color: AppColors.gray,
                              fontSize: 13,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 18,
                              color: AppColors.gray,
                            ),
                            suffixIcon: _searchCtl.text.isEmpty
                                ? null
                                : IconButton(
                                    icon: const Icon(
                                      Icons.cancel,
                                      size: 18,
                                      color: AppColors.gray,
                                    ),
                                    onPressed: () {
                                      _searchCtl.clear();
                                      context
                                          .read<ApprovePurchasingBloc>()
                                          .add(
                                            const ApprovePurchasingEvent
                                                .changeSearchKeyword(
                                                    keyword: ''),
                                          );
                                      setState(() {});
                                    },
                                  ),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            filled: true,
                            fillColor: AppColors.background,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (v) {
                            context.read<ApprovePurchasingBloc>().add(
                                  ApprovePurchasingEvent.changeSearchKeyword(
                                      keyword: v),
                                );
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 18),

                        // ─── Sản phẩm (gộp mã + tên) ───
                        const FilterSectionLabel(
                          icon: Icons.inventory_2_outlined,
                          label: 'Sản phẩm',
                        ),
                        const SizedBox(height: 8),
                        FilterField(
                          icon: Icons.inventory_2_outlined,
                          placeholder: 'Chọn sản phẩm (mã hoặc tên)',
                          value: _productDisplayLabel(f.selectedProduct),
                          onClear: () {
                            context.read<ApprovePurchasingBloc>().add(
                                  const ApprovePurchasingEvent.selectProduct(
                                    product: '',
                                  ),
                                );
                            setState(() {});
                          },
                          onTap: () {
                            // Dựng danh sách gợi ý gộp `code - name`,
                            // bỏ trùng theo cặp (code, name) và bỏ rỗng.
                            final seen = <String>{};
                            final products = <_ProductOption>[];
                            for (final it in items) {
                              final code = (it.productCode ?? '').trim();
                              final name = (it.productName ?? '').trim();
                              if (code.isEmpty && name.isEmpty) continue;
                              // Khoá hiển thị + khoá nội bộ (ghép `|`) để
                              // bloc filter khớp chính xác code/name item.
                              final pair = code.isEmpty
                                  ? name
                                  : (name.isEmpty ? code : '$code - $name');
                              final key =
                                  '$code|$name'; // dedupe theo cặp gốc
                              if (seen.add(key)) {
                                products.add(_ProductOption(
                                  code: code,
                                  name: name,
                                  display: pair,
                                ));
                              }
                            }
                            if (products.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Chưa có dữ liệu sản phẩm',
                                  ),
                                ),
                              );
                              return;
                            }
                            final currentFilter =
                                context
                                    .read<ApprovePurchasingBloc>()
                                    .state
                                    .filter
                                    .selectedProduct;
                            showPickerBottomSheet<_ProductOption>(
                              context: context,
                              title: 'Chọn sản phẩm',
                              items: products,
                              label: (p) => p.display,
                              onSelected: (opt) {
                                // Lưu `code|name` để bloc filter tách
                                // từng khoá và khớp linh hoạt.
                                final next = opt.key == currentFilter
                                    ? ''
                                    : opt.key;
                                context.read<ApprovePurchasingBloc>().add(
                                      ApprovePurchasingEvent.selectProduct(
                                        product: next,
                                      ),
                                    );
                                setState(() {});
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 14),

                        // ─── Trạng thái duyệt BGĐ (3 nút: Tất cả / Chưa / Đã) ───
                        const FilterSectionLabel(
                          icon: Icons.verified_outlined,
                          label: 'Trạng thái duyệt',
                        ),
                        const SizedBox(height: 8),
                        _ApprovalSegment(
                          value: f.approvalFilter,
                          onChanged: (next) {
                            context.read<ApprovePurchasingBloc>().add(
                                  ApprovePurchasingEvent.selectApprovalFilter(
                                    filter: next,
                                  ),
                                );
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 18),

                        // ─── Dự án ───
                        const FilterSectionLabel(
                          icon: Icons.folder_outlined,
                          label: 'Dự án',
                        ),
                        const SizedBox(height: 8),
                        FilterField(
                          icon: Icons.folder_outlined,
                          placeholder: 'Chọn dự án',
                          value: projectLabel,
                          onClear: () {
                            context.read<ApprovePurchasingBloc>().add(
                                  const ApprovePurchasingEvent.selectProject(
                                    projectId: null,
                                  ),
                                );
                            setState(() {});
                          },
                          onTap: () {
                            showPickerBottomSheet<ProjectFilterItem>(
                              context: context,
                              title: 'Chọn dự án',
                              items: projects,
                              label: _projectDisplayLabel,
                              onSelected: (project) {
                                final newId = project.id == f.selectedProjectId
                                    ? null
                                    : project.id;
                                context.read<ApprovePurchasingBloc>().add(
                                      ApprovePurchasingEvent.selectProject(
                                        projectId: newId,
                                      ),
                                    );
                                setState(() {});
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 14),

                        // ─── Nhà cung cấp ───
                        const FilterSectionLabel(
                          icon: Icons.store_outlined,
                          label: 'Nhà cung cấp',
                        ),
                        const SizedBox(height: 8),
                        FilterField(
                          icon: Icons.store_outlined,
                          placeholder: 'Chọn nhà cung cấp',
                          value: supplierLabel,
                          onClear: () {
                            context.read<ApprovePurchasingBloc>().add(
                                  const ApprovePurchasingEvent.selectSupplier(
                                    supplierId: null,
                                  ),
                                );
                            setState(() {});
                          },
                          onTap: () {
                            showPickerBottomSheet<SupplierItem>(
                              context: context,
                              title: 'Chọn nhà cung cấp',
                              items: suppliers,
                              label: _supplierDisplayLabel,
                              onSelected: (supplier) {
                                final newId = supplier.id == f.selectedSupplierId
                                    ? null
                                    : supplier.id;
                                context.read<ApprovePurchasingBloc>().add(
                                      ApprovePurchasingEvent.selectSupplier(
                                        supplierId: newId,
                                      ),
                                    );
                                setState(() {});
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // ════════ FOOTER ════════
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                  child: Row(
                    children: [
                      // Nút Đặt lại.
                      SizedBox(
                        width: 110,
                        height: 46,
                        child: OutlinedButton(
                          onPressed: _resetAll,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.alert,
                            side: BorderSide(
                              color: AppColors.alert.withValues(alpha: 0.4),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Đặt lại',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Nút Áp dụng.
                      Expanded(
                        child: SizedBox(
                          height: 46,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<ApprovePurchasingBloc>().add(
                                    ApprovePurchasingEvent.changeSearchKeyword(
                                      keyword: _searchCtl.text.trim(),
                                    ),
                                  );
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryERP,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Áp dụng',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
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
      },
    );
  }
}

/// Sentinel rỗng dùng với `firstWhere(..., orElse:)` để biết khi nào
/// không tìm thấy. `firstWhere` vẫn build bản rỗng nhưng reference so
/// sánh nhanh và không tốn thêm import.
final ProjectFilterItem _emptyProject = ProjectFilterItem(id: -1);
final SupplierItem _emptySupplier = SupplierItem(id: -1);

/// Label hiển thị của 1 dự án: `code - name`, thiếu bên nào thì lấy
/// bên còn lại.
String _projectDisplayLabel(ProjectFilterItem p) {
  final code = (p.projectCode ?? '').trim();
  final name = (p.projectName ?? '').trim();
  if (code.isEmpty) return name.isEmpty ? 'N/A' : name;
  if (name.isEmpty) return code;
  return '$code - $name';
}

/// Label hiển thị của 1 nhà cung cấp: `code - name`, thiếu bên nào thì
/// lấy bên còn lại.
String _supplierDisplayLabel(SupplierItem s) {
  final code = (s.codeNcc ?? '').trim();
  final name = (s.nameNcc ?? '').trim();
  if (code.isEmpty) return name.isEmpty ? 'N/A' : name;
  if (name.isEmpty) return code;
  return '$code - $name';
}

/// Chuyển khoá nội bộ `code|name` sang dạng hiển thị `code - name`.
/// Nếu 1 bên rỗng, hiển thị bên còn lại.
String? _productDisplayLabel(String raw) {
  if (raw.isEmpty) return null;
  final parts = raw.split('|');
  final code = parts.isNotEmpty ? parts[0].trim() : '';
  final name = parts.length > 1 ? parts[1].trim() : '';
  if (code.isEmpty && name.isEmpty) return raw;
  if (code.isEmpty) return name;
  if (name.isEmpty) return code;
  return '$code - $name';
}

/// Tuỳ chọn cho picker sản phẩm — gộp `code - name`.
class _ProductOption {
  const _ProductOption({
    required this.code,
    required this.name,
    required this.display,
  });
  final String code;
  final String name;
  final String display;
  /// Khoá nội bộ dạng `code|name` lưu vào `selectedProduct`. Khi rỗng
  /// một bên, khoá vẫn chỉ chứa phần có giá trị.
  String get key => code.isEmpty
      ? name
      : (name.isEmpty ? code : '$code|$name');
}

/// 3 nút chọn nhanh trạng thái duyệt BGĐ (Tất cả / Chưa duyệt / Đã duyệt).
class _ApprovalSegment extends StatelessWidget {
  const _ApprovalSegment({required this.value, required this.onChanged});

  final PurchasingApprovalFilter value;
  final ValueChanged<PurchasingApprovalFilter> onChanged;

  @override
  Widget build(BuildContext context) {
    final entries = <(PurchasingApprovalFilter, String)>[
      (PurchasingApprovalFilter.all, 'Tất cả'),
      (PurchasingApprovalFilter.pending, 'Chưa duyệt'),
      (PurchasingApprovalFilter.approved, 'Đã duyệt'),
    ];
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: entries.map((e) {
          final selected = e.$1 == value;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(e.$1),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color:
                      selected ? AppColors.primaryERP : Colors.transparent,
                  borderRadius: BorderRadius.circular(9),
                ),
                alignment: Alignment.center,
                child: Text(
                  e.$2,
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: selected
                        ? Colors.white
                        : AppColors.enableText.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
