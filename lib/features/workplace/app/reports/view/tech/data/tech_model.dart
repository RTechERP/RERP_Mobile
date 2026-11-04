import 'package:equatable/equatable.dart';
import '../../../data/datasource/models/report_model.dart';

/// Một ca làm thêm (OT) gắn với một hạng mục công việc cụ thể.
///
/// Lưu ý: bảng `EmployeeOvertime` không có cột `ProjectItemID` — liên kết tới
/// hạng mục được BE ánh xạ qua bảng trung gian `EmployeeOvertimeProjectItem`
/// khi gọi `POST /api/DailyReportTech/save-overtime-tech`.
class OvertimeSession extends Equatable {
  /// Số ca làm thêm tối đa được khai báo cho 1 hạng mục trong 1 ngày.
  ///
  /// Ca 1: 18:00 - 20:00, Ca 2: 20:00 - 22:00, Ca 3: 22:00 - 23:59.
  /// Từ Ca 4 trở đi phải khai báo làm đêm.
  static const int maxShifts = 3;

  /// Thông báo khi đã đạt giới hạn số ca làm thêm.
  static const String maxShiftsMessage =
      'Thời gian làm thêm được khai báo đã tối đa! Vui lòng khai báo làm đêm';

  /// ID bản ghi trên BE. `0` = ca làm thêm mới (chưa lưu).
  final int id;

  final int employeeId;

  /// Người duyệt (trưởng phòng / đội trưởng) của nhân viên.
  final int approvedId;

  /// Ngày đăng ký làm thêm — luôn trùng với ngày báo cáo.
  final DateTime? dateRegister;

  final DateTime? timeStart;
  final DateTime? endTime;

  /// Số giờ thực tế = EndTime - TimeStart (làm tròn 2 chữ số).
  final double timeReality;

  /// Địa điểm làm thêm — dùng chung bảng `Location` với module làm thêm:
  /// 1 = Văn phòng RTC, 4 = Nhà máy RTC, 2 = Địa điểm công tác, 3 = Tại nhà.
  final int location;

  /// Loại làm thêm — trỏ tới `ID` của `/EmployeeTypeOverTime`.
  final int typeId;

  final int projectId;

  /// Hạng mục công việc mà ca làm thêm này gắn vào.
  final int projectItemId;

  /// Có hưởng phụ cấp ăn tối (đêm) hay không.
  final bool overnight;

  /// Phụ cấp đêm: 30000 VND khi [overnight] = true, ngược lại 0.
  final double costOvernight;

  final String reason;

  /// Đánh dấu xoá mềm — gửi lên BE cùng payload để dọn cả 2 bảng.
  final bool isDeleted;

  const OvertimeSession({
    required this.id,
    required this.employeeId,
    required this.approvedId,
    this.dateRegister,
    this.timeStart,
    this.endTime,
    this.timeReality = 0,
    this.location = 1,
    this.typeId = 1,
    this.projectId = 0,
    this.projectItemId = 0,
    this.overnight = false,
    this.costOvernight = 0,
    this.reason = '',
    this.isDeleted = false,
  });

  /// Tạo ca làm thêm mới (chưa lưu) gắn với hạng mục công việc.
  ///
  /// [timeStart] / [endTime] là khung giờ của ca (đã neo vào ngày báo cáo).
  /// Nếu truyền cả hai thì [timeReality] được tính tự động.
  ///
  /// [location] và [typeId] mặc định là `0` (chưa chọn) để bắt buộc người
  /// dùng chọn trong sheet — tránh gửi lên BE giá trị mặc định không mong muốn.
  ///
  /// [overnight] là trạng thái phụ cấp ăn tối (mặc định `false`).
  factory OvertimeSession.newSession({
    required int employeeId,
    required int approvedId,
    required DateTime dateRegister,
    required int projectId,
    required int projectItemId,
    DateTime? timeStart,
    DateTime? endTime,
    int location = 0,
    bool overnight = false,
  }) {
    return OvertimeSession(
      id: 0,
      employeeId: employeeId,
      approvedId: approvedId,
      dateRegister: dateRegister,
      timeStart: timeStart,
      endTime: endTime,
      timeReality: computeHours(timeStart, endTime) ?? 0,
      location: location,
      typeId: 0,
      projectId: projectId,
      projectItemId: projectItemId,
      overnight: overnight,
      costOvernight: overnight ? 30000 : 0,
    );
  }

