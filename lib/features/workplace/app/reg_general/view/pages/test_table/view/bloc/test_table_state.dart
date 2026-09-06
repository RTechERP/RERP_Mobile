part of 'test_table_bloc.dart';

/// State danh sách phiếu bàn test và từ khóa tìm kiếm hiện tại.
@CopyWith()
class TestTableState extends BaseBlocState {
  final List<TestCardItem> testCard;
  final List<TestTableItem> testTable;
  final List<EmployeeInfoItem> employee;
  final List<ProjectItem> project;
  final List<ApproverItem> approver;
  final String keyword;

  const TestTableState({
    required super.status,
    super.message,
    this.testCard = const [],
    this.testTable = const [],
    this.employee = const [],
    this.project = const [],
    this.approver = const [],
    this.keyword = '',
  });

  factory TestTableState.init() => const TestTableState(
    status: BaseStateStatus.init,
    testCard: [],
    testTable: [],
    employee: [],
    project: [],
    approver: [],
    keyword: '',
  );

  @override
  List get props => [
    status,
    message,
    testCard,
    testTable,
    employee,
    project,
    approver,
    keyword,
  ];
}
