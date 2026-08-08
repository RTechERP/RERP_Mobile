part of 'contact_bloc.dart';

@freezed
class ContactEvent with _$ContactEvent {
  const factory ContactEvent.init({
    @Default(0) int departmentID,
    String? keyword,
  }) = _Init;

  const factory ContactEvent.refresh({
    @Default(0) int departmentID,
    String? keyword,
  }) = _Refresh;
}
