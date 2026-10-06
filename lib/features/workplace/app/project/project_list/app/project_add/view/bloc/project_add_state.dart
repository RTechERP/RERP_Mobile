part of 'project_add_bloc.dart';

/// State của form tạo dự án. Mỗi field là 1 danh sách lookup
/// được load song song khi mở màn hình. Tất cả field đều mặc
/// định rỗng để khi API fail thì UI vẫn hiển thị "không có dữ liệu"
/// thay vì crash.
class ProjectAddState extends BaseBlocState {
  final List<FirmBase> firms;
  final List<CustomerItem> customers;
  final List<ProjectTypeBase> projectTypes;
  final List<PmItem> pms;
  final List<ProjectStatusItem> statuses;
  final List<CustomerIndustry> industries;
  final List<UserTeamItem> userTeams;
  final List<ProjectModalItem> projectModal;
  final List<ApplicationType> applications;
  final List<Technology> technologies;

  /// Tổng hợp message lỗi của các API fail (nếu có).
  final List<String> errorMessages;

  const ProjectAddState({
    required super.status,
    super.message,
    this.firms = const [],
    this.customers = const [],
    this.projectTypes = const [],
    this.pms = const [],
    this.statuses = const [],
    this.industries = const [],
    this.userTeams = const [],
    this.projectModal = const [],
    this.applications = const [],
    this.technologies = const [],
    this.errorMessages = const [],
  });

  factory ProjectAddState.init() => const ProjectAddState(
        status: BaseStateStatus.init,
      );

  /// Trả về 1 bản copy với status = loading, giữ nguyên dữ liệu cũ.
  ProjectAddState setLoading() => copyWith(
        status: BaseStateStatus.loading,
        message: null,
      );

  /// Trả về 1 bản copy với các field được override.
  /// Chỉ những field được truyền mới thay đổi, các field khác giữ nguyên.
  ProjectAddState copyWith({
    BaseStateStatus? status,
    String? message,
    List<FirmBase>? firms,
    List<CustomerItem>? customers,
    List<ProjectTypeBase>? projectTypes,
    List<PmItem>? pms,
    List<ProjectStatusItem>? statuses,
    List<CustomerIndustry>? industries,
    List<UserTeamItem>? userTeams,
    List<ProjectModalItem>? projectModal,
    List<ApplicationType>? applications,
    List<Technology>? technologies,
    List<String>? errorMessages,
  }) {
    return ProjectAddState(
      status: status ?? this.status,
      message: message ?? this.message,
      firms: firms ?? this.firms,
      customers: customers ?? this.customers,
      projectTypes: projectTypes ?? this.projectTypes,
      pms: pms ?? this.pms,
      statuses: statuses ?? this.statuses,
      industries: industries ?? this.industries,
      userTeams: userTeams ?? this.userTeams,
      projectModal: projectModal ?? this.projectModal,
      applications: applications ?? this.applications,
      technologies: technologies ?? this.technologies,
      errorMessages: errorMessages ?? this.errorMessages,
    );
  }

  @override
  List get props => [
        status,
        message,
        firms,
        customers,
        projectTypes,
        pms,
        statuses,
        industries,
        userTeams,
        projectModal,
        applications,
        technologies,
        errorMessages,
      ];
}
