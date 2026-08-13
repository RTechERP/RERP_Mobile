part of 'my_signature_bloc.dart';

@CopyWith()
class MySignatureState extends BaseBlocState {
  final int? employeeId;
  final Uint8List? employeeSignature;

  final bool isSaving;
  final bool saveSuccess;
  final bool deleteSuccess;
  final bool isDeleting;

  const MySignatureState({
    required super.status,
    super.message,
    this.employeeId,
    this.employeeSignature,
    this.isSaving = false,
    this.saveSuccess = false,
    this.deleteSuccess = false,
    this.isDeleting = false,
  });

  factory MySignatureState.init() => const MySignatureState(
        status: BaseStateStatus.init,
        employeeId: null,
        employeeSignature: null,
        isSaving: false,
        saveSuccess: false,
        deleteSuccess: false,
        isDeleting: false,
      );

  @override
  List get props => [
        status,
        message,
        employeeId,
        employeeSignature,
        isSaving,
        saveSuccess,
        deleteSuccess,
        isDeleting,
      ];
}
