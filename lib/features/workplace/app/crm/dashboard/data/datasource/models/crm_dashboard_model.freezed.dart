// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crm_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CrmDashboardData _$CrmDashboardDataFromJson(Map<String, dynamic> json) {
  return _CrmDashboardData.fromJson(json);
}

/// @nodoc
mixin _$CrmDashboardData {
  @JsonKey(name: 'bySource')
  List<LeadBySource> get bySource => throw _privateConstructorUsedError;
  @JsonKey(name: 'byMarketing')
  List<LeadByEmployee> get byMarketing => throw _privateConstructorUsedError;
  @JsonKey(name: 'bySale')
  List<LeadByEmployee> get bySale => throw _privateConstructorUsedError;
  @JsonKey(name: 'byTeamSale')
  List<LeadByTeam> get byTeamSale => throw _privateConstructorUsedError;
  @JsonKey(name: 'byActivity')
  List<LeadByActivity> get byActivity => throw _privateConstructorUsedError;
  @JsonKey(name: 'byIndustryGrowth')
  List<LeadByIndustryGrowth> get byIndustryGrowth =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'byCategoryGrowth')
  List<LeadByCategoryGrowth> get byCategoryGrowth =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrmDashboardDataCopyWith<CrmDashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrmDashboardDataCopyWith<$Res> {
  factory $CrmDashboardDataCopyWith(
          CrmDashboardData value, $Res Function(CrmDashboardData) then) =
      _$CrmDashboardDataCopyWithImpl<$Res, CrmDashboardData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bySource') List<LeadBySource> bySource,
      @JsonKey(name: 'byMarketing') List<LeadByEmployee> byMarketing,
      @JsonKey(name: 'bySale') List<LeadByEmployee> bySale,
      @JsonKey(name: 'byTeamSale') List<LeadByTeam> byTeamSale,
      @JsonKey(name: 'byActivity') List<LeadByActivity> byActivity,
      @JsonKey(name: 'byIndustryGrowth')
      List<LeadByIndustryGrowth> byIndustryGrowth,
      @JsonKey(name: 'byCategoryGrowth')
      List<LeadByCategoryGrowth> byCategoryGrowth});
}

