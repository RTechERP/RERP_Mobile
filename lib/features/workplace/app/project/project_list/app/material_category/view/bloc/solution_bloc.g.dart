// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solution_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SolutionStateCWProxy {
  SolutionState status(BaseStateStatus status);

  SolutionState message(String? message);

  SolutionState solutions(List<SolutionItem> solutions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SolutionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SolutionState(...).copyWith(id: 12, name: "My name")
  /// ````
  SolutionState call({
    BaseStateStatus? status,
    String? message,
    List<SolutionItem>? solutions,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSolutionState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSolutionState.copyWith.fieldName(...)`
class _$SolutionStateCWProxyImpl implements _$SolutionStateCWProxy {
  const _$SolutionStateCWProxyImpl(this._value);

  final SolutionState _value;

  @override
  SolutionState status(BaseStateStatus status) => this(status: status);

  @override
  SolutionState message(String? message) => this(message: message);

  @override
  SolutionState solutions(List<SolutionItem> solutions) =>
      this(solutions: solutions);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SolutionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SolutionState(...).copyWith(id: 12, name: "My name")
  /// ````
  SolutionState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? solutions = const $CopyWithPlaceholder(),
  }) {
    return SolutionState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      solutions: solutions == const $CopyWithPlaceholder() || solutions == null
          ? _value.solutions
          // ignore: cast_nullable_to_non_nullable
          : solutions as List<SolutionItem>,
    );
  }
}

extension $SolutionStateCopyWith on SolutionState {
  /// Returns a callable class that can be used as follows: `instanceOfSolutionState.copyWith(...)` or like so:`instanceOfSolutionState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SolutionStateCWProxy get copyWith => _$SolutionStateCWProxyImpl(this);
}
