// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ContactStateCWProxy {
  ContactState status(BaseStateStatus status);

  ContactState message(String? message);

  ContactState contacts(List<ContactPersonalItem> contacts);

  ContactState selectedContact(ContactPersonalItem? selectedContact);

  ContactState departmentID(int departmentID);

  ContactState keyword(String? keyword);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ContactState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ContactState(...).copyWith(id: 12, name: "My name")
  /// ````
  ContactState call({
    BaseStateStatus? status,
    String? message,
    List<ContactPersonalItem>? contacts,
    ContactPersonalItem? selectedContact,
    int? departmentID,
    String? keyword,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfContactState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfContactState.copyWith.fieldName(...)`
class _$ContactStateCWProxyImpl implements _$ContactStateCWProxy {
  const _$ContactStateCWProxyImpl(this._value);

  final ContactState _value;

  @override
  ContactState status(BaseStateStatus status) => this(status: status);

  @override
  ContactState message(String? message) => this(message: message);

  @override
  ContactState contacts(List<ContactPersonalItem> contacts) =>
      this(contacts: contacts);

  @override
  ContactState selectedContact(ContactPersonalItem? selectedContact) =>
      this(selectedContact: selectedContact);

  @override
  ContactState departmentID(int departmentID) =>
      this(departmentID: departmentID);

  @override
  ContactState keyword(String? keyword) => this(keyword: keyword);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ContactState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ContactState(...).copyWith(id: 12, name: "My name")
  /// ````
  ContactState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? contacts = const $CopyWithPlaceholder(),
    Object? selectedContact = const $CopyWithPlaceholder(),
    Object? departmentID = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
  }) {
    return ContactState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      contacts: contacts == const $CopyWithPlaceholder() || contacts == null
          ? _value.contacts
          // ignore: cast_nullable_to_non_nullable
          : contacts as List<ContactPersonalItem>,
      selectedContact: selectedContact == const $CopyWithPlaceholder()
          ? _value.selectedContact
          // ignore: cast_nullable_to_non_nullable
          : selectedContact as ContactPersonalItem?,
      departmentID:
          departmentID == const $CopyWithPlaceholder() || departmentID == null
              ? _value.departmentID
              // ignore: cast_nullable_to_non_nullable
              : departmentID as int,
      keyword: keyword == const $CopyWithPlaceholder()
          ? _value.keyword
          // ignore: cast_nullable_to_non_nullable
          : keyword as String?,
    );
  }
}

extension $ContactStateCopyWith on ContactState {
  /// Returns a callable class that can be used as follows: `instanceOfContactState.copyWith(...)` or like so:`instanceOfContactState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ContactStateCWProxy get copyWith => _$ContactStateCWProxyImpl(this);
}
