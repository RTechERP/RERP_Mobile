part of 'poll_bloc.dart';

@CopyWith()
class PollState extends BaseBlocState {
  final List<PollItem> polls;
  final bool isDetailLoading;
  final PollItem? detailItem;
  final PollDetailItem? detailData;
  final ResponseItem? responseData;
  final String? detailMessage;
  final Map<int, bool> questionReadonlyMap;

  const PollState({
    required super.status,
    super.message,
    this.polls = const [],
    this.isDetailLoading = false,
    this.detailItem,
    this.detailData,
    this.responseData,
    this.detailMessage,
    this.questionReadonlyMap = const {},
  });

  factory PollState.init() => const PollState(
        status: BaseStateStatus.init,
        message: null,
        polls: [],
        isDetailLoading: false,
        detailItem: null,
        detailData: null,
        responseData: null,
        detailMessage: null,
        questionReadonlyMap: {},
      );

  @override
  List get props => [
        status,
        message,
        polls,
        isDetailLoading,
        detailItem,
        detailData,
        responseData,
        detailMessage,
        questionReadonlyMap,
      ];
}