/// @nodoc
class _$CrmDashboardDataCopyWithImpl<$Res, $Val extends CrmDashboardData>
    implements $CrmDashboardDataCopyWith<$Res> {
  _$CrmDashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bySource = null,
    Object? byMarketing = null,
    Object? bySale = null,
    Object? byTeamSale = null,
    Object? byActivity = null,
    Object? byIndustryGrowth = null,
    Object? byCategoryGrowth = null,
  }) {
    return _then(_value.copyWith(
      bySource: null == bySource
          ? _value.bySource
          : bySource // ignore: cast_nullable_to_non_nullable
              as List<LeadBySource>,
      byMarketing: null == byMarketing
          ? _value.byMarketing
          : byMarketing // ignore: cast_nullable_to_non_nullable
              as List<LeadByEmployee>,
      bySale: null == bySale
          ? _value.bySale
          : bySale // ignore: cast_nullable_to_non_nullable
              as List<LeadByEmployee>,
      byTeamSale: null == byTeamSale
          ? _value.byTeamSale
          : byTeamSale // ignore: cast_nullable_to_non_nullable
              as List<LeadByTeam>,
      byActivity: null == byActivity
          ? _value.byActivity
          : byActivity // ignore: cast_nullable_to_non_nullable
              as List<LeadByActivity>,
      byIndustryGrowth: null == byIndustryGrowth
          ? _value.byIndustryGrowth
          : byIndustryGrowth // ignore: cast_nullable_to_non_nullable
              as List<LeadByIndustryGrowth>,
      byCategoryGrowth: null == byCategoryGrowth
          ? _value.byCategoryGrowth
          : byCategoryGrowth // ignore: cast_nullable_to_non_nullable
              as List<LeadByCategoryGrowth>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrmDashboardDataImplCopyWith<$Res>
    implements $CrmDashboardDataCopyWith<$Res> {
  factory _$$CrmDashboardDataImplCopyWith(_$CrmDashboardDataImpl value,
          $Res Function(_$CrmDashboardDataImpl) then) =
      __$$CrmDashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bySource') List<LeadBySource> bySource,
      @JsonKey(name: 'byMarketing') List<LeadByEmployee> byMarketing,
      @JsonKey(name: 'bySale') List<LeadByEmployee> bySale,
      @JsonKey(name: 'byTeamSale') List<LeadByTeam> byTeamSale,
      @JsonKey(name: 'byActivity') List<LeadByActivity> byActivity,
      @JsonKey(name: 'byIndustryGrowth')
      List<LeadByIndustryGrowth> byIndustryGrowth,
      @JsonKey(name: 'byCategoryGrowth')
      List<LeadByCategoryGrowth> byCategoryGrowth});
}

/// @nodoc
class __$$CrmDashboardDataImplCopyWithImpl<$Res>
    extends _$CrmDashboardDataCopyWithImpl<$Res, _$CrmDashboardDataImpl>
    implements _$$CrmDashboardDataImplCopyWith<$Res> {
  __$$CrmDashboardDataImplCopyWithImpl(_$CrmDashboardDataImpl _value,
      $Res Function(_$CrmDashboardDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bySource = null,
    Object? byMarketing = null,
    Object? bySale = null,
    Object? byTeamSale = null,
    Object? byActivity = null,
    Object? byIndustryGrowth = null,
    Object? byCategoryGrowth = null,
  }) {
    return _then(_$CrmDashboardDataImpl(
      bySource: null == bySource
          ? _value._bySource
          : bySource // ignore: cast_nullable_to_non_nullable
              as List<LeadBySource>,
      byMarketing: null == byMarketing
          ? _value._byMarketing
          : byMarketing // ignore: cast_nullable_to_non_nullable
              as List<LeadByEmployee>,
      bySale: null == bySale
          ? _value._bySale
          : bySale // ignore: cast_nullable_to_non_nullable
              as List<LeadByEmployee>,
      byTeamSale: null == byTeamSale
          ? _value._byTeamSale
          : byTeamSale // ignore: cast_nullable_to_non_nullable
              as List<LeadByTeam>,
      byActivity: null == byActivity
          ? _value._byActivity
          : byActivity // ignore: cast_nullable_to_non_nullable
              as List<LeadByActivity>,
      byIndustryGrowth: null == byIndustryGrowth
          ? _value._byIndustryGrowth
          : byIndustryGrowth // ignore: cast_nullable_to_non_nullable
              as List<LeadByIndustryGrowth>,
      byCategoryGrowth: null == byCategoryGrowth
          ? _value._byCategoryGrowth
          : byCategoryGrowth // ignore: cast_nullable_to_non_nullable
              as List<LeadByCategoryGrowth>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CrmDashboardDataImpl implements _CrmDashboardData {
  const _$CrmDashboardDataImpl(
      {@JsonKey(name: 'bySource') final List<LeadBySource> bySource = const [],
      @JsonKey(name: 'byMarketing')
      final List<LeadByEmployee> byMarketing = const [],
      @JsonKey(name: 'bySale') final List<LeadByEmployee> bySale = const [],
      @JsonKey(name: 'byTeamSale') final List<LeadByTeam> byTeamSale = const [],
      @JsonKey(name: 'byActivity')
      final List<LeadByActivity> byActivity = const [],
      @JsonKey(name: 'byIndustryGrowth')
      final List<LeadByIndustryGrowth> byIndustryGrowth = const [],
      @JsonKey(name: 'byCategoryGrowth')
      final List<LeadByCategoryGrowth> byCategoryGrowth = const []})
      : _bySource = bySource,
        _byMarketing = byMarketing,
        _bySale = bySale,
        _byTeamSale = byTeamSale,
        _byActivity = byActivity,
        _byIndustryGrowth = byIndustryGrowth,
        _byCategoryGrowth = byCategoryGrowth;

  factory _$CrmDashboardDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CrmDashboardDataImplFromJson(json);

  final List<LeadBySource> _bySource;
  @override
  @JsonKey(name: 'bySource')
  List<LeadBySource> get bySource {
    if (_bySource is EqualUnmodifiableListView) return _bySource;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bySource);
  }

  final List<LeadByEmployee> _byMarketing;
  @override
  @JsonKey(name: 'byMarketing')
  List<LeadByEmployee> get byMarketing {
    if (_byMarketing is EqualUnmodifiableListView) return _byMarketing;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_byMarketing);
  }

  final List<LeadByEmployee> _bySale;
  @override
  @JsonKey(name: 'bySale')
  List<LeadByEmployee> get bySale {
    if (_bySale is EqualUnmodifiableListView) return _bySale;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bySale);
  }

  final List<LeadByTeam> _byTeamSale;
  @override
  @JsonKey(name: 'byTeamSale')
  List<LeadByTeam> get byTeamSale {
    if (_byTeamSale is EqualUnmodifiableListView) return _byTeamSale;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_byTeamSale);
  }

  final List<LeadByActivity> _byActivity;
  @override
  @JsonKey(name: 'byActivity')
  List<LeadByActivity> get byActivity {
    if (_byActivity is EqualUnmodifiableListView) return _byActivity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_byActivity);
  }

  final List<LeadByIndustryGrowth> _byIndustryGrowth;
  @override
  @JsonKey(name: 'byIndustryGrowth')
  List<LeadByIndustryGrowth> get byIndustryGrowth {
    if (_byIndustryGrowth is EqualUnmodifiableListView)
      return _byIndustryGrowth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_byIndustryGrowth);
  }

  final List<LeadByCategoryGrowth> _byCategoryGrowth;
  @override
  @JsonKey(name: 'byCategoryGrowth')
  List<LeadByCategoryGrowth> get byCategoryGrowth {
    if (_byCategoryGrowth is EqualUnmodifiableListView)
      return _byCategoryGrowth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_byCategoryGrowth);
  }

  @override
  String toString() {
    return 'CrmDashboardData(bySource: $bySource, byMarketing: $byMarketing, bySale: $bySale, byTeamSale: $byTeamSale, byActivity: $byActivity, byIndustryGrowth: $byIndustryGrowth, byCategoryGrowth: $byCategoryGrowth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrmDashboardDataImpl &&
            const DeepCollectionEquality().equals(other._bySource, _bySource) &&
            const DeepCollectionEquality()
                .equals(other._byMarketing, _byMarketing) &&
            const DeepCollectionEquality().equals(other._bySale, _bySale) &&
            const DeepCollectionEquality()
                .equals(other._byTeamSale, _byTeamSale) &&
            const DeepCollectionEquality()
                .equals(other._byActivity, _byActivity) &&
            const DeepCollectionEquality()
                .equals(other._byIndustryGrowth, _byIndustryGrowth) &&
            const DeepCollectionEquality()
                .equals(other._byCategoryGrowth, _byCategoryGrowth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bySource),
      const DeepCollectionEquality().hash(_byMarketing),
      const DeepCollectionEquality().hash(_bySale),
      const DeepCollectionEquality().hash(_byTeamSale),
      const DeepCollectionEquality().hash(_byActivity),
      const DeepCollectionEquality().hash(_byIndustryGrowth),
      const DeepCollectionEquality().hash(_byCategoryGrowth));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrmDashboardDataImplCopyWith<_$CrmDashboardDataImpl> get copyWith =>
      __$$CrmDashboardDataImplCopyWithImpl<_$CrmDashboardDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CrmDashboardDataImplToJson(
      this,
    );
  }
}

abstract class _CrmDashboardData implements CrmDashboardData {
  const factory _CrmDashboardData(
          {@JsonKey(name: 'bySource') final List<LeadBySource> bySource,
          @JsonKey(name: 'byMarketing') final List<LeadByEmployee> byMarketing,
          @JsonKey(name: 'bySale') final List<LeadByEmployee> bySale,
          @JsonKey(name: 'byTeamSale') final List<LeadByTeam> byTeamSale,
          @JsonKey(name: 'byActivity') final List<LeadByActivity> byActivity,
          @JsonKey(name: 'byIndustryGrowth')
          final List<LeadByIndustryGrowth> byIndustryGrowth,
          @JsonKey(name: 'byCategoryGrowth')
          final List<LeadByCategoryGrowth> byCategoryGrowth}) =
      _$CrmDashboardDataImpl;

  factory _CrmDashboardData.fromJson(Map<String, dynamic> json) =
      _$CrmDashboardDataImpl.fromJson;

