// Bottom-sheet hiển thị lịch sử giá của 1 sản phẩm.
//
// API: GET /ProjectPartlistPurchaseRequest/history-product-partlist?keyword=<mã SP>

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/approve_purchasing_model.dart';
import '../bloc/approve_purchasing_bloc.dart';

/// Sheet lịch sử giá sản phẩm.
///
/// Được mở từ nút "Lịch sử giá" trên card sản phẩm. Sheet tự đọc
/// state từ [ApprovePurchasingBloc] để hiển thị loading / lỗi / danh
/// sách — bloc được truyền vào tường minh vì bottom sheet mở trên
/// root navigator nên không kế thừa [BlocProvider] của màn hình.
class ProductPriceHistorySheet extends StatefulWidget {
  const ProductPriceHistorySheet({
    super.key,
    required this.bloc,
    required this.keyword,
    required this.productName,
  });

  /// Bloc chứa dữ liệu lịch sử giá.
  final ApprovePurchasingBloc bloc;

  /// Mã sản phẩm dùng làm query `keyword`.
  final String keyword;

  /// Tên sản phẩm để hiển thị trên header (có thể rỗng).
  final String productName;

  /// Mở sheet lịch sử giá và tự dispatch event tải dữ liệu.
  static Future<void> show(
    BuildContext context, {
    required ApprovePurchasingBloc bloc,
    required String keyword,
    String productName = '',
  }) {
    // Dispatch trước khi mở sheet để khi sheet build đã có loading.
    bloc.add(ApprovePurchasingEvent.loadPriceHistory(keyword: keyword));
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => ProductPriceHistorySheet(
        bloc: bloc,
        keyword: keyword,
        productName: productName,
      ),
    ).whenComplete(() {
      // Xoá dữ liệu khỏi state sau khi đóng sheet để lần mở sau luôn
      // tải mới, không dùng nhầm cache cũ.
      bloc.add(const ApprovePurchasingEvent.clearPriceHistory());
    });
  }

  @override
  State<ProductPriceHistorySheet> createState() =>
      _ProductPriceHistorySheetState();
}

class _ProductPriceHistorySheetState extends State<ProductPriceHistorySheet> {
  /// Controller của ô tìm kiếm trong lịch sử giá. Khởi tạo sẵn với
  /// mã sản phẩm đang xem.
  late final TextEditingController _searchCtrl =
      TextEditingController(text: widget.keyword);

  /// Timer debounce cho ô tìm kiếm — tránh gọi API liên tục khi user
  /// đang gõ.
  Timer? _debounce;

  /// Khoá tìm kiếm hiện tại đã gửi lên API.
  String _query = '';

  /// Thời gian chờ trước khi gọi API (ms).
  static const Duration _debounceDelay = Duration(milliseconds: 400);

  @override
  void dispose() {
    _debounce?.cancel();
    _searchCtrl.dispose();
    super.dispose();
  }

  /// Gọi API lịch sử giá theo từ khoá mới.
  ///
  /// Tìm kiếm là **server-side**: mỗi từ khoá gõ ra sẽ gọi lại
  /// `GET /ProjectPartlistPurchaseRequest/history-product-partlist?keyword=...`
  /// thay vì lọc client-side trên dữ liệu đã tải.
  void _search(String keyword) {
    final kw = keyword.trim();
    // Từ khoá rỗng → không gọi API, giữ nguyên kết quả đang hiển thị.
    if (kw.isEmpty) return;
    if (kw == _query) return;

    setState(() => _query = kw);
    widget.bloc.add(ApprovePurchasingEvent.loadPriceHistory(keyword: kw));
  }

