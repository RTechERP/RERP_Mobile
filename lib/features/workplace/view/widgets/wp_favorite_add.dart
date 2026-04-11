// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Widget hiển thị danh sách favorites (yêu thích) có nút thêm

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../common/utils/action_icon_tile.dart';
import '../../app/favorites/data/datasource/service/favorites_service.dart';

/// Widget hiển thị danh sách favorites của user.
///
/// Nếu chưa có favorite nào → hiển thị nút "Thêm yêu thích".
/// Nếu đã có → hiển thị grid favorites với nút "Thêm" ở cuối.
class WpFavoriteAdd extends StatelessWidget {
  /// Callback khi user tap vào nút thêm favorite.
  final VoidCallback onAddTap;

  /// Padding bên ngoài card.
  final EdgeInsets outerPadding;

  /// Padding bên trong card.
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
                if (index == favorites.length) {
                  return ActionIconTile(
                    icon: Icons.add,
                    title: 'Thêm',
                    iconColor: Colors.orange,
                    onTap: onAddTap,
                  );
                }

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

