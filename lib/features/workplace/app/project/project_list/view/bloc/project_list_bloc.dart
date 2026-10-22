import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/common/logger/index.dart';
import 'package:rtc_erp/features/workplace/app/project/project_list/data/datasource/model/project_list_model.dart';
import 'package:rtc_erp/features/workplace/app/project/project_list/data/repository/project_list_repo.dart';

part 'project_list_event.dart';
part 'project_list_state.dart';
part 'project_list_bloc.g.dart';
part 'project_list_bloc.freezed.dart';

@injectable
class ProjectListBloc extends BaseBloc<ProjectListEvent, ProjectListState> {
  final LogUtils _log;
  final ProjectListRepo _repo;

  ProjectListBloc(
    this._repo,
    this._log,
  ) : super(ProjectListState.init()) {
    on<ProjectListEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        refresh: () => _onRefresh(emit),
        search: (keyword) => _onSearch(emit, keyword: keyword),
        changeKeyword: (keyword) => _onChangeKeyword(emit, keyword: keyword),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
      );
    });
  }

  ProjectListParams _buildParams() {
    final df = DateFormat('yyyy/MM/dd HH:mm:ss');

    return ProjectListParams(
      keyword: state.searchKeyword,
      dateTimeS: state.dateStart != null
          ? df.format(state.dateStart!)
          : '2025-01-01 00:00:00',
      dateTimeE: state.dateEnd != null
          ? df.format(state.dateEnd!)
          : DateTime.now().toString().substring(0, 19).replaceAll('-', '/'),
    );
  }

  Future<void> _onInit(Emitter<ProjectListState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final params = _buildParams();

    final res = await _repo.getProjects(params: params);

    await res.fold(
      (l) async {
        _log.logE('ProjectListBloc _onInit failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: l.getErrorMessage,
        ));
      },
      (r) async {
        _log.logI('ProjectListBloc _onInit success: ${r.length} projects');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          projects: r,
        ));
      },
    );
  }

  Future<void> _onRefresh(Emitter<ProjectListState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final params = _buildParams();

    final res = await _repo.getProjects(params: params);

    await res.fold(
      (l) async {
        _log.logE('ProjectListBloc _onRefresh failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: l.getErrorMessage,
        ));
      },
      (r) async {
        _log.logI('ProjectListBloc _onRefresh success: ${r.length} projects');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          projects: r,
        ));
      },
    );
  }

  Future<void> _onSearch(
    Emitter<ProjectListState> emit, {
    String? keyword,
  }) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      searchKeyword: keyword ?? state.searchKeyword,
    ));

    final params = _buildParams();

    final res = await _repo.getProjects(params: params);

    await res.fold(
      (l) async {
        _log.logE('ProjectListBloc _onSearch failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: l.getErrorMessage,
        ));
      },
      (r) async {
        _log.logI('ProjectListBloc _onSearch success: ${r.length} projects');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          projects: r,
        ));
      },
    );
  }

  Future<void> _onChangeKeyword(
    Emitter<ProjectListState> emit, {
    required String keyword,
  }) async {
    emit(state.copyWith(searchKeyword: keyword));
  }

  Future<void> _onChangeDateRange(
    Emitter<ProjectListState> emit, {
    DateTime? dateStart,
    DateTime? dateEnd,
  }) async {
    emit(state.copyWith(dateStart: dateStart, dateEnd: dateEnd));
    add(const ProjectListEvent.init());
  }
}
