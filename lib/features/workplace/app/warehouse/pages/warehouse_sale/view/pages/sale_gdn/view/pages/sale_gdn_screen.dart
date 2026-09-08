import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/bloc/bloc_status.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/helpers/select_bottom_sheet_helper.dart';
import 'package:rtc_erp/common/utils/navigation/navigation_utils.dart';
import 'package:rtc_erp/common/widgets/date_range_picker.dart';
import 'package:rtc_erp/base/widgets/qr_barcode_scanner_page.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/bloc/sale_gdn_bloc.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/widgets/sale_gdn_card.dart';
import 'package:rtc_erp/routes/route_names.dart';

class SaleGdnScreen extends StatefulWidget {
  /// `areaId` của khu vực đang chọn (ví dụ `warehouse_area:ha_noi`).
  /// Null = mặc định "HN".
  final String? areaId;

  const SaleGdnScreen({super.key, this.areaId});

  @override
  State<SaleGdnScreen> createState() => _SaleGdnScreenState();
}

class _SaleGdnScreenState
    extends BaseState<SaleGdnScreen, SaleGdnEvent, SaleGdnState, SaleGdnBloc> {
  @override
  void initState() {
    super.initState();
    // Map areaId → warehouseCode (HN/HCM/BN) rồi set cho bloc.
    final code = _mapAreaIdToWarehouseCode(widget.areaId);
    bloc.add(SaleGdnEvent.setWarehouseCode(code));
    bloc.add(const SaleGdnEvent.init());
    bloc.add(const SaleGdnEvent.fetchWarehouseTypes());
    // Pre-fetch lookup data (suppliers, senders, customers, etc.) so detail
    // screen has data ready immediately without additional API calls.
    bloc.add(const SaleGdnEvent.prefetchLookupData());
  }

  /// Map `areaId` từ màn chọn khu vực sang `warehouseCode` truyền cho API.
  /// - Hà Nội → "HN"
  /// - Hồ Chí Minh → "HCM"
  /// - Bắc Ninh → "BN"
  /// Trả về null nếu không khớp để giữ nguyên `warehouseCode` mặc định của bloc.
  static String? _mapAreaIdToWarehouseCode(String? areaId) {
    switch (areaId) {
      case 'warehouse_area:ha_noi':
        return 'HN';
      case 'warehouse_area:ho_chi_minh':
        return 'HCM';
      case 'warehouse_area:bac_ninh':
        return 'BN';
      default:
        return null;
    }
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
                prev.selectedStatus != curr.selectedStatus ||
                prev.selectedSenderName != curr.selectedSenderName ||
                prev.selectedReceiverName != curr.selectedReceiverName,
            builder: (context, state) {
              final hasFilter = state.selectedWarehouseTypeIds.isNotEmpty ||
                  state.selectedStatus != -1 ||
                  state.selectedSenderName != null ||
                  state.selectedReceiverName != null;
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
        final allGdns = state.gdns;
        final filteredGdns = allGdns.where((g) {
          if (state.selectedSenderName != null && g.fullNameSender != state.selectedSenderName) {
            return false;
          }
          if (state.selectedReceiverName != null &&
              g.receiverFullName != state.selectedReceiverName) {
            return false;
          }
          return true;
        }).toList();

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
        if (filteredGdns.isEmpty) {
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
            itemCount: filteredGdns.length + 1,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              if (index == 0) {
                return _ListHeader(
                  total: filteredGdns.length,
                  dateStart: state.dateStart,
                  dateEnd: state.dateEnd,
                  isSearching: state.searchKeyword.isNotEmpty,
                );
              }
              final item = filteredGdns[index - 1];
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
        selectedSenderName: bloc.state.selectedSenderName,
        selectedReceiverName: bloc.state.selectedReceiverName,
        gdns: bloc.state.gdns,
        onApply: (warehouseTypeIds, status, senderName, receiverName) {
          if (warehouseTypeIds != bloc.state.selectedWarehouseTypeIds) {
            bloc.add(SaleGdnEvent.filterByWarehouseType(warehouseTypeIds));
          }
          if (status != bloc.state.selectedStatus) {
            bloc.add(SaleGdnEvent.filterByStatus(status));
          }
          if (senderName != bloc.state.selectedSenderName) {
            bloc.add(SaleGdnEvent.filterBySenderName(senderName));
          }
          if (receiverName != bloc.state.selectedReceiverName) {
            bloc.add(SaleGdnEvent.filterByReceiver(receiverName));
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
    required this.selectedSenderName,
    required this.selectedReceiverName,
    required this.gdns,
    required this.onApply,
    required this.onClear,
  });

  final List<TypeWarehouseResponse> warehouseTypes;
  final List<int> selectedWarehouseTypeIds;
  final int selectedStatus;
  final String? selectedSenderName;
  final String? selectedReceiverName;
  final List<BillExporResponse> gdns;
  final void Function(List<int> warehouseTypeIds, int status, String? senderName, String? receiverName) onApply;
  final VoidCallback onClear;

  @override
  State<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<_FilterSheet> {
  late List<int> _selectedWarehouseTypeIds;
  late int _selectedStatus;
  late String? _selectedSenderName;
  late String? _selectedReceiverName;

  @override
  void initState() {
    super.initState();
    _selectedWarehouseTypeIds = List<int>.from(widget.selectedWarehouseTypeIds);
    _selectedStatus = widget.selectedStatus;
    _selectedSenderName = widget.selectedSenderName;
    _selectedReceiverName = widget.selectedReceiverName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
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
                  // Người giao
                  _buildPersonField(
                    label: 'Người giao',
                    selectedValue: _selectedSenderName,
                    onTap: () => _openUserSheet(),
                    onClear: () => setState(() => _selectedSenderName = null),
                  ),
                  const SizedBox(height: 16),
                  // Người nhận
                  _buildPersonField(
                    label: 'Người nhận',
                    selectedValue: _selectedReceiverName,
                    onTap: () => _openReceiverSheet(),
                    onClear: () => setState(() => _selectedReceiverName = null),
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
                        widget.onApply(
                          _selectedWarehouseTypeIds,
                          _selectedStatus,
                          _selectedSenderName,
                          _selectedReceiverName,
                        );
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

  Widget _buildPersonField({
    required String label,
    required Object? selectedValue,
    required VoidCallback onTap,
    required VoidCallback onClear,
  }) {
    final hasValue = selectedValue != null &&
        (selectedValue is! String || selectedValue.isNotEmpty);
    String displayText;
    if (!hasValue) {
      displayText = 'Chọn $label';
    } else {
      displayText = selectedValue as String;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.heading,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.grey_bg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderColor),
            ),
            child: Row(
              children: [
                const Icon(Icons.person_outline, color: AppColors.gray, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    displayText,
                    style: TextStyle(
                      fontSize: 15,
                      color: hasValue
                          ? AppColors.heading
                          : AppColors.gray.withValues(alpha: 0.6),
                    ),
                  ),
                ),
                if (hasValue)
                  GestureDetector(
                    onTap: onClear,
                    child: const Icon(Icons.close, color: AppColors.gray, size: 20),
                  )
                else
                  const Icon(Icons.keyboard_arrow_down, color: AppColors.gray, size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _openUserSheet() {
    openSelectBottomSheet<String>(
      context: context,
      title: 'Chọn người giao',
      items: _senderNames(),
      displayText: (name) => name,
      hintText: 'Tìm theo tên...',
      initialSelectedItem: _selectedSenderName,
      onSelected: (name) {
        setState(() => _selectedSenderName = name);
      },
    );
  }

  List<String> _senderNames() {
    return widget.gdns
        .map((g) => g.fullNameSender)
        .where((name) => name != null && name.isNotEmpty)
        .map((name) => name!)
        .toSet()
        .toList()
      ..sort();
  }

  void _openReceiverSheet() {
    final receiverNames = widget.gdns
        .map((g) => g.receiverFullName)
        .where((name) => name != null && name.isNotEmpty)
        .map((name) => name!)
        .toSet()
        .toList()
      ..sort();
    openSelectBottomSheet<String>(
      context: context,
      title: 'Chọn người nhận',
      items: receiverNames,
      displayText: (name) => name,
      hintText: 'Tìm theo tên...',
      initialSelectedItem: receiverNames.contains(_selectedReceiverName) ? _selectedReceiverName : null,
      onSelected: (name) {
        setState(() => _selectedReceiverName = name);
      },
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
