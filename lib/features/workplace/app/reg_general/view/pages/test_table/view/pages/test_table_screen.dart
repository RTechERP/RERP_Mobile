// Date: 03/09/2026
// Nội dung/Chức năng: Màn hình danh sách đăng ký bàn test ESL — chỉ hiển thị
// phiếu do currentUser đăng ký (lọc client-side theo ownerId/fullName).

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../bloc/test_table_bloc.dart';
import '../widgets/test_table_card.dart';

class TestTableScreen extends StatefulWidget {
  const TestTableScreen({super.key});

  @override
  State<TestTableScreen> createState() => _TestTableScreenState();
}

class _TestTableScreenState extends BaseState<TestTableScreen, TestTableEvent,
    TestTableState, TestTableBloc> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchActive = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const TestTableEvent.init());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchSubmit() {
    bloc.add(
      TestTableEvent.changeKeyword(keyword: _searchController.text.trim()),
    );
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _isSearchActive = false);
    if (bloc.state.keyword.isNotEmpty) {
      bloc.add(const TestTableEvent.changeKeyword(keyword: ''));
    }
  }

  /// Mở DateRangePicker dùng để lọc danh sách theo khoảng ngày đăng ký.
  Future<void> _openDateRangePicker() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final start = bloc.state.dateStart ?? today;
    final end = bloc.state.dateEnd ?? start.add(const Duration(days: 1));

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: start,
        initialEnd: end,
        onApply: (s, e) {
          bloc.add(TestTableEvent.changeDateRange(
            dateStart: s,
            dateEnd: e,
          ));
        },
      ),
    );
  }

  /// Mở bottom sheet lọc theo 3 trạng thái phiếu.
  Future<void> _openStatusFilter() async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (sheetCtx) {
        final entries = <_StatusOption>[
          _StatusOption(0, 'Chờ duyệt', Icons.hourglass_top),
          _StatusOption(1, 'Đã duyệt', Icons.check_circle_outline),
          _StatusOption(2, 'Từ chối', Icons.cancel_outlined),
        ];

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.gray.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Lọc theo trạng thái',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.heading,
                    ),
                  ),
                ),
                ...entries.map((opt) {
                  final selected = opt.value == bloc.state.statusFilter;
                  return ListTile(
                    leading: Icon(
                      opt.icon,
                      color: selected
                          ? AppColors.primaryERP
                          : AppColors.heading,
                    ),
                    title: Text(
                      opt.label,
                      style: TextStyle(
                        fontWeight:
                            selected ? FontWeight.w700 : FontWeight.w500,
                        color: selected
                            ? AppColors.primaryERP
                            : AppColors.heading,
                      ),
                    ),
                    trailing: selected
                        ? const Icon(
                            Icons.check,
                            color: AppColors.primaryERP,
                          )
                        : null,
                    onTap: () {
                      bloc.add(TestTableEvent.changeStatus(status: opt.value));
                      Navigator.pop(sheetCtx);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<TestTableBloc, TestTableState>(
      bloc: bloc,
      builder: (context, state) {
        return BaseScaffold(
          backgroundColor: const Color(0xFFF4F7FB),
          appBar: AppBarCommon(
            title: _isSearchActive
                ? _buildSearchField()
                : const Text('Đăng ký bàn test'),
            onBackTap: () =>
                _isSearchActive ? _clearSearch() : onBack(context),
            actions: _isSearchActive
                ? [
                    if (_searchController.text.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.clear, size: 20),
                        tooltip: 'Xoá tìm kiếm',
                        onPressed: () {
                          _searchController.clear();
                          setState(() {});
                          bloc.add(
                            const TestTableEvent.changeKeyword(keyword: ''),
                          );
                        },
                      ),
                  ]
                : [
                    IconButton(
                      icon: const Icon(Icons.qr_code_scanner),
                      tooltip: 'Quét QR bàn test',
                      onPressed: () async {
                        // QR screen truyền `true` lên nếu Add submit thành công.
                        final reload =
                            await context.push<bool?>(RouteNames.testTableQrScan);
                        if (!mounted) return;
                        if (reload == true) {
                          bloc.add(const TestTableEvent.init());
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      tooltip: 'Tìm kiếm',
                      onPressed: () => setState(() => _isSearchActive = true),
                    ),
                    IconButton(
                      icon: const Icon(Icons.filter_list),
                      tooltip: 'Lọc trạng thái',
                      onPressed: _openStatusFilter,
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_month),
                      tooltip: 'Chọn khoảng ngày',
                      onPressed: _openDateRangePicker,
                    ),
                  ],
          ),
          body: _buildBody(state),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if (_isSearchActive) _clearSearch();
              final reload =
                  await context.push<bool?>(RouteNames.testTableAdd);
              if (!mounted) return;
              if (reload == true) {
                bloc.add(const TestTableEvent.init());
              }
            },
            backgroundColor: AppColors.primaryERP,
            elevation: 6,
            shape: const CircleBorder(),
            child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
        );
      },
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      style: const TextStyle(fontSize: 16, color: AppColors.heading),
      decoration: const InputDecoration(
        hintText: 'Tìm mã đăng ký, bàn test, dự án...',
        hintStyle: TextStyle(fontSize: 16, color: AppColors.hintText),
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
      textInputAction: TextInputAction.search,
      onChanged: (_) => setState(() {}),
      onSubmitted: (_) => _onSearchSubmit(),
    );
  }

  /// Lọc các phiếu thuộc về currentUser theo ownerId.
  /// Trả về list gốc nếu chưa load xong currentUser để tránh ẩn nhầm dữ liệu.
  List<dynamic> _filterByCurrentUser(TestTableState state) {
    final user = state.currentUser;
    if (user == null) return state.testCard;

    return state.testCard.where((item) {
      if (item.ownerId != null) {
        return item.ownerId == user.employeeId;
      }
      return false;
    }).toList();
  }

  Widget _buildBody(TestTableState state) {
    if (state.status == BaseStateStatus.loading && state.testCard.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == BaseStateStatus.failed && state.testCard.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.error, width: 320),
            const SizedBox(height: 12),
            Text(state.message ?? 'Tải dữ liệu thất bại'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => bloc.add(const TestTableEvent.init()),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    final items = _filterByCurrentUser(state);
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.missing, width: 320),
            const SizedBox(height: 12),
            const Text('Không có bản ghi nào'),
          ],
        ),
      );
    }

    return RefreshIndicator(
      color: AppColors.primaryERP,
      onRefresh: () async {
        bloc.add(const TestTableEvent.refresh());
        await bloc.stream.firstWhere(
          (s) => s.status != BaseStateStatus.loading,
        );
      },
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        children: [
          _ListHeader(
            total: items.length,
            dateStart: state.dateStart,
            dateEnd: state.dateEnd,
            isSearching: _searchController.text.isNotEmpty,
          ),
          const SizedBox(height: 8),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TestTableCard(item: item),
              )),
        ],
      ),
    );
  }
}

