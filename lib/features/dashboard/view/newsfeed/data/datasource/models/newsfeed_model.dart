import 'package:freezed_annotation/freezed_annotation.dart';

import 'newsletter_category.dart';

part 'newsfeed_model.freezed.dart';
part 'newsfeed_model.g.dart';

@freezed
class NewsletterItem with _$NewsletterItem {
  const factory NewsletterItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Title') String? title,
    @JsonKey(name: 'NewsletterContent') String? newsletterContent,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'Image') String? image,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'OriginImgPath') String? originImgPath,
    @JsonKey(name: 'ServerImgPath') String? serverImgPath,
    @JsonKey(name: 'IsPublish') bool? isPublish,
    @JsonKey(name: 'NewsletterTypeCode') String? newsletterTypeCode,
    @JsonKey(name: 'NewsletterTypeName') String? newsletterTypeName,
    @JsonKey(name: 'IsPublishText') String? isPublishText,
  }) = _NewsletterItem;

  factory NewsletterItem.fromJson(Map<String, dynamic> json) =>
      _$NewsletterItemFromJson(json);
}

@freezed
class NewsletterDetailItem with _$NewsletterDetailItem {
  const factory NewsletterDetailItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Title') String? title,
    @JsonKey(name: 'NewsletterContent') String? newsletterContent,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'Image') String? image,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'OriginImgPath') String? originImgPath,
    @JsonKey(name: 'ServerImgPath') String? serverImgPath,
    @JsonKey(name: 'IsPublish') bool? isPublish,
  }) = _NewsletterDetailItem;

  factory NewsletterDetailItem.fromJson(Map<String, dynamic> json) =>
      _$NewsletterDetailItemFromJson(json);
}

@freezed
class NewsletterFileItem with _$NewsletterFileItem {
  const factory NewsletterFileItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'NewsletterID') int? newsletterId,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'OriginPath') String? originPath,
    @JsonKey(name: 'ServerPath') String? serverPath,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _NewsletterFileItem;

  factory NewsletterFileItem.fromJson(Map<String, dynamic> json) =>
      _$NewsletterFileItemFromJson(json);
}

@freezed
class CalendarItem with _$CalendarItem {
  const factory CalendarItem({
    @JsonKey(name: 'holidays') List<HolidayItem>? holidays,
    @JsonKey(name: 'scheduleWorkSaturdays')
    List<ScheduleWorkSaturdayItem>? scheduleWorkSaturdays,
    @JsonKey(name: 'companyEvents') List<CompanyEventItem>? companyEvents,
  }) = _CalendarItem;

  factory CalendarItem.fromJson(Map<String, dynamic> json) =>
      _$CalendarItemFromJson(json);
}

/// Sự kiện của công ty trong tháng.
@freezed
class CompanyEventItem with _$CompanyEventItem {
  const factory CompanyEventItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'EventDate') DateTime? eventDate,
    @JsonKey(name: 'YearValue') int? yearValue,
    @JsonKey(name: 'MonthValue') int? monthValue,
    @JsonKey(name: 'DayValue') int? dayValue,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'CompanyEventTypeID') int? companyEventTypeId,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'TypeText') String? typeText,
  }) = _CompanyEventItem;

  factory CompanyEventItem.fromJson(Map<String, dynamic> json) =>
      _$CompanyEventItemFromJson(json);
}

/// Ngày dương lịch của sự kiện.
extension CompanyEventItemDate on CompanyEventItem {
  /// Ưu tiên `EventDate`, fallback sang `YearValue/MonthValue/DayValue`.
  DateTime? get date {
    if (eventDate != null) return eventDate;
    if (yearValue == null || monthValue == null || dayValue == null) {
      return null;
    }
    return DateTime(yearValue!, monthValue!, dayValue!);
  }
}

/// Ngày thứ bảy được làm việc trong tháng.
@freezed
class ScheduleWorkSaturdayItem with _$ScheduleWorkSaturdayItem {
  const factory ScheduleWorkSaturdayItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'DateValue') DateTime? dateValue,
    @JsonKey(name: 'Status') bool? status,
    @JsonKey(name: 'WorkDay') int? workDay,
    @JsonKey(name: 'WorkMonth') int? workMonth,
    @JsonKey(name: 'WorkYear') int? workYear,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'Note') String? note,
  }) = _ScheduleWorkSaturdayItem;

  factory ScheduleWorkSaturdayItem.fromJson(Map<String, dynamic> json) =>
      _$ScheduleWorkSaturdayItemFromJson(json);
}

/// Ngày dương lịch của thứ bảy làm việc.
extension ScheduleWorkSaturdayItemDate on ScheduleWorkSaturdayItem {
  /// Ưu tiên `DateValue`, fallback sang các trường `WorkDay/WorkMonth/WorkYear`
  /// để không bỏ sót khi API không trả về `DateValue`.
  DateTime? get date {
    if (dateValue != null) return dateValue;
    if (workDay == null || workMonth == null || workYear == null) return null;
    return DateTime(workYear!, workMonth!, workDay!);
  }
}

@freezed
class HolidayItem with _$HolidayItem {
  const factory HolidayItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'HolidayDate') DateTime? holidayDate,
    @JsonKey(name: 'HolidayYear') int? holidayYear,
    @JsonKey(name: 'HolidayMonth') int? holidayMonth,
    @JsonKey(name: 'HolidayDay') int? holidayDay,
    @JsonKey(name: 'DayValue') String? dayValue,
    @JsonKey(name: 'HolidayName') String? holidayName,
    @JsonKey(name: 'HolidayCode') String? holidayCode,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'TypeHoliday') int? typeHoliday,
    @JsonKey(name: 'TypeHolidayText') String? typeHolidayText,
  }) = _HolidayItem;

  factory HolidayItem.fromJson(Map<String, dynamic> json) =>
      _$HolidayItemFromJson(json);
}

/// Thông tin ngày nghỉ.
extension HolidayItemInfo on HolidayItem {
  /// Ngày dương lịch của ngày nghỉ này.
  ///
  /// Ưu tiên `HolidayDate`, fallback sang `HolidayYear/HolidayMonth/HolidayDay`.
  DateTime? get date {
    if (holidayDate != null) return holidayDate;
    if (holidayYear == null || holidayMonth == null || holidayDay == null) {
      return null;
    }
    return DateTime(holidayYear!, holidayMonth!, holidayDay!);
  }

  /// Ngày này có phải ngày nghỉ không hưởng lương hay không.
  ///
  /// `TypeHoliday` = 1 là nghỉ có hưởng lương, = 2 là nghỉ không hưởng lương.
  bool get isUnpaid => typeHoliday == 2;
}

/// Phân loại tin theo nhóm tin của API.
extension NewsletterItemCategory on NewsletterItem {
  /// Nhóm tin của bản tin này, suy ra từ `NewsletterTypeCode`.
  ///
  /// Trả về `null` khi mã loại tin không thuộc nhóm nào đang hỗ trợ, để các
  /// bản tin khác không bị ẩn nhầm khi lọc theo tab.
  NewsletterCategory? get category {
    final code = newsletterTypeCode?.trim().toLowerCase();
    if (code == null || code.isEmpty) return null;

    for (final category in NewsletterCategory.values) {
      if (category.code.toLowerCase() == code) return category;
    }
    return null;
  }
}
