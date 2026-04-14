// Date: 14/04/2026 - Dev: Claude
// Nội dung/Chức năng: Màn hình tài sản cá nhân - danh sách tài sản

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
import '../../data/datasource/models/personal_asset_model.dart';
import '../bloc/personal_asset_bloc.dart';
import '../widgets/personal_asset_card.dart';

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class PersonalAssetScreen extends StatefulWidget {
  const PersonalAssetScreen({super.key});

  @override
  State<PersonalAssetScreen> createState() => _PersonalAssetScreenState();
}

class _PersonalAssetScreenState extends BaseState<PersonalAssetScreen, PersonalAssetEvent, PersonalAssetState, PersonalAssetBloc> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const PersonalAssetEvent.init());
    });
  }
  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<PersonalAssetBloc, PersonalAssetState>(
      listenWhen: (prev, curr) =>
          (curr.message != null && prev.message != curr.message),
      listener: (context, state) {
        if ((state.message ?? '').isNotEmpty &&
            state.status == BaseStateStatus.failed) {
          context.showMessage(state.message!, type: SnackBarType.error);
        }
      },
      child: BlocBuilder<PersonalAssetBloc, PersonalAssetState>(
        builder: (context, state) {
          final assets = state.personalAsset;
          final loading = state.status == BaseStateStatus.loading;
          final failed = state.status == BaseStateStatus.failed;
          final isInitialLoading = loading && assets.isEmpty;

          return BaseScaffold(
            appBar: AppBarCommon(
              onBackTap: () => context.pop(),
              title: const Text(
                'Tài sản cá nhân',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                ),
              ),
            ),
            body: _AssetTabBody(
              assets: assets,
              isInitialLoading: isInitialLoading,
              failed: failed,
              message: state.message,
              onRetry: () {
                context.read<PersonalAssetBloc>().add(
                      const PersonalAssetEvent.init(),
                    );
              },
            ),
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Tab: Tài sản cá nhân
// ---------------------------------------------------------------------------

class _AssetTabBody extends StatelessWidget {
  const _AssetTabBody({
    required this.assets,
    required this.isInitialLoading,
    required this.failed,
    required this.message,
    required this.onRetry,
  });

  final List<PersonalAssetItem> assets;
  final bool isInitialLoading;
  final bool failed;
  final String? message;
  final VoidCallback onRetry;

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
    if (failed && assets.isEmpty) {
      return _ErrorState(message: message, onRetry: onRetry);
    }

    final displayItems = isInitialLoading ? _skeletonList(3) : assets;

    if (displayItems.isEmpty && !isInitialLoading) {
      return const _EmptyState(
        icon: Icons.inventory_2_outlined,
        title: 'Chưa có tài sản',
        subtitle: 'Thông tin tài sản cá nhân của bạn trống.',
      );
    }

    return Skeletonizer(
      containersColor: AppColors.white,
      enabled: isInitialLoading,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        itemCount: displayItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = displayItems[index];
          return PersonalAssetCard(
            item: item,
            onTap: () {},
          );
        },
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