  @override
  @JsonKey(name: 'bySource')
  List<LeadBySource> get bySource;
  @override
  @JsonKey(name: 'byMarketing')
  List<LeadByEmployee> get byMarketing;
  @override
  @JsonKey(name: 'bySale')
  List<LeadByEmployee> get bySale;
  @override
  @JsonKey(name: 'byTeamSale')
  List<LeadByTeam> get byTeamSale;
  @override
  @JsonKey(name: 'byActivity')
  List<LeadByActivity> get byActivity;
  @override
  @JsonKey(name: 'byIndustryGrowth')
  List<LeadByIndustryGrowth> get byIndustryGrowth;
  @override
  @JsonKey(name: 'byCategoryGrowth')
  List<LeadByCategoryGrowth> get byCategoryGrowth;
  @override
  @JsonKey(ignore: true)
  _$$CrmDashboardDataImplCopyWith<_$CrmDashboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadBySource _$LeadBySourceFromJson(Map<String, dynamic> json) {
  return _LeadBySource.fromJson(json);
}

/// @nodoc
mixin _$LeadBySource {
  @JsonKey(name: 'LeadSourceName')
  String? get leadSourceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total')
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalMarketing')
  int get totalMarketing => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalSales')
  int get totalSales => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalMQL')
  int get totalMQL => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalHandover')
  int get totalHandover => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalConverted')
  int get totalConverted => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalLost')
  int get totalLost => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDisqualified')
  int get totalDisqualified => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalPO')
  int get totalPO => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalReturned')
  int get totalReturned => throw _privateConstructorUsedError;
  @JsonKey(name: 'ConvertRate')
  double get convertRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ConvertedValue')
  double get convertedValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'ConvertedValuePo')
  double get convertedValuePo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadBySourceCopyWith<LeadBySource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadBySourceCopyWith<$Res> {
  factory $LeadBySourceCopyWith(
          LeadBySource value, $Res Function(LeadBySource) then) =
      _$LeadBySourceCopyWithImpl<$Res, LeadBySource>;
  @useResult
  $Res call(
      {@JsonKey(name: 'LeadSourceName') String? leadSourceName,
      @JsonKey(name: 'Total') int total,
      @JsonKey(name: 'TotalMarketing') int totalMarketing,
      @JsonKey(name: 'TotalSales') int totalSales,
      @JsonKey(name: 'TotalMQL') int totalMQL,
      @JsonKey(name: 'TotalHandover') int totalHandover,
      @JsonKey(name: 'TotalConverted') int totalConverted,
      @JsonKey(name: 'TotalLost') int totalLost,
      @JsonKey(name: 'TotalDisqualified') int totalDisqualified,
      @JsonKey(name: 'TotalPO') int totalPO,
      @JsonKey(name: 'TotalReturned') int totalReturned,
      @JsonKey(name: 'ConvertRate') double convertRate,
      @JsonKey(name: 'ConvertedValue') double convertedValue,
      @JsonKey(name: 'ConvertedValuePo') double convertedValuePo});
}

/// @nodoc
class _$LeadBySourceCopyWithImpl<$Res, $Val extends LeadBySource>
    implements $LeadBySourceCopyWith<$Res> {
  _$LeadBySourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leadSourceName = freezed,
    Object? total = null,
    Object? totalMarketing = null,
    Object? totalSales = null,
    Object? totalMQL = null,
    Object? totalHandover = null,
    Object? totalConverted = null,
    Object? totalLost = null,
    Object? totalDisqualified = null,
    Object? totalPO = null,
    Object? totalReturned = null,
    Object? convertRate = null,
    Object? convertedValue = null,
    Object? convertedValuePo = null,
  }) {
    return _then(_value.copyWith(
      leadSourceName: freezed == leadSourceName
          ? _value.leadSourceName
          : leadSourceName // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalMarketing: null == totalMarketing
          ? _value.totalMarketing
          : totalMarketing // ignore: cast_nullable_to_non_nullable
              as int,
      totalSales: null == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int,
      totalMQL: null == totalMQL
          ? _value.totalMQL
          : totalMQL // ignore: cast_nullable_to_non_nullable
              as int,
      totalHandover: null == totalHandover
          ? _value.totalHandover
          : totalHandover // ignore: cast_nullable_to_non_nullable
              as int,
      totalConverted: null == totalConverted
          ? _value.totalConverted
          : totalConverted // ignore: cast_nullable_to_non_nullable
              as int,
      totalLost: null == totalLost
          ? _value.totalLost
          : totalLost // ignore: cast_nullable_to_non_nullable
              as int,
      totalDisqualified: null == totalDisqualified
          ? _value.totalDisqualified
          : totalDisqualified // ignore: cast_nullable_to_non_nullable
              as int,
      totalPO: null == totalPO
          ? _value.totalPO
          : totalPO // ignore: cast_nullable_to_non_nullable
              as int,
      totalReturned: null == totalReturned
          ? _value.totalReturned
          : totalReturned // ignore: cast_nullable_to_non_nullable
              as int,
      convertRate: null == convertRate
          ? _value.convertRate
          : convertRate // ignore: cast_nullable_to_non_nullable
              as double,
      convertedValue: null == convertedValue
          ? _value.convertedValue
          : convertedValue // ignore: cast_nullable_to_non_nullable
              as double,
      convertedValuePo: null == convertedValuePo
          ? _value.convertedValuePo
          : convertedValuePo // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadBySourceImplCopyWith<$Res>
    implements $LeadBySourceCopyWith<$Res> {
  factory _$$LeadBySourceImplCopyWith(
          _$LeadBySourceImpl value, $Res Function(_$LeadBySourceImpl) then) =
      __$$LeadBySourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'LeadSourceName') String? leadSourceName,
      @JsonKey(name: 'Total') int total,
      @JsonKey(name: 'TotalMarketing') int totalMarketing,
      @JsonKey(name: 'TotalSales') int totalSales,
      @JsonKey(name: 'TotalMQL') int totalMQL,
      @JsonKey(name: 'TotalHandover') int totalHandover,
      @JsonKey(name: 'TotalConverted') int totalConverted,
      @JsonKey(name: 'TotalLost') int totalLost,
      @JsonKey(name: 'TotalDisqualified') int totalDisqualified,
      @JsonKey(name: 'TotalPO') int totalPO,
      @JsonKey(name: 'TotalReturned') int totalReturned,
      @JsonKey(name: 'ConvertRate') double convertRate,
      @JsonKey(name: 'ConvertedValue') double convertedValue,
      @JsonKey(name: 'ConvertedValuePo') double convertedValuePo});
}

