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

  static String? validateCpReport<T>({
    required DateTime? date,
    required List<T> works,

    required int? Function(T) getFilmId,
    required int? Function(T) getQuantity,
    required int? Function(T) getActualTime,
    required int? Function(T) getPerformanceActual,
    required int? Function(T) getPercentage,
  }) {

    if (date == null) {
      return 'Vui lòng chọn Ngày báo cáo';
    }

    if (works.isEmpty) {
      return 'Vui lòng thêm ít nhất 1 công việc';
    }

    final usedIds = <int>{};

    for (int i = 0; i < works.length; i++) {
      final work = works[i];
      final prefix = 'Công việc ${i + 1}: ';

      final filmId = getFilmId(work) ?? 0;

      if (filmId == 0) {
        return '${prefix}Vui lòng chọn nội dung công việc';
      }

      if (usedIds.contains(filmId)) {
        return '${prefix}Nội dung công việc đã được chọn';
      }

      usedIds.add(filmId);

      final quantity = getQuantity(work) ?? 0;
      final time = getActualTime(work) ?? 0;
      final performance = getPerformanceActual(work) ?? 0;
      final percent = getPercentage(work) ?? 0;

      if (quantity <= 0) {
        return '${prefix}Số lượng phải lớn hơn 0';
      }

      if (time <= 0) {
        return '${prefix}Thời gian thực hiện phải lớn hơn 0';
      }

      if (performance <= 0) {
        return '${prefix}Năng suất thực tế không hợp lệ';
      }

      if (percent <= 0) {
        return '${prefix}Tỷ lệ (%) không hợp lệ';
      }
    }

    return null;
  }

  static String? validateAgvAdReport<T>({
    required DateTime? date,
    required List<T> works,

    required String? Function(T) getProjectName,
    required double Function(T) getTotalHours,
    required double? Function(T) getOtHours,
    required String Function(T) getContent,
    required String Function(T) getResult,

    String? locationType,
    String? location,
    String? nextPlan,
  }) {
    if (date == null) return 'Vui lòng chọn Ngày báo cáo';
    if (works.isEmpty) return 'Vui lòng thêm ít nhất 1 dự án';

    double totalDayHours = 0;
    double totalDayOT = 0;

    final usedProjects = <String>{};

    for (int i = 0; i < works.length; i++) {
      final work = works[i];
      final prefix = 'Dự án ${i + 1}: ';

      final projectName = (getProjectName(work) ?? '').trim();

      if (projectName.isEmpty) {
        return '${prefix}Vui lòng chọn dự án';
      }

      if (usedProjects.contains(projectName)) {
        return '${prefix}Dự án đã được chọn ở dòng khác';
      }

      usedProjects.add(projectName);

      final total = getTotalHours(work);
      final ot = getOtHours(work) ?? 0;

      if (total <= 0) return '${prefix}Tổng số giờ phải lớn hơn 0';
      if (total > 24) return '${prefix}Tổng số giờ không được lớn hơn 24';

      if (ot < 0) return '${prefix}Số giờ OT không được nhỏ hơn 0';
      if (ot > total) {
        return '${prefix}Số giờ OT không được lớn hơn Tổng số giờ';
      }

      if (total > 8 && ot <= 0) {
        return '${prefix}Tổng số giờ lớn hơn 8, vui lòng nhập OT';
      }

      if (total - ot > 8) {
        return '${prefix}Số giờ hành chính không được lớn hơn 8h';
      }

      if (total - ot <= 0) {
        return '${prefix}Số giờ hành chính phải lớn hơn 0';
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

  static String? validateSaleAdminReport<T>({
    required List<T> reports,

    required String Function(T) getEmployeeFullName,
    required String Function(T) getTypeReportName,
    required String Function(T) getReportContent,
    required String Function(T) getResult,
    required String Function(T) getPlanNextDay,
  }) {
    if (reports.isEmpty) return 'Vui lòng thêm ít nhất 1 báo cáo';

    final usedTypes = <String>{};

    for (int i = 0; i < reports.length; i++) {
      final report = reports[i];
      final prefix = 'Báo cáo ${i + 1}: ';

      final employee = getEmployeeFullName(report).trim();
      final typeName = getTypeReportName(report).trim();

      if (employee.isEmpty) {
        return '${prefix}Vui lòng chọn Nhân viên';
      }

      if (typeName.isEmpty) {
        return '${prefix}Vui lòng chọn loại báo cáo';
      }

      if (usedTypes.contains(typeName)) {
        return '${prefix}Loại báo cáo đã được chọn ở dòng khác';
      }

      usedTypes.add(typeName);

      if (getReportContent(report).trim().isEmpty) {
        return '${prefix}Vui lòng nhập Nội dung';
      }

      if (getResult(report).trim().isEmpty) {
        return '${prefix}Vui lòng nhập Kết quả';
      }

      if (getPlanNextDay(report).trim().isEmpty) {
        return '${prefix}Vui lòng nhập Kế hoạch ngày tiếp theo';
      }
    }

    return null;
  }

  static String? validateSaleStaffReport<T>({
    required List<T> reports,

    required String Function(T) getFirmName,
    required int? Function(T) getProjectTypeBaseID,
    required String Function(T) getCustomerName,
    required String Function(T) getProjectTypeName,
    required String Function(T) getContactName,
    required String Function(T) getMainIndex,
    required String Function(T) getContent,
    required String Function(T) getResult,
    required String Function(T) getPlanNext,
    required String Function(T) getProductOfCustomer,
    required String Function(T) getStatusName,
  }) {
    if (reports.isEmpty) return 'Vui lòng thêm ít nhất 1 báo cáo';

    for (int i = 0; i < reports.length; i++) {
      final report = reports[i];
      final prefix = 'Báo cáo ${i + 1}: ';

      if (getFirmName(report).trim().isEmpty) {
        return '${prefix}Vui lòng chọn Công ty';
      }

      if ((getProjectTypeBaseID(report) ?? 0) <= 0) {
        return '${prefix}Vui lòng chọn Loại dự án';
      }

      if (getCustomerName(report).trim().isEmpty) {
        return '${prefix}Vui lòng chọn Khách hàng';
      }

      if (getProjectTypeName(report).trim().isEmpty) {
        return '${prefix}Vui lòng chọn Loại hình dự án';
      }

      if (getContactName(report).trim().isEmpty) {
        return '${prefix}Vui lòng nhập Người liên hệ';
      }

      if (getMainIndex(report).trim().isEmpty) {
        return '${prefix}Vui lòng nhập Chỉ số chính';
      }


      if (getStatusName(report).trim().isEmpty) {
        return '${prefix}Vui lòng chọn Trạng thái';
      }

      if (getContent(report).trim().isEmpty) {
        return '${prefix}Vui lòng nhập Nội dung';
      }

      if (getResult(report).trim().isEmpty) {
        return '${prefix}Vui lòng nhập Kết quả';
      }

      if (getPlanNext(report).trim().isEmpty) {
        return '${prefix}Vui lòng nhập Kế hoạch tiếp theo';
      }

      if (getProductOfCustomer(report).trim().isEmpty) {
        return '${prefix}Vui lòng nhập Sản phẩm của khách hàng';
      }

    }

    return null;
  }


  static String? validateMeetingRoom({
    required DateTime? date,
    required DateTime? startTime,
    required DateTime? endTime,
    required int? roomId,
    required int? departmentId,
    required String content,
  }) {
    if (date == null) {
      return 'Vui lòng chọn ngày';
    }

    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    final pickedDate = DateTime(date.year, date.month, date.day);

    if (pickedDate.isBefore(todayOnly)) {
      return 'Không được chọn ngày trước hiện tại';
    }

    if (startTime == null) {
      return 'Vui lòng chọn giờ bắt đầu';
    }

    if (startTime.hour < 8) {
      return 'Giờ bắt đầu không được trước 08:00';
    }

    if (startTime.hour > 17 ||
        (startTime.hour == 17 && startTime.minute > 0)) {
      return 'Giờ bắt đầu không được quá 17:00';
    }


    if (endTime == null) {
      return 'Vui lòng chọn giờ kết thúc';
    }

    if (!endTime.isAfter(startTime)) {
      return 'Giờ kết thúc phải lớn hơn giờ bắt đầu';
    }

    if (departmentId == null) {
      return 'Vui lòng chọn phòng ban';
    }

    if (roomId == null) {
      return 'Vui lòng chọn phòng họp';
    }

    if (content.trim().isEmpty) {
      return 'Vui lòng nhập nội dung cuộc họp';
    }

    return null;
  }
}
