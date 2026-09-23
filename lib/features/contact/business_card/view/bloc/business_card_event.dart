part of 'business_card_bloc.dart';

@freezed
class BusinessCardEvent with _$BusinessCardEvent {
  const factory BusinessCardEvent.init() = _Init;
  const factory BusinessCardEvent.scanCard(String path) = _ScanCard;
}
