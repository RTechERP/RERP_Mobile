/// Biến thể form đặt xe — dùng cho [ValidateHelper.validateBookingVehicle].
enum BookingVehicleValidationVariant {
  passengerGo,
  passengerReturn,
  commercialDelivery,
  commercialPickup,
}

class ValidateHelper {
  static String? validateLunch({
    required int? quantity,
    required String? location,
  }) {
    if (quantity == null || quantity <= 0) {
      return 'Số lượng phải lớn hơn 0';
    }
    if (location == null || location.trim().isEmpty) {
      return 'Vui lòng chọn địa điểm';
    }
    return null;
  }

  static String? validateLunchQuantityField(String? value) {
    final input = value?.trim() ?? '';
    if (input.isEmpty) return 'Vui lòng nhập số lượng';
    final quantity = int.tryParse(input);
    if (quantity == null) return 'Số lượng phải là số nguyên';
    if (quantity <= 0) return 'Số lượng phải lớn hơn 0';
    return null;
  }

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

  // --- Đặt xe (BookingVehicle) — Category API: 1 người đi, 2 giao TM, 5 người về, 6 lấy TM, 7 lấy Demo, 8 giao Demo

  static DateTime? _bvParseDt(dynamic v) {
    if (v == null) return null;
    if (v is DateTime) return v;
    if (v is String) {
      final t = v.trim();
      if (t.isEmpty) return null;
      return DateTime.tryParse(t);
    }
    return null;
  }

  static String _bvTrim(dynamic v) {
    if (v == null) return '';
    if (v is String) return v.trim();
    return v.toString().trim();
  }

  static bool _bvDepartureRulesApply(int category) =>
      category != 2 && category != 6 && category != 7 && category != 8;

  static bool _bvNeedsDepartureAddress(int category) =>
      category != 6 && category != 7;

  static String _bvDepartureAddressFromPassengerGoForm(Map<String, dynamic> f) {
    final dest = _bvTrim(f['destination_address']);
    if (dest.isNotEmpty) return dest;
    return _bvTrim(f['starting_point']);
  }

  static String _bvDepartureAddressFromReturnForm(Map<String, dynamic> f) {
    final addr = _bvTrim(f['return_address']);
    if (addr.isNotEmpty) return addr;
    return _bvTrim(f['return_point']);
  }

  static String _bvCommercialReceiverDisplayName(Map<String, dynamic> f, int i) {
    final n = _bvTrim(f['receiver_name_$i']);
    if (n.isNotEmpty) return n;
    final pick = _bvTrim(f['receiver_employee_$i']);
    if (pick.isEmpty) return '';
    final sep = pick.indexOf(' - ');
    if (sep > 0) return pick.substring(sep + 3).trim();
    return pick;
  }

  static String _bvPickupGiverDisplayName(Map<String, dynamic> f, int i) {
    final n = _bvTrim(f['pickup_giver_name_$i']);
    if (n.isNotEmpty) return n;
    final pick = _bvTrim(f['pickup_giver_employee_$i']);
    if (pick.isEmpty) return '';
    final sep = pick.indexOf(' - ');
    if (sep > 0) return pick.substring(sep + 3).trim();
    return pick;
  }

  static int _bvPackageQty(Map<String, dynamic> f, String key) {
    final raw = f[key];
    if (raw is int) return raw;
    return int.tryParse(_bvTrim(raw)) ?? 0;
  }

  /// **Phát sinh** theo quy tắc nghiệp vụ (đồng bộ BE):
  /// - Ngày đăng ký ≠ ngày cần đến → không phát sinh.
  /// - Cùng ngày: giờ đăng ký ≥ 20:00 → phát sinh; hoặc giờ đăng ký &lt; 16:30 → phát sinh;
  ///   trong [16:30, 20:00) → không phát sinh.
  static bool bookingVehicleIsProblemArises({
    required DateTime? timeNeedPresent,
    required DateTime registrationTime,
  }) {
    final need = timeNeedPresent;
    if (need == null) return false;
    final needDay = DateTime(need.year, need.month, need.day);
    final regDay = DateTime(
      registrationTime.year,
      registrationTime.month,
      registrationTime.day,
    );
    if (needDay != regDay) return false;

    final regMinutes =
        registrationTime.hour * 60 + registrationTime.minute;
    const t1630 = 16 * 60 + 30;
    const t20 = 20 * 60;
    if (regMinutes >= t20) return true;
    if (regMinutes < t1630) return true;
    return false;
  }