/// @nodoc
class __$$LeadBySourceImplCopyWithImpl<$Res>
    extends _$LeadBySourceCopyWithImpl<$Res, _$LeadBySourceImpl>
    implements _$$LeadBySourceImplCopyWith<$Res> {
  __$$LeadBySourceImplCopyWithImpl(
      _$LeadBySourceImpl _value, $Res Function(_$LeadBySourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leadSourceName = freezed,
    Object? total = null,
    Object? totalMarketing = null,
    Object? totalSales = null,
    Object? totalMQL = null,
    Object? totalHandover = null,
    Object? totalConverted = null,
    Object? totalLost = null,
    Object? totalDisqualified = null,
    Object? totalPO = null,
    Object? totalReturned = null,
    Object? convertRate = null,
    Object? convertedValue = null,
    Object? convertedValuePo = null,
  }) {
    return _then(_$LeadBySourceImpl(
      leadSourceName: freezed == leadSourceName
          ? _value.leadSourceName
          : leadSourceName // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalMarketing: null == totalMarketing
          ? _value.totalMarketing
          : totalMarketing // ignore: cast_nullable_to_non_nullable
              as int,
      totalSales: null == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int,
      totalMQL: null == totalMQL
          ? _value.totalMQL
          : totalMQL // ignore: cast_nullable_to_non_nullable
              as int,
      totalHandover: null == totalHandover
          ? _value.totalHandover
          : totalHandover // ignore: cast_nullable_to_non_nullable
              as int,
      totalConverted: null == totalConverted
          ? _value.totalConverted
          : totalConverted // ignore: cast_nullable_to_non_nullable
              as int,
      totalLost: null == totalLost
          ? _value.totalLost
          : totalLost // ignore: cast_nullable_to_non_nullable
              as int,
      totalDisqualified: null == totalDisqualified
          ? _value.totalDisqualified
          : totalDisqualified // ignore: cast_nullable_to_non_nullable
              as int,
      totalPO: null == totalPO
          ? _value.totalPO
          : totalPO // ignore: cast_nullable_to_non_nullable
              as int,
      totalReturned: null == totalReturned
          ? _value.totalReturned
          : totalReturned // ignore: cast_nullable_to_non_nullable
              as int,
      convertRate: null == convertRate
          ? _value.convertRate
          : convertRate // ignore: cast_nullable_to_non_nullable
              as double,
      convertedValue: null == convertedValue
          ? _value.convertedValue
          : convertedValue // ignore: cast_nullable_to_non_nullable
              as double,
      convertedValuePo: null == convertedValuePo
          ? _value.convertedValuePo
          : convertedValuePo // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadBySourceImpl implements _LeadBySource {
  const _$LeadBySourceImpl(
      {@JsonKey(name: 'LeadSourceName') this.leadSourceName,
      @JsonKey(name: 'Total') this.total = 0,
      @JsonKey(name: 'TotalMarketing') this.totalMarketing = 0,
      @JsonKey(name: 'TotalSales') this.totalSales = 0,
      @JsonKey(name: 'TotalMQL') this.totalMQL = 0,
      @JsonKey(name: 'TotalHandover') this.totalHandover = 0,
      @JsonKey(name: 'TotalConverted') this.totalConverted = 0,
      @JsonKey(name: 'TotalLost') this.totalLost = 0,
      @JsonKey(name: 'TotalDisqualified') this.totalDisqualified = 0,
      @JsonKey(name: 'TotalPO') this.totalPO = 0,
      @JsonKey(name: 'TotalReturned') this.totalReturned = 0,
      @JsonKey(name: 'ConvertRate') this.convertRate = 0.0,
      @JsonKey(name: 'ConvertedValue') this.convertedValue = 0.0,
      @JsonKey(name: 'ConvertedValuePo') this.convertedValuePo = 0.0});

  factory _$LeadBySourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadBySourceImplFromJson(json);

  @override
  @JsonKey(name: 'LeadSourceName')
  final String? leadSourceName;
  @override
  @JsonKey(name: 'Total')
  final int total;
  @override
  @JsonKey(name: 'TotalMarketing')
  final int totalMarketing;
  @override
  @JsonKey(name: 'TotalSales')
  final int totalSales;
  @override
  @JsonKey(name: 'TotalMQL')
  final int totalMQL;
  @override
  @JsonKey(name: 'TotalHandover')
  final int totalHandover;
  @override
  @JsonKey(name: 'TotalConverted')
  final int totalConverted;
  @override
  @JsonKey(name: 'TotalLost')
  final int totalLost;
  @override
  @JsonKey(name: 'TotalDisqualified')
  final int totalDisqualified;
  @override
  @JsonKey(name: 'TotalPO')
  final int totalPO;
  @override
  @JsonKey(name: 'TotalReturned')
  final int totalReturned;
  @override
  @JsonKey(name: 'ConvertRate')
  final double convertRate;
  @override
  @JsonKey(name: 'ConvertedValue')
  final double convertedValue;
  @override
  @JsonKey(name: 'ConvertedValuePo')
  final double convertedValuePo;

  @override
  String toString() {
    return 'LeadBySource(leadSourceName: $leadSourceName, total: $total, totalMarketing: $totalMarketing, totalSales: $totalSales, totalMQL: $totalMQL, totalHandover: $totalHandover, totalConverted: $totalConverted, totalLost: $totalLost, totalDisqualified: $totalDisqualified, totalPO: $totalPO, totalReturned: $totalReturned, convertRate: $convertRate, convertedValue: $convertedValue, convertedValuePo: $convertedValuePo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadBySourceImpl &&
            (identical(other.leadSourceName, leadSourceName) ||
                other.leadSourceName == leadSourceName) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalMarketing, totalMarketing) ||
                other.totalMarketing == totalMarketing) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.totalMQL, totalMQL) ||
                other.totalMQL == totalMQL) &&
            (identical(other.totalHandover, totalHandover) ||
                other.totalHandover == totalHandover) &&
            (identical(other.totalConverted, totalConverted) ||
                other.totalConverted == totalConverted) &&
            (identical(other.totalLost, totalLost) ||
                other.totalLost == totalLost) &&
            (identical(other.totalDisqualified, totalDisqualified) ||
                other.totalDisqualified == totalDisqualified) &&
            (identical(other.totalPO, totalPO) || other.totalPO == totalPO) &&
            (identical(other.totalReturned, totalReturned) ||
                other.totalReturned == totalReturned) &&
            (identical(other.convertRate, convertRate) ||
                other.convertRate == convertRate) &&
            (identical(other.convertedValue, convertedValue) ||
                other.convertedValue == convertedValue) &&
            (identical(other.convertedValuePo, convertedValuePo) ||
                other.convertedValuePo == convertedValuePo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      leadSourceName,
      total,
      totalMarketing,
      totalSales,
      totalMQL,
      totalHandover,
      totalConverted,
      totalLost,
      totalDisqualified,
      totalPO,
      totalReturned,
      convertRate,
      convertedValue,
      convertedValuePo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadBySourceImplCopyWith<_$LeadBySourceImpl> get copyWith =>
      __$$LeadBySourceImplCopyWithImpl<_$LeadBySourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadBySourceImplToJson(
      this,
    );
  }
}

