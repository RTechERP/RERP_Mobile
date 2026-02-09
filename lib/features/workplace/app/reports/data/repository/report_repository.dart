import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../common/logger/index.dart';
import '../datasource/models/report_model.dart';


class ReportRepository {
  ReportRepository._();

  static const _projectKey = 'cached_projects';

  /// ==========================
  /// SAVE PROJECT LIST
  /// ==========================
  static Future<void> saveProjects({
    required List<ProjectResponse> projects,
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonList = projects.map((e) => e.toJson()).toList();
    final raw = jsonEncode(jsonList);

    await prefs.setString(_projectKey, raw);

    log?.logI('Projects saved: ${projects.length}');
  }

  /// ==========================
  /// GET PROJECT LIST
  /// ==========================
  static Future<List<ProjectResponse>> getProjects({
    LogUtils? log,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final raw = prefs.getString(_projectKey);
    if (raw == null || raw.isEmpty) {
      log?.logW('No cached projects found');
      return [];
    }

    try {
      final List list = jsonDecode(raw);
      final projects = list
          .map((e) => ProjectResponse.fromJson(e as Map<String, dynamic>))
          .toList();

      log?.logI('Projects loaded: ${projects.length}');
      return projects;
    } catch (e) {
      log?.logE('Parse cached projects failed: $e');
      return [];
    }
  }

  /// ==========================
  /// CLEAR PROJECT CACHE
  /// ==========================
  static Future<void> clearProjects({LogUtils? log}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_projectKey);

    log?.logI('Projects cache cleared');
  }
}
