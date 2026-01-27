import 'package:flutter/material.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../model/favorite_tabs.dart';

class TabWithDrawerRow extends StatelessWidget {
  final List<AppTab> tabs;

  const TabWithDrawerRow({super.key, required this.tabs});

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
