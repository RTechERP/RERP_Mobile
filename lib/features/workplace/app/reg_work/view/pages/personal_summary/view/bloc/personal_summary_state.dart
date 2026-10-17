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
  final DateTime? dateStart;
  final DateTime? dateEnd;

  /// -1: tất cả, 0: chưa duyệt, 1: đã duyệt, 2: huỷ.
  final int statusFilter;

  /// Từ khoá tìm kiếm (apply client-side trên từng tab).
  final String keyword;

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
    this.dateStart,
    this.dateEnd,
    this.statusFilter = -1,
    this.keyword = '',
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
        dateStart: null,
        dateEnd: null,
        statusFilter: -1,
        keyword: '',
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
        dateStart,
        dateEnd,
        statusFilter,
        keyword,
      ];
}
