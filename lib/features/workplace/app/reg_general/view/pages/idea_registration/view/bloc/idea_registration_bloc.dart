import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../../../../../reports/data/datasource/models/report_model.dart';
import '../../data/datasource/models/idea_registration_model.dart';
import '../../data/repository/idea_registration_repo.dart';

part 'idea_registration_event.dart';
part 'idea_registration_state.dart';
part 'idea_registration_bloc.freezed.dart';
part 'idea_registration_bloc.g.dart';

@injectable
class IdeaRegistrationBloc
    extends BaseBloc<IdeaRegistrationEvent, IdeaRegistrationState> {
  final IdeaRegistrationRepo _repo;
  final AuthRepo _authRepo;
  final LogUtils _log;

  bool _isSubmitting = false;

  IdeaRegistrationBloc(this._repo, this._authRepo, this._log)
    : super(IdeaRegistrationState.init()) {
    on<IdeaRegistrationEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        refresh: () => _onRefresh(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart, dateEnd),
        initAdd: () => _onInitAdd(emit),
        changeDateStart: (date) => _onChangeDateStart(emit, date),
        changeDateEnd: (date) => _onChangeDateEnd(emit, date),
        changeDepartment: (id, name) =>
            _onChangeDepartment(emit, id: id, name: name),
        changeCatalog: (id, name) => _onChangeCatalog(emit, id: id, name: name),
        updateDetail: (index, description, note) => _onUpdateDetail(
          emit,
          index: index,
          description: description,
          note: note,
        ),
        submit: (dateStart, dateEnd, departmentId, catalogId, details) =>
            _onSubmit(
              emit,
              dateStart: dateStart,
              dateEnd: dateEnd,
              departmentId: departmentId,
              catalogId: catalogId,
              details: details,
            ),
        clearSubmitState: () => _onClearSubmitState(emit),
      );
    });
  }

  //---(Init)---//

  Future<void> _onInit(Emitter<IdeaRegistrationState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('Get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        if (user == null) {
          emit(state.copyWith(status: BaseStateStatus.failed));
          return;
        }

        final now = DateTime.now();
        final startOfMonth = DateTime(now.year, now.month, 1);
        final endOfMonth = DateTime(now.year, now.month + 1, 0, 23, 59, 59);

        emit(
          state.copyWith(
            employeeId: user.employeeId,
            departmentId: user.departmentId,
            dateStart: startOfMonth,
            dateEnd: endOfMonth,
          ),
        );

        await Future.wait([
          _fetchItems(
            emit,
            employeeId: user.employeeId,
            dateStart: startOfMonth,
            dateEnd: endOfMonth,
            departmentId: user.departmentId,
          ),
        ]);
      },
    );
  }

  //---(Refresh)---//

  Future<void> _onRefresh(Emitter<IdeaRegistrationState> emit) async {
    if (state.employeeId == null) {
      await _onInit(emit);
      return;
    }

    await _fetchItems(
      emit,
      employeeId: state.employeeId,
      dateStart: state.dateStart,
      dateEnd: state.dateEnd,
      departmentId: state.departmentId,
    );
  }

  //---(ChangeDateRange)---//

  Future<void> _onChangeDateRange(
    Emitter<IdeaRegistrationState> emit,
    DateTime dateStart,
    DateTime dateEnd,
  ) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        dateStart: dateStart,
        dateEnd: dateEnd,
      ),
    );

    await _fetchItems(
      emit,
      employeeId: state.employeeId,
      dateStart: dateStart,
      dateEnd: dateEnd,
      departmentId: state.departmentId,
    );
  }

  //---(Fetch)---//

  Future<void> _fetchItems(
    Emitter<IdeaRegistrationState> emit, {
    required int? employeeId,
    required DateTime? dateStart,
    required DateTime? dateEnd,
    required int? departmentId,
    int? headOfDepartment,
  }) async {
    final query = <String, dynamic>{
      'employeeId': headOfDepartment ?? 0, // Chỉnh lại sau khi sửa API
      'dateStart': dateStart?.toIso8601String() ?? '',
      'dateEnd': dateEnd?.toIso8601String() ?? '',
      'keyword': '',
      'authorId': employeeId ?? 0,
      'departmentId': departmentId ?? 0,
      'registerTypeId': 0,
    };

    _log.logI('Idea payload: $query');

    final res = await _repo.getIdeas(query: query);

    await res.fold(
      (err) async {
        _log.logE('Get ideas failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (items) async {
        _log.logI('Get ideas success: ${items.length} items');
        emit(state.copyWith(status: BaseStateStatus.success, items: items));
      },
    );
  }

  Future<void> _fetchDepartments(Emitter<IdeaRegistrationState> emit) async {
    final res = await _repo.getDepart();

    await res.fold(
      (err) async {
        _log.logE('Get departments failed: $err');
      },
      (departments) async {
        _log.logI('Get departments success: ${departments.length} items');
        emit(state.copyWith(departments: departments));
      },
    );
  }

  Future<void> _fetchCatalogs(Emitter<IdeaRegistrationState> emit) async {
    final res = await _repo.getCourseCatalog();

    await res.fold(
      (err) async {
        _log.logE('Get catalogs failed: $err');
      },
      (catalogs) async {
        _log.logI('Get catalogs success: ${catalogs.length} items');
        emit(state.copyWith(catalogs: catalogs));
      },
    );
  }

  //---(InitAdd)---//

  /// Khoi tao gia tri mac dinh cho man add.
  Future<void> _onInitAdd(Emitter<IdeaRegistrationState> emit) async {
    emit(
      state.copyWith(
        isSubmitting: false,
        submitSuccess: false,
        message: null,
        departmentId: null,
        departmentName: null,
        catalogId: null,
        catalogName: null,
        dateStart: DateTime.now(),
        dateEnd: DateTime.now().add(const Duration(days: 30)),
        details: List.generate(
          5,
          (_) => const IdeaDetailRow(description: '', note: null),
        ),
      ),
    );

    final userRes = await _authRepo.getCurrentUser();
    await userRes.fold(
      (err) async => _log.logE('Get user in initAdd failed: $err'),
      (user) async {
        if (user != null) {
          final hod = int.tryParse(user.headofDepartment) ?? 0;
          emit(
            state.copyWith(
              employeeId: user.employeeId,
              departmentId: user.departmentId,
              headOfDepartment: hod > 0 ? hod : null,
            ),
          );
        }
      },
    );

    if (state.departments.isEmpty) {
      await _fetchDepartments(emit);
    }
    if (state.catalogs.isEmpty) {
      await _fetchCatalogs(emit);
    }
  }

  //---(DateChange)---//

  Future<void> _onChangeDateStart(
    Emitter<IdeaRegistrationState> emit,
    DateTime? date,
  ) async {
    emit(state.copyWith(dateStart: date));
  }

  Future<void> _onChangeDateEnd(
    Emitter<IdeaRegistrationState> emit,
    DateTime? date,
  ) async {
    emit(state.copyWith(dateEnd: date));
  }

  //---(Department)---//

  Future<void> _onChangeDepartment(
    Emitter<IdeaRegistrationState> emit, {
    required int? id,
    String? name,
  }) async {
    emit(state.copyWith(departmentId: id, departmentName: name));
  }

  //---(Catalog)---//

  Future<void> _onChangeCatalog(
    Emitter<IdeaRegistrationState> emit, {
    required int? id,
    String? name,
  }) async {
    emit(state.copyWith(catalogId: id, catalogName: name));
  }

  //---(Detail)---//

  Future<void> _onUpdateDetail(
    Emitter<IdeaRegistrationState> emit, {
    required int index,
    required String description,
    String? note,
  }) async {
    final updated = List<IdeaDetailRow>.from(state.details);
    if (index >= 0 && index < updated.length) {
      updated[index] = updated[index].copyWith(
        description: description,
        note: note,
      );
    }
    emit(state.copyWith(details: updated));
  }

  //---(Submit)---//

  Future<void> _onSubmit(
    Emitter<IdeaRegistrationState> emit, {
    required DateTime? dateStart,
    required DateTime? dateEnd,
    required int? departmentId,
    required int? catalogId,
    required List<IdeaDetailRow> details,
  }) async {
    if (_isSubmitting) return;
    _isSubmitting = true;

    try {
      emit(
        state.copyWith(isSubmitting: true, submitSuccess: false, message: null),
      );

      final payload = _buildSavePayload(
        dateStart: dateStart,
        dateEnd: dateEnd,
        departmentId: departmentId,
        catalogId: catalogId,
        details: details,
      );

      _log.logI('Idea save payload: $payload');

      final res = await _repo.saveIdea(payload: payload);

      await res.fold(
        (err) async {
          _log.logE('Save idea failed: $err');
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
          _log.logI('Save idea success');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              message: 'Tao de cu thanh cong',
            ),
          );
        },
      );
    } catch (e) {
      _log.logE('Submit exception: $e');
      emit(
        state.copyWith(
          isSubmitting: false,
          status: BaseStateStatus.failed,
          message: 'Co loi xay ra',
        ),
      );
    } finally {
      _isSubmitting = false;
    }
  }

  //---(ClearSubmit)---//

  Future<void> _onClearSubmitState(Emitter<IdeaRegistrationState> emit) async {
    emit(
      state.copyWith(isSubmitting: false, submitSuccess: false, message: null),
    );
  }

  //---(Helper)---//

  Map<String, dynamic> _buildSavePayload({
    required DateTime? dateStart,
    required DateTime? dateEnd,
    required int? departmentId,
    required int? catalogId,
    required List<IdeaDetailRow> details,
  }) {
    final payloadDetails = <Map<String, dynamic>>[];
    final now = DateTime.now();

    for (var i = 0; i < details.length; i++) {
      final detail = details[i];
      payloadDetails.add({
        'STT': i + 1,
        'Category': ideaDetailCategories[i],
        'Description': detail.description,
        'Note': detail.note ?? '',
        'DateStart': (dateStart ?? now).toIso8601String(),
        'DateEnd': (dateEnd ?? now).toIso8601String(),
      });
    }

    return {
      'ID': 0,
      'EmployeeID': state.employeeId ?? 0,
      'HeadofDepartment': state.headOfDepartment ?? 0,
      'DepartmentOrganizationID': departmentId ?? 0,
      'RegisterIdeaTypeID': catalogId ?? 0,
      'RegisterIdeaDetails': payloadDetails,
      'deletedFileIds': null,
    };
  }
}
