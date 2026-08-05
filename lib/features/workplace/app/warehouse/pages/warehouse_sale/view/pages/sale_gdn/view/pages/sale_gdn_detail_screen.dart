import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:rtc_erp/base/bloc/bloc_status.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/di/injection.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/bloc/sale_gdn_bloc.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_detail_image_flow.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_detail_item_card.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_empty_view.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_error_view.dart';

import '../../../../../../../../../../../common/utils/snack_bar_helper.dart';

/// Màn chi tiết phiếu xuất kho.
class SaleGdnDetailScreen extends StatelessWidget {
  const SaleGdnDetailScreen({super.key, required this.billId, this.bill});

  final int billId;
  final BillExporResponse? bill;

  static Route<void> route({required int billId, BillExporResponse? bill}) {
    return MaterialPageRoute<void>(
      builder: (_) => SaleGdnDetailScreen(billId: billId, bill: bill),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SaleGdnBloc>.value(
      value: getIt<SaleGdnBloc>()
        ..add(SaleGdnEvent.initDetail(id: billId, bill: bill)),
      child: _SaleGdnDetailView(billId: billId, bill: bill),
    );
  }
}

class _SaleGdnDetailView extends StatelessWidget {
  const _SaleGdnDetailView({required this.billId, this.bill});

  final int billId;
  final BillExporResponse? bill;

  void _reload(BuildContext context) {
    context.read<SaleGdnBloc>().add(
      SaleGdnEvent.initDetail(id: billId, bill: bill),
    );
  }

  /// Mở flow chọn ảnh cho dòng có `stt` tương ứng, dispatch AddImages và tự động upload.
  Future<void> _addImages(BuildContext context, int stt) async {
    final confirmed = await showSaleGdnDetailImageFlow(context);
    if (confirmed == null || confirmed.isEmpty) return;
    if (!context.mounted) return;

    context.read<SaleGdnBloc>().add(
      SaleGdnEvent.addImages(stt: stt, imagePaths: confirmed),
    );

    // Tự động upload sau khi thêm ảnh
    await Future.delayed(const Duration(milliseconds: 100));
    if (context.mounted) {
      context.read<SaleGdnBloc>().add(SaleGdnEvent.submitImages());
    }
  }

