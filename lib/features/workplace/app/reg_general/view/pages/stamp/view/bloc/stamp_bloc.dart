import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/stamp_model.dart';
import '../../data/repository/stamp_repo.dart';

part 'stamp_event.dart';
part 'stamp_state.dart';
part 'stamp_bloc.g.dart';
part 'stamp_bloc.freezed.dart';

@injectable
class StampBloc extends BaseBloc<StampEvent, StampState> {
  final LogUtils _log;
  final AuthRepo _authRepo;
  final StampRepo _stampRepo;

  bool _isSubmitting = false;

  StampBloc(this._stampRepo, this._authRepo, this._log)
    : super(StampState.init()) {
    on<StampEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        initAdd: () => _onInitAdd(emit),
        initDetail: (id) => _onInitDetail(emit, id: id),
        initEdit: (id) => _onInitEdit(emit, id: id),
        hydrateEditPayload:
            (
              item,
              detail,
              employees,
              sealRegulations,
              documentTypes,
              taxCompanies,
            ) => _onHydrateEditPayload(
              emit,
              item: item,
              detail: detail,
              employees: employees,
              sealRegulations: sealRegulations,
              documentTypes: documentTypes,
              taxCompanies: taxCompanies,
            ),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        loadFormOptions: () => _onLoadFormOptions(emit),
        changeRegisterDate: (registerDate) =>
            _onChangeRegisterDate(emit, registerDate: registerDate),
        changeUrgent: (isUrgent) => _onChangeUrgent(emit, isUrgent: isUrgent),
        changeDeadline: (deadline) =>
            _onChangeDeadline(emit, deadline: deadline),
        changeDocumentType: (id, name) =>
            _onChangeDocumentType(emit, id: id, name: name),
        changeDocumentName: (name) => _onChangeDocumentName(emit, name: name),
        changeDocumentQuantity: (quantity) =>
            _onChangeDocumentQuantity(emit, quantity: quantity),
        changeDocumentTotalPage: (totalPage) =>
            _onChangeDocumentTotalPage(emit, totalPage: totalPage),
        changeApproved: (id, name) =>
            _onChangeApproved(emit, id: id, name: name),
        changeEmployeeSign: (id, name) =>
            _onChangeEmployeeSign(emit, id: id, name: name),
        changeSealRegulation: (id, name) =>
            _onChangeSealRegulation(emit, id: id, name: name),
        changeTaxCompany: (id, name) =>
            _onChangeTaxCompany(emit, id: id, name: name),
        submitStamp: () => _onSubmitStamp(emit),
        clearSubmitState: () => _onClearSubmitState(emit),
        deleteStamp: (id) => _onDeleteStamp(emit, id: id),
        clearDeleteState: () => _onClearDeleteState(emit),
      );
    });
  }

  Future<void> _onInit(Emitter<StampState> emit) async {
    emit(
      state.copyWith(status: BaseStateStatus.loading, isInitialLoading: true),
    );

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('StampBloc _onInit get user failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            isInitialLoading: false,
          ),
        );
      },
      (user) async {
        if (user == null) {
          emit(
            state.copyWith(
              status: BaseStateStatus.failed,
              isInitialLoading: false,
            ),
          );
          return;
        }

        final now = DateTime.now();
        final startOfDay = DateTime(now.year, now.month, now.day);
        final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

        emit(
          state.copyWith(
            employeeId: user.employeeId,
            departmentId: user.departmentId,
            dateStart: startOfDay,
            dateEnd: endOfDay,
          ),
        );

        await _fetchStamps(emit, dateStart: startOfDay, dateEnd: endOfDay);
      },
    );
  }

  Future<void> _fetchStamps(
    Emitter<StampState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    final payload = {
      'employeeId': state.employeeId ?? 0,
      'dateStart': dateStart.toIso8601String(),
      'dateEnd': dateEnd.toIso8601String(),
      'keyword': '',
      'departmentId': state.departmentId ?? 0,
      'status': -1,
    };

    _log.logI('Stamp payload: $payload');

    final res = await _stampRepo.getStamp(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('Get stamps failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
            isInitialLoading: false,
          ),
        );
      },
      (stamps) async {
        _log.logI('Get stamps success: ${stamps.length} items');
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            stamps: stamps,
            isInitialLoading: false,
          ),
        );
      },
    );
  }

  Future<void> _onChangeDateRange(
    Emitter<StampState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        dateStart: dateStart,
        dateEnd: dateEnd,
      ),
    );

    await _fetchStamps(emit, dateStart: dateStart, dateEnd: dateEnd);
  }

  Future<void> _onInitAdd(Emitter<StampState> emit) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        isSubmitting: false,
        submitSuccess: false,
        message: null,
        registerDate: DateTime.now(),
        isUrgent: false,
        deadline: null,
        documentTypeId: null,
        documentTypeName: null,
        taxCompanyId: null,
        taxCompanyName: null,
        sealRegulationId: null,
        sealRegulationName: null,
        documentName: null,
        documentQuantity: 1,
        documentTotalPage: 1,
        approvedId: null,
        approvedName: null,
        employeeSignId: null,
        employeeSignName: null,
      ),
    );

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('StampBloc _onInitAdd get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        if (user == null) {
          emit(state.copyWith(status: BaseStateStatus.failed));
          return;
        }

        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            employeeId: user.employeeId,
            departmentId: user.departmentId,
          ),
        );

        await _onLoadFormOptions(emit);
      },
    );
  }

  Future<void> _onLoadFormOptions(Emitter<StampState> emit) async {
    emit(state.copyWith(isFormOptionsLoading: true, message: null));

    final results = await Future.wait([
      _stampRepo.getEmployees(),
      _stampRepo.getSealRegulations(),
      _stampRepo.getDocumentTypes(),
      _stampRepo.getTaxCompanies(),
    ]);

    final employeesRes = results[0] as dynamic;
    final sealRes = results[1] as dynamic;
    final documentRes = results[2] as dynamic;
    final companyRes = results[3] as dynamic;

    String? errorMessage;
    List<AssignerStampItem> employees = state.employees;
    List<SealItem> seals = state.sealRegulations;
    List<DocumentStampItem> documents = state.documentTypes;
    List<CompanyStampItem> companies = state.taxCompanies;

    employeesRes.fold(
      (err) => errorMessage ??= err.getErrorMessage,
      (data) => employees = List<AssignerStampItem>.from(data),
    );
    sealRes.fold(
      (err) => errorMessage ??= err.getErrorMessage,
      (data) => seals = List<SealItem>.from(data),
    );
    documentRes.fold(
      (err) => errorMessage ??= err.getErrorMessage,
      (data) => documents = List<DocumentStampItem>.from(data),
    );
    companyRes.fold(
      (err) => errorMessage ??= err.getErrorMessage,
      (data) => companies = List<CompanyStampItem>.from(data),
    );

    final mappedEmployeeSignName = employees
        .firstWhere(
          (item) => item.id == state.employeeSignId,
          orElse: () => const AssignerStampItem(),
        )
        .fullName;
    final mappedDocumentTypeName = documents
        .firstWhere(
          (item) => item.id == state.documentTypeId,
          orElse: () => const DocumentStampItem(),
        )
        .name;
    final mappedTaxCompanyName = companies
        .firstWhere(
          (item) => item.id == state.taxCompanyId,
          orElse: () => const CompanyStampItem(),
        )
        .name;
    final mappedSealRegulationName = seals
        .firstWhere(
          (item) => item.id == state.sealRegulationId,
          orElse: () => const SealItem(),
        )
        .sealName;

    emit(
      state.copyWith(
        employees: employees,
        sealRegulations: seals,
        documentTypes: documents,
        taxCompanies: companies,
        documentTypeName: mappedDocumentTypeName?.trim().isNotEmpty == true
            ? mappedDocumentTypeName
            : state.documentTypeName,
        taxCompanyName: mappedTaxCompanyName?.trim().isNotEmpty == true
            ? mappedTaxCompanyName
            : state.taxCompanyName,
        sealRegulationName: mappedSealRegulationName?.trim().isNotEmpty == true
            ? mappedSealRegulationName
            : state.sealRegulationName,
        employeeSignName: mappedEmployeeSignName?.trim().isNotEmpty == true
            ? mappedEmployeeSignName
            : state.employeeSignName,
        isFormOptionsLoading: false,
        status: errorMessage == null
            ? BaseStateStatus.success
            : BaseStateStatus.failed,
        message: errorMessage,
      ),
    );
  }

  Future<void> _onInitDetail(
    Emitter<StampState> emit, {
    required int id,
  }) async {
    emit(
      state.copyWith(
        isDetailLoading: true,
        status: BaseStateStatus.loading,
        detailItem: null,
        detailData: null,
        tracking: null,
        detailEmployee: null,
        detailDepartment: null,
      ),
    );

    final results = await Future.wait([
      _stampRepo.getStampDetail(id: id),
      _stampRepo.getEmployees(),
      _stampRepo.getSealRegulations(),
      _stampRepo.getDocumentTypes(),
      _stampRepo.getTaxCompanies(),
    ]);

    final detailRes = results[0] as dynamic;
    final employeesRes = results[1] as dynamic;
    final sealRes = results[2] as dynamic;
    final documentRes = results[3] as dynamic;
    final companyRes = results[4] as dynamic;

    await detailRes.fold(
      (err) async {
        _log.logE('StampBloc _onInitDetail failed: $err');
        emit(
          state.copyWith(
            isDetailLoading: false,
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (detail) async {
        _log.logI('StampBloc _onInitDetail success');

        List<AssignerStampItem> employees = state.employees;
        List<SealItem> seals = state.sealRegulations;
        List<DocumentStampItem> documents = state.documentTypes;
        List<CompanyStampItem> companies = state.taxCompanies;

        employeesRes.fold(
          (err) => _log.logE('StampBloc getEmployees failed: $err'),
          (data) => employees = List<AssignerStampItem>.from(data),
        );
        sealRes.fold(
          (err) => _log.logE('StampBloc getSealRegulations failed: $err'),
          (data) => seals = List<SealItem>.from(data),
        );
        documentRes.fold(
          (err) => _log.logE('StampBloc getDocumentTypes failed: $err'),
          (data) => documents = List<DocumentStampItem>.from(data),
        );
        companyRes.fold(
          (err) => _log.logE('StampBloc getTaxCompanies failed: $err'),
          (data) => companies = List<CompanyStampItem>.from(data),
        );

        final tracking = detail.tracking;
        final sealIds =
            detail.seals?.map((item) => item.sealId).whereType<int>().toSet() ??
            <int>{};
        final taxCompanyIds =
            detail.taxs
                ?.map((item) => item.taxCompanyId)
                .whereType<int>()
                .toSet() ??
            <int>{};

        final mappedEmployeeSignName = employees
            .firstWhere(
              (item) => item.id == tracking?.employeeSignId,
              orElse: () => const AssignerStampItem(),
            )
            .fullName;
        final mappedDocumentTypeName = documents
            .firstWhere(
              (item) => item.id == tracking?.documentTypeId,
              orElse: () => const DocumentStampItem(),
            )
            .name;
        final mappedSealName = seals
            .where((item) => sealIds.contains(item.id))
            .map((item) => item.sealName)
            .whereType<String>()
            .where((item) => item.trim().isNotEmpty)
            .join(', ');
        final mappedTaxCompanyName = companies
            .where((item) => taxCompanyIds.contains(item.id))
            .map((item) => item.name)
            .whereType<String>()
            .where((item) => item.trim().isNotEmpty)
            .join(', ');

        emit(
          state.copyWith(
            isDetailLoading: false,
            status: BaseStateStatus.success,
            detailData: detail,
            detailItem: tracking,
            tracking: tracking,
            detailEmployee: detail.employee,
            detailDepartment: detail.department,
            employees: employees,
            sealRegulations: seals,
            documentTypes: documents,
            taxCompanies: companies,
            registerDate: tracking?.registerDate,
            isUrgent: tracking?.isUrgent ?? false,
            deadline: tracking?.deadline,
            documentTypeId: tracking?.documentTypeId,
            documentTypeName: mappedDocumentTypeName?.trim().isNotEmpty == true
                ? mappedDocumentTypeName
                : tracking?.documentTypeName,
            taxCompanyName: mappedTaxCompanyName.trim().isNotEmpty
                ? mappedTaxCompanyName
                : tracking?.taxCompanyText,
            sealRegulationName: mappedSealName.trim().isNotEmpty
                ? mappedSealName
                : tracking?.sealNameText,
            documentName: tracking?.documentName,
            documentQuantity: tracking?.documentQuantity,
            documentTotalPage: tracking?.documentTotalPage,
            approvedId: tracking?.approvedId,
            employeeSignId: tracking?.employeeSignId,
            employeeSignName: mappedEmployeeSignName?.trim().isNotEmpty == true
                ? mappedEmployeeSignName
                : tracking?.employeeSignName,
          ),
        );
      },
    );
  }

  Future<void> _onInitEdit(Emitter<StampState> emit, {required int id}) async {
    emit(
      state.copyWith(
        isDetailLoading: true,
        status: BaseStateStatus.loading,
        detailItem: null,
        detailData: null,
        tracking: null,
        detailEmployee: null,
        detailDepartment: null,
        isSubmitting: false,
        submitSuccess: false,
        message: null,
      ),
    );

    final res = await _stampRepo.getStampDetail(id: id);

    await res.fold(
      (err) async {
        _log.logE('StampBloc _onInitEdit failed: $err');
        emit(
          state.copyWith(
            isDetailLoading: false,
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (detail) async {
        _log.logI('StampBloc _onInitEdit success');
        emit(
          state.copyWith(
            isDetailLoading: false,
            status: BaseStateStatus.success,
            detailData: detail,
            detailItem: detail.tracking,
            tracking: detail.tracking,
            detailEmployee: detail.employee,
            detailDepartment: detail.department,
            registerDate: detail.tracking?.registerDate,
            isUrgent: detail.tracking?.isUrgent ?? false,
            deadline: detail.tracking?.deadline,
            documentTypeId: detail.tracking?.documentTypeId,
            documentTypeName: detail.tracking?.documentTypeName,
            taxCompanyId: detail.taxs
                ?.map((item) => item.taxCompanyId)
                .whereType<int>()
                .firstOrNull,
            taxCompanyName: detail.tracking?.taxCompanyText,
            sealRegulationId: detail.seals
                ?.map((item) => item.sealId)
                .whereType<int>()
                .firstOrNull,
            sealRegulationName: detail.tracking?.sealNameText,
            documentName: detail.tracking?.documentName,
            documentQuantity: detail.tracking?.documentQuantity,
            documentTotalPage: detail.tracking?.documentTotalPage,
            approvedId: detail.tracking?.approvedId,
            employeeSignId: detail.tracking?.employeeSignId,
          ),
        );

        await _onLoadFormOptions(emit);
      },
    );
  }

  _onHydrateEditPayload(
    Emitter<StampState> emit, {
    StampItem? item,
    StampDetailItem? detail,
    required List<AssignerStampItem> employees,
    required List<SealItem> sealRegulations,
    required List<DocumentStampItem> documentTypes,
    required List<CompanyStampItem> taxCompanies,
  }) {
    final taxCompanyId = detail?.taxs
        ?.map((item) => item.taxCompanyId)
        .whereType<int>()
        .firstOrNull;
    final sealRegulationId = detail?.seals
        ?.map((item) => item.sealId)
        .whereType<int>()
        .firstOrNull;

    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        detailData: detail,
        detailItem: item,
        tracking: item,
        detailEmployee: detail?.employee,
        detailDepartment: detail?.department,
        registerDate: item?.registerDate,
        isUrgent: item?.isUrgent ?? false,
        deadline: item?.deadline,
        documentTypeId: item?.documentTypeId,
        documentTypeName: item?.documentTypeName,
        taxCompanyId: taxCompanyId,
        taxCompanyName: item?.taxCompanyText,
        sealRegulationId: sealRegulationId,
        sealRegulationName: item?.sealNameText,
        documentName: item?.documentName,
        documentQuantity: item?.documentQuantity,
        documentTotalPage: item?.documentTotalPage,
        approvedId: item?.approvedId,
        approvedName: item?.approvedName,
        employeeSignId: item?.employeeSignId,
        employeeSignName: item?.employeeSignName,
        employees: employees,
        sealRegulations: sealRegulations,
        documentTypes: documentTypes,
        taxCompanies: taxCompanies,
        isFormOptionsLoading: false,
        isSubmitting: false,
        submitSuccess: false,
        message: null,
      ),
    );
  }

  _onChangeRegisterDate(
    Emitter<StampState> emit, {
    required DateTime registerDate,
  }) {
    emit(state.copyWith(registerDate: registerDate));
  }

  _onChangeUrgent(Emitter<StampState> emit, {required bool isUrgent}) {
    emit(
      state.copyWith(
        isUrgent: isUrgent,
        deadline: isUrgent ? state.deadline : null,
      ),
    );
  }

  _onChangeDeadline(Emitter<StampState> emit, {required DateTime? deadline}) {
    emit(state.copyWith(deadline: deadline));
  }

  _onChangeDocumentType(
    Emitter<StampState> emit, {
    required int? id,
    String? name,
  }) {
    emit(state.copyWith(documentTypeId: id, documentTypeName: name));
  }

  _onChangeDocumentName(Emitter<StampState> emit, {required String name}) {
    emit(state.copyWith(documentName: name));
  }

  _onChangeDocumentQuantity(Emitter<StampState> emit, {required int quantity}) {
    emit(state.copyWith(documentQuantity: quantity));
  }

  _onChangeDocumentTotalPage(
    Emitter<StampState> emit, {
    required int totalPage,
  }) {
    emit(state.copyWith(documentTotalPage: totalPage));
  }

  _onChangeApproved(
    Emitter<StampState> emit, {
    required int? id,
    String? name,
  }) {
    emit(state.copyWith(approvedId: id, approvedName: name));
  }

  _onChangeEmployeeSign(
    Emitter<StampState> emit, {
    required int? id,
    String? name,
  }) {
    emit(state.copyWith(employeeSignId: id, employeeSignName: name));
  }

  _onChangeSealRegulation(
    Emitter<StampState> emit, {
    required int? id,
    String? name,
  }) {
    emit(state.copyWith(sealRegulationId: id, sealRegulationName: name));
  }

  _onChangeTaxCompany(
    Emitter<StampState> emit, {
    required int? id,
    String? name,
  }) {
    emit(state.copyWith(taxCompanyId: id, taxCompanyName: name));
  }

  Future<void> _onSubmitStamp(Emitter<StampState> emit) async {
    if (_isSubmitting) return;
    _isSubmitting = true;

    try {
      emit(
        state.copyWith(isSubmitting: true, submitSuccess: false, message: null),
      );

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);

      if (user == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            message: 'Không lấy được thông tin người dùng.',
          ),
        );
        _isSubmitting = false;
        return;
      }

      if (state.employeeSignId == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            message: 'Vui lòng chọn người ký chính.',
          ),
        );
        _isSubmitting = false;
        return;
      }

      if (state.documentTypeId == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            message: 'Vui lòng chọn loại văn bản.',
          ),
        );
        _isSubmitting = false;
        return;
      }

      if ((state.documentName ?? '').trim().isEmpty) {
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            message: 'Vui lòng nhập tên văn bản.',
          ),
        );
        _isSubmitting = false;
        return;
      }

      if (state.taxCompanyId == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            message: 'Vui lòng chọn tên công ty.',
          ),
        );
        _isSubmitting = false;
        return;
      }

      if (state.sealRegulationId == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            message: 'Vui lòng chọn quy cách đóng dấu.',
          ),
        );
        _isSubmitting = false;
        return;
      }

      if (state.registerDate == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            message: 'Vui lòng chọn ngày đăng ký.',
          ),
        );
        _isSubmitting = false;
        return;
      }

      if (state.isUrgent && state.deadline == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            message: 'Vui lòng chọn ngày giờ đóng dấu gấp.',
          ),
        );
        _isSubmitting = false;
        return;
      }

      final payload = {
        'ID': state.detailItem?.id ?? 0,
        'EmployeeID': user.employeeId,
        'RegisterDate': state.registerDate!.toIso8601String(),
        'EmployeeSignID': state.employeeSignId,
        'DocumentTypeID': state.documentTypeId,
        'DocumentName': state.documentName ?? '',
        'DocumentQuantity': state.documentQuantity ?? 1,
        'DocumentTotalPage': state.documentTotalPage,
        'Deadline': state.deadline?.toIso8601String(),
        'ListSeal': [
          {
            'ID': 0,
            'TrackingMartkID': state.detailItem?.id ?? 0,
            'SealID': state.sealRegulationId,
          },
        ],
        'ListTaxCompany': [
          {
            'ID': 0,
            'TrackingMartkID': state.detailItem?.id ?? 0,
            'TaxCompanyID': state.taxCompanyId,
          },
        ],
        'deletedFileIds': null,
      };

      _log.logI('Stamp submit payload: $payload');

      final res = await _stampRepo.saveStamp(payload: payload);

      await res.fold(
        (err) async {
          emit(
            state.copyWith(
              isSubmitting: false,
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (data) async {
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              message: data['message']?.toString() ?? 'Đăng ký dấu thành công.',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('StampBloc _onSubmitStamp exception: $e');
      emit(
        state.copyWith(
          isSubmitting: false,
          status: BaseStateStatus.failed,
          message: 'Có lỗi xảy ra khi gửi dữ liệu.',
        ),
      );
    } finally {
      _isSubmitting = false;
    }
  }

  _onClearSubmitState(Emitter<StampState> emit) {
    emit(
      state.copyWith(isSubmitting: false, submitSuccess: false, message: null),
    );
  }

  _onClearDeleteState(Emitter<StampState> emit) {
    emit(
      state.copyWith(
        isDeleting: false,
        deleteSuccess: false,
        message: null,
        status: BaseStateStatus.success,
      ),
    );
  }

  Future<void> _onDeleteStamp(
    Emitter<StampState> emit, {
    required int id,
  }) async {
    if (_isSubmitting) return;
    _isSubmitting = true;

    try {
      emit(
        state.copyWith(isDeleting: true, deleteSuccess: false, message: null),
      );

      _log.logI('Delete stamp id: $id');

      final res = await _stampRepo.deleteStamp(id: id);

      await res.fold(
        (err) async {
          _log.logE('Delete stamp failed: $err');
          emit(
            state.copyWith(
              isDeleting: false,
              deleteSuccess: false,
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (_) async {
          final updatedStamps = state.stamps.where((s) => s.id != id).toList();

          emit(
            state.copyWith(
              isDeleting: false,
              deleteSuccess: true,
              status: BaseStateStatus.removeSuccess,
              message: 'Xóa thành công.',
              stamps: updatedStamps,
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('StampBloc _onDeleteStamp exception: $e');
      emit(
        state.copyWith(
          isDeleting: false,
          deleteSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Có lỗi xảy ra khi xóa.',
        ),
      );
    } finally {
      _isSubmitting = false;
    }
  }
}
