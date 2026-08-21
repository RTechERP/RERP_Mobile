import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';


import '../../../../../base/bloc/index.dart';
import '../../../../../features/contact/bussiness_card/data/datasource/models/business_card_model.dart';
import '../../../../../features/contact/bussiness_card/data/repository/business_card_repo.dart';
import '../../data/datasource/models/contact_model.dart';
import '../../data/repository/contact_repo.dart';

part 'contact_event.dart';
part 'contact_state.dart';
part 'contact_bloc.g.dart';
part 'contact_bloc.freezed.dart';

@injectable
class ContactBloc extends BaseBloc<ContactEvent, ContactState> {
  final ContactRepo _repo;
  final BusinessCardRepo _businessCardRepo;

  ContactBloc(this._repo, this._businessCardRepo) : super(ContactState.init()) {
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

    List<BusinessCardModel> businessCards = [];
    try {
      businessCards = await _businessCardRepo.getBusinessCards();
    } catch (_) {}

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
          businessCards: businessCards,
        ));
      },
    );
  }
}
