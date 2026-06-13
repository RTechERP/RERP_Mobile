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
        selectSection: (id) => _onSelectSection(emit, id),
        goToNextSection: () => _onGoToNextSection(emit),
        goToPreviousSection: () => _onGoToPreviousSection(emit),
        setNavigating: (isNavigating) => _onSetNavigating(emit, isNavigating),
        submitPollSection: (payload) => _onSubmitPollSection(emit, payload),
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
        responseData: null,
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
          responseData: null,
          detailMessage: 'Không tìm thấy mã bình chọn',
          questionReadonlyMap: const {},
        ),
      );
      return;
    }

    final detailResult = await _pollRepo.getPollDetail(pollFormId: pollFormId);
    final responseResult = await _pollRepo.getMyResponse(pollFormId: pollFormId);

    detailResult.fold(
      (error) {
        _log.logE('Get poll detail failed: $error');
        emit(
          state.copyWith(
            isDetailLoading: false,
            detailData: null,
            responseData: null,
            detailMessage: error.getErrorMessage,
            questionReadonlyMap: const {},
          ),
        );
      },
      (detail) {
        responseResult.fold(
          (error) {
            _log.logE('Get poll response failed: $error');
            final detailWithResponse = _mergeQuestionResponses(detail, null);
            emit(
              state.copyWith(
                isDetailLoading: false,
                detailData: detailWithResponse,
                responseData: null,
                detailMessage: null,
                questionReadonlyMap: _buildQuestionReadonlyMap(detailWithResponse),
                selectedSectionId: state.selectedSectionId ?? _getDefaultSectionId(detailWithResponse),
              ),
            );
          },
          (response) {
            final detailWithResponse = _mergeQuestionResponses(detail, response);
            emit(
              state.copyWith(
                isDetailLoading: false,
                detailData: detailWithResponse,
                responseData: response,
                detailMessage: null,
                questionReadonlyMap: _buildQuestionReadonlyMap(detailWithResponse),
                selectedSectionId: state.selectedSectionId ?? _getDefaultSectionId(detailWithResponse),
              ),
            );
          },
        );
      },
    );
  }

  int? _getDefaultSectionId(PollDetailItem detail) {
    final sections = detail.sections ?? [];
    if (sections.isEmpty) return null;
    return sections.first.id;
  }

  PollDetailItem _mergeQuestionResponses(
    PollDetailItem detail,
    ResponseItem? response,
  ) {
    final answers = response?.response?.answers ?? const <PollAnswerItem>[];
    if (answers.isEmpty) return detail;

    final answerMap = <int, PollAnswerItem>{
      for (final answer in answers)
        if (answer.pollQuestionId != null) answer.pollQuestionId!: answer,
    };

    PollQuestionItem mergeQuestion(PollQuestionItem question) {
      final questionId = question.id;
      if (questionId == null) return question;
      return question.copyWith(response: answerMap[questionId]);
    }

    return detail.copyWith(
      questions: detail.questions?.map(mergeQuestion).toList(),
      sections: detail.sections
          ?.map(
            (section) => section.copyWith(
              questions: section.questions?.map(mergeQuestion).toList(),
            ),
          )
          .toList(),
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

   _onSelectSection(Emitter<PollState> emit, int sectionId) {
    _log.logI('_onSelectSection: $sectionId, current: ${state.selectedSectionId}');
    emit(PollState(
      status: state.status,
      message: state.message,
      polls: state.polls,
      isDetailLoading: state.isDetailLoading,
      detailItem: state.detailItem,
      detailData: state.detailData,
      responseData: state.responseData,
      detailMessage: state.detailMessage,
      questionReadonlyMap: state.questionReadonlyMap,
      selectedSectionId: sectionId,
      isNavigating: false,
    ));
  }

   _onGoToNextSection(Emitter<PollState> emit) {
    if (state.isNavigating) return;

    final sections = state.detailData?.sections ?? [];
    if (sections.isEmpty) return;

    final currentIndex = sections.indexWhere((s) => s.id == state.selectedSectionId);
    _log.logI('_onGoToNextSection: currentIndex=$currentIndex, total=${sections.length}');
    if (currentIndex < sections.length - 1) {
      final nextId = sections[currentIndex + 1].id;
      _log.logI('_onGoToNextSection: nextId=$nextId');
      emit(PollState(
        status: state.status,
        message: state.message,
        polls: state.polls,
        isDetailLoading: state.isDetailLoading,
        detailItem: state.detailItem,
        detailData: state.detailData,
        responseData: state.responseData,
        detailMessage: state.detailMessage,
        questionReadonlyMap: state.questionReadonlyMap,
        selectedSectionId: nextId,
        isNavigating: true,
      ));

      Future.delayed(const Duration(milliseconds: 300), () {
        add(const PollEvent.setNavigating(false));
      });
    }
  }

   _onGoToPreviousSection(Emitter<PollState> emit) {
    if (state.isNavigating) return;

    final sections = state.detailData?.sections ?? [];
    if (sections.isEmpty) return;

    final currentIndex = sections.indexWhere((s) => s.id == state.selectedSectionId);
    if (currentIndex > 0) {
      emit(PollState(
        status: state.status,
        message: state.message,
        polls: state.polls,
        isDetailLoading: state.isDetailLoading,
        detailItem: state.detailItem,
        detailData: state.detailData,
        responseData: state.responseData,
        detailMessage: state.detailMessage,
        questionReadonlyMap: state.questionReadonlyMap,
        selectedSectionId: sections[currentIndex - 1].id,
        isNavigating: true,
      ));

      Future.delayed(const Duration(milliseconds: 300), () {
        add(const PollEvent.setNavigating(false));
      });
    }
  }

   _onSetNavigating(Emitter<PollState> emit, bool isNavigating) {
    emit(PollState(
      status: state.status,
      message: state.message,
      polls: state.polls,
      isDetailLoading: state.isDetailLoading,
      detailItem: state.detailItem,
      detailData: state.detailData,
      responseData: state.responseData,
      detailMessage: state.detailMessage,
      questionReadonlyMap: state.questionReadonlyMap,
      selectedSectionId: state.selectedSectionId,
      isNavigating: isNavigating,
      isSubmitting: state.isSubmitting,
    ));
  }

  Future<void> _onSubmitPollSection(
    Emitter<PollState> emit,
    PollSubmitPayload payload,
  ) async {
    _log.logI('_onSubmitPollSection: payload=${payload.toJson()}');
    emit(PollState(
      status: state.status,
      message: state.message,
      polls: state.polls,
      isDetailLoading: state.isDetailLoading,
      detailItem: state.detailItem,
      detailData: state.detailData,
      responseData: state.responseData,
      detailMessage: state.detailMessage,
      questionReadonlyMap: state.questionReadonlyMap,
      selectedSectionId: state.selectedSectionId,
      isNavigating: state.isNavigating,
      isSubmitting: true,
    ));

    final pollFormId = state.detailItem?.id;
    if (pollFormId == null) return;

    final result = await _pollRepo.submitPollBulk(
      pollFormId: pollFormId,
      payload: payload,
    );

    result.fold(
      (error) {
        _log.logE('Submit poll failed: $error');
        emit(PollState(
          status: state.status,
          message: state.message,
          polls: state.polls,
          isDetailLoading: state.isDetailLoading,
          detailItem: state.detailItem,
          detailData: state.detailData,
          responseData: state.responseData,
          detailMessage: error.getErrorMessage,
          questionReadonlyMap: state.questionReadonlyMap,
          selectedSectionId: state.selectedSectionId,
          isNavigating: state.isNavigating,
          isSubmitting: false,
        ));
      },
      (_) {
        _log.logI('Submit poll success');
        emit(PollState(
          status: state.status,
          message: null,
          polls: state.polls,
          isDetailLoading: state.isDetailLoading,
          detailItem: state.detailItem,
          detailData: state.detailData,
          responseData: state.responseData,
          detailMessage: null,
          questionReadonlyMap: state.questionReadonlyMap,
          selectedSectionId: state.selectedSectionId,
          isNavigating: state.isNavigating,
          isSubmitting: false,
        ));
        add(const PollEvent.refreshDetail());
      },
    );
  }
}
