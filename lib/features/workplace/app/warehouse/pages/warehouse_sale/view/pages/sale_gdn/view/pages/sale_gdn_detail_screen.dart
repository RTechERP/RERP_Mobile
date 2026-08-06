import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:rtc_erp/base/bloc/bloc_status.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/bloc/sale_gdn_bloc.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_detail_image_flow.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_detail_item_card.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_empty_view.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_error_view.dart';

import '../../../../../../../../../../../common/utils/snack_bar_helper.dart';

/// Màn chi tiết phiếu xuất kho.
class SaleGdnDetailScreen extends StatefulWidget {
  const SaleGdnDetailScreen({super.key, required this.billId, this.bill});

  final int billId;
  final BillExporResponse? bill;

  @override
  State<SaleGdnDetailScreen> createState() => _SaleGdnDetailScreenState();
}

class _SaleGdnDetailScreenState
    extends BaseState<SaleGdnDetailScreen, SaleGdnEvent, SaleGdnState, SaleGdnBloc> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(SaleGdnEvent.initDetail(id: widget.billId, bill: widget.bill));
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<SaleGdnBloc, SaleGdnState>(
      listenWhen: (p, c) =>
          p.detail?.uploadStatus != c.detail?.uploadStatus,
      listener: (context, state) {
        final detail = state.detail;
        if (detail == null) return;

        // Upload thất bại
        if (detail.uploadStatus == BaseStateStatus.failed) {
          context.showMessage(
            detail.message ?? 'Upload thất bại',
            type: SnackBarType.error,
          );
          // Clear status after showing message
          bloc.add(SaleGdnEvent.clearUploadStatus());
        }

        // Upload thành công
        if (detail.uploadStatus == BaseStateStatus.success) {
          context.showMessage(
            'Upload thành công',
            type: SnackBarType.success,
          );
          // Clear status after showing message
          bloc.add(SaleGdnEvent.clearUploadStatus());
        }
      },
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        BaseScaffold(
          appBar: AppBarCommon(
            title: Text(widget.bill?.code ?? 'Chi tiết phiếu xuất'),
            onBackTap: () => context.pop(),
          ),
          body: blocBuilder((context, state) {
            final detail = state.detail;
            if (detail == null) {
              return const Center(child: CircularProgressIndicator());
            }

            if (detail.status == BaseStateStatus.loading && detail.details.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            if (detail.status == BaseStateStatus.failed && detail.details.isEmpty) {
              return SaleGdnErrorView(
                message: detail.message ?? 'Đã xảy ra lỗi',
                onRetry: () => bloc.add(
                  SaleGdnEvent.initDetail(id: widget.billId, bill: widget.bill),
                ),
              );
            }
            if (detail.details.isEmpty) {
              return const SaleGdnEmptyView();
            }

            // Map trực tiếp theo childId (cùng key với bloc dùng để gọi
            // `getBillExportFiles(billExportDetailId: childId)`). Tránh phụ
            // thuộc `stt` vối có thể khác giữa ViewGDNDetailResponse và
            // DetailGDNResponse.
            final childIdToServerFiles = <int, List<ReadFileResponse>>{};
            for (final full in detail.detailFull) {
              final cid = full.childId;
              if (cid != null && cid > 0) {
                childIdToServerFiles[cid] =
                    detail.serverImagesByChildId[cid] ?? [];
              }
            }

            return RefreshIndicator(
              onRefresh: () async => bloc.add(
                SaleGdnEvent.initDetail(id: widget.billId, bill: widget.bill),
              ),
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: detail.details.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final detailItem = detail.details[index];
                  final stt = detailItem.stt ?? (index + 1);
                  // Tra `childId` từ DetailGDNResponse theo cùng vị trí `stt`.
                  DetailGDNResponse? matchedFull;
                  for (final f in detail.detailFull) {
                    final fStt = f.stt ?? (detail.detailFull.indexOf(f) + 1);
                    if (fStt == stt) {
                      matchedFull = f;
                      break;
                    }
                  }
                  matchedFull ??= detail.detailFull.isNotEmpty
                      ? detail.detailFull[index.clamp(0, detail.detailFull.length - 1)]
                      : null;
                  final childId = matchedFull?.childId;
                  final serverFiles = childId != null && childId > 0
                      ? childIdToServerFiles[childId] ?? []
                      : <ReadFileResponse>[];
                  final serverUrls = serverFiles
                      .where((f) =>
                          (f.serverPath ?? '').isNotEmpty &&
                          (f.fileName ?? '').isNotEmpty)
                      .map((f) =>
                          _fixFileUrl('${f.serverPath}\\${f.fileName}'))
                      .where((u) => u.isNotEmpty)
                      .toList();

                  return SaleGdnDetailItemCard(
                    item: detailItem,
                    index: index + 1,
                    localImagePaths: detail.localImagePathsByStt[stt] ?? [],
                    serverImageUrls: serverUrls,
                    onAddImages: () => _addImages(stt),
                    onRemoveImage: (imageIndex, isLocal) =>
                        _removeImage(stt, imageIndex, isLocal),
                  );
                },
              ),
            );
          }),
        ),
        BlocBuilder<SaleGdnBloc, SaleGdnState>(
          buildWhen: (p, c) =>
              p.detail?.uploadStatus != c.detail?.uploadStatus,
          builder: (context, state) {
            final isUploading =
                state.detail?.uploadStatus == BaseStateStatus.loading &&
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
  }

  Future<void> _addImages(int stt) async {
    final confirmed = await showSaleGdnDetailImageFlow(context);
    if (confirmed == null || confirmed.isEmpty) return;

    bloc.add(SaleGdnEvent.addImages(stt: stt, imagePaths: confirmed));
  }

  void _removeImage(int stt, int imageIndex, bool isLocal) {
    bloc.add(SaleGdnEvent.removeImage(
      stt: stt,
      imageIndex: imageIndex,
      isLocal: isLocal,
    ));
  }

  String _fixFileUrl(String? path) {
    if (path == null || path.isEmpty) return '';

    final baseUrl = dotenv.env['BASE_URL'] ?? '';
    final newPrefix = '${baseUrl.replaceFirst(RegExp(r'/$'), '')}/share';

    // Thêm http:// nếu thiếu scheme (//192.168.1.190/... → http://192.168.1.190/...)
    final normalized = path.startsWith('//')
        ? 'https:${path}'
        : path;

    if (normalized.contains('192.168.1.190')) {
      final relative = normalized.split('192.168.1.190').last;
      return '$newPrefix$relative';
    }
    if (normalized.startsWith('http://') || normalized.startsWith('https://')) {
      return normalized;
    }
    return 'http://$normalized';
  }
}
