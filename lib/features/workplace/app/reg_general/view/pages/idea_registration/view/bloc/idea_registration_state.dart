part of 'idea_registration_bloc.dart';

@CopyWith()
class IdeaRegistrationState extends BaseBlocState {
  final List<IdeaItem> items;

  final int? employeeId;
  final int? departmentId;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  // --- Add/Edit form state ---
  final bool isSubmitting;
  final bool submitSuccess;

  final List<IdeaCatalogItem> catalogs;
  final List<DepartResponse> departments;

  final int? catalogId;
  final String? catalogName;
  final int? departmentOrganizationId;
  final String? departmentOrganizationName;
  final int? approvedTBPId;
  final String? approverDisplayName;
  final DateTime? dateStartForm;
  final DateTime? dateEndForm;

  /// Key: index (0-4), Value: {description, note}
  final List<IdeaDetailRow> details;

  // --- Detail screen state ---
  final bool isDetailLoading;
  final int? detailId;
  final IdeaDetail? detailData;

  // --- Delete state ---
  final bool isDeleting;
  final bool deleteSuccess;

  const IdeaRegistrationState({
    required super.status,
    super.message,
    this.items = const [],
    this.employeeId,
    this.departmentId,
    this.dateStart,
    this.dateEnd,
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.catalogs = const [],
    this.departments = const [],
    this.catalogId,
    this.catalogName,
    this.departmentOrganizationId,
    this.departmentOrganizationName,
    this.approvedTBPId,
    this.approverDisplayName,
    this.dateStartForm,
    this.dateEndForm,
    this.details = const [],
    this.isDetailLoading = false,
    this.detailId,
    this.detailData,
    this.isDeleting = false,
    this.deleteSuccess = false,
  });

  factory IdeaRegistrationState.init() => const IdeaRegistrationState(
        status: BaseStateStatus.init,
        items: [],
        isSubmitting: false,
        submitSuccess: false,
        catalogs: [],
        departments: [],
        catalogId: null,
        catalogName: null,
        departmentOrganizationId: null,
        departmentOrganizationName: null,
        approvedTBPId: null,
        approverDisplayName: null,
        dateStartForm: null,
        dateEndForm: null,
        details: [],
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
        catalogs,
        departments,
        catalogId,
        catalogName,
        departmentOrganizationId,
        departmentOrganizationName,
        approvedTBPId,
        approverDisplayName,
        dateStartForm,
        dateEndForm,
        details,
        isDetailLoading,
        detailId,
        detailData,
        isDeleting,
        deleteSuccess,
      ];
}

/// 5 hàng chi tiết cố định.
const List<String> ideaDetailCategories = [
  'Tên hạng mục',
  'Đối tượng áp dụng',
  'Chi phí thực hiện',
  'Địa điểm áp dụng',
  'Thời gian triển khai',
];

/// Một dòng chi tiết ý tưởng: diễn giải + chú thích.
class IdeaDetailRow {
  final int? id;
  final String description;
  final String? note;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  const IdeaDetailRow({
    this.id,
    required this.description,
    this.note,
    this.dateStart,
    this.dateEnd,
  });

  IdeaDetailRow copyWith({
    int? id,
    String? description,
    String? note,
    DateTime? dateStart,
    DateTime? dateEnd,
  }) {
    return IdeaDetailRow(
      id: id ?? this.id,
      description: description ?? this.description,
      note: note ?? this.note,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
    );
  }
}
