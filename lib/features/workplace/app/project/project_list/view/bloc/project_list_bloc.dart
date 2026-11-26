import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/common/logger/index.dart';
import 'package:rtc_erp/features/workplace/app/project/project_list/data/datasource/model/project_list_model.dart';
import 'package:rtc_erp/features/workplace/app/project/project_list/data/repository/project_list_repo.dart';

part 'project_list_event.dart';
part 'project_list_state.dart';
part 'project_list_bloc.g.dart';
part 'project_list_bloc.freezed.dart';

/// Bloc cho danh sách dự án.
///
/// Ngoài việc tải danh sách, bloc còn tải sẵn dữ liệu lookup phục vụ bộ lọc
/// (khách hàng, kiểu dự án, trạng thái, nhân sự).
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
        applyFilters: (filters) => _onApplyFilters(emit, filters: filters),
        clearFilters: () => _onClearFilters(emit),
        reloadLookups: () => _onReloadLookups(emit),
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
      customerId: state.filters.customerId ?? 0,
      projectType: state.filters.projectType?.toString() ?? '',
      projectStatus: state.filters.projectStatus?.toString() ?? '',
      saleId: state.filters.saleId ?? 0,
      userTechId: state.filters.techId ?? 0,
      pmId: state.filters.pmId ?? 0,
      businessFieldId: state.filters.businessFieldId ?? 0,
    );
  }

  Future<void> _onInit(Emitter<ProjectListState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    await _loadLookups(emit);
    await _fetchProjects(emit, 'init');
  }

  Future<void> _onRefresh(Emitter<ProjectListState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    await _fetchProjects(emit, 'refresh');
  }

  Future<void> _onSearch(
    Emitter<ProjectListState> emit, {
    String? keyword,
  }) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      searchKeyword: keyword ?? state.searchKeyword,
    ));

    await _fetchProjects(emit, 'search');
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
    await _fetchProjects(emit, 'changeDateRange');
  }

  Future<void> _onApplyFilters(
    Emitter<ProjectListState> emit, {
    required ProjectFilters filters,
  }) async {
    emit(state.copyWith(filters: filters));
    await _fetchProjects(emit, 'applyFilters');
  }

  Future<void> _onClearFilters(Emitter<ProjectListState> emit) async {
    emit(state.copyWith(filters: const ProjectFilters()));
    await _fetchProjects(emit, 'clearFilters');
  }

  /// Tải lại dữ liệu lookup cho bộ lọc mà không tải lại danh sách dự án.
  Future<void> _onReloadLookups(Emitter<ProjectListState> emit) async {
    await _loadLookups(emit);
  }

  /// Tải song song dữ liệu lookup cho bộ lọc. Từng API được bọc riêng để một
  /// API lỗi không làm mất các API còn lại.
  Future<void> _loadLookups(Emitter<ProjectListState> emit) async {
    Future<List<T>> safe<T>(
      Future<Either<BaseError, List<T>>> Function() fetch,
      List<T> fallback,
      String name,
    ) async {
      try {
        final res = await fetch();
        return res.fold(
          (l) {
            _log.logE('ProjectList lookup $name failed: $l');
            return fallback;
          },
          (r) {
            _log.logI('ProjectList lookup $name: ${r.length} items');
            return r;
          },
        );
      } catch (e) {
        _log.logE('ProjectList lookup $name threw: $e');
        return fallback;
      }
    }

    final results = await Future.wait<dynamic>([
      safe(_repo.getCustomers, state.customers, 'customers'),
      safe(_repo.getProjectTypes, state.projectTypes, 'projectTypes'),
      safe(_repo.getProjectStatuses, state.statuses, 'statuses'),
      safe(_repo.getUsers, state.users, 'users'),
      safe(_repo.getPms, state.pms, 'pms'),
      safe(_repo.getBusinessFields, state.businessFields, 'businessFields'),
    ]);

    emit(state.copyWith(
      customers: (results[0] as List).cast<CustomerItem>(),
      projectTypes: (results[1] as List).cast<ProjectTypeItem>(),
      statuses: (results[2] as List).cast<ProjectStatusItem>(),
      users: (results[3] as List).cast<UserItem>(),
      pms: (results[4] as List).cast<PmItem>(),
      businessFields: (results[5] as List).cast<BusinessFieldItem>(),
    ));
  }

  /// Gọi API danh sách dự án theo bộ tham số hiện tại.
  Future<void> _fetchProjects(Emitter<ProjectListState> emit, String tag) async {
    final params = _buildParams();

    final res = await _repo.getProjects(params: params);

    await res.fold(
      (l) async {
        _log.logE('ProjectListBloc $tag failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: l.getErrorMessage,
        ));
      },
      (r) async {
        _log.logI('ProjectListBloc $tag success: ${r.length} projects');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          projects: r,
        ));
      },
    );
  }
}