  /// Cờ nghiệp vụ / payload: có phát sinh thật (đồng bộ BE) — dùng khi build body và khi bắt TBP lúc submit.
  ///
  /// [registrationReference]: khi sửa bản ghi, truyền `CreatedDate` gốc; tạo mới để `null` (dùng [DateTime.now]).
  static bool bookingVehicleShouldShowProblemArisesCard(
    DateTime? needTime, [
    DateTime? registrationReference,
  ]) {
    final reg = registrationReference ?? DateTime.now();
    return bookingVehicleIsProblemArises(
      timeNeedPresent: needTime,
      registrationTime: reg,
    );
  }

  /// **Chỉ UI:** hiện card «Vấn đề phát sinh / TBP» khi mốc cần đến (ngày lịch) trùng **hôm nay**.
  /// Người dùng có thể điền sớm; bắt buộc TBP/lý do vẫn theo [bookingVehicleIsProblemArises] + [validateBookingVehicle].
  static bool bookingVehicleProblemArisesCardVisibleForUi(DateTime? timeNeedPresent) {
    if (timeNeedPresent == null) return false;
    final n = DateTime.now();
    final today = DateTime(n.year, n.month, n.day);
    final needDay = DateTime(
      timeNeedPresent.year,
      timeNeedPresent.month,
      timeNeedPresent.day,
    );
    return needDay == today;
  }

