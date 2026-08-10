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
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_form.dart';

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

        // Upload/xoá thất bại
        if (detail.uploadStatus == BaseStateStatus.failed) {
          context.showMessage(
            detail.message ?? 'Lưu ảnh thất bại',
            type: SnackBarType.error,
          );
          // Clear status after showing message
          bloc.add(SaleGdnEvent.clearUploadStatus());
        }

        // Upload/xoá thành công
        if (detail.uploadStatus == BaseStateStatus.success) {
          context.showMessage(
            detail.message ?? 'Upload thành công',
            type: SnackBarType.success,
          );
          // Clear status after showing message.
          // KHÔNG pop màn detail: nếu user vẫn muốn xem/ sửa tiếp thì ở lại.
          // Ảnh đã được server cập nhật qua API save-data.
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

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              // +1 cho bill info card ở đầu.
              itemCount: detail.details.length + 1,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                // Index 0: Form phiếu chi tiết (SaleGdnForm).
                if (index == 0) {
                  return SaleGdnForm(
                    detail: detail,
                    suppliers: bloc.state.suppliers,
                    senders: bloc.state.senders,
                    customers: bloc.state.customers,
                    warehouses: bloc.state.warehouses,
                    warehouseTypes: bloc.state.warehouseTypes,
                    users: bloc.state.users,
                    addressStocks: bloc.state.addressStocks,
                    currentWarehouseCode: bloc.state.warehouseCode,
                    onFetchAddressStockByCustomer: (customerId) => bloc.add(
                      SaleGdnEvent.fetchAddressStockByCustomer(customerId: customerId),
                    ),
                    onSelectSupplier: (id) => bloc.add(
                      SaleGdnEvent.selectSupplier(id),
                    ),
                    onSelectSender: (id) => bloc.add(
                      SaleGdnEvent.selectSender(id),
                    ),
                    onSelectReceiver: (id) => bloc.add(
                      SaleGdnEvent.selectReceiver(id),
                    ),
                    onSelectCustomer: (id) => bloc.add(
                      SaleGdnEvent.selectCustomer(id),
                    ),
                    onSelectCustomerWithAddress: (id, address) => bloc.add(
                      SaleGdnEvent.selectCustomerWithAddress(
                        customerId: id,
                        address: address,
                      ),
                    ),
                    onSelectKhoType: (id) => bloc.add(
                      SaleGdnEvent.selectKhoType(id),
                    ),
                    onSelectProductType: (id) => bloc.add(
                      SaleGdnEvent.selectProductType(id),
                    ),
                    onSelectStatus: (id) => bloc.add(
                      SaleGdnEvent.selectStatus(id),
                    ),
                    onChangeDeliveryDate: (date) => bloc.add(
                      SaleGdnEvent.changeDeliveryDate(date),
                    ),
                    onChangeRequestDate: (date) => bloc.add(
                      SaleGdnEvent.changeRequestDate(date),
                    ),
                    onChangeReceiveTime: (time) => bloc.add(
                      SaleGdnEvent.changeReceiveTime(time),
                    ),
                    onSelectLoaiKho: (text) => bloc.add(
                      SaleGdnEvent.selectLoaiKho(text),
                    ),
                    onToggleTransferInternal: (v) => bloc.add(
                      SaleGdnEvent.toggleTransferInternal(value: v),
                    ),
                    onToggleInternal: (v) => bloc.add(
                      SaleGdnEvent.toggleInternal(value: v),
                    ),
                    onSelectInternalWarehouse: (id) => bloc.add(
                      SaleGdnEvent.selectInternalWarehouse(id),
                    ),
                    onSelectInternalKhoType: (id) => bloc.add(
                      SaleGdnEvent.selectInternalKhoType(id),
                    ),
                    onChangeDeliveryAddress: (address) => bloc.add(
                      SaleGdnEvent.changeDeliveryAddress(address),
                    ),
                    onSelectNcc: (id) => bloc.add(
                      SaleGdnEvent.selectNcc(id),
                    ),
                  );
                }
                final detailIndex = index - 1;
                final detailItem = detail.details[detailIndex];
                final stt = detailItem.stt ?? (detailIndex + 1);
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
                    ? detail.detailFull[
                        detailIndex.clamp(0, detail.detailFull.length - 1)]
                    : null;
                final childId = matchedFull?.childId;
                final serverFiles = childId != null && childId > 0
                    ? childIdToServerFiles[childId] ?? []
                    : <ReadFileResponse>[];

                // Tạo danh sách (url, fileId) cho server images của dòng này.
                final serverImages = serverFiles
                    .where((f) =>
                        (f.serverPath ?? '').isNotEmpty &&
                        (f.fileName ?? '').isNotEmpty)
                    .map((f) => (
                          url: _fixFileUrl(
                              '${f.serverPath}\\${f.fileName}'),
                          fileId: f.id,
                        ))
                    .where((rec) => rec.url.isNotEmpty)
                    .toList();

                return SaleGdnDetailItemCard(
                  item: detailItem,
                  index: detailIndex + 1,
                  localImagePaths:
                      detail.localImagePathsByStt[stt] ?? [],
                  serverImages: serverImages,
                  onAddImages: () => _addImages(stt),
                  onTapImage: (imageIndex, isLocal) {},
                  onMarkToDelete: ({fileId, localPath}) =>
                      _markToDelete(fileId: fileId, localPath: localPath),
                  onAfterMarkDelete: _afterMarkDelete,
                  pendingDeletedFileIds:
                      detail.pendingDeletedFileIds,
                  pendingDeletedLocalPaths:
                      detail.pendingDeletedLocalPaths,
                );
              },
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

  void _markToDelete({int? fileId, String? localPath}) {
    bloc.add(SaleGdnEvent.markImageToDelete(
      fileId: fileId,
      localPath: localPath,
    ));
  }

  /// Sau khi mark xoá 1 ảnh từ viewer:
  /// - Tự động submit lên server (upload + deletedFileIds).
  /// - Submit success → screen pop(true) + showMessage qua listener.
  void _afterMarkDelete() {
    bloc.add(const SaleGdnEvent.submitImages());
  }

  String _fixFileUrl(String? path) {
    if (path == null || path.isEmpty) return '';

    final baseUrl = dotenv.env['BASE_URL'] ?? '';
    final newPrefix = '${baseUrl.replaceFirst(RegExp(r'/$'), '')}/share';

    // Chuẩn hoá path: thay tất cả backslash `\` (UNC path Windows) thành
    // forward slash `/` để URL hợp lệ với HTTP. Đồng thời thêm scheme
    // nếu path bắt đầu bằng `//` (vd `//192.168.1.190/...` → `https://...`).
    var normalized = path.replaceAll('\\', '/');
    if (normalized.startsWith('//')) {
      normalized = 'https:$normalized';
    }

    if (normalized.contains('192.168.1.190')) {
      final relative = normalized.split('192.168.1.190').last;
      // Đảm bảo relative path bắt đầu bằng `/`.
      final withSlash = relative.startsWith('/') ? relative : '/$relative';
      return '$newPrefix$withSlash';
    }
    if (normalized.startsWith('http://') || normalized.startsWith('https://')) {
      return normalized;
    }
    return 'http://$normalized';
  }
}
