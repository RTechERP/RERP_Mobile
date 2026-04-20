// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Widget hiển thị tab bar có thể scroll, với nút mở catalog drawer

import 'package:flutter/material.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../model/favorite_tabs.dart';

/// Widget hiển thị tab bar ngang với khả năng scroll.
///
/// Tab bar nằm trong màn favorites, cho phép chuyển giữa các tab
/// (Tất cả, Đơn từ, Tổng hợp, Chung, Tuần, Báo cáo, Biểu mẫu).
/// Nút menu bên phải mở catalog drawer để nhảy nhanh đến tab.
class FavTabDrawer extends StatelessWidget {
  final List<AppTab> tabs;

  const FavTabDrawer({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          /// TAB BAR – sát trái tuyệt đối
          Expanded(
            child: TabBar(
              isScrollable: true,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              tabAlignment: TabAlignment.start,
              indicatorColor: AppColors.primaryERP,
              labelColor: AppColors.primaryERP,
              unselectedLabelColor: Colors.black87,
              tabs: tabs.map((e) => Tab(text: e.label)).toList()
            ),
          ),

          /// MENU ICON
          Builder(
            builder: (context) => InkWell(
              onTap: () => Scaffold.of(context).openEndDrawer(),
              child: const SizedBox(
                width: 44,
                height: 44,
                child: Icon(Icons.menu),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
