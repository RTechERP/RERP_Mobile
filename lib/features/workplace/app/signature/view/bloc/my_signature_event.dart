part of 'my_signature_bloc.dart';

@freezed
class MySignatureEvent with _$MySignatureEvent {
  const factory MySignatureEvent.init() = _Init;

  const factory MySignatureEvent.loadEmployeeSignature() =
      _LoadEmployeeSignature;
}
