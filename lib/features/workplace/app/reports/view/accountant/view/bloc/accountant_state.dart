part of 'accountant_bloc.dart';

@CopyWith()
class AccountantState extends BaseBlocState {
  final List<AccountantItem> reports;

  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String keyword;
  final int page;
  final int size;
  final bool hasReachedMax;
  final bool isLoadingMore;
  final int? employeeId;
  final String? fullName;
  final String? chucVu;

  final bool isSubmitting;
  final bool submitSuccess;

  const AccountantState({
    required super.status,
    super.message,
    this.reports = const [],
    this.dateStart,
    this.dateEnd,
    this.keyword = '',
    this.page = 1,
    this.size = 50,
    this.hasReachedMax = false,
    this.isLoadingMore = false,
    this.employeeId,
    this.fullName,
    this.chucVu,
    this.isSubmitting = false,
    this.submitSuccess = false,
  });

  factory AccountantState.init() => const AccountantState(
        status: BaseStateStatus.init,
        reports: [],
        dateStart: null,
        dateEnd: null,
        keyword: '',
        page: 1,
        size: 50,
        hasReachedMax: false,
        isLoadingMore: false,
        employeeId: null,
        fullName: null,
        chucVu: null,
        isSubmitting: false,
        submitSuccess: false,
      );

  @override
  List get props => [
        status,
        message,
        reports,
        dateStart,
        dateEnd,
        keyword,
        page,
        size,
        hasReachedMax,
        isLoadingMore,
        employeeId,
        fullName,
        chucVu,
        isSubmitting,
        submitSuccess,
      ];
}