  /// Validate tổng hợp form đặt xe trước khi gửi bloc/API.
  ///
  /// Thứ tự kiểm tra bám theo thứ tự field trên UI (TypeForm* → phát sinh → danh sách dòng).
  static String? validateBookingVehicle({
    required BookingVehicleValidationVariant variant,
    required int apiCategory,
    required Map<String, dynamic> form,
    required int lineCount,
    required int projectId,
    required int vehicleType,
  }) {
    // 1) Hình thức / category
    if (apiCategory == 0) {
      return 'Loại đăng ký không hợp lệ.';
    }

    // 2) Dự án
    if (projectId == 0) {
      return 'Vui lòng chọn dự án.';
    }

    final DateTime? timeNeed = switch (variant) {
      BookingVehicleValidationVariant.commercialPickup =>
        _bvParseDt(form['pickup_need_arrive_time']),
      _ => _bvParseDt(form['time_need_present']),
    };

    // 3) Thời gian cần đến / cần về / giao đến / đến lấy
    if (timeNeed == null) {
      return switch (variant) {
        BookingVehicleValidationVariant.commercialPickup =>
          'Vui lòng chọn thời gian cần đến lấy.',
        BookingVehicleValidationVariant.commercialDelivery =>
          'Vui lòng chọn thời gian cần giao đến.',
        BookingVehicleValidationVariant.passengerReturn =>
          'Vui lòng chọn thời gian cần về.',
        BookingVehicleValidationVariant.passengerGo =>
          'Vui lòng chọn thời gian cần đến.',
      };
    }

    final now = DateTime.now();
    if (!timeNeed.isAfter(now)) {
      return switch (variant) {
        BookingVehicleValidationVariant.commercialPickup =>
          'Thời gian cần đến lấy phải lớn hơn thời gian hiện tại.',
        BookingVehicleValidationVariant.commercialDelivery =>
          'Thời gian cần giao đến phải lớn hơn thời gian hiện tại.',
        BookingVehicleValidationVariant.passengerReturn =>
          'Thời gian cần về phải lớn hơn thời gian hiện tại.',
        BookingVehicleValidationVariant.passengerGo =>
          'Thời gian cần đến phải lớn hơn thời gian hiện tại.',
      };
    }

    // 3b) Giao hàng (2/8): thời gian lấy hàng — bắt buộc, không sau mốc cần giao đến
    if (variant == BookingVehicleValidationVariant.commercialDelivery) {
      final takeGoods = _bvParseDt(form['time_return']);
      if (takeGoods == null) {
        return 'Vui lòng chọn thời gian lấy hàng.';
      }
      if (takeGoods.isAfter(timeNeed)) {
        return 'Thời gian lấy hàng không được lớn hơn thời gian cần giao đến.';
      }
    }

    // 3c) Lấy hàng (6/7): thời gian xuất phát — bắt buộc, không sau mốc cần đến lấy
    if (variant == BookingVehicleValidationVariant.commercialPickup) {
      final departPickup = _bvParseDt(form['pickup_departure_time']);
      if (departPickup == null) {
        return 'Vui lòng chọn thời gian xuất phát.';
      }
      if (departPickup.isAfter(timeNeed)) {
        return 'Thời gian xuất phát không được lớn hơn thời gian cần đến lấy.';
      }
    }

    // 4) Điểm đến: công ty, tỉnh, địa chỉ cụ thể
    final String company;
    final String province;
    final String specific;
    switch (variant) {
      case BookingVehicleValidationVariant.commercialPickup:
        company = _bvTrim(form['pickup_company']);
        province = _bvTrim(form['pickup_province']);
        specific = _bvTrim(form['pickup_address']);
        break;
      default:
        company = _bvTrim(form['location_address']);
        province = _bvTrim(form['provinces']);
        specific = _bvTrim(form['address']);
    }

    if (company.isEmpty) {
      return switch (variant) {
        BookingVehicleValidationVariant.commercialPickup =>
          'Vui lòng nhập công ty đến lấy.',
        BookingVehicleValidationVariant.commercialDelivery =>
          'Vui lòng nhập công ty giao đến.',
        _ => 'Vui lòng nhập công ty đến.',
      };
    }
    if (province.isEmpty) {
      return switch (variant) {
        BookingVehicleValidationVariant.commercialPickup =>
          'Vui lòng chọn tỉnh đến lấy.',
        BookingVehicleValidationVariant.commercialDelivery =>
          'Vui lòng chọn tỉnh giao đến.',
        BookingVehicleValidationVariant.passengerReturn =>
          'Vui lòng chọn tỉnh cần về.',
        _ => 'Vui lòng chọn tỉnh đến.',
      };
    }
    if (specific.isEmpty) {
      return 'Vui lòng nhập địa chỉ cụ thể.';
    }

    // 5) Thời gian xuất phát / thời gian đón (category áp rule departure)
    if (_bvDepartureRulesApply(apiCategory)) {
      final DateTime? dep = switch (variant) {
        BookingVehicleValidationVariant.passengerGo =>
          _bvParseDt(form['time_depart']),
        BookingVehicleValidationVariant.passengerReturn =>
          _bvParseDt(form['time_return']),
        _ => null,
      };

      if (dep == null) {
        return switch (variant) {
          BookingVehicleValidationVariant.passengerReturn =>
            'Vui lòng chọn thời gian đón.',
          _ => 'Vui lòng chọn thời gian xuất phát.',
        };
      }

      if (!dep.isAfter(now)) {
        return switch (variant) {
          BookingVehicleValidationVariant.passengerReturn =>
            'Thời gian đón phải lớn hơn thời gian hiện tại.',
          _ => 'Thời gian xuất phát phải lớn hơn thời gian hiện tại.',
        };
      }

      if (!dep.isBefore(timeNeed)) {
        return switch (variant) {
          BookingVehicleValidationVariant.passengerReturn =>
            'Thời gian đón phải nhỏ hơn thời gian cần về.',
          _ =>
              'Thời gian xuất phát phải nhỏ hơn thời gian cần đến.',
        };
      }
    }

    // 6) Thời gian quay về (người đi — nếu có nhập)
    if (variant == BookingVehicleValidationVariant.passengerGo) {
      final tr = _bvParseDt(form['time_return']);
      if (tr != null && !tr.isAfter(timeNeed)) {
        return 'Thời gian quay về phải lớn hơn thời gian cần đến.';
      }
    }

    // 7) Địa chỉ xuất phát / địa chỉ quay về (sau các field điểm đi — điểm về trên form)
    if (_bvNeedsDepartureAddress(apiCategory)) {
      final String depAddr;
      if (apiCategory == 1) {
        depAddr = _bvDepartureAddressFromPassengerGoForm(form);
      } else {
        depAddr = _bvDepartureAddressFromReturnForm(form);
      }
      if (depAddr.isEmpty) {
        return 'Vui lòng nhập địa chỉ xuất phát.';
      }
    }

    if (apiCategory == 1) {
      if (_bvDepartureAddressFromReturnForm(form).isEmpty) {
        return 'Vui lòng nhập địa chỉ quay về.';
      }
    }

    // 8) Loại phương tiện
    if (vehicleType == 0) {
      return 'Vui lòng chọn loại phương tiện.';
    }

    // 9) Người duyệt TBP + lý do phát sinh — cùng điều kiện hiện card
    // [bookingVehicleProblemArisesCardVisibleForUi] (không áp category 5 / người về).
    // Cờ API [IsProblemArises] vẫn tính riêng bằng [bookingVehicleIsProblemArises] trong payload.
    final tbpAndProblemRequired = apiCategory != 5 &&
        bookingVehicleProblemArisesCardVisibleForUi(timeNeed);
    if (tbpAndProblemRequired) {
      final rawTbp = form['approved_tbp'];
      final tbp = rawTbp is int
          ? rawTbp
          : int.tryParse(_bvTrim(rawTbp)) ?? 0;
      if (tbp == 0) {
        return 'Vui lòng chọn người duyệt TBP.';
      }
      if (_bvTrim(form['problem_arises']).isEmpty) {
        return 'Vui lòng nhập lý do phát sinh.';
      }
    }

    // 10) Danh sách người đi / người về (cuối màn hình)
    if (apiCategory == 1 || apiCategory == 5) {
      if (lineCount <= 0) {
        return apiCategory == 5
            ? 'Chưa có dòng người về.'
            : 'Chưa có dòng người đi.';
      }
      for (var i = 0; i < lineCount; i++) {
        if (_bvTrim(form['passenger_full_name_$i']).isEmpty) {
          return 'Vui lòng nhập tên người đi (dòng ${i + 1}).';
        }
        if (_bvTrim(form['passenger_contact_phone_$i']).isEmpty) {
          return 'Vui lòng nhập SĐT người đi (dòng ${i + 1}).';
        }
      }
    }

    // 11) Giao / lấy hàng — từng dòng người nhận hoặc người giao
    if ({2, 6, 7, 8}.contains(apiCategory)) {
      if (lineCount <= 0) {
        return (apiCategory == 2 || apiCategory == 8)
            ? 'Chưa có dòng người nhận.'
            : 'Chưa có dòng người giao.';
      }
      for (var i = 0; i < lineCount; i++) {
        if (apiCategory == 2 || apiCategory == 8) {
          final rName = _bvCommercialReceiverDisplayName(form, i);
          if (rName.isEmpty) {
            return 'Vui lòng nhập tên người nhận (dòng ${i + 1}).';
          }
          if (_bvTrim(form['receiver_phone_number_$i']).isEmpty) {
            return 'Vui lòng nhập SĐT người nhận (dòng ${i + 1}).';
          }
          if (_bvTrim(form['commercial_package_name_$i']).isEmpty) {
            return 'Vui lòng nhập tên kiện hàng (dòng ${i + 1}).';
          }
          if (_bvTrim(form['package_size_$i']).isEmpty) {
            return 'Vui lòng nhập kích thước kiện hàng (dòng ${i + 1}).';
          }
          if (_bvTrim(form['package_weight_$i']).isEmpty) {
            return 'Vui lòng nhập cân nặng kiện hàng (dòng ${i + 1}).';
          }
          final q = _bvPackageQty(form, 'commercial_package_quantity_$i');
          if (q <= 0) {
            return 'Số lượng kiện hàng phải lớn hơn 0 (dòng ${i + 1}).';
          }
        } else {
          final gName = _bvPickupGiverDisplayName(form, i);
          if (gName.isEmpty) {
            return 'Vui lòng nhập tên người giao (dòng ${i + 1}).';
          }
          if (_bvTrim(form['pickup_giver_phone_number_$i']).isEmpty) {
            return 'Vui lòng nhập SĐT người giao (dòng ${i + 1}).';
          }
          if (_bvTrim(form['pickup_package_name_$i']).isEmpty) {
            return 'Vui lòng nhập tên kiện hàng (dòng ${i + 1}).';
          }
          if (_bvTrim(form['pickup_package_size_$i']).isEmpty) {
            return 'Vui lòng nhập kích thước kiện hàng (dòng ${i + 1}).';
          }
          if (_bvTrim(form['pickup_package_weight_$i']).isEmpty) {
            return 'Vui lòng nhập cân nặng kiện hàng (dòng ${i + 1}).';
          }
          final q = _bvPackageQty(form, 'pickup_package_quantity_$i');
          if (q <= 0) {
            return 'Số lượng kiện hàng phải lớn hơn 0 (dòng ${i + 1}).';
          }
        }
      }
    }

    return null;
  }

