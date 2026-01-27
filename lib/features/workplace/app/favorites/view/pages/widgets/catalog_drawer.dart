import 'package:flutter/material.dart';
import '../../model/favorite_tabs.dart';

class CatalogDrawer extends StatelessWidget {
  const CatalogDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = FavoriteTabs.values;
    final controller = DefaultTabController.of(context);

    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mục lục',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              /// GRID 2 CỘT
              Expanded(
                child: GridView.builder(
                  itemCount: tabs.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // ✅ 2 cột
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 3.2, // chiều ngang đẹp hơn
                  ),
                  itemBuilder: (context, index) {
                    final tab = tabs[index];
                    final isActive = controller.index == index;

                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        controller.animateTo(index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isActive
                              ? Colors.orange.shade200
                              : Colors.orange.shade100, // ✅ cam nhạt
                          borderRadius: BorderRadius.circular(12),
                          border: isActive
                              ? Border.all(
                            color: Colors.orange,
                            width: 1.2,
                          )
                              : null,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                tab.name,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: isActive
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                ),
                              ),
                            ),
                            if (isActive) ...[
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.deepOrange,
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