  /// Xoá 1 ảnh theo `stt` và chỉ số ảnh trong dòng đó.
  /// Nếu `isLocal=true` thì xoá local, ngược lại xoá server.
  void _removeImage(BuildContext context, int stt, int imageIndex, bool isLocal) {
    context.read<SaleGdnBloc>().add(
      SaleGdnEvent.removeImage(stt: stt, imageIndex: imageIndex, isLocal: isLocal),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SaleGdnBloc, SaleGdnState>(
      listenWhen: (p, c) => p.detail?.status != c.detail?.status,
      listener: (context, state) {
        final detail = state.detail;
        if (detail == null) return;

        // Upload thất bại
        if (detail.status == BaseStateStatus.failed) {
          context.showMessage(
            state.message ?? 'Upload thất bại',
            type: SnackBarType.error,
          );
        }

        // Upload thành công
        if (detail.status == BaseStateStatus.success &&
            detail.uploadedImages.isNotEmpty) {
          context.showMessage(
            'Upload thành công ${detail.uploadedImages.length} ảnh',
            type: SnackBarType.success,
          );
        }
      },
      buildWhen: (p, c) => p.detail != c.detail,
      builder: (context, state) {
        final detail = state.detail;
        if (detail == null) {
          return BaseScaffold(
            appBar: AppBarCommon(
              title: Text(bill?.code ?? 'Chi tiết phiếu xuất'),
              onBackTap: () => context.pop(),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        return Stack(
          children: [
            BaseScaffold(
              appBar: AppBarCommon(
                title: Text(bill?.code ?? 'Chi tiết phiếu xuất'),
                onBackTap: () => context.pop(),
              ),
              body: _buildBody(context, detail),
            ),
            BlocBuilder<SaleGdnBloc, SaleGdnState>(
              buildWhen: (p, c) =>
                  p.detail?.status != c.detail?.status,
              builder: (context, state) {
                final isUploading =
                    state.detail?.status == BaseStateStatus.loading &&
                    (state.detail?.details.isNotEmpty ?? false);
                if (!isUploading) {
                  return const SizedBox.shrink();
                }
                return Positioned.fill(
                  child: AbsorbPointer(
                    absorbing: true,
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.45),
                      alignment: Alignment.center,
                      child: Lottie.asset(
                        'assets/lotties/Loading.json',
                        width: 240,
                        height: 240,
                        repeat: true,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, GdnDetailState detail) {
    if (detail.status == BaseStateStatus.loading && detail.details.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (detail.status == BaseStateStatus.failed && detail.details.isEmpty) {
      return SaleGdnErrorView(
        message: detail.message ?? 'Đã xảy ra lỗi',
        onRetry: () => _reload(context),
      );
    }
    if (detail.details.isEmpty) {
      return const SaleGdnEmptyView();
    }

    // Build stt -> childId map from detailFull
    final sttToChildId = <int, int>{};
    for (final full in detail.detailFull) {
      final stt = full.stt ?? (detail.detailFull.indexOf(full) + 1);
      if (full.childId != null && full.childId! > 0) {
        sttToChildId[stt] = full.childId!;
      }
    }

    return RefreshIndicator(
      onRefresh: () async => _reload(context),
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: detail.details.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final detailItem = detail.details[index];
          final stt = detailItem.stt ?? (index + 1);
          final childId = sttToChildId[stt];
          final serverFiles = childId != null
              ? detail.serverImagesByChildId[childId] ?? []
              : <ReadFileResponse>[];
          final serverUrls = serverFiles
              .where((f) => f.serverPath != null && f.serverPath!.isNotEmpty)
              .map((f) => _fixFileUrl('${f.serverPath}\\${f.fileName ?? ''}'))
              .toList();

          return SaleGdnDetailItemCard(
            item: detailItem,
            index: index + 1,
            localImagePaths: detail.localImagePathsByStt[stt] ?? [],
            serverImageUrls: serverUrls,
            onAddImages: () => _addImages(context, stt),
            onRemoveImage: (imageIndex, isLocal) =>
                _removeImage(context, stt, imageIndex, isLocal),
          );
        },
      ),
    );
  }

  String _fixFileUrl(String? path) {
    if (path == null || path.isEmpty) return '';

    final baseUrl = dotenv.env['BASE_URL'] ?? '';
    final newPrefix = '${baseUrl.replaceFirst(RegExp(r'/$'), '')}/share';

    // Bỏ prefix /api nếu có (để tránh /api/api/share)
    var normalized = path;
    if (normalized.startsWith('/api/')) {
      normalized = normalized.substring(4);
    }

    // Thêm https: nếu thiếu scheme (//192.168.1.190/... → https://192.168.1.190/...)
    if (normalized.startsWith('//')) {
      normalized = 'https:$normalized';
    }

    // Chuẩn hóa backslash thành forward slash
    normalized = normalized.replaceAll('\\', '/');

    // Xử lý IP local: thay bằng baseUrl/share
    if (normalized.contains('192.168.') || normalized.contains('10.')) {
      final ipMatch = RegExp(r'[\d]+\.[\d]+\.[\d]+\.[\d]+[:\d]*').firstMatch(normalized);
      if (ipMatch != null) {
        final relative = normalized.substring(ipMatch.end);
        return '$newPrefix$relative';
      }
    }

    // Nếu là đường dẫn tuyệt đối có scheme
    if (normalized.startsWith('http://') || normalized.startsWith('https://')) {
      return normalized;
    }

    // Nếu đã có /share thì thêm baseUrl
    if (normalized.startsWith('/share/')) {
      return '$baseUrl$normalized';
    }

    // Ngược lại thêm prefix
    return '$newPrefix/$normalized';
  }
}
