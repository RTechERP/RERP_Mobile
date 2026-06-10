// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsfeed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsletterItemImpl _$$NewsletterItemImplFromJson(Map<String, dynamic> json) =>
    _$NewsletterItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      title: json['Title'] as String?,
      newsletterContent: json['NewsletterContent'] as String?,
      type: (json['Type'] as num?)?.toInt(),
      image: json['Image'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isDeleted: json['IsDeleted'] as bool?,
      originImgPath: json['OriginImgPath'] as String?,
      serverImgPath: json['ServerImgPath'] as String?,
      isPublish: json['IsPublish'] as bool?,
      newsletterTypeCode: json['NewsletterTypeCode'] as String?,
      newsletterTypeName: json['NewsletterTypeName'] as String?,
      isPublishText: json['IsPublishText'] as String?,
    );

Map<String, dynamic> _$$NewsletterItemImplToJson(
        _$NewsletterItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Title': instance.title,
      'NewsletterContent': instance.newsletterContent,
      'Type': instance.type,
      'Image': instance.image,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
      'OriginImgPath': instance.originImgPath,
      'ServerImgPath': instance.serverImgPath,
      'IsPublish': instance.isPublish,
      'NewsletterTypeCode': instance.newsletterTypeCode,
      'NewsletterTypeName': instance.newsletterTypeName,
      'IsPublishText': instance.isPublishText,
    };

_$NewsletterDetailItemImpl _$$NewsletterDetailItemImplFromJson(
        Map<String, dynamic> json) =>
    _$NewsletterDetailItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      title: json['Title'] as String?,
      newsletterContent: json['NewsletterContent'] as String?,
      type: (json['Type'] as num?)?.toInt(),
      image: json['Image'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isDeleted: json['IsDeleted'] as bool?,
      originImgPath: json['OriginImgPath'] as String?,
      serverImgPath: json['ServerImgPath'] as String?,
      isPublish: json['IsPublish'] as bool?,
    );

Map<String, dynamic> _$$NewsletterDetailItemImplToJson(
        _$NewsletterDetailItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Title': instance.title,
      'NewsletterContent': instance.newsletterContent,
      'Type': instance.type,
      'Image': instance.image,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
      'OriginImgPath': instance.originImgPath,
      'ServerImgPath': instance.serverImgPath,
      'IsPublish': instance.isPublish,
    };

_$NewsletterFileItemImpl _$$NewsletterFileItemImplFromJson(
        Map<String, dynamic> json) =>
    _$NewsletterFileItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      newsletterId: (json['NewsletterID'] as num?)?.toInt(),
      fileName: json['FileName'] as String?,
      originPath: json['OriginPath'] as String?,
      serverPath: json['ServerPath'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$NewsletterFileItemImplToJson(
        _$NewsletterFileItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'NewsletterID': instance.newsletterId,
      'FileName': instance.fileName,
      'OriginPath': instance.originPath,
      'ServerPath': instance.serverPath,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
    };

_$CalendarItemImpl _$$CalendarItemImplFromJson(Map<String, dynamic> json) =>
    _$CalendarItemImpl(
      holidays: (json['holidays'] as List<dynamic>?)
          ?.map((e) => HolidayItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CalendarItemImplToJson(_$CalendarItemImpl instance) =>
    <String, dynamic>{
      'holidays': instance.holidays,
    };

_$HolidayItemImpl _$$HolidayItemImplFromJson(Map<String, dynamic> json) =>
    _$HolidayItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      holidayDate: json['HolidayDate'] == null
          ? null
          : DateTime.parse(json['HolidayDate'] as String),
      holidayYear: (json['HolidayYear'] as num?)?.toInt(),
      holidayMonth: (json['HolidayMonth'] as num?)?.toInt(),
      holidayDay: (json['HolidayDay'] as num?)?.toInt(),
      dayValue: json['DayValue'] as String?,
      holidayName: json['HolidayName'] as String?,
      holidayCode: json['HolidayCode'] as String?,
      note: json['Note'] as String?,
      typeHoliday: (json['TypeHoliday'] as num?)?.toInt(),
      typeHolidayText: json['TypeHolidayText'] as String?,
    );

Map<String, dynamic> _$$HolidayItemImplToJson(_$HolidayItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'HolidayDate': instance.holidayDate?.toIso8601String(),
      'HolidayYear': instance.holidayYear,
      'HolidayMonth': instance.holidayMonth,
      'HolidayDay': instance.holidayDay,
      'DayValue': instance.dayValue,
      'HolidayName': instance.holidayName,
      'HolidayCode': instance.holidayCode,
      'Note': instance.note,
      'TypeHoliday': instance.typeHoliday,
      'TypeHolidayText': instance.typeHolidayText,
    };
