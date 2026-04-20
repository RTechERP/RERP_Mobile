// Date: 14/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình tài sản cá nhân - 2 tab biên bản & tài sản

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../data/datasource/models/personal_asset_model.dart';
import '../bloc/personal_asset_bloc.dart';
import '../widgets/personal_asset_card.dart';
import '../widgets/personal_property_card.dart';

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class PersonalAssetScreen extends StatefulWidget {
  const PersonalAssetScreen({super.key});

  @override
  State<PersonalAssetScreen> createState() => _PersonalAssetScreenState();
}

class _PersonalAssetScreenState
    extends BaseState<PersonalAssetScreen, PersonalAssetEvent, PersonalAssetState,
        PersonalAssetBloc>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isSearchMode = false;
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const PersonalAssetEvent.init());
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onTabChanged() {
    if (_isSearchMode) {
      setState(() => _exitSearchMode());
    }
  }

  void _toggleSearchMode() {
    setState(() {
      _isSearchMode = !_isSearchMode;
      if (!_isSearchMode) {
        _exitSearchMode();
      }
    });
  }

  void _exitSearchMode() {
    _debounce?.cancel();
    _searchController.clear();
    bloc.add(const PersonalAssetEvent.searchAssets(filterText: ''));
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      bloc.add(PersonalAssetEvent.searchAssets(filterText: value.trim()));
    });
  }

  Future<void> _onRefresh() async {
    bloc.add(const PersonalAssetEvent.init());
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<PersonalAssetBloc, PersonalAssetState>(
      listenWhen: (prev, curr) =>
          (curr.message != null && prev.message != curr.message) ||
          prev.isApproving != curr.isApproving,
      listener: (context, state) {
        if ((state.message ?? '').isNotEmpty &&
            state.status == BaseStateStatus.failed) {
          context.showMessage(state.message!, type: SnackBarType.error);
        }
        if (state.isApproving) {
          context.showMessage('Đang xử lý duyệt...', type: SnackBarType.info);
        }
      },
      child: BlocBuilder<PersonalAssetBloc, PersonalAssetState>(
        builder: (context, state) {
          return BaseScaffold(
            appBar: _buildAppBar(),
            body: TabBarView(
              controller: _tabController,
              children: [
                _PropertyTabBody(state: state, onRefresh: _onRefresh),
                _AssetTabBody(state: state, onRefresh: _onRefresh),
              ],
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    if (_isSearchMode && _tabController.index == 1) {
      return AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.heading, size: 20),
          onPressed: _toggleSearchMode,
        ),
        titleSpacing: 0,
        title: TextField(
          controller: _searchController,
          autofocus: true,
          onChanged: _onSearchChanged,
          style: const TextStyle(fontSize: 15, color: AppColors.heading),
          decoration: const InputDecoration(
            hintText: 'Nhập mã, tên tài sản...',
            hintStyle: TextStyle(fontSize: 15, color: AppColors.hintText),
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
        ),
        actions: [
          if (_searchController.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear, color: AppColors.gray, size: 20),
              onPressed: () {
                _searchController.clear();
                bloc.add(const PersonalAssetEvent.searchAssets(filterText: ''));
              },
            ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: AppColors.borderColor, height: 1),
        ),
      );
    }

    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: AppColors.heading, size: 20),
        onPressed: () => context.pop(),
      ),
      title: const Text(
        'Quản lý tài sản cá nhân',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.heading,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: AppColors.heading, size: 24),
          onPressed: () {
            if (_tabController.index == 1) {
              _toggleSearchMode();
            } else {
              _showCategoryFilterSheet(context);
            }
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Container(
          color: AppColors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: AppColors.primaryERP,
            unselectedLabelColor: AppColors.gray,
            indicatorColor: AppColors.primaryERP,
            indicatorWeight: 3,
            tabs: const [
              Tab(text: 'Biên bản'),
              Tab(text: 'Tài sản cá nhân'),
            ],
          ),
        ),
      ),
    );
  }

  void _showCategoryFilterSheet(BuildContext context) {
    final currentCategory = bloc.state.propertyCategoryFilter;
    final categories = [
      {'value': -1, 'label': 'Tất cả'},
      {'value': 1, 'label': 'Điều chuyển'},
      {'value': 2, 'label': 'Cấp phát'},
      {'value': 3, 'label': 'Thu hồi'},
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.borderColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Lọc biên bản',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
              ),
            ),
            const SizedBox(height: 16),
            ...categories.map((cat) {
              final val = cat['value'] as int;
              final selected = currentCategory == val;
              return ListTile(
                onTap: () {
                  Navigator.pop(context);
                  bloc.add(PersonalAssetEvent.filterPropertyCategory(category: val));
                },
                leading: Icon(
                  selected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: selected ? AppColors.primaryERP : AppColors.gray,
                  size: 22,
                ),
                title: Text(
                  cat['label'] as String,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                    color: selected ? AppColors.primaryERP : AppColors.heading,
                  ),
                ),
              );
            }),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Tab: Biên bản
