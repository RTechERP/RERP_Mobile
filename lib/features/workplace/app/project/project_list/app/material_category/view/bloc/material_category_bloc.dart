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
        init: (projectId, projectPartListVersionId, projectTypeId, keyword) =>
            _onInit(emit, projectId, projectPartListVersionId, projectTypeId, keyword),
        refresh: () => _onRefresh(emit),
        search: (keyword) => _onSearch(emit, keyword: keyword),
        changeKeyword: (keyword) => _onChangeKeyword(emit, keyword: keyword),
        cancelApproveNew: (item) => _onCancelApproveNew(emit, item),
        approveFix: (item, isFix) => _onApproveFix(emit, item, isFix),
        refreshAfterApprove: (message) => _onRefreshAfterApprove(emit, message),
      );
    });
  }

  Future<void> _onInit(
    Emitter<MaterialCategoryState> emit,
    int projectId,
    int projectPartListVersionId,
    int projectTypeId,
    String? keyword,
  ) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      projectId: projectId,
      projectPartListVersionId: projectPartListVersionId,
      projectTypeId: projectTypeId,
      searchKeyword: keyword ?? '',
      // Dispose data cũ để hiển thị loading indicator khi user chọn
      // version khác ở tab Phiên bản.
      categories: [],
    ));

    try {
      final result = await _repo.getPartList(
        projectId: projectId,
        projectPartListVersionId: projectPartListVersionId,
        projectTypeId: projectTypeId,
        keyword: keyword ?? '',
      );
      result.fold(
        (error) => emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: error.getErrorMessage,
        )),
        (data) {
          emit(state.copyWith(
            status: BaseStateStatus.success,
            categories: data,
          ));
        },
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
        keyword: state.searchKeyword, projectTypeId: state.projectTypeId!,
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
        keyword: state.searchKeyword, projectTypeId: state.projectTypeId!,
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

  /// Huỷ duyệt mới (TBP) cho 1 vật tư. Emit success ngay khi API huỷ duyệt
  /// trả 200 để UI hiện snackbar phản hồi tức thì; đồng thời fire-and-forget
  /// refresh list để cập nhật cờ IsNewCode / IsApprovedTBP mới nhất.
  Future<void> _onCancelApproveNew(
    Emitter<MaterialCategoryState> emit,
    PartListModel item,
  ) async {
    if (state.projectId == null || state.projectPartListVersionId == null) {
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: 'Thiếu thông tin dự án để huỷ duyệt',
      ));
      return;
    }

    emit(state.copyWith(status: BaseStateStatus.loading));

    try {
      final result = await _repo.cancelApproveNew(item);
      await result.fold(
        (error) async => emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: error.getErrorMessage,
        )),
        (_) async {
          emit(state.copyWith(
            status: BaseStateStatus.success,
            message: 'Đã huỷ duyệt mới',
          ));
          // Refresh ngầm để đồng bộ cờ mới nhất; lỗi refresh không ảnh hưởng
          // snackbar vừa hiện. Dùng add() thay vì emit ngoài handler.
          add(const MaterialCategoryEvent.refreshAfterApprove(
            message: 'Đã huỷ duyệt mới',
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: e.toString(),
      ));
    }
  }

  /// Duyệt / huỷ duyệt tích xanh cho 1 vật tư. Emit success ngay khi API trả
  /// 200 để UI hiện snackbar phản hồi tức thì; đồng thời fire-and-forget
  /// refresh list để cập nhật cờ IsFix mới nhất.
  Future<void> _onApproveFix(
    Emitter<MaterialCategoryState> emit,
    PartListModel item,
    bool isFix,
  ) async {
    if (state.projectId == null || state.projectPartListVersionId == null) {
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: 'Thiếu thông tin dự án để duyệt tích xanh',
      ));
      return;
    }

    emit(state.copyWith(status: BaseStateStatus.loading));

    final successMessage =
        isFix ? 'Đã duyệt tích xanh' : 'Đã huỷ duyệt tích xanh';

    try {
      final result = await _repo.approveFix(item, isFix: isFix);
      await result.fold(
        (error) async => emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: error.getErrorMessage,
        )),
        (_) async {
          emit(state.copyWith(
            status: BaseStateStatus.success,
            message: successMessage,
          ));
          add(MaterialCategoryEvent.refreshAfterApprove(message: successMessage));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: e.toString(),
      ));
    }
  }

  /// Refresh list sau khi duyệt/huỷ duyệt — chạy ngầm, không emit loading.
  /// Lỗi network chỉ bỏ qua; thành công thì cập nhật categories + message.
  Future<void> _onRefreshAfterApprove(
    Emitter<MaterialCategoryState> emit,
    String message,
  ) async {
    if (state.projectId == null || state.projectPartListVersionId == null) {
      return;
    }
    final result = await _repo.getPartList(
      projectId: state.projectId!,
      projectPartListVersionId: state.projectPartListVersionId!,
      projectTypeId: state.projectTypeId ?? 0,
      keyword: state.searchKeyword,
    );
    result.fold(
      (_) {},
      (data) => emit(state.copyWith(
        status: BaseStateStatus.success,
        categories: data,
        message: message,
      )),
    );
  }
}