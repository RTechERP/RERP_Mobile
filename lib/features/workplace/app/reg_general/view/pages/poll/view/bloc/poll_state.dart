part of 'poll_bloc.dart';

@CopyWith()
class PollState extends BaseBlocState {
  final List<PollItem> polls;

  const PollState({
    required super.status,
    super.message,
    this.polls = const [],
  });

  factory PollState.init() => const PollState(
        status: BaseStateStatus.init,
        message: null,
        polls: [],
      );

  @override
  List get props => [status, message, polls];
}
