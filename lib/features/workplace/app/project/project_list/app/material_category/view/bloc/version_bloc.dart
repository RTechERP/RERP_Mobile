import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/bloc/index.dart';

import '../models/version_item.dart';

part 'version_event.dart';
part 'version_state.dart';
part 'version_bloc.g.dart';
part 'version_bloc.freezed.dart';

@injectable
class VersionBloc extends BaseBloc<VersionEvent, VersionState> {
  VersionBloc() : super(VersionState.init()) {
    on<VersionEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        refresh: () => _onRefresh(emit),
      );
    });
  }

  Future<void> _onInit(Emitter<VersionState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    await Future.delayed(const Duration(milliseconds: 350));

    final mockData = [
      VersionItem(
        id: 1,
        code: 'V-001',
        description: 'Phiên bản đầu tiên - MVP',
        usage: VersionUsageStatus.archived,
        tbpApprover: 'Nguyễn Văn A',
        approval: VersionApprovalStatus.approved,
        incident: VersionHasIncident.none,
        type: VersionType.solutionVersion,
      ),
      VersionItem(
        id: 3,
        code: 'V-003',
        description: 'Phiên bản Production - phát hành chính thức',
        usage: VersionUsageStatus.inUse,
        tbpApprover: 'Lê Văn C',
        approval: VersionApprovalStatus.pending,
        incident: VersionHasIncident.has,
        incidentContent: 'Cần thêm tài liệu hướng dẫn',
        type: VersionType.poVersion,
      ),
    ];

    emit(state.copyWith(
      status: BaseStateStatus.success,
      versions: mockData,
    ));
  }

  Future<void> _onRefresh(Emitter<VersionState> emit) async {
    await _onInit(emit);
  }
}
