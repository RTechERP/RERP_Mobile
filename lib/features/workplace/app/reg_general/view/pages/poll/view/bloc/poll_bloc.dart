import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../data/datasource/models/poll_model.dart';
import '../../data/repository/poll_repo.dart';

part 'poll_event.dart';
part 'poll_state.dart';
part 'poll_bloc.g.dart';
part 'poll_bloc.freezed.dart';

@injectable
class PollBloc extends BaseBloc<PollEvent, PollState> {
  final LogUtils _log;
  final PollRepo _pollRepo;

  PollBloc(this._pollRepo, this._log) : super(PollState.init()) {
    on<PollEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        refresh: () => _onRefresh(emit),
        initDetail: (item) => _onInitDetail(emit, item),
        refreshDetail: () => _onRefreshDetail(emit),
      );
    });
  }

  Future<void> _onInit(Emitter<PollState> emit) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        message: null,
      ),
    );

    await _fetchPolls(emit);
  }

  Future<void> _onRefresh(Emitter<PollState> emit) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        message: null,
      ),
    );

    await _fetchPolls(emit);
  }

  Future<void> _fetchPolls(Emitter<PollState> emit) async {
    final result = await _pollRepo.getPolls();

    result.fold(
      (error) {
        _log.logE('Get polls failed: $error');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: error.getErrorMessage,
            polls: const [],
          ),
        );
      },
      (polls) {
        _log.logI('Get polls success: ${polls.length} items');
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            polls: polls,
            message: null,
          ),
        );
      },
    );
  }

  Future<void> _onInitDetail(Emitter<PollState> emit, PollItem item) async {
    emit(
      state.copyWith(
        detailItem: item,
        isDetailLoading: true,
        detailData: null,
        detailMessage: null,
        questionReadonlyMap: const {},
      ),
    );

    await _fetchPollDetail(emit, item);
  }

  Future<void> _onRefreshDetail(Emitter<PollState> emit) async {
    final item = state.detailItem;
    if (item == null) return;

    emit(
      state.copyWith(
        isDetailLoading: true,
        detailMessage: null,
      ),
    );

    await _fetchPollDetail(emit, item);
  }

  Future<void> _fetchPollDetail(Emitter<PollState> emit, PollItem item) async {
    final pollFormId = item.id;
    if (pollFormId == null) {
      emit(
        state.copyWith(
          isDetailLoading: false,
          detailData: null,
          detailMessage: 'Không tìm thấy mã bình chọn',
          questionReadonlyMap: const {},
        ),
      );
      return;
    }

    final result = await _pollRepo.getPollDetail(pollFormId: pollFormId);

    result.fold(
      (error) {
        _log.logE('Get poll detail failed: $error');
        emit(
          state.copyWith(
            isDetailLoading: false,
            detailData: null,
            detailMessage: error.getErrorMessage,
            questionReadonlyMap: const {},
          ),
        );
      },
      (detail) {
        emit(
          state.copyWith(
            isDetailLoading: false,
            detailData: detail,
            detailMessage: null,
            questionReadonlyMap: _buildQuestionReadonlyMap(detail),
          ),
        );
      },
    );
  }

  Map<int, bool> _buildQuestionReadonlyMap(PollDetailItem detail) {
    final questionReadonlyMap = <int, bool>{};

    void appendQuestions(List<PollQuestionItem>? questions) {
      for (final question in questions ?? const <PollQuestionItem>[]) {
        final questionId = question.id;
        if (questionId == null) continue;
        questionReadonlyMap[questionId] = _parseReadonly(question.configJson);
      }
    }

    appendQuestions(detail.questions);
    for (final section in detail.sections ?? const <PollSectionItem>[]) {
      appendQuestions(section.questions);
    }

    return questionReadonlyMap;
  }

  bool _parseReadonly(String? rawConfigJson) {
    final raw = rawConfigJson?.trim();
    if (raw == null || raw.isEmpty) return false;

    try {
      final decoded = jsonDecode(raw);
      if (decoded is Map<String, dynamic>) {
        return _readReadonlyValue(decoded['readonly']);
      }
      if (decoded is Map) {
        return _readReadonlyValue(decoded['readonly']);
      }
    } catch (_) {}

    return false;
  }

  bool _readReadonlyValue(dynamic value) {
    if (value is bool) return value;
    if (value is String) return value.toLowerCase() == 'true';
    return false;
  }
}
