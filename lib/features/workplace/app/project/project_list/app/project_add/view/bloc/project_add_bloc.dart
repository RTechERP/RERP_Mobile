import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/common/logger/index.dart';

import '../../data/datasource/model/project_lookup_model.dart';
import '../../data/repository/project_add_repo.dart';

part 'project_add_event.dart';
part 'project_add_state.dart';
part 'project_add_bloc.freezed.dart';

/// Bloc cho màn tạo dự án.
///
/// Mỗi lần mở màn hình sẽ gọi đồng thời 10 API lookup để lấy dữ liệu
/// cho các bottom sheet. Khi load xong (cả thành công và lỗi) sẽ emit
/// state `success` chứa đầy đủ dữ liệu - mỗi field là optional, nếu
/// 1 API fail thì field tương ứng vẫn là mảng rỗng và message lỗi
/// được lưu riêng trong state để hiển thị snackbar nếu cần.
@injectable
class ProjectAddBloc extends BaseBloc<ProjectAddEvent, ProjectAddState> {
  final LogUtils _log;
  final ProjectAddRepo _repo;

  ProjectAddBloc(this._repo, this._log) : super(ProjectAddState.init()) {
    on<ProjectAddEvent>((event, emit) async {
      await event.when(
        loadAll: () => _onLoadAll(emit),
        refresh: (key) => _onRefresh(emit, key),
      );
    });
  }

  /// Load song song 10 API. Lỗi của 1 API không chặn các API khác -
  /// field tương ứng sẽ rỗng và message lỗi được ghi nhận.
  Future<void> _onLoadAll(Emitter<ProjectAddState> emit) async {
    emit(state.setLoading());

    final results = await Future.wait<dynamic>([
      _repo.getFirmBases(),
      _repo.getCustomers(),
      _repo.getProjectTypeBases(),
      _repo.getPms(),
      _repo.getProjectStatuses(),
      _repo.getCustomerIndustries(),
      _repo.getUserTeams(),
      _repo.getProjectModal(),
      _repo.getApplicationTypes(),
      _repo.getTechnologies(),
    ]);

    final errors = <String>[];
    String? firstError;

    /// Trích list từ `Either<BaseError, List<T>>` - nếu lỗi thì giữ giá trị cũ.
    /// Trả `List<dynamic>` để caller tự cast sang kiểu cụ thể.
    List<dynamic> extractList(int i, List<dynamic> fallback) {
      final either = results[i];
      return either.fold(
        (l) {
          // Lỗi - giữ giá trị cũ. Lưu message cho UI.
          final msg = l.toString();
          errors.add(msg);
          firstError ??= msg;
          return fallback;
        },
        (r) => r,
      );
    }

    final next = state.copyWith(
      status: BaseStateStatus.success,
      message: firstError,
      firms: (extractList(0, state.firms)).cast<FirmBase>(),
      customers: (extractList(1, state.customers)).cast<CustomerItem>(),
      projectTypes:
          (extractList(2, state.projectTypes)).cast<ProjectTypeBase>(),
      pms: (extractList(3, state.pms)).cast<PmItem>(),
      statuses: (extractList(4, state.statuses)).cast<ProjectStatusItem>(),
      industries:
          (extractList(5, state.industries)).cast<CustomerIndustry>(),
      userTeams: (extractList(6, state.userTeams)).cast<UserTeamItem>(),
      projectModal:
          (extractList(7, state.projectModal)).cast<ProjectModalItem>(),
      applications:
          (extractList(8, state.applications)).cast<ApplicationType>(),
      technologies: (extractList(9, state.technologies)).cast<Technology>(),
      errorMessages: errors,
    );

    _log.logI('ProjectAdd loadAll: ${errors.length} error(s)');
    emit(next);
  }

  /// Refresh riêng 1 danh sách theo [ProjectLookupKey].
  Future<void> _onRefresh(
    Emitter<ProjectAddState> emit,
    ProjectLookupKey key,
  ) async {
    emit(state.setLoading());

    Future<List<T>> call<T>(Future Function() fetch) async {
      final res = await fetch();
      return res.fold(
        (l) {
          final msg = l.toString();
          if (msg.isNotEmpty) _log.logE('ProjectAdd refresh failed: $msg');
          return <T>[];
        },
        (r) => r.cast<T>(),
      );
    }

    switch (key) {
      case ProjectLookupKey.firms:
        emit(state.copyWith(firms: await call(_repo.getFirmBases)));
        break;
      case ProjectLookupKey.customers:
        emit(state.copyWith(customers: await call(_repo.getCustomers)));
        break;
      case ProjectLookupKey.projectTypes:
        emit(state.copyWith(
            projectTypes: await call(_repo.getProjectTypeBases)));
        break;
      case ProjectLookupKey.pms:
        emit(state.copyWith(pms: await call(_repo.getPms)));
        break;
      case ProjectLookupKey.statuses:
        emit(state.copyWith(statuses: await call(_repo.getProjectStatuses)));
        break;
      case ProjectLookupKey.industries:
        emit(state.copyWith(
            industries: await call(_repo.getCustomerIndustries)));
        break;
      case ProjectLookupKey.userTeams:
        emit(state.copyWith(userTeams: await call(_repo.getUserTeams)));
        break;
      case ProjectLookupKey.projectModal:
        emit(state.copyWith(projectModal: await call(_repo.getProjectModal)));
        break;
      case ProjectLookupKey.applications:
        emit(state.copyWith(
            applications: await call(_repo.getApplicationTypes)));
        break;
      case ProjectLookupKey.technologies:
        emit(state.copyWith(technologies: await call(_repo.getTechnologies)));
        break;
    }
  }
}
