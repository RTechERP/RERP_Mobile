part of 'work_trip_bloc.dart';

@CopyWith()
class WorkTripState extends BaseBlocState {
  final List<WorkTripItem> workTrips;
  final List<ApproverItem> approvers;
  final List<WorkTripTypeItem> workTripTypes;
  final List<WorkTripTypeVehicle> workTripVehicles;
  final List<WorkTripProject> workTripProjects;
  final bool isSubmitting;
  final bool submitSuccess;
  final bool deleteSuccess;
  final bool isDeleting;
  final int? employeeId;
  final String? loginName;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final WorkTripDetailItem? detailItem;
  final bool isFetchingDetail;

  /// Nhân sự đã mở cổng đăng ký bổ sung hay chưa.
  final bool isSupplementaryRegistrationOpen;

  const WorkTripState({
    required super.status,
    super.message,
    this.workTrips = const [],
    this.approvers = const [],
    this.workTripTypes = const [],
    this.workTripVehicles = const [],
    this.workTripProjects = const [],
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.deleteSuccess = false,
    this.isDeleting = false,
    this.employeeId,
    this.loginName,
    this.dateStart,
    this.dateEnd,
    this.detailItem,
    this.isFetchingDetail = false,
    this.isSupplementaryRegistrationOpen = false,
  });

  factory WorkTripState.init() => const WorkTripState(
        status: BaseStateStatus.init,
        workTrips: [],
        approvers: [],
        workTripTypes: [],
        workTripVehicles: [],
        workTripProjects: [],
        isSubmitting: false,
        submitSuccess: false,
        deleteSuccess: false,
        isDeleting: false,
        employeeId: null,
        loginName: null,
        dateStart: null,
        dateEnd: null,
        detailItem: null,
        isFetchingDetail: false,
        isSupplementaryRegistrationOpen: false,
      );

  @override
  List get props => [
        status,
        message,
        workTrips,
        approvers,
        workTripTypes,
        workTripVehicles,
        workTripProjects,
        isSubmitting,
        submitSuccess,
        deleteSuccess,
        isDeleting,
        employeeId,
        loginName,
        dateStart,
        dateEnd,
        detailItem,
        isFetchingDetail,
        isSupplementaryRegistrationOpen,
      ];
}