abstract class _LeadBySource implements LeadBySource {
  const factory _LeadBySource(
          {@JsonKey(name: 'LeadSourceName') final String? leadSourceName,
          @JsonKey(name: 'Total') final int total,
          @JsonKey(name: 'TotalMarketing') final int totalMarketing,
          @JsonKey(name: 'TotalSales') final int totalSales,
          @JsonKey(name: 'TotalMQL') final int totalMQL,
          @JsonKey(name: 'TotalHandover') final int totalHandover,
          @JsonKey(name: 'TotalConverted') final int totalConverted,
          @JsonKey(name: 'TotalLost') final int totalLost,
          @JsonKey(name: 'TotalDisqualified') final int totalDisqualified,
          @JsonKey(name: 'TotalPO') final int totalPO,
          @JsonKey(name: 'TotalReturned') final int totalReturned,
          @JsonKey(name: 'ConvertRate') final double convertRate,
          @JsonKey(name: 'ConvertedValue') final double convertedValue,
          @JsonKey(name: 'ConvertedValuePo') final double convertedValuePo}) =
      _$LeadBySourceImpl;

  factory _LeadBySource.fromJson(Map<String, dynamic> json) =
      _$LeadBySourceImpl.fromJson;

  @override
  @JsonKey(name: 'LeadSourceName')
  String? get leadSourceName;
  @override
  @JsonKey(name: 'Total')
  int get total;
  @override
  @JsonKey(name: 'TotalMarketing')
  int get totalMarketing;
  @override
  @JsonKey(name: 'TotalSales')
  int get totalSales;
  @override
  @JsonKey(name: 'TotalMQL')
  int get totalMQL;
  @override
  @JsonKey(name: 'TotalHandover')
  int get totalHandover;
  @override
  @JsonKey(name: 'TotalConverted')
  int get totalConverted;
  @override
  @JsonKey(name: 'TotalLost')
  int get totalLost;
  @override
  @JsonKey(name: 'TotalDisqualified')
  int get totalDisqualified;
  @override
  @JsonKey(name: 'TotalPO')
  int get totalPO;
  @override
  @JsonKey(name: 'TotalReturned')
  int get totalReturned;
  @override
  @JsonKey(name: 'ConvertRate')
  double get convertRate;
  @override
  @JsonKey(name: 'ConvertedValue')
  double get convertedValue;
  @override
  @JsonKey(name: 'ConvertedValuePo')
  double get convertedValuePo;
  @override
  @JsonKey(ignore: true)
  _$$LeadBySourceImplCopyWith<_$LeadBySourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadByEmployee _$LeadByEmployeeFromJson(Map<String, dynamic> json) {
  return _LeadByEmployee.fromJson(json);
}

/// @nodoc
mixin _$LeadByEmployee {
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeName')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total')
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadByEmployeeCopyWith<LeadByEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadByEmployeeCopyWith<$Res> {
  factory $LeadByEmployeeCopyWith(
          LeadByEmployee value, $Res Function(LeadByEmployee) then) =
      _$LeadByEmployeeCopyWithImpl<$Res, LeadByEmployee>;
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'Total') int total});
}

/// @nodoc
class _$LeadByEmployeeCopyWithImpl<$Res, $Val extends LeadByEmployee>
    implements $LeadByEmployeeCopyWith<$Res> {
  _$LeadByEmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
    Object? employeeName = freezed,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadByEmployeeImplCopyWith<$Res>
    implements $LeadByEmployeeCopyWith<$Res> {
  factory _$$LeadByEmployeeImplCopyWith(_$LeadByEmployeeImpl value,
          $Res Function(_$LeadByEmployeeImpl) then) =
      __$$LeadByEmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'Total') int total});
}

/// @nodoc
class __$$LeadByEmployeeImplCopyWithImpl<$Res>
    extends _$LeadByEmployeeCopyWithImpl<$Res, _$LeadByEmployeeImpl>
    implements _$$LeadByEmployeeImplCopyWith<$Res> {
  __$$LeadByEmployeeImplCopyWithImpl(
      _$LeadByEmployeeImpl _value, $Res Function(_$LeadByEmployeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
    Object? employeeName = freezed,
    Object? total = null,
  }) {
    return _then(_$LeadByEmployeeImpl(
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadByEmployeeImpl implements _LeadByEmployee {
  const _$LeadByEmployeeImpl(
      {@JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'EmployeeName') this.employeeName,
      @JsonKey(name: 'Total') this.total = 0});

  factory _$LeadByEmployeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadByEmployeeImplFromJson(json);

  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'EmployeeName')
  final String? employeeName;
  @override
  @JsonKey(name: 'Total')
  final int total;

  @override
  String toString() {
    return 'LeadByEmployee(employeeId: $employeeId, employeeName: $employeeName, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadByEmployeeImpl &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, employeeId, employeeName, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadByEmployeeImplCopyWith<_$LeadByEmployeeImpl> get copyWith =>
      __$$LeadByEmployeeImplCopyWithImpl<_$LeadByEmployeeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadByEmployeeImplToJson(
      this,
    );
  }
}

abstract class _LeadByEmployee implements LeadByEmployee {
  const factory _LeadByEmployee(
      {@JsonKey(name: 'EmployeeID') final int? employeeId,
      @JsonKey(name: 'EmployeeName') final String? employeeName,
      @JsonKey(name: 'Total') final int total}) = _$LeadByEmployeeImpl;

  factory _LeadByEmployee.fromJson(Map<String, dynamic> json) =
      _$LeadByEmployeeImpl.fromJson;

  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'EmployeeName')
  String? get employeeName;
  @override
  @JsonKey(name: 'Total')
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$LeadByEmployeeImplCopyWith<_$LeadByEmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadByTeam _$LeadByTeamFromJson(Map<String, dynamic> json) {
  return _LeadByTeam.fromJson(json);
}

/// @nodoc
mixin _$LeadByTeam {
  @JsonKey(name: 'UserTeamID')
  int? get userTeamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TeamName')
  String? get teamName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total')
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadByTeamCopyWith<LeadByTeam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadByTeamCopyWith<$Res> {
  factory $LeadByTeamCopyWith(
          LeadByTeam value, $Res Function(LeadByTeam) then) =
      _$LeadByTeamCopyWithImpl<$Res, LeadByTeam>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UserTeamID') int? userTeamId,
      @JsonKey(name: 'TeamName') String? teamName,
      @JsonKey(name: 'Total') int total});
}

/// @nodoc
class _$LeadByTeamCopyWithImpl<$Res, $Val extends LeadByTeam>
    implements $LeadByTeamCopyWith<$Res> {
  _$LeadByTeamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userTeamId = freezed,
    Object? teamName = freezed,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      userTeamId: freezed == userTeamId
          ? _value.userTeamId
          : userTeamId // ignore: cast_nullable_to_non_nullable
              as int?,
      teamName: freezed == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadByTeamImplCopyWith<$Res>
    implements $LeadByTeamCopyWith<$Res> {
  factory _$$LeadByTeamImplCopyWith(
          _$LeadByTeamImpl value, $Res Function(_$LeadByTeamImpl) then) =
      __$$LeadByTeamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UserTeamID') int? userTeamId,
      @JsonKey(name: 'TeamName') String? teamName,
      @JsonKey(name: 'Total') int total});
}

