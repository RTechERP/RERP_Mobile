import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/enums/role_enum.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../../common/services/permissions/role_resolver.dart';
import '../../../../../../../../../common/utils/datetime_utils.dart';
import '../../../../../../../../../common/utils/formatter/date_formatter.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/leave_model.dart';
import '../../data/repository/leave_repo.dart';
import '../../data/repository/leave_repository.dart';

part 'leave_event.dart';
part 'leave_state.dart';
part 'leave_bloc.g.dart';
part 'leave_bloc.freezed.dart';

@injectable
class LeaveBloc extends BaseBloc<LeaveEvent, LeaveState> {
  final LogUtils _log;
  final AuthRepo _authRepo;

  final LeaveRepo _leaveRepo;
  bool _isSubmittingReport = false;
  bool _isInitAddInFlight = false;

  LeaveBloc(
    this._leaveRepo,
    this._authRepo,
    this._log,
  ) : super(LeaveState.init()) {
    on<LeaveEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        initAdd: () => _onInitAdd(emit),
        initDetail: (phaseId, detailId, listStartDate, listTimeOnLeave) =>
            _onInitDetail(
              emit,
              phaseId: phaseId,
              detailId: detailId,
              listStartDate: listStartDate,
              listTimeOnLeave: listTimeOnLeave,
            ),
        clearDetailForm: () async => _onClearDetailForm(emit),
        fetchApprovers: () => _onFetchApprovers(emit),
        submit: (type, approvedTP, dateStart, dateEnd, timeRegister, reason) =>
            _onSubmit(
              emit,
              type: type,
              approvedTP: approvedTP,
              dateStart: dateStart,
              dateEnd: dateEnd,
              timeRegister: timeRegister,
              reason: reason,
            ),
        submitBatch: (approvedTP, slips) =>
            _onSubmitBatch(emit, approvedTP: approvedTP, slips: slips),
        onCancelSubmit: (id) => _onCancelSubmit(emit, id: id),
        onEditSubmit: (phaseId, approvedTP, slips) => _onEditSubmit(
              emit,
              phaseId: phaseId,
              approvedTP: approvedTP,
              slips: slips,
            ),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        clearSubmitState: () async => _onClearSubmitState(emit),
      );
    });
  }

  Future<void> _onInitAdd(Emitter<LeaveState> emit) async {
    // Chặn bắn API trùng khi UI render / init state gọi nhanh.
    if (_isInitAddInFlight) {
      _log.logI('ℹ️ initAdd skipped: request in-flight');
      return;
    }
    _isInitAddInFlight = true;
    try {
      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.fold((_) => null, (u) => u);

      if (user == null) {
        _log.logE('❌ initAdd: no current user');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: 'Không lấy được thông tin người dùng',
          ),
        );
        return;
      }

      final employeeID = user.employeeId;
      final roles = RoleResolver.resolve(user);
      final skipDateRules =
          roles.contains(AppRole.admin) || roles.contains(AppRole.hr);
      final todayStart = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );

      // ── 1. Đọc cache trước ──────────────────────────────────────────────
      final cache = await LeaveRepository.getInitAddCache(
        employeeId: employeeID,
        log: _log,
      );
      final cachedApprovers = cache?.approvers ?? const [];
      final cachedLeaveTime = cache?.leaveTime ?? const [];
      final cachedEmployees = cache?.employees ?? const [];
      final cachedApproveId = cache?.defaultApprover;

      final hasApprovers = cachedApprovers.isNotEmpty;
      final hasLeaveTime = cachedLeaveTime.isNotEmpty;
      final hasEmployees = skipDateRules ? cachedEmployees.isNotEmpty : true;

      _log.logI(
        'ℹ️ initAdd cache: approvers=${cachedApprovers.length}, '
        'leaveTime=${cachedLeaveTime.length}, '
        'employees=${cachedEmployees.length}, '
        'approveId=${cachedApproveId != null}, '
        'skipDateRules=$skipDateRules',
      );

      // Emit cache ngay để UI hiển thị không loading.
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          approvers: cachedApprovers,
          leaveTime: cachedLeaveTime,
          employeeLeave: skipDateRules ? cachedEmployees : [],
          approveId: cachedApproveId,
          employeeId: employeeID,
          loginName: user.loginName,
          departmentName: user.departmentName,
          employeeDisplayLine: '${user.code} - ${user.fullName}'.trim(),
          skipLeaveDateConstraints: skipDateRules,
        ),
      );

      // ── 2. Backfill từ API nếu cache thiếu ───────────────────────────
      final needApprovers = !hasApprovers;
      final needLeaveTime = !hasLeaveTime;
      final needEmployees = skipDateRules && !hasEmployees;
      final needDefaultApprover = cachedApproveId == null;

      if (needApprovers || needLeaveTime || needEmployees || needDefaultApprover) {
        await _backfillInitAdd(
          employeeId: employeeID,
          todayStart: todayStart,
          skipDateRules: skipDateRules,
          needApprovers: needApprovers,
          needLeaveTime: needLeaveTime,
          needEmployees: needEmployees,
          needDefaultApprover: needDefaultApprover,
          existing: cache,
          emit: emit,
        );
      }

      _log.logI('✅ initAdd complete');
    } finally {
      _isInitAddInFlight = false;
    }
  }

  /// Backfill từng phần cache còn thiếu; ghi lại cache đầy đủ sau khi xong.
  Future<void> _backfillInitAdd({
    required int employeeId,
    required DateTime todayStart,
    required bool skipDateRules,
    required bool needApprovers,
    required bool needLeaveTime,
    required bool needEmployees,
    required bool needDefaultApprover,
    required LeaveInitAddCache? existing,
    required Emitter<LeaveState> emit,
  }) async {
    List<ApproverItem>? approvers;
    List<LeaveTimeItem>? leaveTime;
    List<EmployeeLeave>? employees;
    FillApproverItem? defaultApprover;

    if (needApprovers) {
      final res = await _leaveRepo.getApprover();
      res.fold(
        (l) => _log.logE('❌ backfill getApprover failed: $l'),
        (r) => approvers = r,
      );
    }

    if (needLeaveTime) {
      final res = await _leaveRepo.getLeaveTimeItem(
        dateStart: todayStart,
        employeeId: employeeId,
      );
      res.fold(
        (l) => _log.logE('❌ backfill getLeaveTime failed: $l'),
        (r) => leaveTime = r,
      );
    }

    if (needEmployees) {
      final res = await _leaveRepo.getEmployeeLeave();
      res.fold(
        (l) => _log.logE('❌ backfill getEmployeeLeave failed: $l'),
        (r) => employees = r,
      );
    }

    if (needDefaultApprover) {
      final res = await _leaveRepo.getFillApprover(
        employeeID: employeeId,
        tableName: 'EmployeeOnLeave',
      );
      res.fold(
        (l) => _log.logE('❌ backfill getFillApprover failed: $l'),
        (r) => defaultApprover = r,
      );
    }

    // Cập nhật state nếu còn mở.
    if (!isClosed) {
      emit(
        state.copyWith(
          approvers: approvers ?? state.approvers,
          leaveTime: leaveTime ?? state.leaveTime,
          employeeLeave: employees ?? state.employeeLeave,
          approveId: defaultApprover ?? state.approveId,
        ),
      );
    }

    // Ghi lại cache đầy đủ.
    await LeaveRepository.saveInitAddCache(
      employeeId: employeeId,
      approvers: approvers ?? existing?.approvers ?? const [],
      leaveTime: leaveTime ?? existing?.leaveTime ?? const [],
      employees: employees ?? existing?.employees ?? const [],
      defaultApprover: defaultApprover ?? existing?.defaultApprover,
      log: _log,
    );
  }

  List<LeaveEditSlip> _pickDetailSlips({
    required LeavePhaseMultiDto dto,
    required int detailId,
    DateTime? listStartDate,
    int? listTimeOnLeave,
  }) {
    var picked = dto.slips.where((s) => s.detailId == detailId).toList();
    if (picked.isNotEmpty) return picked;

    if (listStartDate != null) {
      final day = DateTime(
        listStartDate.year,
        listStartDate.month,
        listStartDate.day,
      );
      final candidates = dto.slips.where((s) {
        final sd = DateTime(s.date.year, s.date.month, s.date.day);
        if (sd != day) return false;
        if (listTimeOnLeave != null && listTimeOnLeave > 0) {
          return s.timeRegister == listTimeOnLeave;
        }
        return true;
      }).toList();
      if (candidates.length == 1) return candidates;
    }
    return picked;
  }

  Future<void> _onInitDetail(
    Emitter<LeaveState> emit, {
    required int phaseId,
    required int detailId,
    DateTime? listStartDate,
    int? listTimeOnLeave,
  }) async {
    emit(
      state.copyWith(
        isDetailLoading: true,
        detailPhaseId: phaseId,
        detailFocusDetailId: detailId,
        detailEditSlips: const [],
        detailPhaseAllSlips: const [],
        message: null,
      ),
    );
    try {
      final multiRes = await _leaveRepo.getLeavePhaseMulti(phaseId: phaseId);
      await multiRes.fold(
        (err) async {
          _log.logE('❌ initDetail get-multi failed: $err');
          emit(
            state.copyWith(
              isDetailLoading: false,
              detailEditSlips: const [],
              detailPhaseAllSlips: const [],
              message: err.getErrorMessage,
            ),
          );
        },
        (dto) async {
          final picked = _pickDetailSlips(
            dto: dto,
            detailId: detailId,
            listStartDate: listStartDate,
            listTimeOnLeave: listTimeOnLeave,
          );
          if (picked.isEmpty) {
            _log.logE('❌ initDetail: no detail id=$detailId in phase=$phaseId');
            emit(
              state.copyWith(
                isDetailLoading: false,
                detailEditSlips: const [],
                detailPhaseAllSlips: const [],
                message:
                    'Không tìm thấy phiếu #$detailId trong đợt nghỉ #$phaseId.',
              ),
            );
            return;
          }

          final userRes = await _authRepo.getCurrentUser();
          final user = userRes.fold((_) => null, (u) => u);
          if (user == null) {
            emit(
              state.copyWith(
                isDetailLoading: false,
                message: 'Không lấy được thông tin người dùng',
              ),
            );
            return;
          }

          final roles = RoleResolver.resolve(user);
          final skipDateRules = roles.contains(AppRole.admin) ||
              roles.contains(AppRole.hr);

          final dateForStats = picked.first.date;

          final approverRes = await _leaveRepo.getApprover();
          final leaveTimeRes = await _leaveRepo.getLeaveTimeItem(
            dateStart: dateForStats,
            employeeId: user.employeeId,
          );

          BaseError? err;
          var approvers = <ApproverItem>[];
          var leaveTimeItems = <LeaveTimeItem>[];
          var employeeItems = <EmployeeLeave>[];

          approverRes.fold((l) => err = l, (r) => approvers = r);
          if (err != null) {
            emit(
              state.copyWith(
                isDetailLoading: false,
                message: err!.getErrorMessage,
              ),
            );
            return;
          }

          leaveTimeRes.fold((l) => err = l, (r) => leaveTimeItems = r);
          if (err != null) {
            emit(
              state.copyWith(
                isDetailLoading: false,
                message: err!.getErrorMessage,
              ),
            );
            return;
          }

          if (skipDateRules) {
            final empRes = await _leaveRepo.getEmployeeLeave();
            empRes.fold((l) => err = l, (r) => employeeItems = r);
            if (err != null) {
              _log.logE('❌ initDetail getEmployeeLeave failed: $err');
              err = null; // không chặn màn hình, chỉ log
            }
          }

          // Khi admin/HR xem đơn của người khác: dùng EmployeeID từ phase.
          final targetEmployeeId =
              (skipDateRules && dto.employeeId != null && dto.employeeId! > 0)
                  ? dto.employeeId!
                  : user.employeeId;

          // Tìm thông tin hiển thị cho nhân viên được chọn (nếu khác user).
          String displayLine = '${user.code} - ${user.fullName}'.trim();
          String? deptName = user.departmentName;
          if (targetEmployeeId != user.employeeId && employeeItems.isNotEmpty) {
            final found = employeeItems
                .where((e) => e.id == targetEmployeeId)
                .firstOrNull;
            if (found != null) {
              displayLine =
                  '${found.code ?? ''} - ${found.fullName ?? ''}'.trim();
              deptName = found.departmentName;
            }
          }

          _log.logI(
            '✅ initDetail phase=$phaseId detail=$detailId '
            '(phaseSlips=${dto.slips.length})',
          );
          final phaseTp = dto.approvedTP;
          final rowTp = picked.first.approvedPayloadFromRow;
          final mergedApprovedTp =
              phaseTp > 0 ? phaseTp : (rowTp ?? 0);
          emit(
            state.copyWith(
              isDetailLoading: false,
              status: BaseStateStatus.success,
              approvers: approvers,
              leaveTime: leaveTimeItems,
              employeeLeave: skipDateRules ? employeeItems : [],
              employeeId: targetEmployeeId,
              loginName: user.loginName,
              departmentName: deptName,
              employeeDisplayLine: displayLine,
              skipLeaveDateConstraints: skipDateRules,
              detailPhaseId: dto.phaseId,
              detailPhaseCode: dto.phaseCode,
              detailPhaseDateRegister: dto.dateRegister,
              detailApprovedTP: mergedApprovedTp,
              detailEditSlips: picked,
              detailPhaseAllSlips: dto.slips,
              detailFocusDetailId: detailId,
              detailPhaseIsApprovedBGD: dto.phaseIsApprovedBGD,
              detailPhaseIsApprovedTP: dto.phaseIsApprovedTP,
              detailPhaseIsApprovedHR: dto.phaseIsApprovedHR,
              detailPhaseStatusHRNumber: dto.phaseStatusHRNumber,
              detailPhaseStatusHRText: dto.phaseStatusHRText,
              message: null,
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ initDetail exception: $e');
      emit(
        state.copyWith(
          isDetailLoading: false,
          message: 'Có lỗi khi tải chi tiết đơn',
        ),
      );
    }
  }

  /// Admin / HR chọn nhân viên khác từ picker: cập nhật state (không qua event).
  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  void updateSelectedEmployee({
    required int employeeId,
    required String? departmentName,
    required String? employeeDisplay,
  }) {
    if (isClosed) return;
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    emit(
      state.copyWith(
        employeeId: employeeId,
        departmentName: departmentName,
        employeeDisplayLine: employeeDisplay,
      ),
    );
  }

  void _onClearDetailForm(Emitter<LeaveState> emit) {
    emit(
      state.copyWith(
        isDetailLoading: false,
        detailPhaseId: null,
        detailPhaseCode: null,
        detailPhaseDateRegister: null,
        detailApprovedTP: null,
        detailEditSlips: const [],
        detailPhaseAllSlips: const [],
        detailFocusDetailId: null,
        detailPhaseIsApprovedBGD: null,
        detailPhaseIsApprovedTP: null,
        detailPhaseIsApprovedHR: null,
        detailPhaseStatusHRNumber: null,
        detailPhaseStatusHRText: null,
      ),
    );
  }

  Future<void> _onFetchApprovers(Emitter<LeaveState> emit) async {
    final approverRes = await _leaveRepo.getApprover();
    await approverRes.fold(
          (l) async {
        _log.logE('❌ fetchApprovers failed: $l');
        emit(state.copyWith(message: l.getErrorMessage));
      },
          (r) async {
        _log.logI('✅ fetchApprovers success');
        emit(state.copyWith(approvers: r));
      },
    );
  }

  Future<void> _onInit(Emitter<LeaveState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final today = DateTime.now();
    final todayStart = DateTime(today.year, today.month, today.day);

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
          (err) async {
        _log.logE('❌ Get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
          (user) async {
        final roles = RoleResolver.resolve(user!);

        final skipDateRules = roles.contains(AppRole.admin) ||
            roles.contains(AppRole.hr);

        final (defaultStart, defaultEnd) = DateFormatter.calendarMonthBounds(today);

        late final DateTime queryDate;
        late final DateTime exactStart;
        late final DateTime exactEnd;

        if (state.dateStart != null && state.dateEnd != null) {
          final a = state.dateStart!;
          final b = state.dateEnd!;
          queryDate = a.isAfter(b) ? b : a;
          exactStart = a.isAfter(b) ? b : a;
          exactEnd = a.isAfter(b) ? a : b;
        } else {
          queryDate = today;
          exactStart = defaultStart;
          exactEnd = defaultEnd;
        }

        final payload = <String, dynamic>{
          "IDApprovedTP": 0,
          "departmentId": 0,
          "keyWord": '',
          "month": queryDate.month,
          "pageNumber": 1,
          "pageSize": 1000,
          "status": -1,
          "year": queryDate.year,
        };

        _log.logI('Payload: $payload');

        final leaveRes = await _leaveRepo.getLeave(payload: payload);

        await leaveRes.fold(
              (err) async {
            _log.logE('❌ Get leave failed: $err');
            emit(state.copyWith(status: BaseStateStatus.failed));
          },
              (leaveData) async {
            final leaveTimeRes = await _leaveRepo.getLeaveTimeItem(
              dateStart: todayStart,
              employeeId: user.employeeId ,
            );

            await leaveTimeRes.fold(
                  (err) async {
                _log.logE('❌ Get leave time failed: $err');

                emit(
                  state.copyWith(
                    status: BaseStateStatus.success,
                    leave: leaveData,
                    dateStart: exactStart,
                    dateEnd: exactEnd,
                    skipLeaveDateConstraints: skipDateRules,
                  ),
                );
              },
                  (leaveTimeItem) async {
                final roles = RoleResolver.resolve(user);

                // Refresh cache để addScreen hiển thị ngay khi mở.
                // Chạy song song, không block emit success.
                unawaited(
                  _refreshLeaveCache(
                    employeeId: user.employeeId,
                    roles: roles,
                    todayStart: todayStart,
                  ),
                );

                emit(
                  state.copyWith(
                    status: BaseStateStatus.success,
                    leave: leaveData,
                    leaveTime: leaveTimeItem,
                    dateStart: exactStart,
                    dateEnd: exactEnd,
                    skipLeaveDateConstraints: skipDateRules,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  /// Background refresh cache (approvers / employees / leaveTime / default approver)
  /// phục vụ màn Add. Không emit state, không fail màn List.
  Future<void> _refreshLeaveCache({
    required int employeeId,
    required Set<AppRole> roles,
    required DateTime todayStart,
  }) async {
    final skipDateRules =
        roles.contains(AppRole.admin) || roles.contains(AppRole.hr);

    List<ApproverItem>? approvers;
    List<LeaveTimeItem>? leaveTime;
    List<EmployeeLeave>? employees;
    FillApproverItem? defaultApprover;

    final approverRes = await _leaveRepo.getApprover();
    approverRes.fold(
      (l) => _log.logE('❌ refreshCache getApprover failed: $l'),
      (r) => approvers = r,
    );

    final leaveTimeRes = await _leaveRepo.getLeaveTimeItem(
      dateStart: todayStart,
      employeeId: employeeId,
    );
    leaveTimeRes.fold(
      (l) => _log.logE('❌ refreshCache getLeaveTime failed: $l'),
      (r) => leaveTime = r,
    );

    if (skipDateRules) {
      final employeeRes = await _leaveRepo.getEmployeeLeave();
      employeeRes.fold(
        (l) => _log.logE('❌ refreshCache getEmployeeLeave failed: $l'),
        (r) => employees = r,
      );
    }

    final fillApproverRes = await _leaveRepo.getFillApprover(
      employeeID: employeeId,
      tableName: 'EmployeeOnLeave',
    );
    fillApproverRes.fold(
      (l) => _log.logE('❌ refreshCache getFillApprover failed: $l'),
      (r) => defaultApprover = r,
    );

    if (approvers == null && leaveTime == null && employees == null) {
      // Không có gì mới để ghi.
      return;
    }

    await LeaveRepository.saveInitAddCache(
      employeeId: employeeId,
      approvers: approvers ?? const [],
      leaveTime: leaveTime ?? const [],
      employees: employees ?? const [],
      defaultApprover: defaultApprover,
      log: _log,
    );
  }

  Future<void> _onChangeDateRange(
      Emitter<LeaveState> emit, {
        required DateTime dateStart,
        required DateTime dateEnd,
      }) async {
    final start = DateTime(dateStart.year, dateStart.month, dateStart.day);
    final end = DateTime(dateEnd.year, dateEnd.month, dateEnd.day);

    final lo = start.isAfter(end) ? end : start;
    final hi = start.isAfter(end) ? start : end;

    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        dateStart: lo,
        dateEnd: hi,
      ),
    );

    final userRes = await _authRepo.getCurrentUser();
    await userRes.fold(
          (err) async {
        _log.logE('❌ Get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
          (user) async {
        final payload = <String, dynamic>{
          "IDApprovedTP": 0,
          "departmentId": 0,
          "keyWord": '',
          "month": lo.month,
          "pageNumber": 1,
          "pageSize": 10000,
          "status": -1,
          "year": lo.year,
        };

        _log.logI('Payload: $payload');

        final res = await _leaveRepo.getLeave(payload: payload);
        await res.fold(
              (l) async {
            _log.logE('❌ API failed: $l');
            emit(state.copyWith(status: BaseStateStatus.failed));
          },
              (r) async {
            _log.logI('✅ API success - total: $r');
            emit(
              state.copyWith(
                status: BaseStateStatus.success,
                leave: r,
                dateStart: lo,
                dateEnd: hi,
              ),
            );
          },
        );
      },
    );
  }

  Future<Either<BaseError, void>> _saveLeaveRecord({
    required int employeeId,
    int id = 0,
    required int type,
    required int approvedTP,
    required DateTime dateStart,
    required DateTime dateEnd,
    required int timeRegister,
    required String reason,
  }) async {
    final now = DateTime.now();
    final dateRegister = DateTime(
      dateStart.year,
      dateStart.month,
      dateStart.day,
      now.hour,
      now.minute,
      now.second,
      now.millisecond,
    );
    final payload = <String, dynamic>{
      "ID": id,
      "ApprovedID": 0,
      "ApprovedTP": approvedTP,
      "DateEnd": toVnIso8601(dateEnd),
      "DateRegister": toVnIso8601(dateRegister),
      "DateStart": toVnIso8601(dateStart),
      "EmployeeID": employeeId,
      "IsApproved": false,
      "IsDeleted": false,
      "Reason": reason,
      "ReasonHREdit": "",
      "TimeRegister": timeRegister,
      "Type": type,
    };
    return _leaveRepo.saveMultiLeave(payload: payload);
  }

  /// Body save-data: Phase (tổng ngày + đăng ký) + Details (từng phiếu).
  /// Buổi: 1 sáng 8–12h, 2 chiều 13:30–17:30, 3 cả ngày 8–17:30.
  Map<String, dynamic> _leaveSubmitBody({
    required int employeeId,
    required int approvedTP,
    required List<LeaveAddSlip> slips,
  }) {
    final details = <Map<String, dynamic>>[];
    var totalDayPhase = 0.0;
    DateTime? firstStart;
    DateTime? lastEnd;

    for (final s in slips) {
      final y = s.date.year, m = s.date.month, d = s.date.day;
      late DateTime start, end;
      late int totalTime;
      late double dayFrac;
      switch (s.timeRegister) {
        case 1:
          start = DateTime(y, m, d, 8);
          end = DateTime(y, m, d, 12);
          totalTime = 4;
          dayFrac = 0.5;
          break;
        case 2:
          start = DateTime(y, m, d, 13, 30);
          end = DateTime(y, m, d, 17, 30);
          totalTime = 4;
          dayFrac = 0.5;
          break;
        default:
          start = DateTime(y, m, d, 8);
          end = DateTime(y, m, d, 17, 30);
          totalTime = 8;
          dayFrac = 1;
      }
      totalDayPhase += dayFrac;

      if (firstStart == null || start.isBefore(firstStart)) {
        firstStart = start;
      }
      if (lastEnd == null || end.isAfter(lastEnd)) {
        lastEnd = end;
      }

      details.add({
        'ID': 0,
        'StartDate': toVnIso8601(start),
        'EndDate': toVnIso8601(end),
        'TimeOnLeave': s.timeRegister,
        'Type': s.type,
        'TypeIsReal': s.type,
        'Reason': s.reason,
        'EmployeeID': employeeId,
        'ApprovedTP': approvedTP,
        'TotalTime': totalTime,
        'TotalDay': dayFrac,
        'IsApprovedTP': false,
        'IsApprovedHR': false,
        'IsCancelTP': false,
        'DeleteFlag': false,
      });
    }

    return {
      'Phase': {
        'ID': 0,
        'Code': '',
        'EmployeeID': employeeId,
        'DateRegister': toVnIso8601(DateTime.now()),
        'Reason': '',
        'StartDate': firstStart == null ? null : toVnIso8601(firstStart!),
        'EndDate': lastEnd == null ? null : toVnIso8601(lastEnd!),
        'TotalDay': totalDayPhase,
        'IsDeleted': false,
      },
      'Details': details,
      'IsPartialUpdate': false,
    };
  }

  Map<String, dynamic> _leaveEditSubmitBody({
    required int employeeId,
    required int phaseId,
    required String phaseCode,
    required DateTime? phaseDateRegister,
    required int approvedTP,
    required List<LeaveEditSlip> slips,
  }) {
    final details = <Map<String, dynamic>>[];
    var totalDayPhase = 0.0;
    final regIso = toVnIso8601(phaseDateRegister ?? DateTime.now());

    DateTime? firstStart;
    DateTime? lastEnd;

    for (final s in slips) {
      final y = s.date.year, m = s.date.month, d = s.date.day;
      late DateTime start, end;
      late int totalTime;
      late double dayFrac;
      switch (s.timeRegister) {
        case 1:
          start = DateTime(y, m, d, 8);
          end = DateTime(y, m, d, 12);
          totalTime = 4;
          dayFrac = 0.5;
          break;
        case 2:
          start = DateTime(y, m, d, 13, 30);
          end = DateTime(y, m, d, 17, 30);
          totalTime = 4;
          dayFrac = 0.5;
          break;
        default:
          start = DateTime(y, m, d, 8);
          end = DateTime(y, m, d, 17, 30);
          totalTime = 8;
          dayFrac = 1;
      }
      totalDayPhase += dayFrac;

      if (firstStart == null || start.isBefore(firstStart)) {
        firstStart = start;
      }
      if (lastEnd == null || end.isAfter(lastEnd)) {
        lastEnd = end;
      }

      details.add({
        'ID': s.detailId,
        'StartDate': toVnIso8601(start),
        'EndDate': toVnIso8601(end),
        'TimeOnLeave': s.timeRegister,
        'Type': s.type,
        'TypeIsReal': s.type,
        'EmployeeID': employeeId,
        'ApprovedTP': approvedTP,
        'TotalTime': totalTime,
        'TotalDay': dayFrac,
        'IsApprovedTP': false,
        'IsApprovedHR': false,
        'IsCancelTP': false,
        'DeleteFlag': false,
      });
    }

    return {
      'Phase': {
        'ID': phaseId,
        'Code': phaseCode,
        'EmployeeID': employeeId,
        'DateRegister': regIso,
        'StartDate': firstStart == null ? null : toVnIso8601(firstStart!),
        'EndDate': lastEnd == null ? null : toVnIso8601(lastEnd!),
        'TotalDay': totalDayPhase,
        'IsDeleted': false,
      },
      'Details': details,
      'IsPartialUpdate': true,
    };
  }

  Future<void> _onSubmitBatch(
    Emitter<LeaveState> emit, {
    required int approvedTP,
    required List<LeaveAddSlip> slips,
  }) async {
    if (_isSubmittingReport || slips.isEmpty) return;
    _isSubmittingReport = true;

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
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: 'Không lấy được thông tin người dùng',
          ),
        );
        return;
      }

      // Ưu tiên employeeId đã chọn trong state (admin/HR đại diện nộp cho người khác).
      final employeeId = state.employeeId ?? user.employeeId;
      final payload = _leaveSubmitBody(
        employeeId: employeeId,
        approvedTP: approvedTP,
        slips: slips,
      );
      final saveRes = await _leaveRepo.saveMultiLeave(payload: payload);

      await saveRes.fold(
        (err) async {
          _log.logE('❌ Submit Leave batch failed: $err');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: false,
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (_) async {
          _log.logI('✅ Submit Leave batch success');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              employeeId: employeeId,
              message: 'Tạo đơn xin nghỉ thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Submit Leave batch exception: $e');
      emit(
        state.copyWith(
          isSubmitting: false,
          submitSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Có lỗi xảy ra khi gửi dữ liệu',
        ),
      );
    } finally {
      _isSubmittingReport = false;
      _log.logI('🏁 End submit Leave batch');
    }
  }

  Future<void> _onSubmit(
      Emitter<LeaveState> emit, {
        required int type,
        required int approvedTP,
        required DateTime dateStart,
        required DateTime dateEnd,
        required int timeRegister,
        required String reason,
      }) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

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
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: 'Không lấy được thông tin người dùng',
          ),
        );
        return;
      }

      final employeeId = user.employeeId;
      final saveRes = await _saveLeaveRecord(
        employeeId: employeeId,
        id: 0,
        type: type,
        approvedTP: approvedTP,
        dateStart: dateStart,
        dateEnd: dateEnd,
        timeRegister: timeRegister,
        reason: reason,
      );

      await saveRes.fold(
        (err) async {
          _log.logE('❌ Submit Leave API failed: $err');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: false,
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (_) async {
          _log.logI('✅ Submit Leave success');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              employeeId: employeeId,
              message: 'Tạo đơn xin nghỉ thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Submit Leave exception: $e');
      emit(
        state.copyWith(
          isSubmitting: false,
          submitSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Có lỗi xảy ra khi gửi dữ liệu',
        ),
      );
    } finally {
      _isSubmittingReport = false;
      _log.logI('🏁 End submit Leave');
    }
  }

  void _onClearSubmitState(Emitter<LeaveState> emit) {
    emit(state.copyWith(submitSuccess: false, message: null));
  }

  Future<void> _onEditSubmit(
    Emitter<LeaveState> emit, {
    required int phaseId,
    required int approvedTP,
    required List<LeaveEditSlip> slips,
  }) async {
    if (_isSubmittingReport || slips.isEmpty) return;
    _isSubmittingReport = true;

    try {
      emit(
        state.copyWith(
          isSubmitting: true,
          submitSuccess: false,
          message: null,
          deleteSuccess: false,
          isDeleting: false,
        ),
      );

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);

      if (user == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: 'Không lấy được thông tin người dùng',
          ),
        );
        return;
      }

      final payload = _leaveEditSubmitBody(
        // Ưu tiên employeeId trong state (admin/HR đại diện sửa).
        employeeId: state.employeeId ?? user.employeeId,
        phaseId: phaseId,
        phaseCode: state.detailPhaseCode ?? '',
        phaseDateRegister: state.detailPhaseDateRegister,
        approvedTP: approvedTP,
        slips: slips,
      );
      final saveRes = await _leaveRepo.saveMultiLeave(payload: payload);
      await saveRes.fold(
        (err) async {
          _log.logE('❌ Edit Leave batch failed: $err');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: false,
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (_) async {
          _log.logI('✅ Edit Leave batch success');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              message: 'Cập nhật đơn xin nghỉ thành công',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Edit Leave exception: $e');
      emit(
        state.copyWith(
          isSubmitting: false,
          submitSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Có lỗi xảy ra khi gửi dữ liệu',
        ),
      );
    } finally {
      _isSubmittingReport = false;
      _log.logI('🏁 End edit Leave batch');
    }
  }

  Future<void> _onCancelSubmit(
      Emitter<LeaveState> emit, {
        required int id,
      }) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(
        state.copyWith(
          isDeleting: true,
          deleteSuccess: false,
          status: BaseStateStatus.loading,
          message: null,
        ),
      );

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);

      if (user == null) {
        emit(
          state.copyWith(
            isDeleting: false,
            deleteSuccess: false,
            status: BaseStateStatus.failed,
            message: 'Có lỗi xảy ra khi gửi dữ liệu',
          ),
        );
        return;
      }


      final payload = <String, dynamic>{
        "ID": id,
        "EmployeeID": user.employeeId,
        "DeleteFlag": true,
      };

      final saveRes = await _leaveRepo.saveLeave(payload: payload);
      await saveRes.fold(
            (err) async {
          _log.logE('❌ Cancel Leave API failed: $err');
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
          final updatedLeave = state.leave.where((e) => e.id != id).toList();
          emit(
            state.copyWith(
              isDeleting: false,
              deleteSuccess: true,
              status: BaseStateStatus.success,
              leave: updatedLeave,
              message: null,
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('❌ Cancel Leave exception: $e');
      emit(
        state.copyWith(
          isDeleting: false,
          deleteSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Có lỗi xảy ra khi gửi dữ liệu',
        ),
      );
    } finally {
      _isSubmittingReport = false;
      _log.logI('🏁 End cancel Leave');
    }
  }
}