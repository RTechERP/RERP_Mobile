import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../data/datasource/models/test_table_model.dart';
import '../../data/repository/test_table_repo.dart';

part 'test_table_event.dart';
part 'test_table_state.dart';
part 'test_table_bloc.g.dart';
part 'test_table_bloc.freezed.dart';

/// Bloc danh sách đăng ký bàn test ESL.
@injectable
class TestTableBloc extends BaseBloc<TestTableEvent, TestTableState> {
  final LogUtils _log;
  final TestTableRepo _repo;

  TestTableBloc(this._log, this._repo) : super(TestTableState.init()) {
    on<TestTableEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        refresh: () => _onRefresh(emit),
        changeKeyword: (keyword) => _onChangeKeyword(emit, keyword: keyword),
      );
    });
  }

  Future<void> _onInit(Emitter<TestTableState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading, message: null));
    await _fetchTestTables(emit);
  }

  Future<void> _onRefresh(Emitter<TestTableState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading, message: null));
    await _fetchTestTables(emit);
  }

  Future<void> _onChangeKeyword(
    Emitter<TestTableState> emit, {
    required String keyword,
  }) async {
    emit(
      state.copyWith(
        keyword: keyword,
        status: BaseStateStatus.loading,
        message: null,
      ),
    );
    await _fetchTestTables(emit);
  }

  /// Gọi API theo [TestTableState.keyword].
  Future<void> _fetchTestTables(Emitter<TestTableState> emit) async {
    final result = await _repo.getTestTableItem(keyword: state.keyword);

    result.fold(
      (error) {
        _log.logE('Get test tables failed: $error');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: error.getErrorMessage,
            testTable: const [],
          ),
        );
      },
      (items) {
        _log.logI('Get test tables success: ${items.length} items');
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            testTable: items,
            message: null,
          ),
        );
      },
    );
  }
}
