part of 'test_table_bloc.dart';

/// Sự kiện màn danh sách bàn test: tải lần đầu, làm mới, tìm kiếm.
@freezed
class TestTableEvent with _$TestTableEvent {
  const factory TestTableEvent.init() = _Init;

  const factory TestTableEvent.refresh() = _Refresh;

  const factory TestTableEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;
}
