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
    final willCheck = !isFavorite;

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
            _buildIcon(context),

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
              bubblesColor: const BubblesColor(
                dotPrimaryColor: Colors.green,
                dotSecondaryColor: Colors.lightGreen,
              ),
              circleColor: const CircleColor(
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

  /// ===== ICON / IMAGE (thu gọn ảnh ở giữa circle) =====
  Widget _buildIcon(BuildContext context) {
    final theme = Theme.of(context);
    final imagePath = item.imageUrl; // field ảnh trong AppItemModel

    const double circleSize = 48;   // kích thước vòng tròn
    const double imageSize = circleSize * 0.75;    // 👈 thu nhỏ ảnh bên trong

    if (imagePath != null && imagePath.isNotEmpty) {
      return Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade100,
        ),
        alignment: Alignment.center,
        child: ClipOval(
          child: Image.asset(
            imagePath,
            width: imageSize,
            height: imageSize,
            fit: BoxFit.contain, // 👈 không crop, giữ nguyên hình
            errorBuilder: (_, __, ___) => _fallbackIcon(theme),
          ),
        ),
      );
    }

    return _fallbackIcon(theme);
  }

  Widget _fallbackIcon(ThemeData theme) {
    const double circleSize = 40;
    const double iconSize = 22;

    return Container(
      width: circleSize,
      height: circleSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade100,
      ),
      alignment: Alignment.center,
      child: Icon(
        IconData(
          item.iconCodePoint ?? 0,
          fontFamily: item.iconFontFamily,
        ),
        size: iconSize,
        color: theme.iconTheme.color,
      ),
    );
  }
}
