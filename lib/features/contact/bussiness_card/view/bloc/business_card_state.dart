part of 'business_card_bloc.dart';

@CopyWith()
class BusinessCardState extends BaseBlocState {
  const BusinessCardState({
    required super.status,
    super.message,
    this.cards = const [],
    this.scannedData = const {},
  });

  factory BusinessCardState.init() => const BusinessCardState(
        status: BaseStateStatus.init,
      );

  final List<BusinessCardModel> cards;

  /// Kết quả scan từ Ollama vision — key viết HOA (NAME, PHONE, EMAIL,...)
  /// để tương thích với `ConfirmBusinessCardScreen`.
  final Map<String, String> scannedData;
}
