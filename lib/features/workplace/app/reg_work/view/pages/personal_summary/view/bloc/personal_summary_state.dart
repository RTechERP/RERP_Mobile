part of 'personal_summary_bloc.dart';

@CopyWith()
class PersonalSummaryState extends BaseBlocState {
  final List<PersonalLeaveItem> onLeave;
  final List<PersonalEarlyLateItem> earlyLate;
  final List<PersonalOverTimeItem> overTime;
  final List<PersonalBussinessItem> bussiness;
  final List<PersonalWfhItem> wfh;
  final List<PersonalEnfItem> enf;
  final List<PersonalNightShiftItem> nightShift;
  final List<PersonalAttendanceItem> attendance;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  /// Danh sách phòng ban để chọn trong bottom sheet lọc.
  final List<SummaryDepartment> departments;

  /// Phòng ban đang được chọn để lọc (null = theo user hiện tại).
  final int? departmentId;

  /// Trạng thái duyệt bổ sung:
  /// -1: tất cả, 0: chờ duyệt, 1: đã duyệt, 2: từ chối.
  final int statusFilter;

  /// Từ khoá tìm kiếm (apply client-side trên từng tab).
  final String keyword;

  /// Danh sách nhân viên của phòng ban hiện tại (cache cho drawer).
  final List<PersonalAttendanceEmployee> employees;

  /// Nhân viên đang chọn trong drawer (null = chưa chọn).
  final int? selectedEmployeeId;

  /// Phòng ban đã load danh sách nhân viên thành công.
  final int? employeesLoadedForDept;

  /// Đang gọi API load employees.
  final bool employeesLoading;

  const PersonalSummaryState({
    required super.status,
    super.message,
    this.onLeave = const [],
    this.earlyLate = const [],
    this.overTime = const [],
    this.bussiness = const [],
    this.wfh = const [],
    this.enf = const [],
    this.nightShift = const [],
    this.attendance = const [],
    this.dateStart,
    this.dateEnd,
    this.departments = const [],
    this.departmentId,
    this.statusFilter = -1,
    this.keyword = '',
    this.employees = const [],
    this.selectedEmployeeId,
    this.employeesLoadedForDept,
    this.employeesLoading = false,
  });

  factory PersonalSummaryState.init() => const PersonalSummaryState(
        status: BaseStateStatus.init,
        onLeave: [],
        earlyLate: [],
        overTime: [],
        bussiness: [],
        wfh: [],
        enf: [],
        nightShift: [],
        attendance: [],
        dateStart: null,
        dateEnd: null,
        departments: [],
        departmentId: null,
        statusFilter: -1,
        keyword: '',
        employees: [],
        selectedEmployeeId: null,
        employeesLoadedForDept: null,
        employeesLoading: false,
      );

  @override
  List get props => [
        status,
        message,
        onLeave,
        earlyLate,
        overTime,
        bussiness,
        wfh,
        enf,
        nightShift,
        attendance,
        dateStart,
        dateEnd,
        departments,
        departmentId,
        statusFilter,
        keyword,
        employees,
        selectedEmployeeId,
        employeesLoadedForDept,
        employeesLoading,
      ];
}
