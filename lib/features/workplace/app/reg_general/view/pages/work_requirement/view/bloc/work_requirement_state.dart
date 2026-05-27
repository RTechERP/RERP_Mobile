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

  // --- File state ---
  final bool isUploadingFile;
  final bool uploadSuccess;

  /// Files đã upload lên server (dùng để submit).
  final List<WorkRequirementFileRequest> files;

  /// Files local chưa upload (pending).
  final List<File> localFiles;

  /// ID của các file đã xoá (dùng trong edit mode).
  final List<int> deletedFileIds;

  // --- Detail screen state ---
  final bool isDetailLoading;
  final int? detailId;
  final WorkRequirementDetailData? detailData;

  // --- Delete state ---
  final bool isDeleting;
  final bool deleteSuccess;

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
    this.isUploadingFile = false,
    this.uploadSuccess = false,
    this.files = const [],
    this.localFiles = const [],
    this.deletedFileIds = const [],
    this.isDetailLoading = false,
    this.detailId,
    this.detailData,
    this.isDeleting = false,
    this.deleteSuccess = false,
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
        isUploadingFile: false,
        uploadSuccess: false,
        files: [],
        localFiles: [],
        deletedFileIds: [],
        isDetailLoading: false,
        detailId: null,
        detailData: null,
        isDeleting: false,
        deleteSuccess: false,
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
        isUploadingFile,
        uploadSuccess,
        files,
        localFiles,
        deletedFileIds,
        isDetailLoading,
        detailId,
        detailData,
        isDeleting,
        deleteSuccess,
      ];
}
