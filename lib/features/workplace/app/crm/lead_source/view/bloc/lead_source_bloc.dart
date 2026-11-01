import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../data/datasource/models/lead_source_model.dart';
import '../../data/repo/lead_source_repo.dart';

part 'lead_source_event.dart';
part 'lead_source_state.dart';
part 'lead_source_bloc.g.dart';
part 'lead_source_bloc.freezed.dart';

/// Bloc xử lý logic nghiệp vụ cho màn Nguồn Lead của CRM.
@injectable
class LeadSourceBloc extends BaseBloc<LeadSourceEvent, LeadSourceState> {
  final LeadSourceRepo _repo;
  final LogUtils _log;

  LeadSourceBloc(this._repo, this._log) : super(LeadSourceState.init()) {
    on<LeadSourceEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        refresh: () => _onRefresh(emit),
        save: (source) => _onSave(emit, source: source),
        delete: (id) => _onDelete(emit, id: id),
        clearSaveState: () async => _onClearSaveState(emit),
        clearDeleteState: () async => _onClearDeleteState(emit),
      );
    });
  }

  /// Tải danh sách nguồn lead.
  Future<void> _onInit(Emitter<LeadSourceState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final result = await _repo.getLeadSources();

    result.fold(
      (error) {
        _log.logE('LeadSourceBloc._onInit error: ${error.getErrorMessage}');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: error.getErrorMessage,
        ));
      },
      (sources) {
        emit(state.copyWith(
          status: BaseStateStatus.success,
          sources: sources,
        ));
      },
    );
  }

  /// Refresh danh sách.
  Future<void> _onRefresh(Emitter<LeadSourceState> emit) async {
    final result = await _repo.getLeadSources();

    result.fold(
      (error) {
        _log.logE('LeadSourceBloc._onRefresh error: ${error.getErrorMessage}');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: error.getErrorMessage,
        ));
      },
      (sources) {
        emit(state.copyWith(
          status: BaseStateStatus.success,
          sources: sources,
        ));
      },
    );
  }

  /// Lưu nguồn lead.
  Future<void> _onSave(
    Emitter<LeadSourceState> emit, {
    required LeadSourceItem source,
  }) async {
    emit(state.copyWith(saveStatus: BaseStateStatus.loading));

    final result = await _repo.saveLeadSource(source);

    result.fold(
      (error) {
        _log.logE('LeadSourceBloc._onSave error: ${error.getErrorMessage}');
        emit(state.copyWith(
          saveStatus: BaseStateStatus.failed,
          saveMessage: error.getErrorMessage,
        ));
      },
      (savedSource) {
        emit(state.copyWith(
          saveStatus: BaseStateStatus.success,
          saveMessage: source.id == 0
              ? 'Thêm nguồn lead thành công!'
              : 'Cập nhật nguồn lead thành công!',
        ));
      },
    );
  }

  /// Xóa nguồn lead.
  Future<void> _onDelete(
    Emitter<LeadSourceState> emit, {
    required int id,
  }) async {
    emit(state.copyWith(deleteStatus: BaseStateStatus.loading));

    final result = await _repo.deleteLeadSource([id]);

    result.fold(
      (error) {
        _log.logE('LeadSourceBloc._onDelete error: ${error.getErrorMessage}');
        emit(state.copyWith(
          deleteStatus: BaseStateStatus.failed,
          deleteMessage: error.getErrorMessage,
        ));
      },
      (deletedIds) {
        emit(state.copyWith(
          deleteStatus: BaseStateStatus.success,
          deleteMessage: 'Xoá nguồn lead thành công!',
        ));
      },
    );
  }

  /// Clear trạng thái sau khi lưu.
  Future<void> _onClearSaveState(Emitter<LeadSourceState> emit) async {
    emit(state.copyWith(
      saveStatus: BaseStateStatus.init,
      saveMessage: null,
    ));
  }

  /// Clear trạng thái sau khi xoá.
  Future<void> _onClearDeleteState(Emitter<LeadSourceState> emit) async {
    emit(state.copyWith(
      deleteStatus: BaseStateStatus.init,
      deleteMessage: null,
    ));
  }
}
