class ValidateHelper {
  static String? validateReport<T>({
    required DateTime? date,
    required int projectId,
    required List<T> works,

    required int? Function(T) getProjectItemId,
    required double Function(T) getTotalHours,
    required double? Function(T) getOtHours,
    required double Function(T) getPercent,
    required String Function(T) getContent,
    required String Function(T) getResult,

    String? locationType,
    String? location,
    String? nextPlan,
  }) {
    if (date == null) return 'Vui lòng chọn Ngày báo cáo';
    if (projectId == 0) return 'Vui lòng chọn dự án';
    if (works.isEmpty) return 'Vui lòng thêm ít nhất 1 công việc';

    double totalDayHours = 0;
    double totalDayOT = 0;
    final usedIds = <int>{};

    for (int i = 0; i < works.length; i++) {
      final work = works[i];
      final prefix = 'Công việc ${i + 1}: ';

      final id = getProjectItemId(work) ?? 0;
      if (id == 0) return '${prefix}Vui lòng chọn hạng mục';
      if (usedIds.contains(id)) {
        return '${prefix}Hạng mục đã được chọn ở công việc khác';
      }
      usedIds.add(id);

      final total = getTotalHours(work);
      final ot = getOtHours(work) ?? 0;

      if (total <= 0) return '${prefix}Tổng số giờ phải lớn hơn 0';
      if (total > 24) return '${prefix}Tổng số giờ không được lớn hơn 24';
      if (ot < 0) return '${prefix}Số giờ OT không được nhỏ hơn 0';
      if (ot > total)
        return '${prefix}Số giờ OT không được lớn hơn Tổng số giờ';
      if (total > 8 && ot <= 0) {
        return '${prefix}Tổng số giờ lớn hơn 8, vui lòng nhập OT';
      }
      if (total - ot > 8) {
        return '${prefix}Số giờ hành chính không được lớn hơn 8h';
      }
      if (total - ot <= 0) {
        return '${prefix}Số giờ hành chính phải lớn hơn 0';
      }

      final percent = getPercent(work);
      if (percent <= 0 || percent > 100) {
        return '$prefix% Hoàn thành phải từ 1 đến 100';
      }

      if (getContent(work).trim().isEmpty) {
        return '${prefix}Vui lòng nhập nội dung công việc';
      }

      if (getResult(work).trim().isEmpty) {
        return '${prefix}Vui lòng nhập kết quả';
      }

      totalDayHours += total;
      totalDayOT += ot;
    }

    if (totalDayHours - totalDayOT > 8) {
      return 'Tổng giờ hành chính trong ngày không được lớn hơn 8h';
    }

    if (locationType == 'other' && (location?.trim().isEmpty ?? true)) {
      return 'Vui lòng nhập Nơi làm việc';
    }

    if (nextPlan?.trim().isEmpty ?? true) {
      return 'Vui lòng nhập Kế hoạch ngày tiếp theo';
    }

    return null;
  }

  static String? validateMarketingReport({
    required DateTime? date,
    required String content,
    required String result,
    required String planNextDay,
  }) {
    if (date == null) {
      return 'Vui lòng chọn Ngày báo cáo';
    }

    if (content.trim().isEmpty) {
      return 'Vui lòng nhập Nội dung công việc';
    }

    if (result.trim().isEmpty) {
      return 'Vui lòng nhập Kết quả';
    }

    if (planNextDay.trim().isEmpty) {
      return 'Vui lòng nhập Kế hoạch ngày tiếp theo';
    }

    return null;
  }

  static String? validateLxReport({
    required DateTime? date,
    required int? kmNumber,
    required int? totalLate,
    required int? totalTimeLate,
  }) {
    if (date == null) {
      return 'Vui lòng chọn Ngày báo cáo';
    }

    if (kmNumber == null || kmNumber <= 0) {
      return 'Vui lòng nhập Số Km';
    }

    if (totalLate == null) {
      return 'Vui lòng nhập Số cuốc xe muộn';
    }

    if (totalTimeLate == null) {
      return 'Vui lòng nhập Tổng số phút chậm';
    }

    return null;
  }
}
