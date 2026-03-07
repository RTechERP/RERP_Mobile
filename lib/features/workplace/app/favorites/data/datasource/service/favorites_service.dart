import 'package:hive/hive.dart';
import '../../../../../../../common/app_registry/app_items_registry.dart';
import '../../../../../../../common/models/index.dart';

const String favoriteBox = 'favorites';
const String favoriteKey = 'local_favorites';

class FavoriteService {
  static Box get _box => Hive.box(favoriteBox);

  /// 🔹 Load raw ids
  static List<String> loadIds() {
    final raw = _box.get(favoriteKey);
    if (raw == null) return [];
    return List<String>.from(raw);
  }

  /// 🔹 Load full items (dùng cho UI)
  static List<AppItemModel> load() {
    final ids = loadIds();

    return ids
        .map(AppItemRegistry.byId)
        .whereType<AppItemModel>() // loại null
        .toList();
  }

  /// 🔹 Save ids
  static Future<void> _saveIds(List<String> ids) async {
    await _box.put(favoriteKey, ids);
  }

  /// 🔹 Toggle by item
  static Future<void> toggle(AppItemModel item) async {
    final ids = loadIds();

    if (ids.contains(item.id)) {
      ids.remove(item.id);
    } else {
      // ids.add(item.id);
      ids.insert(0, item.id);
    }

    await _saveIds(ids);
  }

  /// 🔹 Toggle by id (tiện cho registry)
  static Future<void> toggleById(String id) async {
    final ids = loadIds();

    if (ids.contains(id)) {
      ids.remove(id);
    } else {
      ids.add(id);
    }

    await _saveIds(ids);
  }

  /// 🔹 Dùng cho UI check trạng thái
  static Set<String> loadIdSet() {
    return loadIds().toSet();
  }

  /// 🔹 Load items theo thứ tự favorite (favorite trước)
  static List<AppItemModel> loadSorted(List<AppItemModel> all) {
    final favoriteIds = loadIds();

    final favoriteSet = favoriteIds.toSet();

    final favorites = favoriteIds
        .map(AppItemRegistry.byId)
        .whereType<AppItemModel>()
        .toList();

    final others = all.where((e) => !favoriteSet.contains(e.id)).toList();

    return [...favorites, ...others];
  }

}
