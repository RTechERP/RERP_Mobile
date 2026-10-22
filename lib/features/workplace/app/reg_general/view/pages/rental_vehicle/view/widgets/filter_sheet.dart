// Date: 16/10/2026
// Nội dung/Chức năng: Bottom-sheet bộ lọc cho màn danh sách thuê xe tải.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/rental_vehicle_model.dart';
import '../bloc/rental_vehicle_bloc.dart';
import 'filter_field.dart';
import 'filter_section_label.dart';
import 'picker_sheet.dart';

/// Bottom-sheet filter: Từ khoá tìm kiếm / Phòng ban / Người YC / Người đặt.
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
      text: context.read<RentalVehicleBloc>().state.keyword,
    );
  }

  @override
  void dispose() {
    _searchCtl.dispose();
    super.dispose();
  }

  void _resetAll() {
    _searchCtl.clear();
    final bloc = context.read<RentalVehicleBloc>();
    bloc.add(const RentalVehicleEvent.search(keyword: ''));
    bloc.add(const RentalVehicleEvent.selectDepartment(0));
    bloc.add(const RentalVehicleEvent.selectRequester(0));
    bloc.add(const RentalVehicleEvent.selectBooker(0));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RentalVehicleBloc, RentalVehicleState>(
      builder: (context, state) {
        final departments = state.departments;
        final employees = state.employees;
        final hasFilter = state.selectedDepartmentId != 0 ||
            state.selectedRequesterId != 0 ||
            state.selectedBookerId != 0 ||
            state.keyword.trim().isNotEmpty;

        String? deptName;
        if (state.selectedDepartmentId != 0) {
          final match = departments
              .where((d) => d.id == state.selectedDepartmentId)
              .toList();
          if (match.isNotEmpty) deptName = match.first.name;
        }
        String? reqName;
        if (state.selectedRequesterId != 0) {
          final match = employees
              .where((e) => e.id == state.selectedRequesterId)
              .toList();
          if (match.isNotEmpty) reqName = _employeeLabel(match.first);
        }
        String? bookerName;
        if (state.selectedBookerId != 0) {
          final match = employees
              .where((e) => e.id == state.selectedBookerId)
              .toList();
          if (match.isNotEmpty) bookerName = _employeeLabel(match.first);
        }

        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
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
                            color:
                                AppColors.primaryERP.withValues(alpha: 0.1),
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
                          // Text search
                          const FilterSectionLabel(
                            icon: Icons.search,
                            label: 'Từ khoá tìm kiếm',
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _searchCtl,
                            decoration: InputDecoration(
                              hintText: 'Tên NV, dự án, NCC, ...',
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
                                        context.read<RentalVehicleBloc>().add(
                                              const RentalVehicleEvent.search(
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
                              context.read<RentalVehicleBloc>().add(
                                    RentalVehicleEvent.search(keyword: v),
                                  );
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 18),

                          // Phòng ban
                          const FilterSectionLabel(
                            icon: Icons.business_outlined,
                            label: 'Phòng ban',
                          ),
                          const SizedBox(height: 8),
                          FilterField(
                            icon: Icons.business_outlined,
                            placeholder: 'Chọn phòng ban',
                            value: deptName,
                            onTap: () {
                              showPickerBottomSheet<RentalVehicleDepartment>(
                                context: context,
                                title: 'Chọn phòng ban',
                                items: departments,
                                label: (d) => d.name ?? '—',
                                onSelected: (d) {
                                  context
                                      .read<RentalVehicleBloc>()
                                      .add(RentalVehicleEvent.selectDepartment(
                                        d.id ?? 0,
                                      ));
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 14),

                          // Người yêu cầu
                          const FilterSectionLabel(
                            icon: Icons.person_outline,
                            label: 'Người yêu cầu',
                          ),
                          const SizedBox(height: 8),
                          FilterField(
                            icon: Icons.person_outline,
                            placeholder: 'Chọn người yêu cầu',
                            value: reqName,
                            onTap: () {
                              showPickerBottomSheet<RentalVehicleEmployee>(
                                context: context,
                                title: 'Chọn người yêu cầu',
                                items: employees,
                                label: _employeeLabel,
                                onSelected: (e) {
                                  context
                                      .read<RentalVehicleBloc>()
                                      .add(RentalVehicleEvent.selectRequester(
                                        e.id ?? 0,
                                      ));
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 14),

                          // Người đặt
                          const FilterSectionLabel(
                            icon: Icons.assignment_ind_outlined,
                            label: 'Người đặt',
                          ),
                          const SizedBox(height: 8),
                          FilterField(
                            icon: Icons.assignment_ind_outlined,
                            placeholder: 'Chọn người đặt',
                            value: bookerName,
                            onTap: () {
                              showPickerBottomSheet<RentalVehicleEmployee>(
                                context: context,
                                title: 'Chọn người đặt',
                                items: employees,
                                label: _employeeLabel,
                                onSelected: (e) {
                                  context
                                      .read<RentalVehicleBloc>()
                                      .add(RentalVehicleEvent.selectBooker(
                                        e.id ?? 0,
                                      ));
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),

                  // ===== FOOTER BUTTONS =====
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12),
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
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
          ),
        );
      },
    );
  }
}

/// Format hiển thị nhân viên trong dropdown: `Code - FullName`.
String _employeeLabel(RentalVehicleEmployee e) {
  final code = (e.code ?? '').trim();
  final name = (e.fullName ?? '').trim();
  if (code.isEmpty && name.isEmpty) return '—';
  if (code.isEmpty) return name;
  if (name.isEmpty) return code;
  return '$code - $name';
}