  /// Validate form tạo mới `InOut` (đi muộn - về sớm).
  ///
  /// Trả về `String` mô tả lỗi (nếu có), ngược lại `null` nếu form hợp lệ.
  static String? validateInOut({
    required DateTime todayStart,
    required DateTime? date,
    required DateTime? from,
    required DateTime? to,
    required String? typeRaw,
    required String? approverTpRaw,
    required String? reason,
    /// Màn tạo mới: `true`. Màn chi tiết / sửa đơn cũ: `false` để cho phép ngày đã qua.
    bool disallowPastDates = true,
  }) {
    if (date == null) return 'Vui lòng chọn ngày';

    final pickedDay = DateTime(date.year, date.month, date.day);
    if (disallowPastDates && pickedDay.isBefore(todayStart)) {
      return 'Không được chọn ngày cũ';
    }

    if (from == null || to == null) return 'Vui lòng chọn thời gian';

    final typeTrim = typeRaw?.trim() ?? '';
    if (typeTrim.isEmpty) return 'Vui lòng chọn loại';

    final approverTrim = approverTpRaw?.trim() ?? '';
    if (approverTrim.isEmpty) return 'Vui lòng chọn người duyệt';

    if ((reason ?? '').trim().isEmpty) return 'Vui lòng nhập lý do';

    final dateStart = DateTime(
      date.year,
      date.month,
      date.day,
      from.hour,
      from.minute,
    );
    final dateEnd = DateTime(
      date.year,
      date.month,
      date.day,
      to.hour,
      to.minute,
    );

    if (!dateEnd.isAfter(dateStart)) {
      return 'Giờ kết thúc phải lớn hơn giờ bắt đầu';
    }

    // Map loại form -> payload API.
    final type = switch (typeTrim) {
      'late_company' => 1,
      'early_company' => 2,
      'late_personal' => 3,
      'early_personal' => 4,
      _ => 0,
    };
    if (type == 0) return 'Loại không hợp lệ';

    final approvedTP = int.tryParse(approverTrim) ?? 0;
    if (approvedTP == 0) return 'Người duyệt không hợp lệ';

    return null;
  }

