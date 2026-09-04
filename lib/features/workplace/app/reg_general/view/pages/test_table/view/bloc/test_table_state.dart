part of 'test_table_bloc.dart';

/// State danh sách phiếu bàn test và từ khóa tìm kiếm hiện tại.
@CopyWith()
class TestTableState extends BaseBlocState {
  final List<TestTableItem> testTable;
  final String keyword;

  const TestTableState({
    required super.status,
    super.message,
    this.testTable = const [],
    this.keyword = '',
  });

  factory TestTableState.init() => const TestTableState(
        status: BaseStateStatus.init,
        testTable: [],
        keyword: '',
      );

  @override
  List get props => [
        status,
        message,
        testTable,
        keyword,
      ];
}
