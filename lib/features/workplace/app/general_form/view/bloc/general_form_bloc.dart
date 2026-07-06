import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/common/logger/index.dart';
import 'package:rtc_erp/features/workplace/app/reports/data/datasource/models/report_model.dart';
import 'package:rtc_erp/features/workplace/app/general_form/data/repository/general_form_repo.dart';
import 'package:rtc_erp/features/workplace/app/general_form/data/datasource/model/general_form_model.dart';

part 'general_form_event.dart';
part 'general_form_state.dart';
part 'general_form_bloc.g.dart';
part 'general_form_bloc.freezed.dart';

@injectable
class GeneralFormBloc extends BaseBloc<GeneralFormEvent, GeneralFormState> {
  final LogUtils _log;
  final GeneralFormRepo _generalFormRepo;

  GeneralFormBloc(
    this._generalFormRepo,
    this._log,
  ) : super(GeneralFormState.init()) {
    on<GeneralFormEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        fetchByDepartment: (departmentId) =>
            _onFetchByDepartment(emit, departmentId: departmentId),
        search: (keyword, departmentId) =>
            _onSearch(emit, keyword: keyword, departmentId: departmentId),
        changeDepartment: (departmentId) =>
            _onChangeDepartment(emit, departmentId: departmentId),
        changeKeyword: (keyword) => _onChangeKeyword(emit, keyword: keyword),
      );
    });
  }

  Future<void> _onInit(Emitter<GeneralFormState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final futureDepartments = _generalFormRepo.getDepart();

    final departRes = await futureDepartments;

    final List<DepartResponse> departments = departRes.fold(
      (l) {
        _log.logE('Get depart failed: $l');
        return <DepartResponse>[];
      },
      (r) => r,
    );

    // Fetch all forms in a single call (departID=-1 returns everything)
    final formRes = await _generalFormRepo.getGeneralForm(departmentId: -1);
    final List<FormItem> allFormItems = [];
    formRes.fold(
      (l) => _log.logE('Get general form with -1 failed: $l'),
      (r) => allFormItems.addAll(r),
    );

    if (departments.isEmpty && allFormItems.isEmpty) {
      _log.logE('GeneralFormBloc _onInit failed: both APIs returned empty');
      emit(
        state.copyWith(
          status: BaseStateStatus.failed,
          message: 'Không thể tải dữ liệu',
        ),
      );
      return;
    }

    _log.logI('✅ GeneralFormBloc _onInit - departments: ${departments.length}, forms: ${allFormItems.length}');

    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        departments: departments,
        formItems: allFormItems,
      ),
    );
  }

  Future<void> _onFetchByDepartment(
    Emitter<GeneralFormState> emit, {
    required int departmentId,
  }) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final res = await _generalFormRepo.getGeneralForm(departmentId: departmentId);

    await res.fold(
      (l) async {
        _log.logE('❌ GeneralFormBloc _onFetchByDepartment API failed: $l');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: l.getErrorMessage,
          ),
        );
      },
      (r) async {
        _log.logI(
          '✅ GeneralFormBloc _onFetchByDepartment success, total: ${r.length}',
        );
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            formItems: r,
            selectedDepartmentId: departmentId,
          ),
        );
      },
    );
  }

  Future<void> _onSearch(
    Emitter<GeneralFormState> emit, {
    String? keyword,
    int? departmentId,
  }) async {
    final deptId = departmentId ?? state.selectedDepartmentId ?? -1;

    emit(state.copyWith(status: BaseStateStatus.loading));

    final res = await _generalFormRepo.getGeneralForm(departmentId: deptId);

    await res.fold(
      (l) async {
        _log.logE('❌ GeneralFormBloc _onSearch API failed: $l');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: l.getErrorMessage,
          ),
        );
      },
      (r) async {
        _log.logI('✅ GeneralFormBloc _onSearch success, total: ${r.length}');
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            formItems: r,
            selectedDepartmentId: deptId,
            searchKeyword: keyword ?? state.searchKeyword,
          ),
        );
      },
    );
  }

  Future<void> _onChangeDepartment(
    Emitter<GeneralFormState> emit, {
    required int departmentId,
  }) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      selectedDepartmentId: departmentId,
    ));

    // If "Tất cả" (-1), fetch all forms in a single call
    if (departmentId == -1) {
      final res = await _generalFormRepo.getGeneralForm(departmentId: -1);
      await res.fold(
        (l) async {
          _log.logE('❌ GeneralFormBloc _onChangeDepartment(-1) API failed: $l');
          emit(
            state.copyWith(
              status: BaseStateStatus.failed,
              message: l.getErrorMessage,
            ),
          );
        },
        (r) async {
          _log.logI(
            '✅ GeneralFormBloc _onChangeDepartment(-1) success, total: ${r.length}',
          );
          emit(
            state.copyWith(
              status: BaseStateStatus.success,
              formItems: r,
            ),
          );
        },
      );
      return;
    }

    final res = await _generalFormRepo.getGeneralForm(departmentId: departmentId);

    await res.fold(
      (l) async {
        _log.logE('❌ GeneralFormBloc _onChangeDepartment API failed: $l');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: l.getErrorMessage,
          ),
        );
      },
      (r) async {
        _log.logI(
          '✅ GeneralFormBloc _onChangeDepartment success, total: ${r.length}',
        );
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            formItems: r,
          ),
        );
      },
    );
  }

  Future<void> _onChangeKeyword(Emitter<GeneralFormState> emit, {required String keyword}) async {
    emit(state.copyWith(searchKeyword: keyword));
  }
}
