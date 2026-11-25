import 'package:flutter/material.dart';

/// Bốn mùa theo tháng dương.
enum Season { xuan, ha, thu, dong }

/// Mùa của một tháng dương, chia theo quý: 1-3 xuân, 4-6 hạ, 7-9 thu, 10-12 đông.
Season seasonOfMonth(int month) {
  if (month <= 3) return Season.xuan;
  if (month <= 6) return Season.ha;
  if (month <= 9) return Season.thu;
  return Season.dong;
}

/// Cung cấp [SeasonPalette] cho toàn bộ cây widget của màn hình Bảng tin.
///
/// Đây là nguồn duy nhất cho bảng màu theo mùa: mọi widget trong màn hình
/// đọc cùng một palette nên app bar, nền và nội dung luôn đồng nhất.
class SeasonPaletteScope extends InheritedWidget {
  const SeasonPaletteScope({
    super.key,
    required this.palette,
    required super.child,
  });

  /// Bảng màu theo mùa dùng chung cho mọi widget con.
  final SeasonPalette palette;

  /// Palette đang áp dụng, lấy từ [context] gần nhất chứa [SeasonPaletteScope].
  static SeasonPalette of(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<SeasonPaletteScope>();
    assert(scope != null, 'SeasonPaletteScope chưa được bọc quanh widget');
    return scope!.palette;
  }

  @override
  bool updateShouldNotify(SeasonPaletteScope oldWidget) =>
      oldWidget.palette != palette;
}

/// Bảng màu và họ hình ảnh của bốn mùa.
///
/// Mỗi mùa có một bảng màu riêng cho nền màn hình, app bar, thẻ nội dung
/// và phong cảnh, tạo nên một không gian thống nhất cho toàn bộ màn hình
/// Bảng tin / Lịch làm việc.
class SeasonPalette {
  const SeasonPalette({
    required this.season,
    required this.label,
    required this.subtitle,
    required this.emoji,
    required this.primary,
    required this.secondary,
    required this.surface,
    required this.onSurface,
    required this.screenGradient,
    required this.cardGradient,
    required this.headerGradient,
    required this.sceneFar,
    required this.sceneNear,
  });

  /// Mùa mà bảng màu này mô tả.
  final Season season;

  /// Tên mùa hiển thị trên UI.
  final String label;

  /// Mô tả ngắn về mùa.
  final String subtitle;

  /// Biểu tượng đại diện cho mùa.
  final String emoji;

  /// Màu chủ đạo.
  final Color primary;

  /// Màu nhấn phụ.
  final Color secondary;

  /// Màu nền thẻ.
  final Color surface;

  /// Màu chữ trên nền [surface].
  final Color onSurface;

  /// Gradient nền toàn màn hình.
  final List<Color> screenGradient;

  /// Gradient cho thẻ nội dung.
  final List<Color> cardGradient;

  /// Gradient cho phần đầu màn hình.
  final List<Color> headerGradient;

  /// Màu lớp nền xa của phong cảnh theo mùa.
  final Color sceneFar;

  /// Màu lớp nền gần của phong cảnh theo mùa.
  final Color sceneNear;

  /// Bảng màu của mùa [season].
  static SeasonPalette of(Season season) {
    switch (season) {
      case Season.xuan:
        return const SeasonPalette(
          season: Season.xuan,
          label: 'Xuân',
          subtitle: 'Xuân về, trăm hoa đua nở',
          emoji: '🌸',
          primary: Color(0xFFD81B60),
          secondary: Color(0xFF7B1FA2),
          surface: Color(0xFFFFF0F4),
          onSurface: Color(0xFF6A1030),
          screenGradient: [
            Color(0xFFFFD3E0),
            Color(0xFFFFE3CC),
            Color(0xFFEDDDFB),
          ],
          cardGradient: [Color(0xFFFFFDFD), Color(0xFFFFF2F6)],
          headerGradient: [Color(0xFFFFD1E2), Color(0xFFFFEAD6)],
          sceneFar: Color(0xFFA5C9A0),
          sceneNear: Color(0xFF7BA87C),
        );
      case Season.ha:
        return const SeasonPalette(
          season: Season.ha,
          label: 'Hạ',
          subtitle: 'Hạ nắng vàng, trĩu cành chiếc',
          emoji: '☀️',
          primary: Color(0xFFEF8C00),
          secondary: Color(0xFF00897B),
          surface: Color(0xFFFFF7E0),
          onSurface: Color(0xFF6D4A00),
          screenGradient: [
            Color(0xFFFFE3A8),
            Color(0xFFFFF2CE),
            Color(0xFFD9EFE4),
          ],
          cardGradient: [Color(0xFFFFFEFB), Color(0xFFFFF9EA)],
          headerGradient: [Color(0xFFFFE2A3), Color(0xFFDFF2E4)],
          sceneFar: Color(0xFF7FC8D6),
          sceneNear: Color(0xFF3E9DB2),
        );
      case Season.thu:
        return const SeasonPalette(
          season: Season.thu,
          label: 'Thu',
          subtitle: 'Thu se, lá vàng rơi nhẹ',
          emoji: '🍂',
          primary: Color(0xFFC05621),
          secondary: Color(0xFF795548),
          surface: Color(0xFFFFF0E3),
          onSurface: Color(0xFF6B3417),
          screenGradient: [
            Color(0xFFF9CB96),
            Color(0xFFEFDCC2),
            Color(0xFFDFD0BE),
          ],
          cardGradient: [Color(0xFFFFFDFA), Color(0xFFFBF0E4)],
          headerGradient: [Color(0xFFF8D3A3), Color(0xFFE7D8C2)],
          sceneFar: Color(0xFFB98A57),
          sceneNear: Color(0xFF8A5A33),
        );
      case Season.dong:
        return const SeasonPalette(
          season: Season.dong,
          label: 'Đông',
          subtitle: 'Đông lạnh, đón Tết sum họp',
          emoji: '❄️',
          primary: Color(0xFF283593),
          secondary: Color(0xFF00796B),
          surface: Color(0xFFEDF1FC),
          onSurface: Color(0xFF1A237E),
          screenGradient: [
            Color(0xFFBCCAF7),
            Color(0xFFC2E0DE),
            Color(0xFFD8CBF2),
          ],
          cardGradient: [Color(0xFFFCFDFF), Color(0xFFEEF2FC)],
          headerGradient: [Color(0xFFC5CFF8), Color(0xFFC4E4E0)],
          sceneFar: Color(0xFF9FB3E8),
          sceneNear: Color(0xFF6C86C7),
        );
    }
  }
}
