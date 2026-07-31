import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/bloc/bloc_status.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/utils/dialog/dialog_service.dart';
import 'package:rtc_erp/common/utils/navigation/navigation_utils.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/bloc/sale_gdn_bloc.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_card.dart';

class SaleGdnScreen extends StatefulWidget {
  const SaleGdnScreen({super.key});

  @override
  State<SaleGdnScreen> createState() => _SaleGdnScreenState();
}

class _SaleGdnScreenState
    extends BaseState<SaleGdnScreen, SaleGdnEvent, SaleGdnState, SaleGdnBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const SaleGdnEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Phiếu xuất kho'),
        onBackTap: () => onBack(context),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _showSearchDialog,
            tooltip: 'Tìm kiếm',
          ),
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: _onQrScan,
            tooltip: 'Quét QR',
          ),
        ],
      ),
      body: blocBuilder((context, state) {
        final gdns = state.gdns;
        if (state.status == BaseStateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status == BaseStateStatus.failed) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline,
                    size: 48, color: AppColors.stateErrorColor),
                const SizedBox(height: 16),
                Text(
                  state.message ?? 'Đã xảy ra lỗi',
                  style: const TextStyle(color: AppColors.stateErrorColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => bloc.add(const SaleGdnEvent.fetchGdns()),
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          );
        }
        if (gdns.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.inbox_outlined,
                  size: 64,
                  color: AppColors.gray.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 16),
                Text(
                  state.searchKeyword.isNotEmpty
                      ? 'Không tìm thấy phiếu'
                      : 'Chưa có phiếu xuất kho',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.gray.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            bloc.add(const SaleGdnEvent.fetchGdns());
          },
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: gdns.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = gdns[index];
              return SaleGdnCard(
                item: item,
                onTap: () {
                },
              );
            },
          ),
        );
      }),
    );
  }

  void _showSearchDialog() {
    final controller =
        TextEditingController(text: bloc.state.searchKeyword);
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(Icons.search, color: AppColors.primaryERP, size: 28),
                  const SizedBox(width: 12),
                  const Text(
                    'Tìm kiếm phiếu',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.enableText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TextField(
                controller: controller,
                autofocus: true,
                textInputAction: TextInputAction.search,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'Nhập số phiếu...',
                  hintStyle: TextStyle(color: AppColors.gray.withValues(alpha: 0.6)),
                  prefixIcon: const Icon(Icons.receipt_long_outlined, color: AppColors.gray),
                  filled: true,
                  fillColor: AppColors.grey_bg,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.primaryERP, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    bloc.add(SaleGdnEvent.searchByVoucherNumber(value.trim()));
                  }
                  ctx.pop();
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        bloc.add(const SaleGdnEvent.clearSearch());
                        ctx.pop();
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
                        'Xóa',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final value = controller.text.trim();
                        if (value.isNotEmpty) {
                          bloc.add(SaleGdnEvent.searchByVoucherNumber(value));
                        }
                        ctx.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryERP,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Tìm',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onQrScan() {
    DialogService.showProcessing(context: context);
  }
}
