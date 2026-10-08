part of 'my_signature_bloc.dart';

@freezed
class MySignatureEvent with _$MySignatureEvent {
  const factory MySignatureEvent.init() = _Init;

  const factory MySignatureEvent.loadEmployeeSignature() =
      _LoadEmployeeSignature;

  const factory MySignatureEvent.saveEmployeeSignature(Uint8List signatureBytes) =
      _SaveEmployeeSignature;

  const factory MySignatureEvent.deleteEmployeeSignature() =
      _DeleteEmployeeSignature;
}
