import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../data/repository/signature_repo.dart';

part 'my_signature_event.dart';
part 'my_signature_state.dart';
part 'my_signature_bloc.g.dart';
part 'my_signature_bloc.freezed.dart';

@injectable
class MySignatureBloc extends BaseBloc<MySignatureEvent, MySignatureState> {
  final LogUtils _log;
  final SignatureRepo _signatureRepo;

  MySignatureBloc(this._signatureRepo, this._log) : super(MySignatureState.init()) {
    on<MySignatureEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        loadEmployeeSignature: () => _onLoadEmployeeSignature(emit),
      );
    });
  }

  Future<void> _onInit(Emitter<MySignatureState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    await _onLoadEmployeeSignature(emit);
  }

  Future<void> _onLoadEmployeeSignature(Emitter<MySignatureState> emit) async {
    final res = await _signatureRepo.getEmployeeSignature();

    await res.fold(
      (err) async {
        _log.logE('Get employee signature failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (signature) async {
        _log.logI('Get employee signature success');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          employeeSignature: signature,
        ));
      },
    );
  }
}
