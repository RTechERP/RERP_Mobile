part of 'celebration_bloc.dart';

@CopyWith()
class CelebrationState extends BaseBlocState {
  final CelebrationItem? celebrationItem;

  const CelebrationState({
    required super.status,
    super.message,
    this.celebrationItem,
  });

  factory CelebrationState.init() =>
      const CelebrationState(status: BaseStateStatus.init);
}
