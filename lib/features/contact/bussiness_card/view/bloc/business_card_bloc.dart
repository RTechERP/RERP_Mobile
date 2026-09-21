import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../../base/bloc/index.dart';
import '../../../../../base/network/errors/extension.dart';
import '../../../../../common/logger/index.dart';
import '../../data/datasource/models/business_card_model.dart';
import '../../data/repository/business_card_repo.dart';

part 'business_card_event.dart';
part 'business_card_state.dart';
part 'business_card_bloc.g.dart';
part 'business_card_bloc.freezed.dart';

@injectable
class BusinessCardBloc extends BaseBloc<BusinessCardEvent, BusinessCardState> {
  final LogUtils _log;
  final BusinessCardRepo _repo;

  BusinessCardBloc(this._log, this._repo) : super(BusinessCardState.init()) {
    on<BusinessCardEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        scanCard: (path) => _onScanCard(path, emit),
      );
    });
  }

  Future<void> _onInit(Emitter<BusinessCardState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final result = await _repo.getBusinessCards();
    result.fold(
      (error) {
        _log.logE('BusinessCard: load list failed: $error');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: error.getErrorMessage,
        ));
      },
      (cards) {
        emit(state.copyWith(
          status: BaseStateStatus.success,
          cards: cards,
        ));
      },
    );
  }

  Future<void> _onScanCard(String path, Emitter<BusinessCardState> emit) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      message: null,
    ));

    final result = await _repo.scanBusinessCard(path);
    result.fold(
      (error) {
        _log.logE('BusinessCard: scan failed: $error');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: error.getErrorMessage,
        ));
      },
      (scannedData) {
        emit(state.copyWith(
          status: BaseStateStatus.success,
          scannedData: scannedData,
        ));
      },
    );
  }
}
