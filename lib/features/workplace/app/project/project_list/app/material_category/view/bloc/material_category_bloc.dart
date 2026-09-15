import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/bloc/index.dart';

import '../../data/datasource/model/material_category_model.dart';

part 'material_category_event.dart';
part 'material_category_state.dart';
part 'material_category_bloc.g.dart';
part 'material_category_bloc.freezed.dart';

@injectable
class MaterialCategoryBloc
    extends BaseBloc<MaterialCategoryEvent, MaterialCategoryState> {
  MaterialCategoryBloc() : super(MaterialCategoryState.init()) {
    on<MaterialCategoryEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        refresh: () => _onRefresh(emit),
        search: (keyword) => _onSearch(emit, keyword: keyword),
        changeKeyword: (keyword) => _onChangeKeyword(emit, keyword: keyword),
      );
    });
  }

  /// TODO: Bỏ mock khi API vật tư hoàn thiện.
  /// Mock 2 nhánh đủ 3 cấp, test flow expand/collapse nhiều root:
  ///   1         (root A)
  ///   1.1       (con A.1)
  ///   1.1.1     (cháu A.1.1)
  ///   1.1.2     (cháu A.1.2)
  ///   1.2       (con A.2, là lá)
  ///   2         (root B)
  ///   2.1       (con B.1)
  ///   2.1.1     (cháu B.1.1)
  /// Cha & con cháu đều có value riêng (parent_has_value).
  List<MaterialCategoryItem> _mockData() {
    return [
      // === Root A: id = 1 - Tủ điện tổng ===
      const MaterialCategoryItem(
        id: 1,
        code: 'VT-ELE-001',
        name: 'Tủ điện tổng',
        deviceCode: 'MS-ELE-01',
        qtyPerMachine: 1,
        totalQty: 2,
      ),
      // Con: 1.1
      const MaterialCategoryItem(
        id: 11,
        parentId: 1,
        code: 'VT-ELE-001-DR',
        name: 'Thanh DIN 35mm',
        deviceCode: 'MS-ELE-01',
        qtyPerMachine: 2,
        totalQty: 4,
      ),
      // Cháu: 1.1.1 (thuộc con 11)
      const MaterialCategoryItem(
        id: 111,
        parentId: 11,
        code: 'VT-ELE-001-DR-A',
        name: 'DIN 35mm - loại 1m',
        deviceCode: 'MS-ELE-01',
        qtyPerMachine: 1,
        totalQty: 2,
      ),
    ];
  }

  Future<void> _onInit(Emitter<MaterialCategoryState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    // TODO: Bật lại khi API sẵn sàng.
    // final res = await _repo.getMaterialCategories(keyword: state.searchKeyword);
    // await res.fold(...);

    await Future.delayed(const Duration(milliseconds: 300));
    final all = _mockData();
    final filtered = _filter(all, state.searchKeyword);
    emit(state.copyWith(
      status: BaseStateStatus.success,
      categories: filtered,
    ));
  }

  Future<void> _onRefresh(Emitter<MaterialCategoryState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    await Future.delayed(const Duration(milliseconds: 300));
    final all = _mockData();
    final filtered = _filter(all, state.searchKeyword);
    emit(state.copyWith(
      status: BaseStateStatus.success,
      categories: filtered,
    ));
  }

  Future<void> _onSearch(
    Emitter<MaterialCategoryState> emit, {
    String? keyword,
  }) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      searchKeyword: keyword ?? state.searchKeyword,
    ));
    await Future.delayed(const Duration(milliseconds: 200));
    final all = _mockData();
    final filtered = _filter(all, state.searchKeyword);
    emit(state.copyWith(
      status: BaseStateStatus.success,
      categories: filtered,
    ));
  }

  /// Lọc theo keyword: nếu node khớp thì giữ cả cha gốc để hiển thị context.
  List<MaterialCategoryItem> _filter(
    List<MaterialCategoryItem> all,
    String keyword,
  ) {
    if (keyword.isEmpty) return all;
    final k = keyword.toLowerCase();
    final matchIds = <int>{};
    for (final n in all) {
      final nameMatch = n.name.toLowerCase().contains(k);
      final codeMatch = n.code.toLowerCase().contains(k);
      if (nameMatch || codeMatch) {
        matchIds.add(n.id);
        // Kéo cha
        var p = n.parentId;
        while (p != null) {
          matchIds.add(p);
          final parent = all.firstWhere(
            (e) => e.id == p,
            orElse: () => const MaterialCategoryItem(id: 0, code: '', name: ''),
          );
          if (parent.id == 0) break;
          p = parent.parentId;
        }
      }
    }
    return all.where((n) => matchIds.contains(n.id)).toList();
  }

  Future<void> _onChangeKeyword(
    Emitter<MaterialCategoryState> emit, {
    required String keyword,
  }) async {
    emit(state.copyWith(searchKeyword: keyword));
  }
}

