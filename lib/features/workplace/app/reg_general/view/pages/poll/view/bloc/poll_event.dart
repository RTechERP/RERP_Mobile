part of 'poll_bloc.dart';

@freezed
class PollEvent with _$PollEvent {
  const factory PollEvent.init() = _Init;

  const factory PollEvent.refresh() = _Refresh;

  const factory PollEvent.initDetail(PollItem item) = _InitDetail;

  const factory PollEvent.refreshDetail() = _RefreshDetail;

  const factory PollEvent.selectSection(int sectionId) = _SelectSection;

  const factory PollEvent.goToNextSection() = _GoToNextSection;

  const factory PollEvent.goToPreviousSection() = _GoToPreviousSection;

  const factory PollEvent.setNavigating(bool isNavigating) = _SetNavigating;

  const factory PollEvent.submitPollSection(PollSubmitPayload payload) = _SubmitPollSection;
}
