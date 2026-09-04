// Date: 03/09/2026
// Nội dung/Chức năng: Màn hình danh sách đăng ký bàn test ESL

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
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
                      icon: const Icon(Icons.search),
                      tooltip: 'Tìm kiếm',
                      onPressed: () => setState(() => _isSearchActive = true),
                    ),
                  ],
          ),
          body: _buildBody(state),
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

  Widget _buildBody(TestTableState state) {
    if (state.status == BaseStateStatus.loading && state.testTable.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == BaseStateStatus.failed && state.testTable.isEmpty) {
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

    if (state.testTable.isEmpty) {
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
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: state.testTable.length,
        separatorBuilder: (_, _) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          return TestTableCard(item: state.testTable[index]);
        },
      ),
    );
  }
}
