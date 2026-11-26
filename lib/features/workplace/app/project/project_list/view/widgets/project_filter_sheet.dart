import 'package:flutter/material.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../data/datasource/model/project_list_model.dart';
import '../bloc/project_list_bloc.dart';

/// Bottom sheet bộ lọc danh sách dự án.
///
/// Theo đúng pattern bộ lọc của module kho (`sale_gdn_screen.dart`): mọi
/// tiêu chí đều là một ô chọn, bấm vào mở `openSelectBottomSheet` có ô tìm
/// kiếm và pre-select giá trị đang chọn.
class ProjectFilterSheet extends StatefulWidget {
  const ProjectFilterSheet({
    super.key,
    required this.bloc,
    required this.currentFilters,
    required this.onApply,
    required this.onClear,
    this.onRetryLookup,
  });

  /// Bloc danh sách dự án - dùng để đọc dữ liệu lookup mới nhất.
  final ProjectListBloc bloc;

  /// Bộ lọc hiện tại để pre-select chip.
  final ProjectFilters currentFilters;

  /// Callback khi bấm "Áp dụng".
  final void Function(ProjectFilters filters) onApply;

  /// Callback khi bấm "Xoá lọc".
  final VoidCallback onClear;

  /// Callback tải lại dữ liệu lookup khi danh sách chưa có dữ liệu.
  final VoidCallback? onRetryLookup;

  /// Mở bottom sheet bộ lọc.
  static Future<void> show(
    BuildContext context, {
    required ProjectListBloc bloc,
    required ProjectFilters currentFilters,
    required void Function(ProjectFilters filters) onApply,
    required VoidCallback onClear,
    VoidCallback? onRetryLookup,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ProjectFilterSheet(
        bloc: bloc,
        currentFilters: currentFilters,
        onApply: onApply,
        onClear: onClear,
        onRetryLookup: onRetryLookup,
      ),
    );
  }

  @override
  State<ProjectFilterSheet> createState() => _ProjectFilterSheetState();
}

class _ProjectFilterSheetState extends State<ProjectFilterSheet> {
  late ProjectFilters _filters;

  @override
  void initState() {
    super.initState();
    _filters = widget.currentFilters;
  }

  /// Dữ liệu lookup mới nhất từ bloc.
  ///
  /// Sheet được mở bằng `showModalBottomSheet` nên không nằm trong cây
  /// `BlocProvider` của màn danh sách - dùng `bloc.state` để đọc trực tiếp
  /// thay vì snapshot lúc mở (dữ liệu có thể vừa được tải lại).
  ProjectListState get _state => widget.bloc.state;