  static String? validateWfhContentField(String? value) {
    final t = value?.trim() ?? '';
    if (t.isEmpty) return 'Vui lòng nhập nội dung/kế hoạch công việc';
    if (t.length < 10) return 'Nội dung tối thiểu 10 ký tự';
    return null;
  }

  static String? validateWfhReasonField(String? value) {
    if ((value?.trim() ?? '').isEmpty) return 'Vui lòng nhập lý do';
    return null;
  }

  /// [requireAfterToday]: `true` khi tạo mới (chỉ ngày tương lai); `false` khi sửa đơn (cho phép ngày hiện tại / quá khứ).
  static String? validateWfhDateField(
    DateTime? value, {
    required DateTime todayStart,
    bool requireAfterToday = true,
  }) {
    if (value == null) return 'Vui lòng chọn ngày';
    final d = DateTime(value.year, value.month, value.day);
    if (requireAfterToday && !d.isAfter(todayStart)) {
      return 'Chỉ được đăng ký WFH cho các ngày sau hôm nay';
    }
    return null;
  }

  /// Validate tổng hợp trước khi gửi WFH (tạo mới hoặc sửa — [requireFutureWfhDate] giống In/Out `disallowPastDates`).
  static String? validateWfh({
    required DateTime todayStart,
    required DateTime? date,
    required String? sessionRaw,
    required String? approverIdRaw,
    required String? content,
    required String? reason,
    bool requireFutureWfhDate = true,
  }) {
    final dateErr = validateWfhDateField(
      date,
      todayStart: todayStart,
      requireAfterToday: requireFutureWfhDate,
    );
    if (dateErr != null) return dateErr;

    final sessionTrim = (sessionRaw ?? '').trim();
    if (sessionTrim.isEmpty) return 'Vui lòng chọn thời gian';
    const knownSessions = {'morning', 'afternoon', 'full_day'};
    if (!knownSessions.contains(sessionTrim)) {
      return 'Thời gian không hợp lệ';
    }

    final approverTrim = (approverIdRaw ?? '').trim();
    if (approverTrim.isEmpty) return 'Vui lòng chọn người duyệt';
    final approvedId = int.tryParse(approverTrim) ?? 0;
    if (approvedId <= 0) return 'Người duyệt không hợp lệ';

    final contentErr = validateWfhContentField(content);
    if (contentErr != null) return contentErr;

    final reasonErr = validateWfhReasonField(reason);
    if (reasonErr != null) return reasonErr;

    return null;
  }
}
