// Bottom-sheet bộ lọc: từ khoá + Dự án + Nhà cung cấp.

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
        final projects = state.projects;
        final suppliers = state.suppliers;
        final f = state.filter;
        final hasFilter = f.selectedProjectId != null ||
            f.selectedSupplierId != null ||
            f.searchKeyword.trim().isNotEmpty;

        // Label dự án.
        String? projectLabel;
        if (f.selectedProjectId != null) {
          final m = projects.where((p) => p.id == f.selectedProjectId).toList();
          if (m.isNotEmpty) {
            projectLabel = '${m.first.projectCode ?? ''}'
                ' - ${m.first.projectName ?? 'N/A'}';
          }
        }

        // Label NCC.
        String? supplierLabel;
        if (f.selectedSupplierId != null) {
          final m = suppliers
              .where((s) => s.id == f.selectedSupplierId)
              .toList();
          if (m.isNotEmpty) {
            supplierLabel = '${m.first.codeNcc ?? ''}'
                ' - ${m.first.nameNcc ?? 'N/A'}';
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
                      if (hasFilter)
                        GestureDetector(
                          onTap: () {},
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
                          onTap: () {
                            showPickerBottomSheet<ProjectFilterItem>(
                              context: context,
                              title: 'Chọn dự án',
                              items: projects,
                              label: (p) {
                                final code = p.projectCode ?? '';
                                final name = p.projectName ?? 'N/A';
                                return code.isEmpty ? name : '$code - $name';
                              },
                              onSelected: (project) {
                                final newId = project.id == f.selectedProjectId
                                    ? null
                                    : project.id;
                                context.read<ApprovePurchasingBloc>().add(
                                      ApprovePurchasingEvent.applyFilter(
                                        projectId: newId,
                                        supplierId: f.selectedSupplierId,
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
                          onTap: () {
                            showPickerBottomSheet<SupplierItem>(
                              context: context,
                              title: 'Chọn nhà cung cấp',
                              items: suppliers,
                              label: (s) {
                                final code = s.codeNcc ?? '';
                                final name = s.nameNcc ?? 'N/A';
                                return code.isEmpty ? name : '$code - $name';
                              },
                              onSelected: (supplier) {
                                final newId = supplier.id == f.selectedSupplierId
                                    ? null
                                    : supplier.id;
                                context.read<ApprovePurchasingBloc>().add(
                                      ApprovePurchasingEvent.applyFilter(
                                        projectId: f.selectedProjectId,
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
