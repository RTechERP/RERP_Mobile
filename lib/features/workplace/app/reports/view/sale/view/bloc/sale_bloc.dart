import 'dart:convert';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../../../../../../auth/data/repository/auth_repo.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../../../data/repository/report_repo.dart';
import '../../data/sale_admin_model.dart';
import '../../data/sale_staff_model.dart';

part 'sale_event.dart';
part 'sale_state.dart';
part 'sale_bloc.g.dart';
part 'sale_bloc.freezed.dart';

@injectable
class SaleBloc extends BaseBloc<SaleEvent, SaleState> {
  final ReportRepo _reportRepo;
  final LogUtils _log;
  final AuthRepo _authRepo;

  SaleBloc(this._reportRepo, this._authRepo, this._log)
    : super(SaleState.init()) {
    on<SaleEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        addWork: () => _onAddWork(emit),
        removeWork: (index) => _onRemoveWork(index, emit),
        expandWork: (index) => _onExpandWork(index, emit),
        getSaleProject: () => _onGetSaleProject(emit),
        getFirmBase: () => _onGetFirmBase(emit),
        getTypeProjectBase: () => _onGetTypeProjectBase(emit),
        getCustomer: () => _onGetCustomer(emit),
        getTypeTeamSale: () => _onGetTypeTeamSale(emit),
        getStatusProject: () => _onGetStatusProject(emit),
        getCustomerContact: (customerId) =>
            _onGetCustomerContact(customerId, emit),
        getCustomerPart: (customerId) => _onGetCustomerPart(customerId, emit),
        updateWork:
            (
              index,
              projectId,
              projectName,
              code,
              firmId,
              firmName,
              typeProjectId,
              typeProjectName,
              customerId,
              customerName,
              customerCode,
              typeTeamSaleId,
              typeTeamSaleMainIndex,
              statusProjectId,
              statusProjectName,
              indexStatusProject,
              customerContactId,
              customerContactName,
              customerContactPhone,
              customerContactTeam,
              customerContactPart,
              customerContactPosition,
              customerPartId,
              customerPartName,
              customerPartCode,
              indexCustomerPart,
              saleOpportunity,
              bigAccount,
              content,
              results,
              planNextDay,
              backlog,
              customerProduct,
            ) => _onUpdateWork(
              index,
              projectId: projectId,
              projectName: projectName,
              code: code,
              firmId: firmId,
              firmName: firmName,
              typeProjectId: typeProjectId,
              typeProjectName: typeProjectName,
              customerId: customerId,
              customerName: customerName,
              customerCode: customerCode,
              typeTeamSaleId: typeTeamSaleId,
              typeTeamSaleMainIndex: typeTeamSaleMainIndex,
              statusProjectId: statusProjectId,
              statusProjectName: statusProjectName,
              indexStatusProject: indexStatusProject,
              customerContactId: customerContactId,
              customerContactName: customerContactName,
              customerContactPhone: customerContactPhone,
              customerContactTeam: customerContactTeam,
              customerContactPart: customerContactPart,
              customerContactPosition: customerContactPosition,
              customerPartId: customerPartId,
              customerPartName: customerPartName,
              customerPartCode: customerPartCode,
              indexCustomerPart: indexCustomerPart,
              saleOpportunity: saleOpportunity,
              bigAccount: bigAccount,
              content: content,
              results: results,
              planNextDay: planNextDay,
              backlog: backlog,
              customerProduct: customerProduct,
              emit: emit,
            ),
        updateDate: (picked) => _onUpdateDate(picked, emit),
        submitReport: (pickedDate) => _onSubmitReport(pickedDate, emit),
        resetSubmitFlags: () => _onResetSubmitFlags(emit),
        deleteReport: (dailyID) => _onDeleteReport(dailyID, emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(dateStart, dateEnd, emit),
        selectReport: (dailyID, forEdit) =>
            _onSelectReport(dailyID, forEdit: forEdit, emit: emit),
        submitEditReport: (pickedDate, dailyID) =>
            _onSubmitEditReport(pickedDate, dailyID, emit),
        getAllUser: () => _onGetAllUser(emit),
        updateAdminWork:
            (
              index,
              projectId,
              employeeId,
              employeeRequestId,
              customerId,
              reportTypeId,
              dateReport,
              reportContent,
              result,
              planNextDay,
              problem,
              problemSolve,
            reportTypeName,
            ) => _onUpdateAdminWork(
              index,
              projectId: projectId,
              employeeId: employeeId,
              employeeRequestId: employeeRequestId,
              customerId: customerId,
              reportTypeId: reportTypeId,
              dateReport: dateReport,
              reportContent: reportContent,
              result: result,
              planNextDay: planNextDay,
              problem: problem,
              problemSolve: problemSolve,
              reportTypeName: reportTypeName,
              emit: emit,
            ),
        getAdminTypeReport: () => _onGetAdminTypeReport(emit),
        getAdminProject: () => _onGetAdminProject(emit),
        getAdminCustomer: () => _onGetAdminCustomer(emit),
        submitAdminReport: (pickedDate) =>
            _onSubmitAdminReport(pickedDate, emit),
        selectAdminReport: (dailyID) => _onSelectAdminReport(dailyID, emit: emit),
        submitEditAdminReport: (pickedDate, dailyID) =>
            _onSubmitEditAdminReport(pickedDate, dailyID, emit),
        deleteAdminReport: (dailyID) => _onDeleteAdminReport(dailyID, emit),
      );
    });
  }

  Future<void> _loadAdminDailyReport({
    required DateTime start,
    required DateTime end,
    required Emitter<SaleState> emit,
  }) async {
    final res = await _reportRepo.getSaleAdminDailyReport(
      dateStart: start,
      dateEnd: end,
      customerId: 0,
      userId: 0,
      keyword: "",
    );
    res.fold(
      (l) {
        _log.logE('Error Sale Admin: ${l.getErrorMessage}');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (r) {
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            adminReports: r,
            dateStart: start,
            dateEnd: end,
          ),
        );
      },
    );
  }

  Future<void> _loadDailyReport({
    required DateTime start,
    required DateTime end,
    required Emitter<SaleState> emit,
  }) async {
    final userId = state.userId;
    final teamId = state.teamId;

    if (userId == null && teamId == null) {
      emit(state.copyWith(status: BaseStateStatus.failed));
      return;
    }

    final res = await _reportRepo.getSaleDailyReport(
      dateStart: start,
      dateEnd: end,
      userId: userId!,
      employeeTeamSaleId: 0,
    );

    res.fold(
      (l) {
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (r) {
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            reports: r.data.data,
            dateStart: start,
            dateEnd: end,
          ),
        );
      },
    );
  }

  Future<void> _onInit(Emitter<SaleState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (l) async {
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        if (user == null) {
          emit(state.copyWith(status: BaseStateStatus.failed));
          return;
        }

        emit(
          state.copyWith(
            userId: user.id,
            fullName: user.fullName,
            departmentId: user.departmentId,
            teamId: user.teamOfUser,
            employeeID: user.employeeId,
            positionName: user.positionName,
            departmentName: user.departmentName,
            positionId: user.positionId,

            /// auto có sẵn công việc 1
            staffWorks: [
              SaleStaffWork(
                id: DateTime.now().microsecondsSinceEpoch,
                code: '',
                fullName: user.fullName,
                userId: user.id,
                positionName: user.positionName,
                totalHours: 0,
                content: '',
                results: '',
                planNextDay: '',
                mission: '',
                projectItemCode: '',
              ),
            ],

            adminWorks: [
              SaleAdminWork(
                id: DateTime.now().microsecondsSinceEpoch,
                employeeId: user.id,
                employeeRequestId: 0,
                customerId: 0,
                projectId: 0,
                reportTypeId: 0,
                reportContent: '',
                result: '',
                planNextDay: '',
                problem: '',
                problemSolve: '',
                reportTypeName: '',
                customerName: '',
              ),
            ],

            /// auto mở
            expandedWorkIndex: 0,
          ),
        );

        final now = DateTime.now();

        final start = DateTime(now.year, now.month, now.day);
        final end = DateTime(now.year, now.month, now.day, 23, 59, 59);

        await _loadDailyReport(start: start, end: end, emit: emit);
        await _loadAdminDailyReport(start: start, end: end, emit: emit);
      },
    );
  }

  _onExpandWork(int index, Emitter<SaleState> emit) {
    emit(
      state.copyWith(
        expandedWorkIndex: state.expandedWorkIndex == index ? null : index,
      ),
    );
  }

  _onAddWork(Emitter<SaleState> emit) {
    final dateStr = state.dateStart != null
        ? DateFormat('yyyy-MM-dd').format(state.dateStart!)
        : '';

    final newStaffWorks = [
      ...state.staffWorks,
      SaleStaffWork.empty(
        dateReport: dateStr,
        projectId: 0,
        userId: 0,
        code: '',
        fullName: '',
        projectItemId: 0,
      ),
    ];

    final newAdminWorks = [
      ...state.adminWorks,
      SaleAdminWork.empty(
        dateReport: dateStr,
        projectId: 0,
        userId: 0,
        code: '',
        fullName: '',
        projectItemId: 0,
      ),
    ];

    emit(
      state.copyWith(
        staffWorks: newStaffWorks,
        adminWorks: newAdminWorks,
        expandedWorkIndex: newStaffWorks.length - 1,
      ),
    );
  }

  _onRemoveWork(int index, Emitter<SaleState> emit) {
    final newStaffWorks = [...state.staffWorks];
    final newAdminWorks = [...state.adminWorks];

    if (index < 0 || index >= newStaffWorks.length) return;

    newStaffWorks.removeAt(index);

    if (index < newAdminWorks.length) {
      newAdminWorks.removeAt(index);
    }

    emit(
      state.copyWith(
        staffWorks: newStaffWorks,
        adminWorks: newAdminWorks,
        expandedWorkIndex: null,
      ),
    );
  }

  Future<void> _onGetSaleProject(Emitter<SaleState> emit) async {
    final res = await _reportRepo.getSaleProject();

    res.fold(
      (l) {
        _log.logE('Get sale project failed: $l');
      },
      (r) {
        emit(state.copyWith(projects: r));
      },
    );
  }

  Future<void> _onGetFirmBase(Emitter<SaleState> emit) async {
    final res = await _reportRepo.getFirmBase();

    res.fold(
      (l) {
        _log.logE('Get firm base failed: $l');
      },
      (r) {
        emit(state.copyWith(firmBases: r));
      },
    );
  }

  Future<void> _onGetTypeProjectBase(Emitter<SaleState> emit) async {
    final res = await _reportRepo.getTypeProject();

    res.fold(
      (l) {
        _log.logE('Get type project base failed: $l');
      },
      (r) {
        emit(state.copyWith(typeProjectBases: r));
      },
    );
  }

  Future<void> _onGetCustomer(Emitter<SaleState> emit) async {
    final res = await _reportRepo.getCustomer();

    res.fold(
      (l) {
        _log.logE('Get customer failed: $l');
      },
      (r) {
        emit(state.copyWith(customers: r));
      },
    );
  }

  Future<void> _onGetTypeTeamSale(Emitter<SaleState> emit) async {
    final res = await _reportRepo.getTypeTeamSale();

    res.fold(
      (l) {
        _log.logE('Get type team sale failed: $l');
      },
      (r) {
        emit(state.copyWith(typeTeamSales: r));
      },
    );
  }

  Future<void> _onGetStatusProject(Emitter<SaleState> emit) async {
    final res = await _reportRepo.getStatusProject();

    res.fold(
      (l) {
        _log.logE('Get status project failed: $l');
      },
      (r) {
        emit(state.copyWith(statusProjects: r));
      },
    );
  }

  Future<void> _onGetCustomerContact(
    int customerId,
    Emitter<SaleState> emit,
  ) async {
    if (customerId <= 0) {
      _log.logE('CustomerId invalid ($customerId), skip getCustomerContact');
      return;
    }

    final res = await _reportRepo.getCustomerContact(customerId: customerId);

    res.fold(
      (l) {
        _log.logE('Get customer contact failed: $l');
      },
      (r) {
        emit(state.copyWith(customerContacts: r));
      },
    );
  }

  Future<void> _onGetCustomerPart(
    int customerId,
    Emitter<SaleState> emit,
  ) async {
    if (customerId <= 0) {
      _log.logE('CustomerId invalid ($customerId), skip getCustomerPart');
      return;
    }

    final res = await _reportRepo.getCustomerPart(customerId: customerId);

    res.fold(
      (l) {
        _log.logE('Get customer part failed: $l');
      },
      (r) {
        emit(state.copyWith(customerParts: r));
      },
    );
  }

  Future<void> _onUpdateWork(
    int index, {
    int? projectId,
    String? projectName,
    String? code,
    int? firmId,
    String? firmName,
    int? typeProjectId,
    String? typeProjectName,
    int? customerId,
    String? customerName,
    String? customerCode,
    int? typeTeamSaleId,
    String? typeTeamSaleMainIndex,
    int? statusProjectId,
    String? statusProjectName,
    int? indexStatusProject,
    int? customerContactId,
    String? customerContactName,
    String? customerContactPhone,
    String? customerContactTeam,
    String? customerContactPart,
    String? customerContactPosition,
    int? customerPartId,
    String? customerPartName,
    String? customerPartCode,
    int? indexCustomerPart,
    bool? saleOpportunity,
    bool? bigAccount,
    String? content,
    String? results,
    String? planNextDay,
    String? backlog,
    String? customerProduct,
    required Emitter<SaleState> emit,
  }) async {
    final works = [...state.staffWorks];
    if (index < 0 || index >= works.length) return;

    final old = works[index];

    final effectiveProjectId = projectId ?? old.projectId;
    SaleProjectResponse? project;
    if (effectiveProjectId != null) {
      for (final p in state.projects) {
        if (p.id == effectiveProjectId) {
          project = p;
          break;
        }
      }
    }

    final effectiveProjectName =
        projectName ?? project?.projectName ?? old.projectName;
    final effectiveProjectCode =
        code ?? project?.projectCode ?? old.projectCode;
    final effectiveProjectText =
        '${effectiveProjectCode ?? ''} - ${effectiveProjectName ?? ''}'.trim();

    final effectiveCustomerId = customerId ?? old.customerId;
    final customerChanged = customerId != null && customerId != old.customerId;

    works[index] = old.copyWith(
      projectId: effectiveProjectId,
      projectName: effectiveProjectName,
      projectCode: effectiveProjectCode,
      projectText: effectiveProjectText,
      firmId: firmId ?? old.firmId,
      firmName: firmName ?? old.firmName,
      typeProjectId: typeProjectId ?? old.typeProjectId,
      typeProjectName: typeProjectName ?? old.typeProjectName,
      customerId: effectiveCustomerId,
      customerName: customerName ?? old.customerName,
      customerCode: customerCode ?? old.customerCode,
      typeTeamSaleId: typeTeamSaleId ?? old.typeTeamSaleId,
      typeTeamSaleMainIndex: typeTeamSaleMainIndex ?? old.typeTeamSaleMainIndex,
      statusProjectId: statusProjectId ?? old.statusProjectId,
      statusProjectName: statusProjectName ?? old.statusProjectName,
      indexStatusProject: indexStatusProject ?? old.indexStatusProject,
      clearContactAndPart: customerChanged,
      customerContactId: customerContactId ?? old.customerContactId,
      customerContactName: customerContactName ?? old.customerContactName,
      customerContactPhone: customerContactPhone ?? old.customerContactPhone,
      customerContactTeam: customerContactTeam ?? old.customerContactTeam,
      customerContactPart: customerContactPart ?? old.customerContactPart,
      customerContactPosition:
          customerContactPosition ?? old.customerContactPosition,
      customerPartId: customerPartId ?? old.customerPartId,
      customerPartName: customerPartName ?? old.customerPartName,
      customerPartCode: customerPartCode ?? old.customerPartCode,
      indexCustomerPart: indexCustomerPart ?? old.indexCustomerPart,
      saleOpportunity: saleOpportunity ?? old.saleOpportunity,
      bigAccount: bigAccount ?? old.bigAccount,
      content: content ?? old.content,
      results: results ?? old.results,
      planNextDay: planNextDay ?? old.planNextDay,
      backlog: backlog ?? old.backlog,
      customerProduct: customerProduct ?? old.customerProduct,
    );

    if (customerChanged) {
      // Xóa cache contact/part cũ; load lại theo customerId mới để bottom sheet đúng KH.
      emit(
        state.copyWith(
          staffWorks: works,
          customerContacts: const [],
          customerParts: const [],
        ),
      );
      if (effectiveCustomerId != null && effectiveCustomerId > 0) {
        final contactRes = await _reportRepo.getCustomerContact(
          customerId: effectiveCustomerId,
        );
        contactRes.fold(
          (l) => _log.logE('Get customer contact after customer change: $l'),
          (r) => emit(state.copyWith(staffWorks: works, customerContacts: r)),
        );
        final partRes = await _reportRepo.getCustomerPart(
          customerId: effectiveCustomerId,
        );
        partRes.fold(
          (l) => _log.logE('Get customer part after customer change: $l'),
          (r) => emit(state.copyWith(staffWorks: works, customerParts: r)),
        );
      }
    } else {
      emit(state.copyWith(staffWorks: works));
    }
  }

  _onUpdateDate(DateTime? picked, Emitter<SaleState> emit) {
    if (picked == null) return;

    final safeDate = DateTime(picked.year, picked.month, picked.day);

    emit(state.copyWith(dateReport: safeDate));
  }

  bool _isSubmittingReport = false;

  Future<void> _onSubmitReport(
    DateTime pickedDate,
    Emitter<SaleState> emit,
  ) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(state.copyWith(isSubmitting: true, submitSuccess: false));

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      final userId = user?.id;

      if (userId == null) {
        emit(state.copyWith(isSubmitting: false));
        return;
      }

      if (state.staffWorks.isEmpty) {
        emit(state.copyWith(isSubmitting: false));
        return;
      }

      final safeStart = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );
      final safeEnd = safeStart;

      final payload = state.staffWorks.map<Map<String, dynamic>>((w) {
        return {
          'ID': 0,

          'projectId': w.projectId ?? 0,
          'customerId': w.customerId ?? 0,
          'warehouseId': 1,
          'projectStatusBaseId': w.projectStatusBaseId ?? 0,
          'userId': userId,

          // Nếu từng work không có date riêng thì dùng khoảng ngày submit
          'dateStart': (w.dateStart ?? safeStart).toIso8601String(),
          'dateEnd': (w.dateEnd ?? safeEnd).toIso8601String(),

          'firmId': w.firmId ?? 0,
          'projectTypeId': w.typeProjectId ?? 0,
          'contactId': w.customerContactId ?? 0,
          'groupTypeId': w.typeTeamSaleId ?? 0,

          'partId': w.customerPartId,

          'bigAccount': w.bigAccount,
          'saleOpportunity': w.saleOpportunity,

          'content': w.content,
          'result': w.results,
          'problemBacklog': w.problem ?? '',
          'planNext': w.planNextDay,
          'productOfCustomer': w.customerProduct ?? '',

          'projectStatusOld': w.projectStatusOld ?? 0,
          'employeeId': userId,

          'dateStatusLog': DateTime.now().toIso8601String(),
        };
      }).toList();

      _log.logD('Payload: ${jsonEncode(payload)}');

      final res = await _reportRepo.saveReportSaleStaff(payload: payload);

      await res.fold(
        (l) async {
          _log.logE('❌ Submit API failed: $l');
          emit(state.copyWith(isSubmitting: false, submitSuccess: false));
        },
        (r) async {
          _log.logI('✅ Submit report success');
          emit(state.copyWith(isSubmitting: false, submitSuccess: true));
        },
      );
    } catch (e, s) {
      _log.logE('❌ Submit exception: $e');
      _log.logE('$s');
      emit(state.copyWith(isSubmitting: false, submitSuccess: false));
    } finally {
      _isSubmittingReport = false;
      _log.logI('🏁 End submit report');
    }
  }

  _onResetSubmitFlags(Emitter<SaleState> emit) {
    emit(state.copyWith(submitSuccess: false));
    emit(state.copyWith(isSubmitting: false));
  }

  Future<void> _onDeleteReport(int dailyID, Emitter<SaleState> emit) async {
    emit(
      state.copyWith(
        isDeleting: true,
        deleteSuccess: false,
        status: BaseStateStatus.loading,
      ),
    );

    final result = await _reportRepo.deleteSaleReport(dailyID: dailyID);

    result.fold(
      (error) {
        emit(state.copyWith(isDeleting: false, deleteSuccess: false));
      },
      (message) {
        /// remove khỏi list hiện tại (không cần gọi lại API)
        final updatedReports = state.reports
            .where((e) => e.id != dailyID)
            .toList();

        emit(
          state.copyWith(
            reports: updatedReports,
            isDeleting: false,
            deleteSuccess: true,
            status: BaseStateStatus.success,
            message: message,
          ),
        );
      },
    );
  }

  Future<void> _onChangeDateRange(
    DateTime dateStart,
    DateTime dateEnd,
    Emitter<SaleState> emit,
  ) async {
    final start = DateTime(dateStart.year, dateStart.month, dateStart.day);
    final end = DateTime(dateEnd.year, dateEnd.month, dateEnd.day);

    emit(state.copyWith(status: BaseStateStatus.loading));

    await _loadDailyReport(start: start, end: end, emit: emit);
  }

  Future<void> _onSelectReport(
    int dailyID, {
    required bool forEdit,
    required Emitter<SaleState> emit,
  }) async {
    emit(state.copyWith(isLoadingDetail: true));

    final res = await _reportRepo.getSaleById(dailyID: dailyID);

    await res.fold(
      (l) async {
        _log.logE('Get detail failed: $l');
        emit(state.copyWith(isLoadingDetail: false));
      },
      (detail) async {
        _log.logI('✅ Detail Report: $detail');

        emit(
          state.copyWith(
            isLoadingDetail: false,
            selectedReportDetail: detail,
            staffWorks: forEdit
                ? [SaleStaffWork.fromDetailSaleReportResponse(detail)]
                : state.staffWorks,
          ),
        );
      },
    );
  }

  Future<void> _onSelectAdminReport(
      int dailyID, {
        required Emitter<SaleState> emit,
      }) async {
    emit(state.copyWith(isLoadingDetail: true));

    final res = await _reportRepo.getSaleAdminById(dailyID: dailyID);

    await res.fold(
          (l) async {
        _log.logE('Get detail failed: $l');
        emit(state.copyWith(isLoadingDetail: false));
      },
          (detail) async {
        _log.logI('✅ Detail Report: $detail');

        emit(
          state.copyWith(
            isLoadingDetail: false,
            selectedReportAdminDetail: detail,
            adminWorks: [
              SaleAdminWork.fromDetailSaleReportResponse(detail),
            ],
          ),
        );
      },
    );
  }

  Future<void> _onSubmitEditReport(
    DateTime pickedDate,
    int dailyID,
    Emitter<SaleState> emit,
  ) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(state.copyWith(isSaving: true, saveSuccess: false));

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      final userId = user?.id;

      if (userId == null) {
        emit(state.copyWith(isSaving: false));
        return;
      }

      if (state.staffWorks.isEmpty) {
        emit(state.copyWith(isSaving: false));
        return;
      }

      final safeStart = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );
      final safeEnd = safeStart;

      final payload = state.staffWorks.map<Map<String, dynamic>>((w) {
        return {
          'ID': dailyID,

          'projectId': w.projectId ?? 0,
          'customerId': w.customerId ?? 0,
          'warehouseId': 1,
          'projectStatusBaseId': w.projectStatusBaseId ?? 0,
          'userId': userId,

          // Nếu từng work không có date riêng thì dùng khoảng ngày submit
          'dateStart': (w.dateStart ?? safeStart).toIso8601String(),
          'dateEnd': (w.dateEnd ?? safeEnd).toIso8601String(),

          'firmId': w.firmId ?? 0,
          'projectTypeId': w.typeProjectId ?? 0,
          'contactId': w.customerContactId ?? 0,
          'groupTypeId': w.typeTeamSaleId ?? 0,

          'partId': w.customerPartId,

          'bigAccount': w.bigAccount,
          'saleOpportunity': w.saleOpportunity,

          'content': w.content,
          'result': w.results,
          'problemBacklog': w.problem ?? '',
          'planNext': w.planNextDay,
          'productOfCustomer': w.customerProduct ?? '',

          'projectStatusOld': w.projectStatusOld ?? 0,
          'employeeId': userId,

          'dateStatusLog': DateTime.now().toIso8601String(),
        };
      }).toList();

      _log.logD('Payload: ${jsonEncode(payload)}');

      final res = await _reportRepo.saveReportSaleStaff(payload: payload);

      await res.fold(
        (l) async {
          _log.logE('❌ Submit API failed: $l');
          emit(state.copyWith(isSaving: false, saveSuccess: false));
        },
        (r) async {
          _log.logI('✅ Submit report success');
          emit(state.copyWith(isSaving: false, saveSuccess: true));
        },
      );
    } catch (e, s) {
      _log.logE('❌ Submit exception: $e');
      _log.logE('$s');
      emit(state.copyWith(isSaving: false, saveSuccess: false));
    } finally {
      _isSubmittingReport = false;
      _log.logI('🏁 End submit report');
    }
  }

  Future<void> _onGetAllUser(Emitter<SaleState> emit) async {
    final res = await _reportRepo.getAllUser();

    res.fold(
      (l) {
        _log.logE('Get all users failed: $l');
      },
      (r) {
        emit(state.copyWith(users: r));
      },
    );
  }

  Future<void> _onGetAdminTypeReport(Emitter<SaleState> emit) async {
    final res = await _reportRepo.getAdminTypeReport();

    res.fold(
      (l) {
        _log.logE('Get admin type report failed: $l');
      },
      (r) {
        emit(state.copyWith(adminTypeReports: r));
      },
    );
  }

  Future<void> _onGetAdminProject(Emitter<SaleState> emit) async {
    final res = await _reportRepo.getAdminProject();

    res.fold(
      (l) {
        _log.logE('Get admin project failed: $l');
      },
      (r) {
        emit(state.copyWith(adminProjects: r));
      },
    );
  }

  Future<void> _onGetAdminCustomer(Emitter<SaleState> emit) async {
    final res = await _reportRepo.getAdminCustomer();

    res.fold(
      (l) {
        _log.logE('Get admin customer failed: $l');
      },
      (r) {
        emit(state.copyWith(adminCustomers: r));
      },
    );
  }

  Future<void> _onUpdateAdminWork(
    int index, {
    int? projectId,
    int? employeeId,
    int? employeeRequestId,
    int? customerId,
    int? reportTypeId,
    DateTime? dateReport,
    String? reportContent,
    String? result,
    String? planNextDay,
    String? problem,
    String? problemSolve,
        String? reportTypeName,
    required Emitter<SaleState> emit,
  }) async {
    final works = [...state.adminWorks];
    if (index < 0 || index >= works.length) return;

    final old = works[index];

    final effectiveProjectId = projectId ?? old.projectId;
    final effectiveEmployeeId = employeeId ?? old.employeeId;
    final effectiveEmployeeRequestId =
        employeeRequestId ?? old.employeeRequestId;
    final effectiveCustomerId = customerId ?? old.customerId;
    final effectiveReportTypeId = reportTypeId ?? old.reportTypeId;
    final effectiveDateReport = dateReport ?? old.dateReport;

    works[index] = old.copyWith(
      projectId: effectiveProjectId,
      employeeId: effectiveEmployeeId,
      employeeRequestId: effectiveEmployeeRequestId,
      customerId: effectiveCustomerId,
      reportTypeId: effectiveReportTypeId,
      dateReport: effectiveDateReport,
      reportContent: reportContent ?? old.reportContent,
      result: result ?? old.result,
      planNextDay: planNextDay ?? old.planNextDay,
      problem: problem ?? old.problem,
      problemSolve: problemSolve ?? old.problemSolve,
      reportTypeName: reportTypeName ?? old.reportTypeName,
    );

    emit(state.copyWith(adminWorks: works));
  }

  Future<void> _onSubmitAdminReport(
    DateTime pickedDate,
    Emitter<SaleState> emit,
  ) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(state.copyWith(isSubmitting: true, submitSuccess: false));

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      final userId = user?.id;

      if (userId == null) {
        emit(state.copyWith(isSubmitting: false));
        return;
      }

      if (state.adminWorks.isEmpty) {
        emit(state.copyWith(isSubmitting: false));
        return;
      }

      final safeStart = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );

      final payload = {
        'request': state.adminWorks.map((w) {
          return {
            'ID': 0,
            'PlanNextDay': w.planNextDay ?? '',
            'Problem': w.problem ?? '',
            'ProblemSolve': w.problemSolve ?? '',
            'ReportContent': w.reportContent ?? '',
            'Result': w.result ?? '',
            'EmployeeID': w.employeeId,
            'EmployeeRequestID': w.employeeRequestId ?? 0,
            'CustomerID': w.customerId ?? 0,
            'ProjectID': w.projectId ?? 0,
            'ReportTypeID': w.reportTypeId ?? 0,
            'DateReport': safeStart.toIso8601String(),
          };
        }).toList(),
        'IdsDel': [],
      };

      _log.logD('Payload: ${jsonEncode(payload)}');

      final res = await _reportRepo.saveReportSaleAdmin(payload: payload);

      await res.fold(
        (l) async {
          _log.logE('❌ Submit API failed: $l');
          emit(state.copyWith(isSubmitting: false, submitSuccess: false));
        },
        (r) async {
          _log.logI('✅ Submit report success');
          emit(state.copyWith(isSubmitting: false, submitSuccess: true));
        },
      );
    } catch (e, s) {
      _log.logE('❌ Submit exception: $e');
      _log.logE('$s');
      emit(state.copyWith(isSubmitting: false, submitSuccess: false));
    } finally {
      _isSubmittingReport = false;
      _log.logI('🏁 End submit report');
    }
  }

  Future<void> _onSubmitEditAdminReport(
      DateTime pickedDate,
      int dailyID,
      Emitter<SaleState> emit,
      ) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(state.copyWith(isSubmitting: true, submitSuccess: false));

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      final userId = user?.id;

      if (userId == null) {
        emit(state.copyWith(isSubmitting: false));
        return;
      }

      if (state.adminWorks.isEmpty) {
        emit(state.copyWith(isSubmitting: false));
        return;
      }

      final safeStart = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );

      final payload = {
        'request': state.adminWorks.map((w) {
          return {
            'ID': dailyID,
            'PlanNextDay': w.planNextDay ?? '',
            'Problem': w.problem ?? '',
            'ProblemSolve': w.problemSolve ?? '',
            'ReportContent': w.reportContent ?? '',
            'Result': w.result ?? '',
            'EmployeeID': w.employeeId,
            'EmployeeRequestID': w.employeeRequestId ?? 0,
            'CustomerID': w.customerId ?? 0,
            'ProjectID': w.projectId ?? 0,
            'ReportTypeID': w.reportTypeId ?? 0,
            'DateReport': safeStart.toIso8601String(),
          };
        }).toList(),
        'IdsDel': [],
      };

      _log.logD('Payload: ${jsonEncode(payload)}');

      final res = await _reportRepo.saveReportSaleAdmin(payload: payload);

      await res.fold(
            (l) async {
          _log.logE('❌ Submit API failed: $l');
          emit(state.copyWith(isSubmitting: false, submitSuccess: false));
        },
            (r) async {
          _log.logI('✅ Submit report success');
          emit(state.copyWith(isSubmitting: false, submitSuccess: true));
        },
      );
    } catch (e, s) {
      _log.logE('❌ Submit exception: $e');
      _log.logE('$s');
      emit(state.copyWith(isSubmitting: false, submitSuccess: false));
    } finally {
      _isSubmittingReport = false;
      _log.logI('🏁 End submit report');
    }
  }

  Future<void> _onDeleteAdminReport(int dailyID, Emitter<SaleState> emit) async {
    emit(
      state.copyWith(
        isDeleting: true,
        deleteSuccess: false,
        status: BaseStateStatus.loading,
      ),
    );

    final result = await _reportRepo.deleteSaleAdminReport(dailyID: dailyID);

    result.fold(
          (error) {
        emit(state.copyWith(isDeleting: false, deleteSuccess: false));
      },
          (message) {
        /// remove khỏi list hiện tại (không cần gọi lại API)
        final updatedReports = state.adminReports
            .where((e) => e.id != dailyID)
            .toList();

        emit(
          state.copyWith(
            adminReports: updatedReports,
            isDeleting: false,
            deleteSuccess: true,
            status: BaseStateStatus.success,
            message: message,
          ),
        );
      },
    );
  }
}
