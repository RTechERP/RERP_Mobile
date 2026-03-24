part of 'lunch_bloc.dart';

@CopyWith()
class LunchState extends BaseBlocState {
  final List<LunchItem> lunch;

  final bool isSubmitting;
  final bool submitSuccess;
  final bool deleteSuccess;
  final bool isDeleting;
  final int? employeeId;

  final String? loginName;

  const LunchState({
    required super.status,
    super.message,
    this.lunch = const [],
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.deleteSuccess = false,
    this.isDeleting = false,
    this.employeeId,
    this.loginName,
  });

  factory LunchState.init() => const LunchState(
    status: BaseStateStatus.init,
    isSubmitting: false,
    submitSuccess: false,
    deleteSuccess: false,
    isDeleting: false,
    lunch: [],
    employeeId: null,
    loginName: null,
  );

  @override
  List get props => [
    status,
    message,
    lunch,
    isSubmitting,
    submitSuccess,
    deleteSuccess,
    isDeleting,
    employeeId,
    loginName,
  ];
}