// ---------------------------------------------------------------------------

class _PropertyTabBody extends StatelessWidget {
  const _PropertyTabBody({required this.state, required this.onRefresh});

  final PersonalAssetState state;
  final Future<void> Function() onRefresh;

  static List<PersonalPropertyItem> _skeletonList(int count) => List.generate(
        count,
        (i) => PersonalPropertyItem(
          assetId: i,
          deliverId: i,
          receiverId: i,
          assetCategory: 1,
          assetCode: 'BB-00$i',
          assetCategoryText: 'Loại biên bản skeleton',
          implementationDate: DateTime.now(),
          isApprovedPersonalProperty: false,
          isApproveAccountant: false,
          isApproved: false,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final properties = state.personalProperty;
    final loading = state.status == BaseStateStatus.loading;
    final failed = state.status == BaseStateStatus.failed;
    final isInitialLoading = loading && properties.isEmpty;

    if (failed && properties.isEmpty) {
      return _ErrorState(
        message: state.message,
        onRetry: () {
          context.read<PersonalAssetBloc>().add(
                const PersonalAssetEvent.init(),
              );
        },
      );
    }

    final displayItems = isInitialLoading ? _skeletonList(3) : properties;

    if (displayItems.isEmpty && !isInitialLoading) {
      return const _EmptyState(
        icon: Icons.description_outlined,
        title: 'Chưa có biên bản',
        subtitle: 'Thông tin biên bản bàn giao / thu hồi trống.',
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primaryERP,
      child: Skeletonizer(
        containersColor: AppColors.white,
        enabled: isInitialLoading,
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          itemCount: displayItems.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final item = displayItems[index];
            return PersonalPropertyCard(
              item: item,
              isApproving: state.isApproving,
              onApprove: (approveType) {
                final deliverId = item.deliverId;
                final assetId = item.assetId;
                if (deliverId != null &&
                    deliverId > 0 &&
                    assetId != null &&
                    assetId > 0) {
                  context.read<PersonalAssetBloc>().add(
                        PersonalAssetEvent.approveProperty(
                          deliverId: deliverId,
                          assetId: assetId,
                          approveType: approveType,
                        ),
                      );
                }
              },
              onTap: () {
                context.push(
                  RouteNames.personalPropertyDetail,
                  extra: item,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Tab: Tài sản cá nhân
// ---------------------------------------------------------------------------

class _AssetTabBody extends StatelessWidget {
  const _AssetTabBody({required this.state, required this.onRefresh});

  final PersonalAssetState state;
  final Future<void> Function() onRefresh;

  static List<PersonalAssetItem> _skeletonList(int count) => List.generate(
        count,
        (i) => PersonalAssetItem(
          assetCode: 'TS-00$i',
          tsAssetName: 'Tên tài sản skeleton text dài',
          assetType: 'Loại skeleton',
          tsAssetCode: 'LTS-00$i',
          seri: 'SN-00$i',
          status: 'active',
        ),
      );

  @override
  Widget build(BuildContext context) {
    final assets = state.personalAsset;
    final loading = state.status == BaseStateStatus.loading;
    final failed = state.status == BaseStateStatus.failed;
    final isInitialLoading = loading && assets.isEmpty;

    if (failed && assets.isEmpty) {
      return _ErrorState(
        message: state.message,
        onRetry: () {
          context.read<PersonalAssetBloc>().add(
                const PersonalAssetEvent.init(),
              );
        },
      );
    }

    final displayItems = isInitialLoading ? _skeletonList(3) : assets;

    if (displayItems.isEmpty && !isInitialLoading) {
      return const _EmptyState(
        icon: Icons.inventory_2_outlined,
        title: 'Chưa có tài sản',
        subtitle: 'Thông tin tài sản cá nhân của bạn trống.',
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primaryERP,
      child: Skeletonizer(
        containersColor: AppColors.white,
        enabled: isInitialLoading,
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          itemCount: displayItems.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final item = displayItems[index];
            return PersonalAssetCard(
              item: item,
              onTap: () {
                context.push(
                  RouteNames.personalAssetDetail,
                  extra: item,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shared: Error / Empty state
// ---------------------------------------------------------------------------

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String? message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 64, color: AppColors.gray),
            const SizedBox(height: 16),
            Text(
              message ?? 'Tải dữ liệu thất bại',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: AppColors.gray),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onRetry,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
              ),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 72, color: AppColors.gray.withValues(alpha: 0.5)),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.heading,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: AppColors.gray),
            ),
          ],
        ),
      ),
    );
  }
}