  /// Xoá ô tìm kiếm → khôi phục lại mã sản phẩm ban đầu và gọi API.
  void _clearSearch() {
    _debounce?.cancel();
    _searchCtrl.text = widget.keyword;
    _searchCtrl.selection = TextSelection.collapsed(
      offset: _searchCtrl.text.length,
    );
    _search(widget.keyword);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: BlocBuilder<ApprovePurchasingBloc, ApprovePurchasingState>(
        builder: (context, state) {
          // Dùng DraggableScrollableSheet để sheet chiếm 85% màn hình,
          // user vẫn thấy được danh sách phiếu bên dưới để đối chiếu.
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.85,
            minChildSize: 0.4,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Column(
                children: [
                  _buildHeader(context),
                  const Divider(height: 1, thickness: 0.6),
                  _buildSearchField(),
                  const Divider(height: 1, thickness: 0.6),
                  Expanded(
                    child: _buildBody(context, state, scrollController),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  /// Header: tiêu đề + mã sản phẩm + nút đóng.
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 12, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.blueA100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.history_rounded,
              size: 18,
              color: AppColors.blueA500,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lịch sử giá sản phẩm',
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.enableText,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.productName.trim().isEmpty
                      ? widget.keyword
                      : widget.productName.trim(),
                  style: const TextStyle(
                    fontSize: 11.5,
                    color: AppColors.gray,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close, size: 20, color: AppColors.gray),
          ),
        ],
      ),
    );
  }

  /// Ô tìm kiếm trong lịch sử giá (server-side, debounce 400ms).
  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: TextField(
        controller: _searchCtrl,
        onChanged: (value) {
          _debounce?.cancel();
          _debounce = Timer(_debounceDelay, () => _search(value));
        },
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          _debounce?.cancel();
          _search(value);
        },
        style: const TextStyle(fontSize: 13, color: AppColors.enableText),
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Nhập mã sản phẩm để tìm lịch sử giá',
          hintStyle: const TextStyle(fontSize: 12.5, color: AppColors.gray),
          prefixIcon: const Icon(
            Icons.search_rounded,
            size: 18,
            color: AppColors.gray,
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 34,
            minHeight: 30,
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.close_rounded,
              size: 16,
              color: AppColors.gray,
            ),
            onPressed: _clearSearch,
          ),
          filled: true,
          fillColor: const Color(0xFFF2F5F9),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.primaryERP.withValues(alpha: 0.4),
            ),
          ),
        ),
      ),
    );
  }

  /// Body: loading / lỗi / danh sách lịch sử giá.
  Widget _buildBody(
    BuildContext context,
    ApprovePurchasingState state,
    ScrollController scrollController,
  ) {
    if (state.isLoadingPriceHistory) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 48),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.priceHistoryError != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 40,
              color: AppColors.stateErrorColor,
            ),
            const SizedBox(height: 10),
            Text(
              state.priceHistoryError!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: AppColors.gray),
            ),
          ],
        ),
      );
    }

    final history = state.priceHistory ?? const [];
    if (history.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _query.isEmpty
                    ? Icons.inbox_outlined
                    : Icons.search_off_rounded,
                size: 36,
                color: AppColors.gray,
              ),
              const SizedBox(height: 10),
              Text(
                _query.isEmpty
                    ? 'Chưa có lịch sử giá cho sản phẩm này'
                    : 'Không tìm thấy lịch sử giá cho "$_query"',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13, color: AppColors.gray),
              ),
            ],
          ),
        ),
      );
    }

    return _HistoryGroupList(
      history: history,
      scrollController: scrollController,
    );
  }
}

/// Danh sách lịch sử giá được gom theo `TableType` (bảng) — mỗi nhóm
/// là 1 header có thể mở / thu gọn, bên trong là các card chi tiết.
class _HistoryGroupList extends StatefulWidget {
  const _HistoryGroupList({
    required this.history,
    required this.scrollController,
  });

  final List<ProductPriceHistoryItem> history;
  final ScrollController scrollController;

  @override
  State<_HistoryGroupList> createState() => _HistoryGroupListState();
}

class _HistoryGroupListState extends State<_HistoryGroupList> {
  /// Trạng thái mở/thu gọn theo khoá nhóm. Nhóm chưa có trạng thái
  /// được coi là đang mở.
  final Map<String, bool> _expanded = {};

  /// Gom các bản ghi theo `TableType`, giữ thứ tự xuất hiện trong API.
  List<_HistoryGroup> _buildGroups() {
    final groups = <String, List<ProductPriceHistoryItem>>{};
    for (final item in widget.history) {
      final key = (item.tableType ?? '').trim();
      groups.putIfAbsent(key, () => []).add(item);
    }
    return groups.entries
        .map(
          (e) => _HistoryGroup(
            key: e.key,
            title: e.key.isEmpty ? 'Khác' : e.key,
            items: e.value,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final groups = _buildGroups();
    return ListView.separated(
      controller: widget.scrollController,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      itemCount: groups.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final group = groups[index];
        final isExpanded = _expanded[group.key] ?? true;
        return _HistoryGroupCard(
          group: group,
          isExpanded: isExpanded,
          onToggle: () {
            setState(() => _expanded[group.key] = !isExpanded);
          },
        );
      },
    );
  }
}

/// 1 nhóm lịch sử giá theo bảng.
class _HistoryGroup {
  const _HistoryGroup({
    required this.key,
    required this.title,
    required this.items,
  });

  /// Khoá nhóm = giá trị `TableType` (có thể rỗng).
  final String key;

  /// Tên hiển thị của bảng.
  final String title;

  /// Các bản ghi thuộc nhóm.
  final List<ProductPriceHistoryItem> items;
}

/// Card của 1 nhóm: header gập/mở + danh sách card chi tiết.
class _HistoryGroupCard extends StatelessWidget {
  const _HistoryGroupCard({
    required this.group,
    required this.isExpanded,
    required this.onToggle,
  });

