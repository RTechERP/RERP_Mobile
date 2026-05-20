part of 'contract_registration_bloc.dart';

@CopyWith()
class ContractRegistrationState extends BaseBlocState {
  final List<ContractResponseItem> contracts;
  final String? keyword;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final List<TypeDocumentResponseItem> documentTypes;
  final List<TaxCompanyResponseItem> taxCompanies;
  final List<UserResponse> receivers;
  final bool isSubmitting;
  final bool submitSuccess;
  final bool isUpdating;
  final bool updateSuccess;
  final bool isDetailLoading;
  final DetailContractResponseItem? detail;

  const ContractRegistrationState({
    required super.status,
    super.message,
    this.contracts = const [],
    this.keyword,
    this.dateStart,
    this.dateEnd,
    this.documentTypes = const [],
    this.taxCompanies = const [],
    this.receivers = const [],
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.isUpdating = false,
    this.updateSuccess = false,
    this.isDetailLoading = false,
    this.detail,
  });

  factory ContractRegistrationState.init() => const ContractRegistrationState(
    status: BaseStateStatus.init,
    contracts: [],
    keyword: null,
    dateStart: null,
    dateEnd: null,
    documentTypes: [],
    taxCompanies: [],
    receivers: [],
    isSubmitting: false,
    submitSuccess: false,
    isUpdating: false,
    updateSuccess: false,
    isDetailLoading: false,
    detail: null,
  );

  @override
  List get props => [
    status,
    message,
    contracts,
    keyword,
    dateStart,
    dateEnd,
    documentTypes,
    taxCompanies,
    receivers,
    isSubmitting,
    submitSuccess,
    isUpdating,
    updateSuccess,
    isDetailLoading,
    detail,
  ];
}
