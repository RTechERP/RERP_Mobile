part of 'sale_gdn_bloc.dart';

@freezed
class SaleGdnEvent with _$SaleGdnEvent {
  const factory SaleGdnEvent.init() = _Init;
  const factory SaleGdnEvent.fetchGdns() = _FetchGdns;
  const factory SaleGdnEvent.searchByKeyword(String keyword) = _SearchByKeyword;
  const factory SaleGdnEvent.searchByVoucherNumber(String voucherNumber) = _SearchByVoucherNumber;
  const factory SaleGdnEvent.clearSearch() = _ClearSearch;
  const factory SaleGdnEvent.scanQrCode(String code) = _ScanQrCode;
}
