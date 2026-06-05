part of 'stamp_bloc.dart';

@CopyWith()
class StampState extends BaseBlocState {
  final List<StampItem> stamps;
  final int? employeeId;
  final int? departmentId;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  final List<AssignerStampItem> employees;
  final List<SealItem> sealRegulations;
  final List<DocumentStampItem> documentTypes;
  final List<CompanyStampItem> taxCompanies;
  final bool isFormOptionsLoading;

  final DateTime? registerDate;
  final bool isUrgent;
  final DateTime? deadline;

  final int? documentTypeId;
  final String? documentTypeName;
  final int? taxCompanyId;
  final String? taxCompanyName;
  final int? sealRegulationId;
  final String? sealRegulationName;

  final String? documentName;
  final int? documentQuantity;
  final int? documentTotalPage;

  final int? approvedId;
  final String? approvedName;

  final int? employeeSignId;
  final String? employeeSignName;

  final StampItem? detailItem;
  final bool isDetailLoading;

  final bool isSubmitting;
  final bool submitSuccess;
  final bool deleteSuccess;
  final bool isDeleting;

  final bool isInitialLoading;

  const StampState({
    required super.status,
    super.message,
    this.stamps = const [],
    this.employeeId,
    this.departmentId,
    this.dateStart,
    this.dateEnd,
    this.employees = const [],
    this.sealRegulations = const [],
    this.documentTypes = const [],
    this.taxCompanies = const [],
    this.isFormOptionsLoading = false,
    this.registerDate,
    this.isUrgent = false,
    this.deadline,
    this.documentTypeId,
    this.documentTypeName,
    this.taxCompanyId,
    this.taxCompanyName,
    this.sealRegulationId,
    this.sealRegulationName,
    this.documentName,
    this.documentQuantity,
    this.documentTotalPage,
    this.approvedId,
    this.approvedName,
    this.employeeSignId,
    this.employeeSignName,
    this.detailItem,
    this.isDetailLoading = false,
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.deleteSuccess = false,
    this.isDeleting = false,
    this.isInitialLoading = false,
  });

  factory StampState.init() => const StampState(
        status: BaseStateStatus.init,
        stamps: [],
        employeeId: null,
        departmentId: null,
        dateStart: null,
        dateEnd: null,
        employees: [],
        sealRegulations: [],
        documentTypes: [],
        taxCompanies: [],
        isFormOptionsLoading: false,
        registerDate: null,
        isUrgent: false,
        deadline: null,
        documentTypeId: null,
        documentTypeName: null,
        taxCompanyId: null,
        taxCompanyName: null,
        sealRegulationId: null,
        sealRegulationName: null,
        documentName: null,
        documentQuantity: null,
        documentTotalPage: null,
        approvedId: null,
        approvedName: null,
        employeeSignId: null,
        employeeSignName: null,
        detailItem: null,
        isDetailLoading: false,
        isSubmitting: false,
        submitSuccess: false,
        deleteSuccess: false,
        isDeleting: false,
        isInitialLoading: false,
      );

  @override
  List get props => [
        status,
        message,
        stamps,
        employeeId,
        departmentId,
        dateStart,
        dateEnd,
        employees,
        sealRegulations,
        documentTypes,
        taxCompanies,
        isFormOptionsLoading,
        registerDate,
        isUrgent,
        deadline,
        documentTypeId,
        documentTypeName,
        taxCompanyId,
        taxCompanyName,
        sealRegulationId,
        sealRegulationName,
        documentName,
        documentQuantity,
        documentTotalPage,
        approvedId,
        approvedName,
        employeeSignId,
        employeeSignName,
        detailItem,
        isDetailLoading,
        isSubmitting,
        submitSuccess,
        deleteSuccess,
        isDeleting,
        isInitialLoading,
      ];
}
