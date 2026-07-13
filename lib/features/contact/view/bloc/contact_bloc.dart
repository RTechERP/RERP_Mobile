import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/features/contact/data/datasource/models/contact_model.dart';

import '../../../../../base/bloc/index.dart';
import '../../data/repository/contact_repo.dart';

part 'contact_event.dart';
part 'contact_state.dart';
part 'contact_bloc.g.dart';
part 'contact_bloc.freezed.dart';

@injectable
class ContactBloc extends BaseBloc<ContactEvent, ContactState> {
  final ContactRepo _repo;

  ContactBloc(this._repo) : super(ContactState.init()) {
    on<ContactEvent>((event, emit) async {
      await event.when(
        init: (departmentID, keyword) =>
            _onLoad(emit, departmentID: departmentID, keyword: keyword),
        refresh: (departmentID, keyword) =>
            _onLoad(emit, departmentID: departmentID, keyword: keyword),
      );
    });
  }

  Future<void> _onLoad(
    Emitter<ContactState> emit, {
    required int departmentID,
    String? keyword,
  }) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      departmentID: departmentID,
      keyword: keyword,
    ));

    final result = await _repo.getContact(departmentID: departmentID, keyword: keyword);

    result.fold(
      (error) {
        final msg = error.when(
          httpInternalServerError: (body) => body,
          httpUnAuthorizedError: () => 'Unauthorized',
          httpUnknownError: (m) => m,
        );
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: msg,
        ));
      },
      (contacts) {
        emit(state.copyWith(
          status: BaseStateStatus.success,
          contacts: contacts,
        ));
      },
    );
  }
}
