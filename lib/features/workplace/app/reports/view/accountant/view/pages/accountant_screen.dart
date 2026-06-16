import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/date_range_picker.dart';
import '../../../../../../../../routes/route_names.dart';
import '../bloc/accountant_bloc.dart';
import '../widgets/accountant_card.dart';
import '../widgets/date_header.dart';

class AccountantScreen extends StatefulWidget {
  const AccountantScreen({super.key});

  @override
  State<AccountantScreen> createState() => _AccountantScreenState();
}

class _AccountantScreenState
    extends
        BaseState<
          AccountantScreen,
          AccountantEvent,
          AccountantState,
          AccountantBloc
        > {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc.add(const AccountantEvent.init());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isSearching) return;
    if (!bloc.state.hasReachedMax && !bloc.state.isLoadingMore) {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        bloc.add(
          AccountantEvent.changeDateRange(
            dateStart: bloc.state.dateStart ?? DateTime.now(),
            dateEnd: bloc.state.dateEnd ?? DateTime.now(),
          ),
        );
      }
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<AccountantBloc, AccountantState>(
      bloc: bloc,
      listenWhen: (p, c) =>
          p.deleteSuccess != c.deleteSuccess ||
          p.isDeleting != c.isDeleting ||
          p.status != c.status ||
          p.message != c.message,
      listener: (context, state) {
        if (state.deleteSuccess) {
          showMessage(
            context,
            'Xoá báo cáo công việc thành công',
            type: SnackBarType.success,
          );
          bloc.add(const AccountantEvent.resetDeleteStatus());
        }

        if (state.status == BaseStateStatus.failed &&
            !state.deleteSuccess &&
            !state.isDeleting &&
            (state.message ?? '').isNotEmpty) {
          showMessage(context, state.message!, type: SnackBarType.error);
        }
      },
      child: BaseScaffold(
        appBar: AppBarCommon(
          title: _isSearching
              ? TextField(
                  controller: _searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm báo cáo kế toán...',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    bloc.add(AccountantEvent.searchKeyword(value));
                  },
                )
              : Text('report.accountant'.tr()),
          onBackTap: () => onBack(context),
          actions: [
            IconButton(
              icon: Icon(
                _isSearching ? Icons.close_rounded : Icons.search_rounded,
                size: 22,
              ),
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching;
                  if (!_isSearching) {
                    _searchController.clear();
                    bloc.add(const AccountantEvent.searchKeyword(''));
                  }
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.date_range_rounded, size: 22),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => DateRangePicker(
                    initialStart: bloc.state.dateStart,
                    initialEnd: bloc.state.dateEnd,
                    onApply: (start, end) {
                      bloc.add(
                        AccountantEvent.changeDateRange(
                          dateStart: start,
                          dateEnd: DateTime(
                            end.year,
                            end.month,
                            end.day,
                            23,
                            59,
                            59,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<AccountantBloc, AccountantState>(
          builder: (context, state) {
            if (state.isDeleting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == BaseStateStatus.loading &&
                state.reports.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == BaseStateStatus.failed &&
                state.reports.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline_rounded,
                      color: Colors.redAccent,
                      size: 48,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Không thể tải dữ liệu',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () =>
                          bloc.add(const AccountantEvent.refresh()),
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              );
            }

            if (state.reports.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.inbox_outlined, size: 48, color: Colors.grey),
                    SizedBox(height: 8),
                    Text(
                      'Không có báo cáo',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                bloc.add(const AccountantEvent.refresh());
                await bloc.stream.firstWhere(
                  (s) => s.status != BaseStateStatus.loading,
                );
              },
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.only(top: 4, bottom: 16),
                itemCount: state.reports.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return AccountantDateHeader(state: state);
                  }

                  final item = state.reports[index - 1];
                  final reportId = item.id ?? 0;
                  return AccountantCard(
                    item: item,
                    onTap: reportId == 0
                        ? null
                        : () async {
                            final result = await context.push<int>(
                              RouteNames.reportAccountantEdit,
                              extra: reportId,
                            );
                            if (result == true) {
                              bloc.add(const AccountantEvent.refresh());
                            }
                          },
                    onDelete: reportId == 0
                        ? null
                        : () async {
                            final confirmed =
                                await DialogService.showConfirmDelete(
                              context: context,
                            );
                            if (!confirmed) return;

                            bloc.add(AccountantEvent.deleteReport(reportId));
                          },
                  );
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await context.push(RouteNames.reportAccountantAdd);
            if (result == true) {
              bloc.add(const AccountantEvent.refresh());
            }
          },
          backgroundColor: AppColors.primaryERP,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }
}
