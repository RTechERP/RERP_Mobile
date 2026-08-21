import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../../base/bloc/index.dart';
import '../../../../../common/logger/index.dart';
import '../../data/repository/business_card_repo.dart';

part 'business_card_event.dart';
part 'business_card_state.dart';
part 'business_card_bloc.g.dart';
part 'business_card_bloc.freezed.dart';

@injectable
class BusinessCardBloc extends BaseBloc<BusinessCardEvent, BusinessCardState> {
  final LogUtils _log;
  final BusinessCardRepo _repo;

  BusinessCardBloc(this._log,this._repo) : super(BusinessCardState.init()) {
    on<BusinessCardEvent>((event, emit) async {
      await event.when(init: () => _onInit(emit));
    });
  }

  Future<void> _onInit(Emitter<BusinessCardState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    try {
      await _repo.getBusinessCards();
      emit(state.copyWith(status: BaseStateStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: e.toString(),
      ));
    }
  }
}
