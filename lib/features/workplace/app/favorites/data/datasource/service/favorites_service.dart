// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Quản lý favorites - load, save, toggle, sort items theo thứ tự ưu tiên

import 'package:hive/hive.dart';
import '../../../../../data/datasource/app_registry/app_items_registry.dart';
import '../../../../../data/datasource/models/index.dart';

const String favoriteBox = 'favorites';
const String favoriteKey = 'local_favorites';

/// Service quản lý favorites sử dụng Hive local storage.
///
/// Lưu trữ list ID items được đánh dấu yêu thích.
/// Items giữ nguyên vị trí như trong registry.
class FavoriteService {
  static Box get _box => Hive.box(favoriteBox);

  /// Load danh sách ID favorites.
  static List<String> loadIds() {
    final raw = _box.get(favoriteKey);
    if (raw == null) return [];
    return List<String>.from(raw);
  }

  /// Load full items (dùng cho UI).
  static List<AppItemModel> load() {
    final ids = loadIds();

    return ids
        .map(AppItemRegistry.byId)
        .whereType<AppItemModel>()
        .toList();
  }

  /// Lưu danh sách ID favorites.
  static Future<void> _saveIds(List<String> ids) async {
    await _box.put(favoriteKey, ids);
  }

  /// Toggle trạng thái yêu thích của một item.
  /// Nếu đã yêu thích → xóa khỏi danh sách.
  /// Nếu chưa yêu thích → thêm vào cuối danh sách.
  static Future<void> toggle(AppItemModel item) async {
    final ids = loadIds();

    if (ids.contains(item.id)) {
      ids.remove(item.id);
    } else {
      ids.add(item.id);
    }

    await _saveIds(ids);
  }

  /// Toggle trạng thái yêu thích theo ID.
  static Future<void> toggleById(String id) async {
    final ids = loadIds();

    if (ids.contains(id)) {
      ids.remove(id);
    } else {
      ids.add(id);
    }

    await _saveIds(ids);
  }

  /// Load set ID favorites — dùng cho UI check trạng thái nhanh.
  static Set<String> loadIdSet() {
    return loadIds().toSet();
  }

  /// Load items giữ nguyên thứ tự như registry, không reorder.
  static List<AppItemModel> loadSorted(List<AppItemModel> all) {
    return all;
  }
}