  /// Ánh xạ từ response `GET /api/DailyReportTech/get-overtime-by-date`.
  factory OvertimeSession.fromApi(OvertimeRecord record) {
    return OvertimeSession(
      id: record.id,
      employeeId: record.employeeId ?? 0,
      approvedId: record.approvedId ?? 0,
      dateRegister: record.dateRegister,
      timeStart: record.timeStart,
      endTime: record.endTime,
      timeReality: record.timeReality ?? 0,
      location: record.location ?? 1,
      typeId: record.typeId ?? 1,
      projectId: record.projectId ?? 0,
      projectItemId: record.projectItemId ?? 0,
      overnight: record.overnight ?? false,
      costOvernight: record.costOvernight ?? 0,
      reason: record.reason ?? '',
      isDeleted: record.isDeleted ?? false,
    );
  }

  /// Tính lại số giờ thực tế từ [timeStart] / [endTime].
  ///
  /// Công thức: `Round((EndTime - TimeStart) / 3600000, 2)` — làm tròn 2 chữ số.
  /// Trả về `null` nếu thiếu mốc thời gian hoặc khoảng thời gian không hợp lệ.
  static double? computeHours(DateTime? start, DateTime? end) {
    if (start == null || end == null) return null;
    final minutes = end.difference(start).inMinutes;
    if (minutes <= 0) return null;
    final hours = minutes / 60;
    return (hours * 100).round() / 100;
  }

  /// Ca làm thêm `18:00 - 20:00` — mặc định được tích phụ cấp ăn tối.
  ///
  /// Dùng để tự động bật [overnight] khi ca trùng khung giờ này.
  static bool isDinnerShift(DateTime? start, DateTime? end) {
    if (start == null || end == null) return false;
    return start.hour == 18 &&
        start.minute == 0 &&
        end.hour == 20 &&
        end.minute == 0;
  }

  /// Kiểm tra tính hợp lệ của 1 ca làm thêm.
  ///
  /// [reportDate] là ngày báo cáo — ca làm thêm phải nằm trong ngày này.
  /// [reason] là lý do làm thêm dùng để validate (mặc định lấy từ session).
  /// Trả về thông báo lỗi, hoặc `null` nếu hợp lệ.
  static String? validate(
    OvertimeSession session, {
    required DateTime reportDate,
    String? reason,
  }) {
    if (session.timeStart == null || session.endTime == null) {
      return 'Vui lòng chọn thời gian bắt đầu và kết thúc của ca làm thêm';
    }

    if (!session.endTime!.isAfter(session.timeStart!)) {
      return 'Thời gian kết thúc phải lớn hơn thời gian bắt đầu';
    }

    // Ca làm thêm phải nằm trong ngày báo cáo (00:00 - 23:59).
    final dayStart = DateTime(
      reportDate.year,
      reportDate.month,
      reportDate.day,
    );
    final dayEnd = dayStart.add(const Duration(days: 1));

    if (session.timeStart!.isBefore(dayStart) ||
        !session.timeStart!.isBefore(dayEnd) ||
        !session.endTime!.isBefore(dayEnd)) {
      return 'Thời gian làm thêm phải nằm trong ngày báo cáo';
    }

    if (session.approvedId <= 0) {
      return 'Không tìm thấy người duyệt cho ca làm thêm';
    }

    if (session.location <= 0) {
      return 'Vui lòng chọn địa điểm làm thêm';
    }

    if (session.typeId <= 0) {
      return 'Vui lòng chọn loại làm thêm';
    }

    final finalReason = reason ?? session.reason;
    if (finalReason.trim().isEmpty) {
      return 'Vui lòng nhập lý do làm thêm';
    }

    return null;
  }

