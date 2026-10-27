// Màn hình Duyệt ĐNTT (đề nghị thanh toán) Đặt xe / Nhà nghỉ.
// Hiển thị danh sách phân trang, lọc theo khoảng ngày và bộ lọc
// phòng ban / người tạo / từ khoá.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/constants/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/date_range_picker.dart';
import '../bloc/approve_booking_payment_bloc.dart';
import '../widgets/approve_booking_payment_card.dart';
import '../widgets/approve_booking_payment_filter_sheet.dart';
class ApproveBookingPaymentScreen extends StatefulWidget {
  const ApproveBookingPaymentScreen({super.key});

  @override
  State<ApproveBookingPaymentScreen> createState() =>
      _ApproveBookingPaymentScreenState();
}

class _ApproveBookingPaymentScreenState
    extends BaseState<
        ApproveBookingPaymentScreen,
        ApproveBookingPaymentEvent,
        ApproveBookingPaymentState,
        ApproveBookingPaymentBloc
    > {
  final ScrollController _scrollCtl = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollCtl.addListener(_onScroll);
    bloc.add(const ApproveBookingPaymentEvent.init());
  }

  @override
  void dispose() {
    _scrollCtl.dispose();
    super.dispose();
  }

  /// Tải trang kế tiếp khi còn cách cuối danh sách 200px.
  void _onScroll() {
    if (!_scrollCtl.hasClients) return;
    final position = _scrollCtl.position;
    if (position.pixels >= position.maxScrollExtent - 200) {
      bloc.add(const ApproveBookingPaymentEvent.loadMore());
    }
  }

  /// Chỉ báo lỗi bằng snackbar khi đã có dữ liệu (refresh / load more lỗi);
  /// lỗi lần tải đầu được hiển thị ngay trên body.
  @override
  void listener(BuildContext context, ApproveBookingPaymentState state) {
    final message = (state.message ?? '').trim();
    if (message.isNotEmpty && state.items.isNotEmpty) {
      showMessage(context, message, type: SnackBarType.error);
    }
  }

  Future<void> _openDateRangePicker() async {
    final state = bloc.state;
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: state.dateStart ?? ApproveBookingPaymentState.defaultStart(),
        initialEnd: state.dateEnd ?? ApproveBookingPaymentState.defaultEnd(),
        onApply: (start, end) => bloc.add(
          ApproveBookingPaymentEvent.changeDateRange(
            dateStart: DateTime(start.year, start.month, start.day),
            dateEnd: DateTime(end.year, end.month, end.day),
          ),
        ),
      ),
    );
  }

  void _openFilterSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => BlocProvider.value(
        value: bloc,
        child: const ApproveBookingPaymentFilterSheet(),
      ),
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return blocBuilder((context, state) {
      final filtered = state.activeFilterCount > 0;
      return BaseScaffold(
        appBar: AppBarCommon(
          title: Text('Duyệt ĐNTT', style: AppStyles.headingTitle2),
          onBackTap: () => context.pop(),
          actions: [
            IconButton(
              tooltip: 'Bộ lọc',
              onPressed: _openFilterSheet,
              icon: Icon(
                filtered ? Icons.filter_alt_rounded : Icons.filter_alt_outlined,
                color: filtered ? AppColors.primaryERP : AppColors.gray,
              ),
            ),
            IconButton(
              tooltip: 'Lọc ngày',
              onPressed: _openDateRangePicker,
              icon: const Icon(Icons.calendar_month, color: AppColors.gray),
            ),
          ],
        ),
        body: _buildBody(state),
      );
    });
  }

  Widget _buildBody(ApproveBookingPaymentState state) {
    final loading = state.status == BaseStateStatus.loading ||
        state.status == BaseStateStatus.init;
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == BaseStateStatus.failed) {
      return _StateView(
        image: AppImages.error,
        text: (state.message ?? '').trim().isNotEmpty
            ? state.message!.trim()
            : 'Load dữ liệu thất bại',
        onRetry: () => bloc.add(const ApproveBookingPaymentEvent.refresh()),
      );
    }

    final items = state.visibleItems;
    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(const ApproveBookingPaymentEvent.refresh());
        await bloc.stream.firstWhere((s) => !s.isRefreshing);
      },
      child: items.isEmpty
          ? ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [
                SizedBox(height: 80),
                _StateView(image: AppImages.missing, text: 'Không có dữ liệu'),
              ],
            )
          : ListView.separated(
              controller: _scrollCtl,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              // +1 dòng cuối cho loading indicator khi tải thêm trang.
              itemCount: items.length + 1,
              separatorBuilder: (_, _) => const SizedBox(height: 10),
              itemBuilder: (_, index) {
                if (index == items.length) {
                  return state.isLoadingMore
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : const SizedBox.shrink();
                }
                return ApproveBookingPaymentCard(item: items[index]);
              },
            ),
    );
  }
}

/// View trạng thái rỗng / lỗi: ảnh minh hoạ + thông điệp (+ nút thử lại).
class _StateView extends StatelessWidget {
  const _StateView({required this.image, required this.text, this.onRetry});

  final String image;
  final String text;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image, width: 320),
            const SizedBox(height: 12),
            Text(text, textAlign: TextAlign.center),
            if (onRetry != null) ...[
              const SizedBox(height: 12),
              TextButton(onPressed: onRetry, child: const Text('Thử lại')),
            ],
          ],
        ),
      ),
    );
  }
}
