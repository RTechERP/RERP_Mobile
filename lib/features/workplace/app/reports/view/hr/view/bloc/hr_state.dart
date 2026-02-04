part of 'hr_bloc.dart';

@CopyWith()
class HrState extends BaseBlocState {
  const HrState({
    required super.status,
    super.message,
    this.adList,
    this.lxcpList,
  });

  final List<dynamic>? adList;
  final List<dynamic>? lxcpList;

  factory HrState.init() => const HrState(
    status: BaseStateStatus.init,
    adList: null,
    lxcpList: null,
  );

  @override
  List get props => [status, message, adList, lxcpList];
}