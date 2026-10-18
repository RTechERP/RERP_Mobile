import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:injectable/injectable.dart';

import '../models/business_card_model.dart';

/// Service ghi thông tin danh thiếp vào danh bạ hệ thống của thiết bị.
///
/// Tách riêng khỏi [BusinessCardService] vì nguồn dữ liệu khác nhau:
/// - [BusinessCardService] giao tiếp với backend API.
/// - Service này giao tiếp với cơ sở dữ liệu danh bạ của hệ điều hành.
///
/// Sử dụng flutter_contacts 2.1.0 — API dùng namespace
/// (FlutterContacts.permissions, FlutterContacts.create) và `Contact` là
/// immutable, phải dùng `copyWith` thay cho setter.
@lazySingleton
class ContactSaveService {
  /// Ghi một [BusinessCardModel] vào danh bạ máy.
  ///
  /// - Tự xin quyền nếu chưa cấp.
  /// - Các trường rỗng/null sẽ bị bỏ qua.
  /// - [BusinessCardModel.fullName] bắt buộc (trả về `false` nếu rỗng).
  /// - [BusinessCardModel.companyName] → `organization.name`.
  /// - [BusinessCardModel.chucVu] → `organization.jobTitle`.
  /// - [BusinessCardModel.sdtCaNhan] → `phone` (label mobile).
  /// - [BusinessCardModel.emailCongTy] / `emailCaNhan` → `email`.
  /// - [BusinessCardModel.address] → `address.formatted`.
  ///
  /// Trả về `true` nếu ghi thành công, `false` nếu user từ chối cấp quyền
  /// hoặc hệ thống trả lỗi.
  Future<bool> saveBusinessCardToDevice(BusinessCardModel card) async {
    final fullName = card.fullName?.trim() ?? '';
    if (fullName.isEmpty) return false;

    try {
      final status = await FlutterContacts.permissions
          .request(PermissionType.readWrite);
      if (status != PermissionStatus.granted) return false;

      final newContact = Contact(
        name: Name(first: fullName),
        organizations: _buildOrganizations(card),
        phones: _buildPhones(card),
        emails: _buildEmails(card),
        addresses: _buildAddresses(card),
      );

      await FlutterContacts.create(newContact);
      return true;
    } catch (_) {
      return false;
    }
  }

  List<Organization> _buildOrganizations(BusinessCardModel card) {
    final company = card.companyName?.trim() ?? '';
    final title = card.chucVu?.trim() ?? '';
    if (company.isEmpty && title.isEmpty) return const [];
    return [
      Organization(
        name: company.isEmpty ? null : company,
        jobTitle: title.isEmpty ? null : title,
      ),
    ];
  }

  List<Phone> _buildPhones(BusinessCardModel card) {
    final phone = card.sdtCaNhan?.trim() ?? '';
    if (phone.isEmpty) return const [];
    return [Phone(number: phone, label: const Label(PhoneLabel.mobile))];
  }

  List<Email> _buildEmails(BusinessCardModel card) {
    final emails = <Email>[];
    final companyEmail = card.emailCongTy?.trim() ?? '';
    if (companyEmail.isNotEmpty) {
      emails.add(Email(address: companyEmail, label: const Label(EmailLabel.work)));
    }
    final personalEmail = card.emailCaNhan?.trim() ?? '';
    if (personalEmail.isNotEmpty) {
      emails.add(Email(address: personalEmail, label: const Label(EmailLabel.home)));
    }
    return emails;
  }

  List<Address> _buildAddresses(BusinessCardModel card) {
    final address = card.address?.trim() ?? '';
    if (address.isEmpty) return const [];
    return [Address(formatted: address, label: const Label(AddressLabel.work))];
  }

  /// Đọc danh sách danh thiếp đã lưu từ danh bạ máy.
  ///
  /// - Tự xin quyền nếu chưa cấp.
  /// - Lấy toàn bộ contact (chỉ ID + display name để nhanh) rồi gọi
  ///   `get()` cho từng contact với các property cần thiết.
  /// - Trả về danh sách rỗng nếu user từ chối cấp quyền hoặc lỗi.
  /// - Map ngược `Contact` → `BusinessCardModel` dùng cùng quy ước
  ///   ngược lại với `saveBusinessCardToDevice`.
  Future<List<BusinessCardModel>> getSavedBusinessCards() async {
    try {
      final status = await FlutterContacts.permissions
          .request(PermissionType.read);
      if (status != PermissionStatus.granted) return const [];

      final contacts = await FlutterContacts.getAll(
        properties: ContactProperties.allProperties,
      );

      return contacts.map(_mapContactToCard).toList();
    } catch (_) {
      return const [];
    }
  }

  /// Map một [Contact] từ danh bạ máy về [BusinessCardModel].
  ///
  /// Bỏ qua các contact không có tên (không phải danh thiếp do app lưu).
  BusinessCardModel _mapContactToCard(Contact c) {
    final phone = c.phones.isNotEmpty ? c.phones.first.number : null;

    String? companyEmail;
    String? personalEmail;
    for (final e in c.emails) {
      if (companyEmail == null &&
          e.label.label == EmailLabel.work &&
          e.address.isNotEmpty) {
        companyEmail = e.address;
      } else if (personalEmail == null &&
          e.label.label == EmailLabel.home &&
          e.address.isNotEmpty) {
        personalEmail = e.address;
      }
    }

    final nameParts = [c.name?.first, c.name?.middle, c.name?.last]
        .where((s) => s != null && s.isNotEmpty)
        .join(' ')
        .trim();
    final fullName = (c.displayName?.isNotEmpty ?? false)
        ? c.displayName
        : (nameParts.isEmpty ? null : nameParts);

    return BusinessCardModel(
      fullName: fullName,
      chucVu: c.organizations.isNotEmpty
          ? c.organizations.first.jobTitle
          : null,
      sdtCaNhan: phone,
      emailCongTy: companyEmail,
      emailCaNhan: personalEmail,
      address: c.addresses.isNotEmpty ? c.addresses.first.formatted : null,
      companyName: c.organizations.isNotEmpty
          ? c.organizations.first.name
          : null,
    );
  }
}
