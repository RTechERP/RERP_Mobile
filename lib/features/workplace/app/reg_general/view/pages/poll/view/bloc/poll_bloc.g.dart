// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PollStateCWProxy {
  PollState status(BaseStateStatus status);

  PollState message(String? message);

  PollState polls(List<PollItem> polls);

  PollState isDetailLoading(bool isDetailLoading);

  PollState detailItem(PollItem? detailItem);

  PollState detailData(PollDetailItem? detailData);

  PollState responseData(ResponseItem? responseData);

  PollState detailMessage(String? detailMessage);

  PollState questionReadonlyMap(Map<int, bool> questionReadonlyMap);

  PollState selectedSectionId(int? selectedSectionId);

  PollState isNavigating(bool isNavigating);

  PollState isSubmitting(bool isSubmitting);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PollState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PollState(...).copyWith(id: 12, name: "My name")
  /// ````
  PollState call({
    BaseStateStatus? status,
    String? message,
    List<PollItem>? polls,
    bool? isDetailLoading,
    PollItem? detailItem,
    PollDetailItem? detailData,
    ResponseItem? responseData,
    String? detailMessage,
    Map<int, bool>? questionReadonlyMap,
    int? selectedSectionId,
    bool? isNavigating,
    bool? isSubmitting,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPollState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPollState.copyWith.fieldName(...)`
class _$PollStateCWProxyImpl implements _$PollStateCWProxy {
  const _$PollStateCWProxyImpl(this._value);

  final PollState _value;

  @override
  PollState status(BaseStateStatus status) => this(status: status);

  @override
  PollState message(String? message) => this(message: message);

  @override
  PollState polls(List<PollItem> polls) => this(polls: polls);

  @override
  PollState isDetailLoading(bool isDetailLoading) =>
      this(isDetailLoading: isDetailLoading);

  @override
  PollState detailItem(PollItem? detailItem) => this(detailItem: detailItem);

  @override
  PollState detailData(PollDetailItem? detailData) =>
      this(detailData: detailData);

  @override
  PollState responseData(ResponseItem? responseData) =>
      this(responseData: responseData);

  @override
  PollState detailMessage(String? detailMessage) =>
      this(detailMessage: detailMessage);

  @override
  PollState questionReadonlyMap(Map<int, bool> questionReadonlyMap) =>
      this(questionReadonlyMap: questionReadonlyMap);

  @override
  PollState selectedSectionId(int? selectedSectionId) =>
      this(selectedSectionId: selectedSectionId);

  @override
  PollState isNavigating(bool isNavigating) => this(isNavigating: isNavigating);

  @override
  PollState isSubmitting(bool isSubmitting) => this(isSubmitting: isSubmitting);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PollState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PollState(...).copyWith(id: 12, name: "My name")
  /// ````
  PollState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? polls = const $CopyWithPlaceholder(),
    Object? isDetailLoading = const $CopyWithPlaceholder(),
    Object? detailItem = const $CopyWithPlaceholder(),
    Object? detailData = const $CopyWithPlaceholder(),
    Object? responseData = const $CopyWithPlaceholder(),
    Object? detailMessage = const $CopyWithPlaceholder(),
    Object? questionReadonlyMap = const $CopyWithPlaceholder(),
    Object? selectedSectionId = const $CopyWithPlaceholder(),
    Object? isNavigating = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
  }) {
    return PollState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      polls: polls == const $CopyWithPlaceholder() || polls == null
          ? _value.polls
          // ignore: cast_nullable_to_non_nullable
          : polls as List<PollItem>,
      isDetailLoading: isDetailLoading == const $CopyWithPlaceholder() ||
              isDetailLoading == null
          ? _value.isDetailLoading
          // ignore: cast_nullable_to_non_nullable
          : isDetailLoading as bool,
      detailItem: detailItem == const $CopyWithPlaceholder()
          ? _value.detailItem
          // ignore: cast_nullable_to_non_nullable
          : detailItem as PollItem?,
      detailData: detailData == const $CopyWithPlaceholder()
          ? _value.detailData
          // ignore: cast_nullable_to_non_nullable
          : detailData as PollDetailItem?,
      responseData: responseData == const $CopyWithPlaceholder()
          ? _value.responseData
          // ignore: cast_nullable_to_non_nullable
          : responseData as ResponseItem?,
      detailMessage: detailMessage == const $CopyWithPlaceholder()
          ? _value.detailMessage
          // ignore: cast_nullable_to_non_nullable
          : detailMessage as String?,
      questionReadonlyMap:
          questionReadonlyMap == const $CopyWithPlaceholder() ||
                  questionReadonlyMap == null
              ? _value.questionReadonlyMap
              // ignore: cast_nullable_to_non_nullable
              : questionReadonlyMap as Map<int, bool>,
      selectedSectionId: selectedSectionId == const $CopyWithPlaceholder()
          ? _value.selectedSectionId
          // ignore: cast_nullable_to_non_nullable
          : selectedSectionId as int?,
      isNavigating:
          isNavigating == const $CopyWithPlaceholder() || isNavigating == null
              ? _value.isNavigating
              // ignore: cast_nullable_to_non_nullable
              : isNavigating as bool,
      isSubmitting:
          isSubmitting == const $CopyWithPlaceholder() || isSubmitting == null
              ? _value.isSubmitting
              // ignore: cast_nullable_to_non_nullable
              : isSubmitting as bool,
    );
  }
}

extension $PollStateCopyWith on PollState {
  /// Returns a callable class that can be used as follows: `instanceOfPollState.copyWith(...)` or like so:`instanceOfPollState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PollStateCWProxy get copyWith => _$PollStateCWProxyImpl(this);
}
