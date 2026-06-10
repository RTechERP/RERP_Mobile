import 'package:freezed_annotation/freezed_annotation.dart';

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

  factory NewsletterDetailItem.fromJson(
      Map<String, dynamic> json,
      ) =>
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

  factory NewsletterFileItem.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$NewsletterFileItemFromJson(json);
}

@freezed
class CalendarItem with _$CalendarItem {
  const factory CalendarItem({
    @JsonKey(name: 'holidays') List<HolidayItem>? holidays,
  }) = _CalendarItem;

  factory CalendarItem.fromJson(Map<String, dynamic> json) =>
      _$CalendarItemFromJson(json);
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