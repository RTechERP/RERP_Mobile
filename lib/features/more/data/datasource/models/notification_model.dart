import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class TypeNotiItem with _$TypeNotiItem {
  const factory TypeNotiItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'TypeName') required String typeName,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'IsDeleted') required bool isDeleted,
    @JsonKey(name: 'IsSelected') required bool isSelected,
    @JsonKey(name: 'TypeLinkID') required int typeLinkId,
    @JsonKey(name: 'UserID') required int userId,
  }) = _TypeNotiItem;

  factory TypeNotiItem.fromJson(Map<String, dynamic> json) =>
      _$TypeNotiItemFromJson(json);
}