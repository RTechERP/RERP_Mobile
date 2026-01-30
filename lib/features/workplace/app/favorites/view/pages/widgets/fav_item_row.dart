import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../../../../../../../common/models/index.dart';

class FavItemRow extends StatelessWidget {
  final AppItemModel item;
  final bool isFavorite;
  final ValueChanged<bool> onFavoriteChanged;

  const FavItemRow({
    super.key,
    required this.item,
    required this.isFavorite,
    required this.onFavoriteChanged,
  });

  void _toggle() {
    onFavoriteChanged(!isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    final willCheck = !isFavorite; // 👈 sắp CHECK hay UNCHECK

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: _toggle,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              IconData(
                item.iconCodePoint ?? 0,
                fontFamily: item.iconFontFamily, // 🔥 BẮT BUỘC
              ),
              size: 28,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),

            LikeButton(
              isLiked: isFavorite,
              size: 28,

              /// 🔥 CHỈ CÓ HIỆU ỨNG KHI CHECK
              bubblesColor: willCheck
                  ? const BubblesColor(
                dotPrimaryColor: Colors.green,
                dotSecondaryColor: Colors.lightGreen,
              )
                  : const BubblesColor(
                dotPrimaryColor: Colors.green,
                dotSecondaryColor: Colors.lightGreen,
              ),

              circleColor: willCheck
                  ? const CircleColor(
                start: Colors.transparent,
                end: Colors.transparent,
              )
                  : const CircleColor(
                start: Colors.transparent,
                end: Colors.transparent,
              ),

              likeBuilder: (liked) {
                return Icon(
                  liked
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: liked ? Colors.green : Colors.grey,
                );
              },

              onTap: (liked) async {
                _toggle();
                return !liked;
              },
            ),
          ],
        ),
      ),
    );
  }
}

