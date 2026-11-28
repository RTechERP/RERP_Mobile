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

  /// Theo dõi request sinh mã dự án đang chạy.
  ///
  /// Khi người dùng đổi khách hàng hoặc kiểu dự án, request cũ bị vô hiệu
  /// hoá để mã sinh ra sau đó không ghi đè giá trị mới.
  final _CodeRequestTracker _codeRequestId = _CodeRequestTracker();

  ProjectListBloc(this._repo, this._log) : super(ProjectListState.init()) {
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
        generateProjectCode: (customerShortName, projectType) =>
            _onGenerateProjectCode(
              emit,
              customerShortName: customerShortName,
              projectType: projectType,
            ),
        clearGeneratedCode: () => _onClearGeneratedCode(emit),
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
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        searchKeyword: keyword ?? state.searchKeyword,
      ),
    );

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
  ///
  /// Dùng cho cả bộ lọc và form tạo dự án.
  Future<void> _onReloadLookups(Emitter<ProjectListState> emit) async {
    await _loadLookups(emit);
  }

  /// Sinh mã dự án tự động từ tên viết tắt khách hàng và kiểu dự án.
  Future<void> _onGenerateProjectCode(
    Emitter<ProjectListState> emit, {
    required String customerShortName,
    required int projectType,
  }) async {
    final session = _codeRequestId.start();
    emit(state.copyWith(isGeneratingCode: true, message: null));

    final res = await _repo.generateProjectCode(
      customerShortName: customerShortName,
      projectType: projectType,
    );

    await res.fold(
      (l) async {
        _log.logE('ProjectList generateProjectCode failed: $l');
        emit(
          state.copyWith(
            isGeneratingCode: false,
            status: BaseStateStatus.failed,
            message: l.getErrorMessage,
          ),
        );
      },
      (r) async {
        _log.logI('ProjectList generateProjectCode success: $r');

        /// Nếu người dùng đã đổi khách hàng/kiểu dự án trong lúc chờ API thì
        /// mã vừa sinh không còn đúng - bỏ qua để không ghi đè giá trị mới.
        if (session != _codeRequestId.activeSession) return;

        emit(
          state.copyWith(
            isGeneratingCode: false,
            status: BaseStateStatus.success,
            generatedProjectCode: r,
          ),
        );
      },
    );
  }

  /// Xoá mã dự án đã sinh.
  ///
  /// Đánh dấu các request đang chạy là không còn hợp lệ để mã sinh ra sau
  /// đó không ghi đè giá trị đã xoá.
  Future<void> _onClearGeneratedCode(Emitter<ProjectListState> emit) async {
    _codeRequestId.invalidate();

    /// Dùng `copyWith.generatedProjectCode(null)` vì `copyWith` dạng
    /// thường của `copy_with_extension` bỏ qua giá trị `null`.
    emit(
      state.copyWith
          .generatedProjectCode(null)
          .copyWith(isGeneratingCode: false),
    );
  }

  /// Tải song song dữ liệu lookup cho bộ lọc. Từng API được bọc riêng để một
  /// API lỗi không làm mất các API còn lại.
  ///
  /// Mỗi API được emit riêng ngay khi nó trả về, không chờ tất cả 10 API.
  /// Nếu chờ tất cả thì một API chậm sẽ khiến form tạo dự án trống hoàn toàn
  /// và người dùng không chọn được khách hàng / kiểu dự án.
  Future<void> _loadLookups(Emitter<ProjectListState> emit) async {
    await Future.wait<void>([
      _loadOne(
        emit,
        _repo.getCustomers,
        'customers',
        (s, list) => s.copyWith(customers: list.cast<CustomerItem>()),
      ),
      _loadOne(
        emit,
        _repo.getProjectTypes,
        'projectTypes',
        (s, list) => s.copyWith(projectTypes: list.cast<ProjectTypeItem>()),
      ),
      _loadOne(
        emit,
        _repo.getProjectStatuses,
        'statuses',
        (s, list) => s.copyWith(statuses: list.cast<ProjectStatusItem>()),
      ),
      _loadOne(
        emit,
        _repo.getUsers,
        'users',
        (s, list) => s.copyWith(users: list.cast<UserItem>()),
      ),
      _loadOne(
        emit,
        _repo.getPms,
        'pms',
        (s, list) => s.copyWith(pms: list.cast<PmItem>()),
      ),
      _loadOne(
        emit,
        _repo.getBusinessFields,
        'businessFields',
        (s, list) => s.copyWith(businessFields: list.cast<BusinessFieldItem>()),
      ),
      _loadOne(
        emit,
        _repo.getFirmBases,
        'firms',
        (s, list) => s.copyWith(firms: list.cast<FirmBase>()),
      ),
      _loadOne(
        emit,
        _repo.getCustomerIndustries,
        'industries',
        (s, list) => s.copyWith(industries: list.cast<CustomerIndustry>()),
      ),
      _loadOne(
        emit,
        _repo.getProjectTypeBases,
        'projectTypeBases',
        (s, list) =>
            s.copyWith(projectTypeBases: list.cast<ProjectTypeBase>()),
      ),
      _loadOne(
        emit,
        _repo.getPriorityTypes,
        'priorityTypes',
        (s, list) =>
            s.copyWith(priorityTypes: list.cast<ProjectPriorityType>()),
      ),
    ]);
  }

  /// Gọi 1 API lookup và emit kết quả ngay khi API đó trả về.
  ///
  /// [buildState] nhận state hiện tại cùng kết quả API để tạo state mới,
  /// giữ nguyên các lookup đã tải xong trước đó.
  Future<void> _loadOne<T>(
    Emitter<ProjectListState> emit,
    Future<Either<BaseError, List<T>>> Function() fetch,
    String name,
    ProjectListState Function(ProjectListState state, List<T> list) buildState,
  ) async {
    try {
      final res = await fetch();
      await res.fold(
        (l) async {
          _log.logE('ProjectList lookup $name failed: $l');
        },
        (r) async {
          _log.logI('ProjectList lookup $name: ${r.length} items');
          emit(buildState(state, r));
        },
      );
    } catch (e) {
      _log.logE('ProjectList lookup $name threw: $e');
    }
  }

  /// Gọi API danh sách dự án theo bộ tham số hiện tại.
  Future<void> _fetchProjects(
    Emitter<ProjectListState> emit,
    String tag,
  ) async {
    final params = _buildParams();

    final res = await _repo.getProjects(params: params);

    await res.fold(
      (l) async {
        _log.logE('ProjectListBloc $tag failed: $l');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: l.getErrorMessage,
          ),
        );
      },
      (r) async {
        _log.logI('ProjectListBloc $tag success: ${r.length} projects');
        emit(state.copyWith(status: BaseStateStatus.success, projects: r));
      },
    );
  }
}

/// Theo dõi tính hợp lệ của request sinh mã dự án.
///
/// Mỗi lần bắt đầu sinh mã, [_start] tạo ra một "phiên" mới. Khi người
/// dùng đổi khách hàng / kiểu dự án, [_invalidate] vô hiệu hoá phiên hiện
/// tại để kết quả của request đang chạy bị bỏ qua khi về tới.
class _CodeRequestTracker {
  int _session = 0;
  int _activeSession = 0;

  /// Bắt đầu phiên sinh mã mới và trả về token của phiên đó.
  int start() {
    _activeSession = ++_session;
    return _activeSession;
  }

  /// Vô hiệu hoá phiên hiện tại.
  void invalidate() {
    _activeSession = 0;
  }

  /// Token của phiên đang chạy - dùng để so sánh với token của request.
  int get activeSession => _activeSession;
}
