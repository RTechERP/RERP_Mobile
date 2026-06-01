part of 'idea_registration_bloc.dart';

@CopyWith()
class IdeaRegistrationState extends BaseBlocState {
  final List<IdeaItem> items;
  final List<IdeaCatalogItem> catalogs;
  final List<DepartResponse> departments;

  // Add screen state
  final bool isSubmitting;
  final bool submitSuccess;
  final bool isDeleting;
  final bool deleteSuccess;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final int? departmentId;
  final String? departmentName;
  final int? catalogId;
  final String? catalogName;
  final List<IdeaDetailRow> details;

  // User info
  final int? employeeId;
  final int? currentDepartmentId;
  final int? headOfDepartment;

  const IdeaRegistrationState({
    required super.status,
    super.message,
    this.items = const [],
    this.catalogs = const [],
    this.departments = const [],
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.isDeleting = false,
    this.deleteSuccess = false,
    this.dateStart,
    this.dateEnd,
    this.departmentId,
    this.departmentName,
    this.catalogId,
    this.catalogName,
    this.details = const [],
    this.employeeId,
    this.currentDepartmentId,
    this.headOfDepartment,
  });

  factory IdeaRegistrationState.init() => const IdeaRegistrationState(
        status: BaseStateStatus.init,
        items: [],
        catalogs: [],
        departments: [],
        isSubmitting: false,
        submitSuccess: false,
        isDeleting: false,
        deleteSuccess: false,
        dateStart: null,
        dateEnd: null,
        departmentId: null,
        departmentName: null,
        catalogId: null,
        catalogName: null,
        details: [],
        employeeId: null,
        currentDepartmentId: null,
        headOfDepartment: null,
      );

  @override
  List get props => [
        status,
        message,
        items,
        catalogs,
        departments,
        isSubmitting,
        submitSuccess,
        isDeleting,
        deleteSuccess,
        dateStart,
        dateEnd,
        departmentId,
        departmentName,
        catalogId,
        catalogName,
        details,
        employeeId,
        currentDepartmentId,
        headOfDepartment,
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
  final String description;
  final String? note;

  const IdeaDetailRow({
    required this.description,
    this.note,
  });

  IdeaDetailRow copyWith({String? description, String? note}) {
    return IdeaDetailRow(
      description: description ?? this.description,
      note: note ?? this.note,
    );
  }
}