class _ListHeader extends StatelessWidget {
  const _ListHeader({
    required this.total,
    required this.dateStart,
    required this.dateEnd,
    required this.isSearching,
  });

  final int total;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd/MM/yyyy');
    final hasRange = dateStart != null && dateEnd != null;
    final isSameDay = hasRange && _isSameDay(dateStart!, dateEnd!);

    // Luôn hiển thị khoảng ngày — null thì show placeholder.
    String rangeText;
    if (dateStart == null && dateEnd == null) {
      rangeText = '--/--/----';
    } else if (dateStart != null && dateEnd != null) {
      rangeText = isSameDay
          ? df.format(dateStart!)
          : '${df.format(dateStart!)} - ${df.format(dateEnd!)}';
    } else {
      rangeText = df.format(dateStart ?? dateEnd!);
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryERP,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryERP.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Flexible(
                            child: Text(
                              '$total',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.1,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            'phiếu',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        isSearching ? 'Đang tìm kiếm' : 'Tổng số phiếu',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.event_outlined, size: 14, color: AppColors.primaryERP),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      rangeText,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryERP,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

/// Một lựa chọn trạng thái trong bottom sheet lọc.
class _StatusOption {
  const _StatusOption(this.value, this.label, this.icon);
  final int value;
  final String label;
  final IconData icon;
}
