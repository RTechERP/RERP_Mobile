import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';

part 'hr_event.dart';
part 'hr_state.dart';
part 'hr_bloc.g.dart';
part 'hr_bloc.freezed.dart';

@injectable
class HrBloc extends Bloc<HrEvent, HrState> {
  HrBloc() : super(HrState.init()) {
    on<_InitAd>(_onInitAd);
    on<_InitLxcp>(_onInitLxcp);
  }

  Future<void> _onInitAd(_InitAd event, Emitter<HrState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    // TODO: call API AD
    await Future.delayed(const Duration(milliseconds: 500));

    emit(state.copyWith(
      status: BaseStateStatus.success,
      adList: const [], // fake data tạm
    ));
  }

  Future<void> _onInitLxcp(_InitLxcp event, Emitter<HrState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    // TODO: call API LXCP
    await Future.delayed(const Duration(milliseconds: 500));

    emit(state.copyWith(
      status: BaseStateStatus.success,
      lxcpList: const [], // fake data tạm
    ));
  }
}