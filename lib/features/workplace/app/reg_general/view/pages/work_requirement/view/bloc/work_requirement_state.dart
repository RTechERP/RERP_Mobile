part of 'work_requirement_bloc.dart';
@CopyWith()
class WorkRequirementState extends BaseBlocState {
  final List<WorkRequirementItem> items;

  final int? employeeId;
  final int? departmentId;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  // --- Add form state ---
  final bool isSubmitting;
  final bool submitSuccess;

  final List<DepartResponse> departments;
  final List<WorkRequirementApproverItem> approvers;

  final int? requiredDepartmentId;
  final String? requiredDepartmentName;
  final int? coordinationDepartmentId;
  final String? coordinationDepartmentName;
  final int? approvedTBPId;
  final String? approverDisplayName;
  final DateTime? dateRequest;
  final DateTime? deadlineRequest;

  /// Key: tên field (title, explanation, target, note), Value: giá trị string.
  final Map<int, Map<String, String>> detailValues;

  final List<String> attachmentNames;

  const WorkRequirementState({
    required super.status,
    super.message,
    this.items = const [],
    this.employeeId,
    this.departmentId,
    this.dateStart,
    this.dateEnd,
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.departments = const [],
    this.approvers = const [],
    this.requiredDepartmentId,
    this.requiredDepartmentName,
    this.coordinationDepartmentId,
    this.coordinationDepartmentName,
    this.approvedTBPId,
    this.approverDisplayName,
    this.dateRequest,
    this.deadlineRequest,
    this.detailValues = const {},
    this.attachmentNames = const [],
  });

  factory WorkRequirementState.init() => const WorkRequirementState(
        status: BaseStateStatus.init,
        items: [],
        isSubmitting: false,
        submitSuccess: false,
        departments: [],
        approvers: [],
        requiredDepartmentName: null,
        coordinationDepartmentName: null,
        approverDisplayName: null,
        detailValues: {},
        attachmentNames: [],
      );

  @override
  List get props => [
        status,
        message,
        items,
        employeeId,
        departmentId,
        dateStart,
        dateEnd,
        isSubmitting,
        submitSuccess,
        departments,
        approvers,
        requiredDepartmentName,
        coordinationDepartmentId,
        coordinationDepartmentName,
        approvedTBPId,
        approverDisplayName,
        dateRequest,
        deadlineRequest,
        detailValues,
        attachmentNames,
      ];
}