  final _HistoryGroup group;
  final bool isExpanded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE3E8EF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: tên bảng + số bản ghi + mũi tên xoay.
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.primaryERP.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Icon(
                      Icons.table_chart_rounded,
                      size: 15,
                      color: AppColors.primaryERP,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      group.title,
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: AppColors.enableText,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.gray.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${group.items.length}',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 180),
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                      color: AppColors.gray,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Danh sách card chi tiết (chỉ build khi nhóm đang mở).
          if (isExpanded) ...[
            const Divider(height: 1, thickness: 0.6, color: Color(0xFFE3E8EF)),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < group.items.length; i++) ...[
                    if (i > 0) const SizedBox(height: 8),
                    _HistoryCard(item: group.items[i]),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// 1 bản ghi lịch sử giá — hiển thị 1 lần mua của sản phẩm.
///
/// Layout bố cục theo chiều dọc để không có trường nào bị cắt "..."
/// khi nội dung dài: tên SP xuống dòng, chip mã wrap riêng, NCC và
/// các thông tin meta chiếm nguyên 1 dòng.
class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.item});

  final ProductPriceHistoryItem item;

  /// Đơn giá hiển thị dạng số nguyên có dấu phân cách nghìn + " VNĐ",
  /// theo convention của màn Duyệt phiếu đặt phòng.
  static final NumberFormat _moneyFmt = NumberFormat('#,###');
  static final NumberFormat _qtyFmt = NumberFormat('#,##0.##', 'en_US');
  static final DateFormat _dateFmt = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE8EDF4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tên sản phẩm — cho phép tối đa 2 dòng, không cắt bởi hàng.
          Text(
            (item.productName ?? '').trim().isEmpty
                ? (item.productCode ?? '-')
                : (item.productName ?? '').trim(),
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
              color: AppColors.enableText,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 6),

          // Chip mã dự án / mã sản phẩm — wrap xuống dòng nếu dài.
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _codeChip(item.projectCode, Icons.work_outline_rounded),
              _codeChip(item.productCode, Icons.inventory_2_outlined),
            ],
          ),
          const SizedBox(height: 8),

          // Nhà cung cấp — nền nhạt, icon + tên (tối đa 2 dòng).
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F8FC),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.storefront_outlined,
                  size: 14,
                  color: AppColors.gray,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    (item.nameNcc ?? '').trim().isEmpty
                        ? 'Nhà cung cấp: -'
                        : (item.nameNcc ?? '').trim(),
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondaryColor,
                      height: 1.25,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Khối giá: đơn giá (nổi bật) | loại tiền | số lượng.
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryERP.withValues(alpha: 0.10),
                  AppColors.primaryERP.withValues(alpha: 0.03),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.primaryERP.withValues(alpha: 0.18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Đơn giá + loại tiền.
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Đơn giá',
                            style: TextStyle(
                              fontSize: 9.5,
                              fontWeight: FontWeight.w600,
                              color: AppColors.gray,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            item.unitPrice == null
                                ? '-'
                                : '${_moneyFmt.format(item.unitPrice)} VNĐ',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryERP,
                              height: 1.15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: AppColors.primaryERP.withValues(alpha: 0.15),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Loại tiền',
                            style: TextStyle(
                              fontSize: 9.5,
                              fontWeight: FontWeight.w600,
                              color: AppColors.gray,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            (item.currencyCode ?? '').trim().isEmpty
                                ? '-'
                                : (item.currencyCode ?? '').trim(),
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w700,
                              color: AppColors.enableText,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(
                  height: 1,
                  thickness: 0.6,
                  color: Color(0x14000000),
                ),
                const SizedBox(height: 8),

                // Số lượng — chiếm nguyên 1 dòng để không bị cắt.
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Số lượng',
                      style: TextStyle(
                        fontSize: 9.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.gray,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item.quantity == null
                          ? '-'
                          : '${_qtyFmt.format(item.quantity)} '
                              '${(item.unit ?? '').trim()}',
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: AppColors.enableText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Meta: ngày báo giá + lead time — mỗi thông tin 1 dòng riêng.
          _metaRow(
            Icons.event_outlined,
            'Ngày báo giá',
            item.createdDate == null
                ? '-'
                : _dateFmt.format(item.createdDate!),
          ),
          const SizedBox(height: 5),
          _metaRow(
            Icons.schedule_rounded,
            'Lead time',
            (item.leadTime ?? '').trim().isEmpty
                ? '-'
                : (item.leadTime ?? '').trim(),
          ),
          if ((item.projectName ?? '').trim().isNotEmpty) ...[
            const SizedBox(height: 5),
            _metaRow(
              Icons.folder_outlined,
              'Dự án',
              (item.projectName ?? '').trim(),
            ),
          ],
        ],
      ),
    );
  }

  /// Chip mã (dự án / sản phẩm) hiển thị dạng pill nhỏ ở header.
  Widget _codeChip(String? code, IconData icon) {
    final v = (code ?? '').trim();
    if (v.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4F9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: AppColors.gray),
          const SizedBox(width: 3),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 110),
            child: Text(
              v,
              style: const TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w600,
                color: AppColors.gray,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// Dòng meta ở chân card: icon + label + value (giá trị xuống dòng
  /// được phép, không cắt chữ).
  Widget _metaRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Icon(icon, size: 13, color: AppColors.gray),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 10.5, color: AppColors.gray),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondaryColor,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
