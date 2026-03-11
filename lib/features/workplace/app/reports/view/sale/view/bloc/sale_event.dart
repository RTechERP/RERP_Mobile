part of 'sale_bloc.dart';

@freezed
class SaleEvent with _$SaleEvent {
  const factory SaleEvent.init() = _Init;
  const factory SaleEvent.addWork() = _AddWork;

  const factory SaleEvent.removeWork({required int index}) = _RemoveWork;
  const factory SaleEvent.expandWork({required int index}) = _ExpandWork;

}