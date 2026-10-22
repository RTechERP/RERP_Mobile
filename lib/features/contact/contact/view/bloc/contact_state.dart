part of 'contact_bloc.dart';

@CopyWith()
class ContactState extends BaseBlocState {
  final List<ContactPersonalItem> contacts;
  final ContactPersonalItem? selectedContact;
  final int departmentID;
  final String? keyword;
  final List<BusinessCardModel> businessCards;

  const ContactState({
    required super.status,
    super.message,
    this.contacts = const [],
    this.selectedContact,
    this.departmentID = 0,
    this.keyword,
    this.businessCards = const [],
  });

  factory ContactState.init() =>
      const ContactState(status: BaseStateStatus.init);
}
