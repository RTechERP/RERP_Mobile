// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình Newsfeed (Bảng tin) - hiển thị danh sách thông báo HR dạng newsfeed

import 'package:flutter/material.dart';

import '../../../../../common/app_theme/index.dart';

/// Màn hình Newsfeed (Bảng tin) - tab thứ 3 trong DashboardScreen.
///
/// Hiển thị danh sách thông báo từ HR theo dạng newsfeed.
/// Dữ liệu là mock tĩnh, cần tạo BLoC + gọi API để load thực tế.
class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: AppColors.gradientERP,
                borderRadius: BorderRadius.circular(8),
              ),
              child:
                  const Icon(Icons.campaign, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 10),
            const Text(
              'Bảng tin',
              style: TextStyle(
                color: AppColors.heading,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        // actions: [
        //   Stack(
        //     clipBehavior: Clip.none,
        //     children: [
        //       IconButton(
        //         icon: const Icon(
        //           Icons.notifications_none_outlined,
        //           color: AppColors.heading,
        //           size: 26,
        //         ),
        //         onPressed: () {},
        //       ),
        //       const Positioned(
        //         right: 4,
        //         top: 8,
        //         child: _NotificationDot(),
        //       ),
        //     ],
        //   ),
        //   const SizedBox(width: 4),
        // ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          // Section header "Tin mới nhất" với nút "Xem tất cả"
          _SectionHeader(),

          const SizedBox(height: 10),

          // Danh sách thông báo
          const _FeedCard(
            title: 'Thông báo lịch nghỉ lễ 2026',
            body:
                'Công ty xin thông báo lịch nghỉ lễ dịp Tết Nguyên Đán 2026. Chi tiết vui lòng xem file đính kèm.',
            date: '25/01/2026',
            type: FeedType.announcement,
            author: 'Phòng Hành chính',
          ),
          const SizedBox(height: 10),
          const _FeedCard(
            title: 'Cập nhật chính sách lương tháng 4',
            body:
                'Từ tháng 4/2026, chính sách lương và phụ cấp sẽ được điều chỉnh theo quy định mới.',
            date: '20/03/2026',
            type: FeedType.hrPolicy,
            author: 'Phòng Nhân sự',
          ),
          const SizedBox(height: 10),
          const _FeedCard(
            title: 'Hướng dẫn sử dụng app RTC ERP mới',
            body:
                'Phiên bản mới của app RTC ERP đã được cập nhật với nhiều tính năng mới. Vui lòng cập nhật và trải nghiệm.',
            date: '15/01/2026',
            type: FeedType.guide,
            author: 'Phòng Kỹ thuật',
          ),
          const SizedBox(height: 10),
          const _FeedCard(
            title: 'Thông báo nghỉ Tết Dương Lịch 2026',
            body:
                'Nhân viên được nghỉ ngày 01/01/2026 (Thứ Năm). Trở lại làm việc ngày 02/01/2026.',
            date: '30/12/2025',
            type: FeedType.announcement,
            author: 'Phòng Hành chính',
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

/// Dot đỏ báo hiệu có thông báo mới.
class _NotificationDot extends StatelessWidget {
  const _NotificationDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}

/// Header của section danh sách thông báo.
///
/// Gồm tiêu đề "Tin mới nhất" và nút "Xem tất cả".
class _SectionHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Tin mới nhất',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.heading,
          ),
        ),
        // TextButton(
        //   onPressed: () {},
        //   style: TextButton.styleFrom(
        //     padding: EdgeInsets.zero,
        //     minimumSize: const Size(0, 0),
        //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //   ),
        //   child: const Text(
        //     'Xem tất cả',
        //     style: TextStyle(
        //       fontSize: 13,
        //       fontWeight: FontWeight.w600,
        //       color: AppColors.primaryERP,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

/// Loại thông báo trong newsfeed.
///
/// - announcement: thông báo chung
/// - hrPolicy: chính sách nhân sự
/// - guide: hướng dẫn sử dụng
/// - event: sự kiện công ty
enum FeedType { announcement, hrPolicy, guide, event }

/// Card hiển thị một thông báo trong newsfeed.
///
/// Gồm 3 phần:
///   - Header: icon + loại thông báo + phòng ban + ngày (bo tròn)
///   - Content: tiêu đề đậm + mô tả giới hạn 3 dòng
///   - Footer: nút "Xem chi tiết" bo tròn
class _FeedCard extends StatelessWidget {
  final String title;
  final String body;
  final String date;
  final FeedType type;
  final String author;

  const _FeedCard({
    required this.title,
    required this.body,
    required this.date,
    required this.type,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    final (icon, accentColor, label) = switch (type) {
      FeedType.announcement => (
        Icons.campaign_outlined,
        const Color(0xFFEE4623),
        'Thông báo',
      ),
      FeedType.hrPolicy => (
        Icons.policy_outlined,
        const Color(0xFF2957A6),
        'Chính sách HR',
      ),
      FeedType.guide => (
        Icons.menu_book_outlined,
        const Color(0xFF2F80ED),
        'Hướng dẫn',
      ),
      FeedType.event => (
        Icons.event_outlined,
        const Color(0xFFF0891A),
        'Sự kiện',
      ),
    };

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE8EAF0), width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A1A).withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header với nền màu accent
          _FeedCardHeader(
            icon: icon,
            accentColor: accentColor,
            label: label,
            author: author,
            date: date,
          ),

          // Content: title + body + footer
          _FeedCardContent(title: title, body: body),
        ],
      ),
    );
  }
}

/// Phần header của _FeedCard.
///
/// Gồm: icon loại thông báo (bo vuông) + label + phòng ban + badge ngày bo tròn.
class _FeedCardHeader extends StatelessWidget {
  final IconData icon;
  final Color accentColor;
  final String label;
  final String author;
  final String date;

  const _FeedCardHeader({
    required this.icon,
    required this.accentColor,
    required this.label,
    required this.author,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: accentColor.withValues(alpha: 0.06),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 16, color: accentColor),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: accentColor,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  author,
                  style: const TextStyle(fontSize: 11, color: AppColors.gray),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.bgCard,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.schedule, size: 11, color: AppColors.gray),
                const SizedBox(width: 3),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Phần nội dung của _FeedCard.
///
/// Gồm: title đậm + body (max 3 dòng) + nút "Xem chi tiết" bo tròn.
class _FeedCardContent extends StatelessWidget {
  final String title;
  final String body;

  const _FeedCardContent({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.heading,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            body,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.gray,
              height: 1.55,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          // const SizedBox(height: 12),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Container(
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 10,
          //         vertical: 5,
          //       ),
          //       decoration: BoxDecoration(
          //         color: AppColors.white,
          //         borderRadius: BorderRadius.circular(20),
          //         border: Border.all(color: const Color(0xFFE0E0E8), width: 1),
          //       ),
          //       child: const Row(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Text(
          //             'Xem chi tiết',
          //             style: TextStyle(
          //               fontSize: 12,
          //               fontWeight: FontWeight.w600,
          //               color: AppColors.heading,
          //             ),
          //           ),
          //           SizedBox(width: 3),
          //           Icon(
          //             Icons.arrow_forward,
          //             size: 13,
          //             color: AppColors.heading,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
