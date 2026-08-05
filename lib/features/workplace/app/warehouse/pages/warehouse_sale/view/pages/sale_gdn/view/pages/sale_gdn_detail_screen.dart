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
      listenWhen: (p, c) => p.detail?.status != c.detail?.status,
      listener: (context, state) {
        final detail = state.detail;
        if (detail == null) return;

        // Upload thất bại
        if (detail.uploadStatus == BaseStateStatus.failed) {
          context.showMessage(
            state.message ?? 'Upload thất bại',
            type: SnackBarType.error,
          );
        }

        // Upload thành công
        if (detail.uploadStatus == BaseStateStatus.success &&
            detail.uploadedImages.isNotEmpty) {
          context.showMessage(
            'Upload thành công ${detail.uploadedImages.length} ảnh',
            type: SnackBarType.success,
          );
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

            final sttToChildId = <int, int>{};
            for (final full in detail.detailFull) {
              final stt = full.stt ?? (detail.detailFull.indexOf(full) + 1);
              if (full.childId != null && full.childId! > 0) {
                sttToChildId[stt] = full.childId!;
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

    await Future.delayed(const Duration(milliseconds: 100));
    bloc.add(SaleGdnEvent.submitImages());
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

    var normalized = path;
    if (normalized.startsWith('/api/')) {
      normalized = normalized.substring(4);
    }

    if (normalized.startsWith('//')) {
      normalized = 'https:$normalized';
    }

    normalized = normalized.replaceAll('\\', '/');

    if (normalized.contains('192.168.') || normalized.contains('10.')) {
      final ipMatch = RegExp(r'[\d]+\.[\d]+\.[\d]+\.[\d]+[:\d]*').firstMatch(normalized);
      if (ipMatch != null) {
        final relative = normalized.substring(ipMatch.end);
        return '$newPrefix$relative';
      }
    }

    if (normalized.startsWith('http://') || normalized.startsWith('https://')) {
      return normalized;
    }

    if (normalized.startsWith('/share/')) {
      return '$baseUrl$normalized';
    }

    return '$newPrefix/$normalized';
  }
}
