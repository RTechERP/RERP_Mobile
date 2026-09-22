import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';

import '../../data/datasource/model/part_list_model.dart';
import '../../data/repository/material_category_repo.dart';

part 'material_category_event.dart';
part 'material_category_state.dart';
part 'material_category_bloc.g.dart';
part 'material_category_bloc.freezed.dart';

@injectable
class MaterialCategoryBloc
    extends BaseBloc<MaterialCategoryEvent, MaterialCategoryState> {
  final MaterialCategoryRepo _repo;

  MaterialCategoryBloc(this._repo) : super(MaterialCategoryState.init()) {
    on<MaterialCategoryEvent>((event, emit) async {
      await event.when(
        init: (projectId, projectPartListVersionId, keyword) =>
            _onInit(emit, projectId, projectPartListVersionId, keyword),
        refresh: () => _onRefresh(emit),
        search: (keyword) => _onSearch(emit, keyword: keyword),
        changeKeyword: (keyword) => _onChangeKeyword(emit, keyword: keyword),
      );
    });
  }

  Future<void> _onInit(
    Emitter<MaterialCategoryState> emit,
    int projectId,
    int projectPartListVersionId,
    String? keyword,
  ) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      projectId: projectId,
      projectPartListVersionId: projectPartListVersionId,
      searchKeyword: keyword ?? '',
    ));

    try {
      final result = await _repo.getPartList(
        projectId: projectId,
        projectPartListVersionId: projectPartListVersionId,
        keyword: keyword ?? '',
      );
      result.fold(
        (error) => emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: error.getErrorMessage,
        )),
        (data) => emit(state.copyWith(
          status: BaseStateStatus.success,
          categories: data,
        )),
      );
    } catch (e) {
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: e.toString(),
      ));
    }
  }

  Future<void> _onRefresh(Emitter<MaterialCategoryState> emit) async {
    if (state.projectId == null || state.projectPartListVersionId == null) return;
    emit(state.copyWith(status: BaseStateStatus.loading));

    try {
      final result = await _repo.getPartList(
        projectId: state.projectId!,
        projectPartListVersionId: state.projectPartListVersionId!,
        keyword: state.searchKeyword,
      );
      result.fold(
        (error) => emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: error.getErrorMessage,
        )),
        (data) => emit(state.copyWith(
          status: BaseStateStatus.success,
          categories: data,
        )),
      );
    } catch (e) {
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: e.toString(),
      ));
    }
  }

  Future<void> _onSearch(
    Emitter<MaterialCategoryState> emit, {
    String? keyword,
  }) async {
    if (state.projectId == null || state.projectPartListVersionId == null) return;
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      searchKeyword: keyword ?? state.searchKeyword,
    ));

    try {
      final result = await _repo.getPartList(
        projectId: state.projectId!,
        projectPartListVersionId: state.projectPartListVersionId!,
        keyword: state.searchKeyword,
      );
      result.fold(
        (error) => emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: error.getErrorMessage,
        )),
        (data) => emit(state.copyWith(
          status: BaseStateStatus.success,
          categories: data,
        )),
      );
    } catch (e) {
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: e.toString(),
      ));
    }
  }

  Future<void> _onChangeKeyword(
    Emitter<MaterialCategoryState> emit, {
    required String keyword,
  }) async {
    emit(state.copyWith(searchKeyword: keyword));
  }
}