  OvertimeSession copyWith({
    int? id,
    int? employeeId,
    int? approvedId,
    DateTime? dateRegister,
    DateTime? timeStart,
    DateTime? endTime,
    double? timeReality,
    int? location,
    int? typeId,
    int? projectId,
    int? projectItemId,
    bool? overnight,
    double? costOvernight,
    String? reason,
    bool? isDeleted,
  }) {
    return OvertimeSession(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      approvedId: approvedId ?? this.approvedId,
      dateRegister: dateRegister ?? this.dateRegister,
      timeStart: timeStart ?? this.timeStart,
      endTime: endTime ?? this.endTime,
      timeReality: timeReality ?? this.timeReality,
      location: location ?? this.location,
      typeId: typeId ?? this.typeId,
      projectId: projectId ?? this.projectId,
      projectItemId: projectItemId ?? this.projectItemId,
      overnight: overnight ?? this.overnight,
      costOvernight: costOvernight ?? this.costOvernight,
      reason: reason ?? this.reason,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  /// Payload gửi lên `POST /api/DailyReportTech/save-overtime-tech`.
  Map<String, dynamic> toPayload() {
    return {
      'ID': id,
      'EmployeeID': employeeId,
      'ApprovedID': approvedId,
      'DateRegister': _formatIso(dateRegister),
      'TimeStart': _formatIso(timeStart),
      'EndTime': _formatIso(endTime),
      'TimeReality': timeReality,
      'Location': location,
      'TypeID': typeId,
      'ProjectID': projectId,
      'ProjectItemID': projectItemId,
      'Overnight': overnight,
      'CostOvernight': overnight ? 30000 : 0,
      'Reason': reason,
      'IsDeleted': isDeleted,
    };
  }

  /// Payload rút gọn cho bản ghi đã xoá mềm (chỉ cần ID + EmployeeID + IsDeleted).
  Map<String, dynamic> toDeletePayload() {
    return {
      'ID': id,
      'EmployeeID': employeeId,
      'IsDeleted': true,
    };
  }

  static String? _formatIso(DateTime? dt) {
    if (dt == null) return null;
    final y = dt.year.toString().padLeft(4, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    final hh = dt.hour.toString().padLeft(2, '0');
    final mm = dt.minute.toString().padLeft(2, '0');
    return '$y-$m-${d}T$hh:$mm:00';
  }

  @override
  List<Object?> get props => [
    id,
    employeeId,
    approvedId,
    dateRegister,
    timeStart,
    endTime,
    timeReality,
    location,
    typeId,
    projectId,
    projectItemId,
    overnight,
    costOvernight,
    reason,
    isDeleted,
  ];
}

class TechWork extends Equatable {
  final int id;

  final String code;
  final String fullName;
  final int userId;
  final String dateReport;

  final String? projectCode;
  final String? projectName;
  final String? projectText;

  final double totalHours;
  final double? totalHourOT;
  final double percentComplete;

  final String content;
  final String results;
  final String planNextDay;

  final String? backlog;
  final String? problem;

  final String? problemSolve;
  final String? note;

  final DateTime? createdDate;
  final int? type;
  final String positionName;
  final String mission;

  final String projectItemCode;

  final int? projectItemId;

  final DateTime? holidayDate;

  final String? planStartDate;
  final String? planEndDate;
  final String? actualStartDate;
  final String? actualEndDate;

  final int? totalDayPlan;
  final String? location;

  /// Danh sách ca làm thêm đã gắn với hạng mục công việc này.
  final List<OvertimeSession> overtimes;

  /// Người dùng có bật chế độ khai báo làm thêm cho hạng mục này hay không.
  final bool hasOvertime;


  const TechWork({
    required this.id,
    required this.code,
    required this.fullName,
    required this.userId,
    required this.dateReport,
    this.projectCode,
     this.projectName,
     this.projectText,
    required this.totalHours,
    this.totalHourOT,
    required this.percentComplete,
    required this.content,
    required this.results,
    required this.planNextDay,
    this.backlog,
    this.problem,
    this.note,
    this.createdDate,
    required this.type,
    required this.positionName,
    required this.mission,
    required this.projectItemCode,
    required this.holidayDate,
    this.planStartDate,
    this.planEndDate,
    this.actualStartDate,
    this.actualEndDate,
    this.totalDayPlan,
    this.problemSolve,
    this.projectItemId,
    this.location,
    this.overtimes = const [],
    this.hasOvertime = false,
  });

  factory TechWork.empty({
    required int projectId,
    required int userId,
    required String fullName,
    required String dateReport,
    DateTime? createdDate,
    String? projectCode,
    String? projectText,
    String? projectName,
    required String code,
    required int projectItemId,
  }) {
    return TechWork(
      id: DateTime.now().microsecondsSinceEpoch,
      code: code,
      fullName: fullName,
      userId: userId,
      dateReport: dateReport,

      projectCode: projectCode,
      projectName: projectName,
      projectText: projectText,

      totalHours: 0,
      totalHourOT: 0,
      percentComplete: 0,

      content: '',
      results: '',
      planNextDay: '',

      backlog: null,
      problem: null,
      note: null,

      createdDate: createdDate,
      type: 0,
      positionName: '',
      mission: '',

      projectItemCode: '',
      projectItemId: projectItemId,
      holidayDate: null,

      planStartDate: null,
      planEndDate: null,
      actualStartDate: null,
      actualEndDate: null,
      totalDayPlan: null,
      problemSolve: null,
    );
  }


  factory TechWork.fromReportResponse(ReportResponse r) => TechWork(
    id: r.id,
    code: r.code,
    fullName: r.fullName,
    userId: r.userId,
    dateReport: r.dateReport,
    projectCode: r.projectCode,
    projectName: r.projectName,
    projectText: r.projectText,
    totalHours: r.totalHours,
    totalHourOT: r.totalHourOT,
    percentComplete: r.percentComplete,
    content: r.content,
    results: r.results,
    planNextDay: r.planNextDay,
    backlog: r.backlog,
    problem: r.problem,
    note: r.note,
    createdDate: r.createdDate,
    type: r.type,
    positionName: r.positionName,
    mission: r.mission,
    projectItemCode: r.projectItemCode,
    holidayDate: r.holidayDate,
    planStartDate: r.planStartDate,
    planEndDate: r.planEndDate,
    actualStartDate: r.actualStartDate,
    actualEndDate: r.actualEndDate,
    totalDayPlan: r.totalDayPlan,
    problemSolve: r.problemSolve,
  );

  factory TechWork.fromDetailReportResponse(
      DetailReportResponse r, {
        required String code,
        required String fullName,
        required String positionName,
        required String mission,
        required String projectItemCode,
      }) {
    return TechWork(
      id: r.id,
      code: code,
      fullName: fullName,
      userId: r.userReport,
      dateReport: r.dateReport,

      projectCode: null,
      projectName: null,
      projectText: null,

      totalHours: r.totalHours,
      totalHourOT: r.totalHourOT,
      percentComplete: r.percentComplete.toDouble(),

      content: r.content,
      results: r.results,
      planNextDay: r.planNextDay,

      backlog: r.backlog,
      problem: r.problem,
      problemSolve: r.problemSolve,
      note: r.note,

      createdDate: r.createdDate,
      type: r.type,
      positionName: positionName,
      mission: mission,

      projectItemCode: projectItemCode,
      projectItemId: r.projectItemId,
      holidayDate: null,

      planStartDate: null,
      planEndDate: null,
      actualStartDate: null,
      actualEndDate: null,
      totalDayPlan: null,
    );
  }
  TechWork copyWith({
    String? code,
    String? projectCode,
    String? projectName,
    String? projectText,
    double? totalHours,
    double? totalHourOT,
    double? percentComplete,
    String? content,
    String? results,
    String? planNextDay,
    String? backlog,
    String? problem,
    String? note,
    String? projectItemCode,
    String? planStartDate,
    String? planEndDate,
    String? actualStartDate,
    String? actualEndDate,
    int? totalDayPlan,
    String? mission,
    DateTime? createdDate,
    int? type,
    String? positionName,
    String? problemSolve,
    int? projectItemId,
    String? dateReport,
    DateTime? holidayDate,
    String? location,
    List<OvertimeSession>? overtimes,
    bool? hasOvertime,
  }) {
    return TechWork(
      id: id,
      code: code ?? this.code,
      fullName: fullName,
      userId: userId,
      dateReport: dateReport ?? this.dateReport,

      projectCode: projectCode ?? this.projectCode,
      projectName: projectName ?? this.projectName,
      projectText: projectText ?? this.projectText,

      totalHours: totalHours ?? this.totalHours,
      totalHourOT: totalHourOT ?? this.totalHourOT,
      percentComplete: percentComplete ?? this.percentComplete,

      content: content ?? this.content,
      results: results ?? this.results,
      planNextDay: planNextDay ?? this.planNextDay,

      backlog: backlog ?? this.backlog,
      problem: problem ?? this.problem,
      note: note ?? this.note,

      createdDate: createdDate ?? this.createdDate,
      type: type ?? this.type,
      positionName: positionName ?? this.positionName,
      mission: mission ?? this.mission,

      projectItemCode: projectItemCode ?? this.projectItemCode,
      holidayDate: holidayDate,

      planStartDate: planStartDate ?? this.planStartDate,
      planEndDate: planEndDate ?? this.planEndDate,
      actualStartDate: actualStartDate ?? this.actualStartDate,
      actualEndDate: actualEndDate ?? this.actualEndDate,
      totalDayPlan: totalDayPlan ?? this.totalDayPlan,
      problemSolve: problemSolve ?? this.problemSolve,
      projectItemId: projectItemId ?? this.projectItemId,
      location: location ?? this.location,

      overtimes: overtimes ?? this.overtimes,
      hasOvertime: hasOvertime ?? this.hasOvertime,
    );
  }

  @override
  List<Object?> get props => [
    id,
    code,
    projectCode,
    projectName,
    projectText,
    totalHours,
    totalHourOT,
    percentComplete,
    content,
    results,
    planNextDay,
    backlog,
    problem,
    note,
    projectItemCode,
    planStartDate,
    planEndDate,
    actualStartDate,
    actualEndDate,
    totalDayPlan,
    mission,
    createdDate,
    type,
    positionName,
    problemSolve,
    userId,
    fullName,
    dateReport,
    holidayDate,
    projectItemId,
    location,
    overtimes,
    hasOvertime,
  ];
}


class TechProject extends Equatable {
  final String tempId;        // local id (UUID)
  final int? projectId;      // backend id
  final String? projectCode;
  final String? name;

  final String? code;

  /// 👇 FE quản lý work
  final List<TechWork> works;

  const TechProject({
    required this.tempId,
    this.projectId,
    this.projectCode,
    this.name,
    this.works = const [],
    this.code
  });

  TechProject copyWith({
    String? tempId,
    int? projectId,
    String? projectCode,
    String? name,
    List<TechWork>? works,
    String? code
  }) {
    return TechProject(
      tempId: tempId ?? this.tempId,
      projectId: projectId ?? this.projectId,
      projectCode: projectCode ?? this.projectCode,
      name: name ?? this.name,
      works: works ?? this.works,
      code: code ?? this.code,
    );
  }

  @override
  List<Object?> get props => [
    tempId,
    projectId,
    projectCode,
    name,
    works,
    code,
  ];
}



