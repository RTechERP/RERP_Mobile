import '../../../../../../common/logger/index.dart';
import '../../../../data/repository/project_cache_repository.dart';
import '../datasource/models/report_model.dart';

/// Cache danh sách dự án cho feature Reports (tech / ad / agv).
///
/// Dùng chung [ProjectCacheRepository] với các chức năng khác để cache có
/// một nguồn quản lý duy nhất — key `cached_projects` được khai báo trong
/// [ProjectCacheKeys] để xoá tập trung khi đăng xuất.
class ReportRepository {
  ReportRepository._();

  /// ==========================
  /// SAVE PROJECT LIST
  /// ==========================
  static Future<void> saveProjects({
    required List<ProjectResponse> projects,
    LogUtils? log,
  }) async {
    await ProjectCacheRepository.saveProjects(
      cacheKey: ProjectCacheKeys.reports,
      projects: projects,
      toJson: (e) => e.toJson(),
    );

    log?.logI('Projects saved: ${projects.length}');
  }

  /// ==========================
  /// GET PROJECT LIST
  /// ==========================
  static Future<List<ProjectResponse>> getProjects({LogUtils? log}) async {
    final projects = await ProjectCacheRepository.getProjects(
      cacheKey: ProjectCacheKeys.reports,
      fromJson: ProjectResponse.fromJson,
    );

    if (projects.isEmpty) {
      log?.logW('No cached projects found');
    } else {
      log?.logI('Projects loaded: ${projects.length}');
    }
    return projects;
  }

  /// ==========================
  /// CLEAR PROJECT CACHE
  /// ==========================
  static Future<void> clearProjects({LogUtils? log}) async {
    await ProjectCacheRepository.clearProjects(
      cacheKey: ProjectCacheKeys.reports,
      log: log,
    );
  }
}
