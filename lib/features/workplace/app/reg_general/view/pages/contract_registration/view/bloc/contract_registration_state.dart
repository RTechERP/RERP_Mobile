part of 'contract_registration_bloc.dart';

@CopyWith()
class ContractRegistrationState extends BaseBlocState {
  final List<ContractResponseItem> contracts;
  final String? keyword;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  const ContractRegistrationState({
    required super.status,
    super.message,
    this.contracts = const [],
    this.keyword,
    this.dateStart,
    this.dateEnd,
  });

  factory ContractRegistrationState.init() => const ContractRegistrationState(
    status: BaseStateStatus.init,
    contracts: [],
    keyword: null,
    dateStart: null,
    dateEnd: null,
  );

  @override
  List get props => [
    status,
    message,
    contracts,
    keyword,
    dateStart,
    dateEnd,
  ];
}
