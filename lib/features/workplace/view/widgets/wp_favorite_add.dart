import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../common/utils/action_icon_tile.dart';
import '../../app/favorites/data/datasource/service/favorites_service.dart';


class WpFavoriteAdd extends StatelessWidget {
  final VoidCallback onAddTap;
  final EdgeInsets outerPadding;
  final EdgeInsets innerPadding;

  const WpFavoriteAdd({
    super.key,
    required this.onAddTap,
    this.outerPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.innerPadding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding,
      child: ValueListenableBuilder(
        valueListenable:
        Hive.box(favoriteBox).listenable(keys: [favoriteKey]),
        builder: (context, box, _) {
          final favorites = FavoriteService.load();

          /// 🟡 CHƯA CÓ FAVORITE
          if (favorites.isEmpty) {
            return InkWell(
              onTap: onAddTap,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: double.infinity,
                padding: innerPadding,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add, size: 18, color: Colors.orange),
                    SizedBox(width: 6),
                    Text(
                      'Ưa thích',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          /// 🟢 ĐÃ CÓ FAVORITE
          return Container(
            padding: innerPadding,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: favorites.length + 1,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemBuilder: (_, index) {
                /// ➕ NÚT ADD
                if (index == favorites.length) {
                  return ActionIconTile(
                    icon: Icons.add,
                    title: 'Thêm',
                    iconColor: Colors.orange,
                    onTap: onAddTap,
                  );
                }

                /// ⭐ FAVORITE ITEM
                final item = favorites[index];
                return ActionIconTile(
                  icon: IconData(
                    item.iconCodePoint ?? 0,
                    fontFamily: 'MaterialIcons',
                  ),
                  title: item.name,
                  onTap: () {
                    if (item.route != null && item.route!.isNotEmpty) {
                      context.push(item.route!);
                    }
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

