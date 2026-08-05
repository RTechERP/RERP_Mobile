import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/bloc/bloc_status.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/utils/navigation/navigation_utils.dart';
import 'package:rtc_erp/common/widgets/date_range_picker.dart';
import 'package:rtc_erp/base/widgets/qr_barcode_scanner_page.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/bloc/sale_gdn_bloc.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_card.dart';
import 'package:rtc_erp/routes/route_names.dart';

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
    bloc.add(const SaleGdnEvent.fetchWarehouseTypes());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<SaleGdnBloc, SaleGdnState>(
      listenWhen: (prev, curr) =>
          prev.openedDetailBill != curr.openedDetailBill ||
          prev.scanResultMessage != curr.scanResultMessage,
      listener: (context, state) {
        // Tự động mở trang Detail khi bloc tìm được đúng 1 phiếu từ QR/Barcode.
        final bill = state.openedDetailBill;
        if (bill != null && bill.id != null && bill.id! > 0) {
          context.push(RouteNames.warehouseSaleGdnDetail, extra: {
            'billId': bill.id,
            'bill': bill,
          });
          bloc.add(const SaleGdnEvent.clearOpenedDetail());
          bloc.add(const SaleGdnEvent.fetchGdns());
        }
        // Hiển thị snackbar khi không mở được Detail.
        final msg = state.scanResultMessage;
        if (msg != null && msg.isNotEmpty) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(msg)));
          bloc.add(const SaleGdnEvent.clearScanResultMessage());
        }
      },
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Phiếu xuất kho', style: TextStyle(fontSize: 17)),
        onBackTap: () => onBack(context),
        actions: [
          BlocBuilder<SaleGdnBloc, SaleGdnState>(
            buildWhen: (prev, curr) =>
                prev.dateStart != curr.dateStart ||
                prev.dateEnd != curr.dateEnd,
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.calendar_month_outlined),
                tooltip: 'Chọn ngày',
                onPressed: () => _pickDateRange(context),
              );
            },
          ),
          BlocBuilder<SaleGdnBloc, SaleGdnState>(
            buildWhen: (prev, curr) =>
                prev.selectedWarehouseTypeIds.length != curr.selectedWarehouseTypeIds.length ||
                prev.selectedStatus != curr.selectedStatus,
            builder: (context, state) {
              final hasFilter = state.selectedWarehouseTypeIds.isNotEmpty ||
                  state.selectedStatus != -1;
              return IconButton(
                icon: Icon(
                  Icons.filter_list,
                  color: hasFilter ? AppColors.primaryERP : null,
                ),
                tooltip: 'Bộ lọc',
                onPressed: _showFilterSheet,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _showSearchDialog,
            tooltip: 'Tìm kiếm',
          ),
          IconButton(
            icon: const Icon(Icons.qr_code_scanner_outlined),
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
            itemCount: gdns.length + 1,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              if (index == 0) {
                return _ListHeader(
                  total: gdns.length,
                  dateStart: state.dateStart,
                  dateEnd: state.dateEnd,
                  isSearching: state.searchKeyword.isNotEmpty,
                );
              }
              final item = gdns[index - 1];
              return SaleGdnCard(
                item: item,
                onTap: () => _openDetail(item),
              );
            },
          ),
        );
      }),
    );
  }

  void _openDetail(BillExporResponse item) {
    final id = item.id;
    if (id == null || id <= 0) return;
    context.push(RouteNames.warehouseSaleGdnDetail, extra: {
      'billId': id,
      'bill': item,
    });
  }

  /// Mở bottom sheet chọn khoảng ngày và dispatch ChangeDateRange khi user xác nhận.
  void _pickDateRange(BuildContext context) {
    final state = bloc.state;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: state.dateStart ?? today.subtract(const Duration(days: 30)),
        initialEnd: state.dateEnd ?? tomorrow,
        onApply: (start, end) {
          bloc.add(SaleGdnEvent.changeDateRange(
            dateStart: start,
            dateEnd: end,
          ));
        },
      ),
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

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) => _FilterSheet(
        warehouseTypes: bloc.state.warehouseTypes,
        selectedWarehouseTypeIds: bloc.state.selectedWarehouseTypeIds,
        selectedStatus: bloc.state.selectedStatus,
        onApply: (warehouseTypeIds, status) {
          if (warehouseTypeIds != bloc.state.selectedWarehouseTypeIds) {
            bloc.add(SaleGdnEvent.filterByWarehouseType(warehouseTypeIds));
          }
          if (status != bloc.state.selectedStatus) {
            bloc.add(SaleGdnEvent.filterByStatus(status));
          }
        },
        onClear: () => bloc.add(const SaleGdnEvent.clearFilters()),
      ),
    );
  }

  void _onQrScan() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Chọn chế độ quét',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.qr_code_scanner,
                    color: AppColors.primaryERP,
                  ),
                ),
                title: const Text('Quét mã QR'),
                subtitle: const Text('Quét mã QR từ phiếu xuất kho'),
                onTap: () {
                  Navigator.pop(sheetContext);
                  _openScanner(scanMode: ScanMode.qr);
                },
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.barcode_reader,
                    color: Colors.orange,
                  ),
                ),
                title: const Text('Quét mã vạch'),
                subtitle: const Text('Quét mã vạch từ phiếu xuất kho'),
                onTap: () {
                  Navigator.pop(sheetContext);
                  _openScanner(scanMode: ScanMode.barcode);
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openScanner({required ScanMode scanMode}) async {
    final code = await QrBarcodeScannerPage.open(
      context,
      scanMode: scanMode,
    );
    if (code == null || code.isEmpty || !mounted) return;

    // Sau khi quét QR/Barcode (chuỗi mã phiếu) → bloc tìm theo FilterText.
    // Nếu đúng 1 kết quả thì UI tự động mở trang Detail; ngược lại báo snackbar.
    bloc.add(SaleGdnEvent.scanQrToDetail(code));
  }
}

