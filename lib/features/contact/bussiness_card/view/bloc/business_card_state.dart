part of 'business_card_bloc.dart';

@CopyWith()
class BusinessCardState extends BaseBlocState {
  const BusinessCardState({required super.status, super.message});

  factory BusinessCardState.init() =>
      const BusinessCardState(status: BaseStateStatus.init);
}
