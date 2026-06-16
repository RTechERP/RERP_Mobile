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

  final bool isDeleting;
  final bool deleteSuccess;

  final AccountantItem? detailItem;

  final bool isFetchingDetail;
  final bool isUpdating;
  final bool updateSuccess;

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
    this.isDeleting = false,
    this.deleteSuccess = false,
    this.detailItem,
    this.isFetchingDetail = false,
    this.isUpdating = false,
    this.updateSuccess = false,
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
        isDeleting: false,
        deleteSuccess: false,
        detailItem: null,
        isFetchingDetail: false,
        isUpdating: false,
        updateSuccess: false,
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
        isDeleting,
        deleteSuccess,
        detailItem,
        isFetchingDetail,
        isUpdating,
        updateSuccess,
      ];
}