/// Danh sách trạng thái cố định.
const _statusOptions = [
  {'value': -1, 'label': 'Tất cả'},
  {'value': 0, 'label': 'Mượn'},
  {'value': 1, 'label': 'Tồn kho'},
  {'value': 2, 'label': 'Đã xuất kho'},
  {'value': 5, 'label': 'Xuất trả NCC'},
  {'value': 6, 'label': 'Y/C xuất kho'},
  {'value': 7, 'label': 'Y/C mượn'},
];

class _FilterSheet extends StatefulWidget {
  const _FilterSheet({
    required this.warehouseTypes,
    required this.selectedWarehouseTypeIds,
    required this.selectedStatus,
    required this.onApply,
    required this.onClear,
  });

  final List<TypeWarehouseResponse> warehouseTypes;
  final List<int> selectedWarehouseTypeIds;
  final int selectedStatus;
  final void Function(List<int> warehouseTypeIds, int status) onApply;
  final VoidCallback onClear;

  @override
  State<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<_FilterSheet> {
  late List<int> _selectedWarehouseTypeIds;
  late int _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedWarehouseTypeIds = List<int>.from(widget.selectedWarehouseTypeIds);
    _selectedStatus = widget.selectedStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
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
              'Bộ lọc',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.heading,
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  // Loại kho
                  const Text(
                    'Loại kho',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.heading,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.warehouseTypes.map((type) => _buildWarehouseChip(
                      id: type.id ?? -1,
                      label: type.productGroupName ?? '',
                    )).toList(),
                  ),
                  const SizedBox(height: 24),
                  // Trạng thái
                  const Text(
                    'Trạng thái',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.heading,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _statusOptions.map((opt) {
                      return _buildStatusChip(
                        value: opt['value'] as int,
                        label: opt['label'] as String,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        widget.onClear();
                        context.pop();
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
                        'Xóa lọc',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onApply(_selectedWarehouseTypeIds, _selectedStatus);
                        context.pop();
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
                        'Áp dụng',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWarehouseChip({required int id, required String label}) {
    final isSelected = _selectedWarehouseTypeIds.contains(id);
    return GestureDetector(
      onTap: () => setState(() {
        if (isSelected) {
          _selectedWarehouseTypeIds.remove(id);
        } else {
          _selectedWarehouseTypeIds.add(id);
        }
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryERP.withValues(alpha: 0.1)
              : AppColors.grey_bg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryERP : AppColors.borderColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              size: 18,
              color: isSelected ? AppColors.primaryERP : AppColors.grayColor,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: AppColors.heading,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip({required int value, required String label}) {
    final isSelected = _selectedStatus == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedStatus = value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryERP.withValues(alpha: 0.1)
              : AppColors.grey_bg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryERP : AppColors.borderColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primaryERP : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColors.primaryERP : AppColors.grayColor,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 12, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: AppColors.heading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Header hiển thị tổng số phiếu và khoảng ngày đang lọc.
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
    final isSameDay =
        hasRange && _isSameDay(dateStart!, dateEnd!);
    final rangeText = hasRange
        ? (isSameDay
            ? df.format(dateStart!)
            : '${df.format(dateStart!)} - ${df.format(dateEnd!)}')
        : null;

    return Container(
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
          // Tổng số phiếu
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

          // Khoảng ngày
          if (rangeText != null) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.event_outlined,
                    size: 14,
                    color: AppColors.primaryERP,
                  ),
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
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