/// @nodoc
class __$$LeadByTeamImplCopyWithImpl<$Res>
    extends _$LeadByTeamCopyWithImpl<$Res, _$LeadByTeamImpl>
    implements _$$LeadByTeamImplCopyWith<$Res> {
  __$$LeadByTeamImplCopyWithImpl(
      _$LeadByTeamImpl _value, $Res Function(_$LeadByTeamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userTeamId = freezed,
    Object? teamName = freezed,
    Object? total = null,
  }) {
    return _then(_$LeadByTeamImpl(
      userTeamId: freezed == userTeamId
          ? _value.userTeamId
          : userTeamId // ignore: cast_nullable_to_non_nullable
              as int?,
      teamName: freezed == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadByTeamImpl implements _LeadByTeam {
  const _$LeadByTeamImpl(
      {@JsonKey(name: 'UserTeamID') this.userTeamId,
      @JsonKey(name: 'TeamName') this.teamName,
      @JsonKey(name: 'Total') this.total = 0});

  factory _$LeadByTeamImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadByTeamImplFromJson(json);

  @override
  @JsonKey(name: 'UserTeamID')
  final int? userTeamId;
  @override
  @JsonKey(name: 'TeamName')
  final String? teamName;
  @override
  @JsonKey(name: 'Total')
  final int total;

  @override
  String toString() {
    return 'LeadByTeam(userTeamId: $userTeamId, teamName: $teamName, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadByTeamImpl &&
            (identical(other.userTeamId, userTeamId) ||
                other.userTeamId == userTeamId) &&
            (identical(other.teamName, teamName) ||
                other.teamName == teamName) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userTeamId, teamName, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadByTeamImplCopyWith<_$LeadByTeamImpl> get copyWith =>
      __$$LeadByTeamImplCopyWithImpl<_$LeadByTeamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadByTeamImplToJson(
      this,
    );
  }
}

abstract class _LeadByTeam implements LeadByTeam {
  const factory _LeadByTeam(
      {@JsonKey(name: 'UserTeamID') final int? userTeamId,
      @JsonKey(name: 'TeamName') final String? teamName,
      @JsonKey(name: 'Total') final int total}) = _$LeadByTeamImpl;

  factory _LeadByTeam.fromJson(Map<String, dynamic> json) =
      _$LeadByTeamImpl.fromJson;

  @override
  @JsonKey(name: 'UserTeamID')
  int? get userTeamId;
  @override
  @JsonKey(name: 'TeamName')
  String? get teamName;
  @override
  @JsonKey(name: 'Total')
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$LeadByTeamImplCopyWith<_$LeadByTeamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadByActivity _$LeadByActivityFromJson(Map<String, dynamic> json) {
  return _LeadByActivity.fromJson(json);
}

/// @nodoc
mixin _$LeadByActivity {
  @JsonKey(name: 'LastActivityType')
  int? get lastActivityType => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastActivityTypeName')
  String? get lastActivityTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total')
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadByActivityCopyWith<LeadByActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadByActivityCopyWith<$Res> {
  factory $LeadByActivityCopyWith(
          LeadByActivity value, $Res Function(LeadByActivity) then) =
      _$LeadByActivityCopyWithImpl<$Res, LeadByActivity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'LastActivityType') int? lastActivityType,
      @JsonKey(name: 'LastActivityTypeName') String? lastActivityTypeName,
      @JsonKey(name: 'Total') int total});
}

/// @nodoc
class _$LeadByActivityCopyWithImpl<$Res, $Val extends LeadByActivity>
    implements $LeadByActivityCopyWith<$Res> {
  _$LeadByActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastActivityType = freezed,
    Object? lastActivityTypeName = freezed,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      lastActivityType: freezed == lastActivityType
          ? _value.lastActivityType
          : lastActivityType // ignore: cast_nullable_to_non_nullable
              as int?,
      lastActivityTypeName: freezed == lastActivityTypeName
          ? _value.lastActivityTypeName
          : lastActivityTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadByActivityImplCopyWith<$Res>
    implements $LeadByActivityCopyWith<$Res> {
  factory _$$LeadByActivityImplCopyWith(_$LeadByActivityImpl value,
          $Res Function(_$LeadByActivityImpl) then) =
      __$$LeadByActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'LastActivityType') int? lastActivityType,
      @JsonKey(name: 'LastActivityTypeName') String? lastActivityTypeName,
      @JsonKey(name: 'Total') int total});
}

/// @nodoc
class __$$LeadByActivityImplCopyWithImpl<$Res>
    extends _$LeadByActivityCopyWithImpl<$Res, _$LeadByActivityImpl>
    implements _$$LeadByActivityImplCopyWith<$Res> {
  __$$LeadByActivityImplCopyWithImpl(
      _$LeadByActivityImpl _value, $Res Function(_$LeadByActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastActivityType = freezed,
    Object? lastActivityTypeName = freezed,
    Object? total = null,
  }) {
    return _then(_$LeadByActivityImpl(
      lastActivityType: freezed == lastActivityType
          ? _value.lastActivityType
          : lastActivityType // ignore: cast_nullable_to_non_nullable
              as int?,
      lastActivityTypeName: freezed == lastActivityTypeName
          ? _value.lastActivityTypeName
          : lastActivityTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadByActivityImpl implements _LeadByActivity {
  const _$LeadByActivityImpl(
      {@JsonKey(name: 'LastActivityType') this.lastActivityType,
      @JsonKey(name: 'LastActivityTypeName') this.lastActivityTypeName,
      @JsonKey(name: 'Total') this.total = 0});

  factory _$LeadByActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadByActivityImplFromJson(json);

  @override
  @JsonKey(name: 'LastActivityType')
  final int? lastActivityType;
  @override
  @JsonKey(name: 'LastActivityTypeName')
  final String? lastActivityTypeName;
  @override
  @JsonKey(name: 'Total')
  final int total;

  @override
  String toString() {
    return 'LeadByActivity(lastActivityType: $lastActivityType, lastActivityTypeName: $lastActivityTypeName, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadByActivityImpl &&
            (identical(other.lastActivityType, lastActivityType) ||
                other.lastActivityType == lastActivityType) &&
            (identical(other.lastActivityTypeName, lastActivityTypeName) ||
                other.lastActivityTypeName == lastActivityTypeName) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lastActivityType, lastActivityTypeName, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadByActivityImplCopyWith<_$LeadByActivityImpl> get copyWith =>
      __$$LeadByActivityImplCopyWithImpl<_$LeadByActivityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadByActivityImplToJson(
      this,
    );
  }
}

abstract class _LeadByActivity implements LeadByActivity {
  const factory _LeadByActivity(
      {@JsonKey(name: 'LastActivityType') final int? lastActivityType,
      @JsonKey(name: 'LastActivityTypeName') final String? lastActivityTypeName,
      @JsonKey(name: 'Total') final int total}) = _$LeadByActivityImpl;

  factory _LeadByActivity.fromJson(Map<String, dynamic> json) =
      _$LeadByActivityImpl.fromJson;

  @override
  @JsonKey(name: 'LastActivityType')
  int? get lastActivityType;
  @override
  @JsonKey(name: 'LastActivityTypeName')
  String? get lastActivityTypeName;
  @override
  @JsonKey(name: 'Total')
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$LeadByActivityImplCopyWith<_$LeadByActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadByIndustryGrowth _$LeadByIndustryGrowthFromJson(Map<String, dynamic> json) {
  return _LeadByIndustryGrowth.fromJson(json);
}

/// @nodoc
mixin _$LeadByIndustryGrowth {
  @JsonKey(name: 'PoTypeID')
  int? get poTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PoType')
  String? get poType => throw _privateConstructorUsedError;
  @JsonKey(name: 'Year')
  int? get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'Month')
  int? get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total')
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadByIndustryGrowthCopyWith<LeadByIndustryGrowth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadByIndustryGrowthCopyWith<$Res> {
  factory $LeadByIndustryGrowthCopyWith(LeadByIndustryGrowth value,
          $Res Function(LeadByIndustryGrowth) then) =
      _$LeadByIndustryGrowthCopyWithImpl<$Res, LeadByIndustryGrowth>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PoTypeID') int? poTypeId,
      @JsonKey(name: 'PoType') String? poType,
      @JsonKey(name: 'Year') int? year,
      @JsonKey(name: 'Month') int? month,
      @JsonKey(name: 'Total') int total});
}

/// @nodoc
class _$LeadByIndustryGrowthCopyWithImpl<$Res,
        $Val extends LeadByIndustryGrowth>
    implements $LeadByIndustryGrowthCopyWith<$Res> {
  _$LeadByIndustryGrowthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poTypeId = freezed,
    Object? poType = freezed,
    Object? year = freezed,
    Object? month = freezed,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      poTypeId: freezed == poTypeId
          ? _value.poTypeId
          : poTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      poType: freezed == poType
          ? _value.poType
          : poType // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadByIndustryGrowthImplCopyWith<$Res>
    implements $LeadByIndustryGrowthCopyWith<$Res> {
  factory _$$LeadByIndustryGrowthImplCopyWith(_$LeadByIndustryGrowthImpl value,
          $Res Function(_$LeadByIndustryGrowthImpl) then) =
      __$$LeadByIndustryGrowthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PoTypeID') int? poTypeId,
      @JsonKey(name: 'PoType') String? poType,
      @JsonKey(name: 'Year') int? year,
      @JsonKey(name: 'Month') int? month,
      @JsonKey(name: 'Total') int total});
}

/// @nodoc
class __$$LeadByIndustryGrowthImplCopyWithImpl<$Res>
    extends _$LeadByIndustryGrowthCopyWithImpl<$Res, _$LeadByIndustryGrowthImpl>
    implements _$$LeadByIndustryGrowthImplCopyWith<$Res> {
  __$$LeadByIndustryGrowthImplCopyWithImpl(_$LeadByIndustryGrowthImpl _value,
      $Res Function(_$LeadByIndustryGrowthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poTypeId = freezed,
    Object? poType = freezed,
    Object? year = freezed,
    Object? month = freezed,
    Object? total = null,
  }) {
    return _then(_$LeadByIndustryGrowthImpl(
      poTypeId: freezed == poTypeId
          ? _value.poTypeId
          : poTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      poType: freezed == poType
          ? _value.poType
          : poType // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadByIndustryGrowthImpl implements _LeadByIndustryGrowth {
  const _$LeadByIndustryGrowthImpl(
      {@JsonKey(name: 'PoTypeID') this.poTypeId,
      @JsonKey(name: 'PoType') this.poType,
      @JsonKey(name: 'Year') this.year,
      @JsonKey(name: 'Month') this.month,
      @JsonKey(name: 'Total') this.total = 0});

  factory _$LeadByIndustryGrowthImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadByIndustryGrowthImplFromJson(json);

  @override
  @JsonKey(name: 'PoTypeID')
  final int? poTypeId;
  @override
  @JsonKey(name: 'PoType')
  final String? poType;
  @override
  @JsonKey(name: 'Year')
  final int? year;
  @override
  @JsonKey(name: 'Month')
  final int? month;
  @override
  @JsonKey(name: 'Total')
  final int total;

  @override
  String toString() {
    return 'LeadByIndustryGrowth(poTypeId: $poTypeId, poType: $poType, year: $year, month: $month, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadByIndustryGrowthImpl &&
            (identical(other.poTypeId, poTypeId) ||
                other.poTypeId == poTypeId) &&
            (identical(other.poType, poType) || other.poType == poType) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, poTypeId, poType, year, month, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadByIndustryGrowthImplCopyWith<_$LeadByIndustryGrowthImpl>
      get copyWith =>
          __$$LeadByIndustryGrowthImplCopyWithImpl<_$LeadByIndustryGrowthImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadByIndustryGrowthImplToJson(
      this,
    );
  }
}

abstract class _LeadByIndustryGrowth implements LeadByIndustryGrowth {
  const factory _LeadByIndustryGrowth(
      {@JsonKey(name: 'PoTypeID') final int? poTypeId,
      @JsonKey(name: 'PoType') final String? poType,
      @JsonKey(name: 'Year') final int? year,
      @JsonKey(name: 'Month') final int? month,
      @JsonKey(name: 'Total') final int total}) = _$LeadByIndustryGrowthImpl;

  factory _LeadByIndustryGrowth.fromJson(Map<String, dynamic> json) =
      _$LeadByIndustryGrowthImpl.fromJson;

  @override
  @JsonKey(name: 'PoTypeID')
  int? get poTypeId;
  @override
  @JsonKey(name: 'PoType')
  String? get poType;
  @override
  @JsonKey(name: 'Year')
  int? get year;
  @override
  @JsonKey(name: 'Month')
  int? get month;
  @override
  @JsonKey(name: 'Total')
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$LeadByIndustryGrowthImplCopyWith<_$LeadByIndustryGrowthImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LeadByCategoryGrowth _$LeadByCategoryGrowthFromJson(Map<String, dynamic> json) {
  return _LeadByCategoryGrowth.fromJson(json);
}

/// @nodoc
mixin _$LeadByCategoryGrowth {
  @JsonKey(name: 'CustomerTypeName')
  String? get customerTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Year')
  int? get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'Month')
  int? get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total')
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadByCategoryGrowthCopyWith<LeadByCategoryGrowth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadByCategoryGrowthCopyWith<$Res> {
  factory $LeadByCategoryGrowthCopyWith(LeadByCategoryGrowth value,
          $Res Function(LeadByCategoryGrowth) then) =
      _$LeadByCategoryGrowthCopyWithImpl<$Res, LeadByCategoryGrowth>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CustomerTypeName') String? customerTypeName,
      @JsonKey(name: 'Year') int? year,
      @JsonKey(name: 'Month') int? month,
      @JsonKey(name: 'Total') int total});
}

/// @nodoc
class _$LeadByCategoryGrowthCopyWithImpl<$Res,
        $Val extends LeadByCategoryGrowth>
    implements $LeadByCategoryGrowthCopyWith<$Res> {
  _$LeadByCategoryGrowthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerTypeName = freezed,
    Object? year = freezed,
    Object? month = freezed,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      customerTypeName: freezed == customerTypeName
          ? _value.customerTypeName
          : customerTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadByCategoryGrowthImplCopyWith<$Res>
    implements $LeadByCategoryGrowthCopyWith<$Res> {
  factory _$$LeadByCategoryGrowthImplCopyWith(_$LeadByCategoryGrowthImpl value,
          $Res Function(_$LeadByCategoryGrowthImpl) then) =
      __$$LeadByCategoryGrowthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CustomerTypeName') String? customerTypeName,
      @JsonKey(name: 'Year') int? year,
      @JsonKey(name: 'Month') int? month,
      @JsonKey(name: 'Total') int total});
}

/// @nodoc
class __$$LeadByCategoryGrowthImplCopyWithImpl<$Res>
    extends _$LeadByCategoryGrowthCopyWithImpl<$Res, _$LeadByCategoryGrowthImpl>
    implements _$$LeadByCategoryGrowthImplCopyWith<$Res> {
  __$$LeadByCategoryGrowthImplCopyWithImpl(_$LeadByCategoryGrowthImpl _value,
      $Res Function(_$LeadByCategoryGrowthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerTypeName = freezed,
    Object? year = freezed,
    Object? month = freezed,
    Object? total = null,
  }) {
    return _then(_$LeadByCategoryGrowthImpl(
      customerTypeName: freezed == customerTypeName
          ? _value.customerTypeName
          : customerTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadByCategoryGrowthImpl implements _LeadByCategoryGrowth {
  const _$LeadByCategoryGrowthImpl(
      {@JsonKey(name: 'CustomerTypeName') this.customerTypeName,
      @JsonKey(name: 'Year') this.year,
      @JsonKey(name: 'Month') this.month,
      @JsonKey(name: 'Total') this.total = 0});

  factory _$LeadByCategoryGrowthImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadByCategoryGrowthImplFromJson(json);

  @override
  @JsonKey(name: 'CustomerTypeName')
  final String? customerTypeName;
  @override
  @JsonKey(name: 'Year')
  final int? year;
  @override
  @JsonKey(name: 'Month')
  final int? month;
  @override
  @JsonKey(name: 'Total')
  final int total;

  @override
  String toString() {
    return 'LeadByCategoryGrowth(customerTypeName: $customerTypeName, year: $year, month: $month, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadByCategoryGrowthImpl &&
            (identical(other.customerTypeName, customerTypeName) ||
                other.customerTypeName == customerTypeName) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, customerTypeName, year, month, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadByCategoryGrowthImplCopyWith<_$LeadByCategoryGrowthImpl>
      get copyWith =>
          __$$LeadByCategoryGrowthImplCopyWithImpl<_$LeadByCategoryGrowthImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadByCategoryGrowthImplToJson(
      this,
    );
  }
}

abstract class _LeadByCategoryGrowth implements LeadByCategoryGrowth {
  const factory _LeadByCategoryGrowth(
      {@JsonKey(name: 'CustomerTypeName') final String? customerTypeName,
      @JsonKey(name: 'Year') final int? year,
      @JsonKey(name: 'Month') final int? month,
      @JsonKey(name: 'Total') final int total}) = _$LeadByCategoryGrowthImpl;

  factory _LeadByCategoryGrowth.fromJson(Map<String, dynamic> json) =
      _$LeadByCategoryGrowthImpl.fromJson;

  @override
  @JsonKey(name: 'CustomerTypeName')
  String? get customerTypeName;
  @override
  @JsonKey(name: 'Year')
  int? get year;
  @override
  @JsonKey(name: 'Month')
  int? get month;
  @override
  @JsonKey(name: 'Total')
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$LeadByCategoryGrowthImplCopyWith<_$LeadByCategoryGrowthImpl>
      get copyWith => throw _privateConstructorUsedError;
}