  List<CustomerItem> get _customers => _state.customers;
  List<ProjectTypeItem> get _projectTypes => _state.projectTypes;
  List<ProjectStatusItem> get _statuses => _state.statuses;
  List<UserItem> get _users => _state.users;
  List<PmItem> get _pms => _state.pms;
  List<BusinessFieldItem> get _businessFields => _state.businessFields;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHandle(),
            _buildTitle(),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                children: [
                  _buildPersonField(
                    label: 'Khách hàng',
                    icon: Icons.business_outlined,
                    selectedValue: _selectedCustomerName,
                    onTap: _openCustomerSheet,
                    onClear: () => setState(() {
                      _filters = _filters.copyWith(customerId: null);
                    }),
                  ),
                  const SizedBox(height: 16),
                  _buildPersonField(
                    label: 'Sale',
                    icon: Icons.support_agent_outlined,
                    selectedValue: _selectedSaleName,
                    onTap: _openSaleSheet,
                    onClear: () => setState(() {
                      _filters = _filters.copyWith(saleId: null);
                    }),
                  ),
                  const SizedBox(height: 16),
                  _buildPersonField(
                    label: 'Kỹ thuật',
                    icon: Icons.engineering_outlined,
                    selectedValue: _selectedTechName,
                    onTap: _openTechSheet,
                    onClear: () => setState(() {
                      _filters = _filters.copyWith(techId: null);
                    }),
                  ),
                  const SizedBox(height: 16),
                  _buildPersonField(
                    label: 'PM',
                    icon: Icons.account_circle_outlined,
                    selectedValue: _selectedPmName,
                    onTap: _openPmSheet,
                    onClear: () => setState(() {
                      _filters = _filters.copyWith(pmId: null);
                    }),
                  ),
                  const SizedBox(height: 16),
                  _buildPersonField(
                    label: 'Kiểu dự án',
                    icon: Icons.category_outlined,
                    selectedValue: _selectedProjectTypeName,
                    onTap: _openProjectTypeSheet,
                    onClear: () => setState(() {
                      _filters = _filters.copyWith(projectType: null);
                    }),
                  ),
                  const SizedBox(height: 16),
                  _buildPersonField(
                    label: 'Trạng thái',
                    icon: Icons.flag_outlined,
                    selectedValue: _selectedStatusName,
                    onTap: _openStatusSheet,
                    onClear: () => setState(() {
                      _filters = _filters.copyWith(projectStatus: null);
                    }),
                  ),
                  const SizedBox(height: 16),
                  _buildPersonField(
                    label: 'Lĩnh vực',
                    icon: Icons.workspaces_outlined,
                    selectedValue: _selectedBusinessFieldName,
                    onTap: _openBusinessFieldSheet,
                    onClear: () => setState(() {
                      _filters = _filters.copyWith(businessFieldId: null);
                    }),
                  ),
                ],
              ),
            ),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  /// Thanh kéo ở đầu sheet.
  Widget _buildHandle() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: AppColors.borderColor,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  /// Tiêu đề + số tiêu chí đang chọn.
  Widget _buildTitle() {
    final count = _filters.activeCount;
    final hasNoLookup = _customers.isEmpty &&
        _statuses.isEmpty &&
        _users.isEmpty &&
        _pms.isEmpty &&
        _businessFields.isEmpty &&
        _projectTypes.isEmpty;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Bộ lọc',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
              ),
            ),
          ),
          if (hasNoLookup && widget.onRetryLookup != null)
            TextButton.icon(
              onPressed: widget.onRetryLookup,
              icon: const Icon(Icons.refresh, size: 16),
              label: const Text(
                'Tải lại',
                style: TextStyle(fontSize: 12.5),
              ),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryERP,
              ),
            ),
          if (count > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryERP.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '$count tiêu chí',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryERP,
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Ô chọn giá trị duy nhất, bấm vào mở sheet chọn danh sách.
  ///
  /// Hiển thị tên giá trị đang chọn, có nút xoá khi đã chọn và mũi tên
  /// xuống khi chưa chọn - giống ô chọn người trong bộ lọc của module kho.
  Widget _buildPersonField({
    required String label,
    required IconData icon,
    required String? selectedValue,
    required VoidCallback onTap,
    required VoidCallback onClear,
  }) {
    final hasValue =
        selectedValue != null && selectedValue.trim().isNotEmpty;
    final displayText = hasValue ? selectedValue : 'Chọn $label';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.heading,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: hasValue
                  ? AppColors.primaryERP.withValues(alpha: 0.06)
                  : AppColors.grey_bg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: hasValue ? AppColors.primaryERP : AppColors.borderColor,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: hasValue ? AppColors.primaryERP : AppColors.gray,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    displayText,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight:
                          hasValue ? FontWeight.w600 : FontWeight.w400,
                      color: hasValue
                          ? AppColors.heading
                          : AppColors.gray.withValues(alpha: 0.6),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (hasValue)
                  GestureDetector(
                    onTap: onClear,
                    child: const Icon(
                      Icons.close,
                      color: AppColors.gray,
                      size: 20,
                    ),
                  )
                else
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.gray,
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Tên khách hàng đang chọn.
  String? get _selectedCustomerName {
    final id = _filters.customerId;
    if (id == null) return null;
    for (final c in _customers) {
      if (c.id == id) return c.name;
    }
    return null;
  }

  /// Tên sale đang chọn.
  String? get _selectedSaleName {
    final id = _filters.saleId;
    if (id == null) return null;
    for (final u in _users) {
      if (u.id == id) return u.fullName;
    }
    return null;
  }

  /// Tên kỹ thuật đang chọn.
  String? get _selectedTechName {
    final id = _filters.techId;
    if (id == null) return null;
    for (final u in _users) {
      if (u.id == id) return u.fullName;
    }
    return null;
  }

  /// Tên PM đang chọn.
  ///
  /// API `pmID` nhận `EmployeeID` của PM (khớp với cột `PMID` của dự án),
  /// nên cần tra theo cả `employeeId` lẫn `id`.
  String? get _selectedPmName {
    final id = _filters.pmId;
    if (id == null) return null;
    for (final p in _pms) {
      if (p.employeeId == id || p.id == id) return p.fullName;
    }
    return null;
  }

  /// Tên kiểu dự án đang chọn.
  String? get _selectedProjectTypeName {
    final id = _filters.projectType;
    if (id == null) return null;
    for (final t in _projectTypes) {
      if (t.id == id) return t.name;
    }
    return null;
  }

  /// Tên trạng thái đang chọn.
  String? get _selectedStatusName {
    final id = _filters.projectStatus;
    if (id == null) return null;
    for (final s in _statuses) {
      if (s.id == id) return s.name;
    }
    return null;
  }

  /// Tên lĩnh vực đang chọn.
  String? get _selectedBusinessFieldName {
    final id = _filters.businessFieldId;
    if (id == null) return null;
    for (final b in _businessFields) {
      if (b.id == id) return b.name;
    }
    return null;
  }

  /// Báo người dùng danh sách lookup chưa tải được và yêu cầu tải lại.
  ///
  /// Trả về `true` nếu dữ liệu đã sẵn sàng để mở sheet chọn.
  bool _ensureLookupReady({
    required bool isReady,
    required String label,
  }) {
    if (isReady) return true;

    widget.onRetryLookup?.call();
    context.showMessage(
      'Danh sách $label chưa sẵn sàng, đang tải lại...',
      type: SnackBarType.info,
    );
    return false;
  }

  /// Mở sheet chọn khách hàng.
  Future<void> _openCustomerSheet() async {
    if (!_ensureLookupReady(isReady: _customers.isNotEmpty, label: 'khách hàng')) {
      return;
    }

    await openSelectBottomSheet<CustomerItem>(
      context: context,
      title: 'Chọn khách hàng',
      items: _customers,
      displayText: (c) {
        final name = (c.name ?? '').trim();
        final code = (c.code ?? '').trim();
        if (name.isEmpty) return code;
        return code.isEmpty ? name : '$name ($code)';
      },
      hintText: 'Tìm theo tên hoặc mã khách hàng...',
      initialSelectedItem: _selectedCustomer,
      onSelected: (customer) => setState(() {
        _filters = _filters.copyWith(customerId: customer.id);
      }),
    );
  }

  /// Khách hàng đang chọn (để pre-select trong sheet).
  CustomerItem? get _selectedCustomer {
    final id = _filters.customerId;
    if (id == null) return null;
    for (final c in _customers) {
      if (c.id == id) return c;
    }
    return null;
  }

  /// Mở sheet chọn sale.
  Future<void> _openSaleSheet() async {
    if (!_ensureLookupReady(isReady: _users.isNotEmpty, label: 'nhân sự')) {
      return;
    }

    await openSelectBottomSheetGrouped<UserItem>(
      context: context,
      title: 'Chọn Sale',
      items: _users,
      groupBy: (u) => (u.departmentName ?? '').trim(),
      displayText: (u) => u.fullName ?? '',
      hintText: 'Tìm theo tên...',
      initialSelectedItem: _selectedUser(_filters.saleId),
      onSelected: (user) => setState(() {
        _filters = _filters.copyWith(saleId: user.id);
      }),
    );
  }

  /// Mở sheet chọn kỹ thuật.
  Future<void> _openTechSheet() async {
    if (!_ensureLookupReady(isReady: _users.isNotEmpty, label: 'nhân sự')) {
      return;
    }

    await openSelectBottomSheetGrouped<UserItem>(
      context: context,
      title: 'Chọn Kỹ thuật',
      items: _users,
      groupBy: (u) => (u.departmentName ?? '').trim(),
      displayText: (u) => u.fullName ?? '',
      hintText: 'Tìm theo tên...',
      initialSelectedItem: _selectedUser(_filters.techId),
      onSelected: (user) => setState(() {
        _filters = _filters.copyWith(techId: user.id);
      }),
    );
  }

  /// Mở sheet chọn PM.
  Future<void> _openPmSheet() async {
    if (!_ensureLookupReady(isReady: _pms.isNotEmpty, label: 'PM')) {
      return;
    }

    await openSelectBottomSheetGrouped<PmItem>(
      context: context,
      title: 'Chọn PM',
      items: _pms,
      groupBy: (p) => (p.departmentName ?? '').trim(),
      displayText: (p) => p.fullName ?? '',
      hintText: 'Tìm theo tên...',
      initialSelectedItem: _selectedPm,
      onSelected: (pm) => setState(() {
        _filters = _filters.copyWith(pmId: pm.employeeId ?? pm.id);
      }),
    );
  }

  /// Nhân sự đang chọn theo id (để pre-select trong sheet).
  UserItem? _selectedUser(int? id) {
    if (id == null) return null;
    for (final u in _users) {
      if (u.id == id) return u;
    }
    return null;
  }

  /// PM đang chọn (để pre-select trong sheet).
  PmItem? get _selectedPm {
    final id = _filters.pmId;
    if (id == null) return null;
    for (final p in _pms) {
      if (p.employeeId == id || p.id == id) return p;
    }
    return null;
  }

  /// Mở sheet chọn kiểu dự án.
  Future<void> _openProjectTypeSheet() async {
    if (!_ensureLookupReady(
      isReady: _projectTypes.isNotEmpty,
      label: 'kiểu dự án',
    )) {
      return;
    }

    await openSelectBottomSheet<ProjectTypeItem>(
      context: context,
      title: 'Chọn kiểu dự án',
      items: _projectTypes,
      displayText: (t) => t.name ?? '',
      hintText: 'Tìm theo tên kiểu dự án...',
      initialSelectedItem: _selectedProjectType,
      onSelected: (type) => setState(() {
        _filters = _filters.copyWith(projectType: type.id);
      }),
    );
  }

  /// Kiểu dự án đang chọn (để pre-select trong sheet).
  ProjectTypeItem? get _selectedProjectType {
    final id = _filters.projectType;
    if (id == null) return null;
    for (final t in _projectTypes) {
      if (t.id == id) return t;
    }
    return null;
  }

  /// Mở sheet chọn trạng thái dự án.
  Future<void> _openStatusSheet() async {
    if (!_ensureLookupReady(isReady: _statuses.isNotEmpty, label: 'trạng thái')) {
      return;
    }

    await openSelectBottomSheet<ProjectStatusItem>(
      context: context,
      title: 'Chọn trạng thái',
      items: _statuses,
      displayText: (s) => s.name ?? '',
      hintText: 'Tìm theo tên trạng thái...',
      initialSelectedItem: _selectedStatus,
      onSelected: (status) => setState(() {
        _filters = _filters.copyWith(projectStatus: status.id);
      }),
    );
  }

  /// Trạng thái đang chọn (để pre-select trong sheet).
  ProjectStatusItem? get _selectedStatus {
    final id = _filters.projectStatus;
    if (id == null) return null;
    for (final s in _statuses) {
      if (s.id == id) return s;
    }
    return null;
  }

  /// Mở sheet chọn lĩnh vực của dự án.
  Future<void> _openBusinessFieldSheet() async {
    if (!_ensureLookupReady(
      isReady: _businessFields.isNotEmpty,
      label: 'lĩnh vực',
    )) {
      return;
    }

    await openSelectBottomSheet<BusinessFieldItem>(
      context: context,
      title: 'Chọn lĩnh vực',
      items: _businessFields,
      displayText: (b) {
        final name = (b.name ?? '').trim();
        final code = (b.code ?? '').trim();
        if (name.isEmpty) return code;
        return code.isEmpty ? name : '$name ($code)';
      },
      hintText: 'Tìm theo tên lĩnh vực...',
      initialSelectedItem: _selectedBusinessField,
      onSelected: (field) => setState(() {
        _filters = _filters.copyWith(businessFieldId: field.id);
      }),
    );
  }

  /// Lĩnh vực đang chọn (để pre-select trong sheet).
  BusinessFieldItem? get _selectedBusinessField {
    final id = _filters.businessFieldId;
    if (id == null) return null;
    for (final b in _businessFields) {
      if (b.id == id) return b;
    }
    return null;
  }

  /// Hàng nút hành động ở chân sheet.
  Widget _buildActions() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.borderColor)),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                widget.onClear();
                Navigator.pop(context);
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
                'Xoá lọc',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {
                widget.onApply(_filters);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Áp dụng',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
