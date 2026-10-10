// Màn chi tiết phiếu Đặt phòng nhà nghỉ.
//
// Có 2 tab:
// 1. Phiếu đăng ký — hiển thị thông tin đăng ký gốc (người đặt, dự án,
//    thời gian, địa điểm, danh sách người ở). Field duy nhất có icon
//    tròn tích xanh/chấm than là [BookingGuestHouseStatusIndicator] đặt
//    ngay đầu tab để người dùng thấy trạng thái duyệt TBP ngay khi mở.
// 2. TT Quyết toán — form quyết toán (lý do, người nhận tiền, tên KS,
//    TBP duyệt, số hoá đơn, ngân hàng, tổng tiền, ... + 2 file picker).
//    Khi chưa duyệt TBP → toàn bộ field + 2 file picker đều disable màu xám.
//
// Màn này nhận `id` (int) thay vì item, tự gọi API
// `GET /AccommodationBooking/accommodation-booking-by-id?id=<id>` qua bloc
// để lấy đầy đủ `accommodationBooking` (info) + `accommodationBookingDetail`
// (list người ở). Trong lúc load → hiển thị spinner; load lỗi → snackbar + pop.
//
// Toàn bộ UI dùng pattern đồng bộ với add_screen (FormCard + FormInputField
// readOnly) để giao diện giống form chứ không phải chỉ text thuần.
// Tiêu đề + TabBar (pill-style) lấy cảm hứng từ newsfeed_screen
// (gradient icon ở title, tabBar bọc trong container có border + shadow).

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../bloc/booking_guest_house_bloc.dart';
import '../widgets/booking_guest_house_registration_tab.dart';
import '../widgets/booking_guest_house_settlement_tab.dart';

class BookingGuestHouseDetailScreen extends StatefulWidget {
  const BookingGuestHouseDetailScreen({super.key, required this.id});

  /// ID phiếu cần lấy chi tiết.
  final int id;

  @override
  State<BookingGuestHouseDetailScreen> createState() =>
      _BookingGuestHouseDetailScreenState();
}

class _BookingGuestHouseDetailScreenState
    extends State<BookingGuestHouseDetailScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _currentTabIndex = 0;

  static const _tabTitles = ['Phiếu đăng ký', 'TT Quyết toán'];
  static const _tabIcons = [Icons.assignment_outlined, Icons.receipt_long];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(_handleTabChanged);
    // Trigger load detail ngay khi mở màn. 3 API lookup (projects/employees/
    // provinces) KHÔNG gọi ở đây — đã được list screen load sẵn qua
    // loadFilters khi mở tính năng, share qua ShellRoute provider. Nếu mở
    // thẳng detail (deep link) mà chưa qua list, dữ liệu lookup sẽ rỗng
    // và các tab sẽ fallback text theo id (xem _resolve*Name).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final bloc = context.read<BookingGuestHouseBloc>();
      bloc.add(BookingGuestHouseEvent.loadDetail(id: widget.id));
    });
  }

  void _handleTabChanged() {
    if (_tabController.indexIsChanging) return;
    if (_currentTabIndex == _tabController.index) return;
    setState(() => _currentTabIndex = _tabController.index);
  }

  @override
  void dispose() {
    _tabController
      ..removeListener(_handleTabChanged)
      ..dispose();
    super.dispose();
  }

  /// Tạo thân content cho 1 tab — spinner khi loading, lỗi khi fail,
  /// hoặc widget tương ứng khi đã có data.
  Widget _buildTabBody({
    required bool isLoading,
    required String? errorMessage,
    required Widget child,
  }) {
    if (isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.redAccent,
                size: 48,
              ),
              const SizedBox(height: 12),
              Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      );
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingGuestHouseBloc, BookingGuestHouseState>(
      listenWhen: (prev, curr) =>
          prev.detailMessage != curr.detailMessage &&
          curr.detailMessage != null,
      listener: (context, state) {
        // Báo lỗi (nếu có) cho user — chỉ show 1 lần khi message đổi.
        final msg = state.detailMessage;
        if (msg != null && msg.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(msg)));
        }
      },
      builder: (context, state) {
        final detail = state.detailData;
        final isLoading = state.isDetailLoading && detail == null;
        final errorMsg = (detail == null && !isLoading)
            ? state.detailMessage
            : null;

        return Scaffold(
          backgroundColor: const Color(0xFFF0F2F5),
          appBar: AppBarCommon(
            centerTitle: false,
            title: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    gradient: AppColors.gradientERP,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1FEE4623),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    _tabIcons[_currentTabIndex],
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  _tabTitles[_currentTabIndex],
                  style: const TextStyle(
                    color: AppColors.heading,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            onBackTap: () => context.pop(),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(58),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.bgCard,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFD9DEEA)),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    labelColor: AppColors.primaryERP,
                    unselectedLabelColor: AppColors.gray,
                    splashBorderRadius: const BorderRadius.all(
                      Radius.circular(14),
                    ),
                    indicator: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      border: Border.fromBorderSide(
                        BorderSide(color: AppColors.primaryERP, width: 1.2),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x1FEE4623),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    tabs: const [
                      Tab(text: 'Phiếu đăng ký'),
                      Tab(text: 'TT Quyết toán'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildTabBody(
                      isLoading: isLoading,
                      errorMessage: errorMsg,
                      child: detail == null
                          ? const SizedBox.shrink()
                          : BookingGuestHouseRegistrationTab(detail: detail),
                    ),
                    _buildTabBody(
                      isLoading: isLoading,
                      errorMessage: errorMsg,
                      child: detail == null
                          ? const SizedBox.shrink()
                          : BookingGuestHouseSettlementTab(detail: detail),
                    ),
                  ],
                ),
              ),
              _buildBottomBar(),
            ],
          ),
        );
      },
    );
  }

  /// Bottom bar với 1 nút 'Lưu' (y hệt pattern add_screen). Hiển thị khi đã
  /// có `detail` (đã load xong).
  ///
  /// Hiện tại detail read-only nên chưa có payload edit để dispatch
  /// [BookingGuestHouseEvent.submit] lại. Khi có form edit thật:
  /// - Build payload update từ form,
  /// - `bloc.add(BookingGuestHouseEvent.submit(payload: payload))`,
  /// - Lắng `submitSuccess` để gọi `showMessage(context, 'Lưu phiếu
  ///   thành công (#${state.lastSubmittedId})', type: SnackBarType.success)`
  ///   rồi `context.pop()` (xem add_screen renderUI để thấy flow này).
  ///
  /// Tạm thời chỉ show snackbar đơn giản — đủ để xác nhận affordance nút Lưu.
  Widget _buildBottomBar() {
    return BlocBuilder<BookingGuestHouseBloc, BookingGuestHouseState>(
      buildWhen: (prev, curr) =>
          prev.isSubmitting != curr.isSubmitting ||
          prev.detailData != curr.detailData,
      builder: (context, state) {
        final isSubmitting = state.isSubmitting;
        final hasDetail = state.detailData != null;

        return Container(
          padding: EdgeInsets.fromLTRB(
            16,
            12,
            16,
            12 + MediaQuery.of(context).padding.bottom,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: !hasDetail || isSubmitting
                  ? null
                  : () {
                      context.pop();
                      context.showMessage(
                        "Chỉnh sửa phiếu thành công",
                        type: SnackBarType.success,
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: isSubmitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Text(
                      'Lưu',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
