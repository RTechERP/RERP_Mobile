import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Kết quả quét mã từ thiết bị PDA.
class PdaScanResult {
  const PdaScanResult(this.code);

  /// Mã quét được.
  final String code;
}

/// Helper tương tác với phần cứng PDA.
///
/// Gồm 2 phần:
/// - [isPdaDevice]: kiểm tra thiết bị hiện tại có phải PDA hay không
///   (dựa trên manufacturer / model của máy).
/// - [scanStream]: nhận kết quả quét từ phần cứng qua EventChannel, kèm
///   tín hiệu bấm nút quét native.
class PdaHelper {
  PdaHelper._();

  static final EventChannel _channel = EventChannel('vn.rtc.erp/scanner');
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// Stream kết quả quét + sự kiện bấm nút quét.
  ///
  /// Mỗi phần tử là một map:
  /// - `code`: mã quét được (chỉ có khi quét thành công).
  /// - `barcodeType`: mã số loại mã của máy quét (chỉ có khi quét thành công).
  /// - `keyEvent`: scanCode của nút quét native (chỉ có khi bấm nút).
  static Stream<Map<String, dynamic>> get scanStream {
    return _channel.receiveBroadcastStream().map((event) {
      if (event is Map) {
        final payload = Map<String, dynamic>.from(event);
        debugPrint('[PDA] nhận sự kiện quét: $payload');
        return payload;
      }
      final code = event.toString();
      debugPrint('[PDA] nhận mã quét: $code');
      return <String, dynamic>{'code': code};
    });
  }

  /// Danh sách manufacturer của các hãng PDA phổ biến.
  static const Set<String> _pdaManufacturers = {
    'zebra',
    'symbol',
    'urovo',
    'newland',
    'cipherlab',
    'datalogic',
    'honeywell',
    'unitech',
    'mobydata',
    'itecs',
    'chainway',
    'senor',
    'birch',
    'i2c',
  };

  /// Danh sách model đặc trưng của PDA (dùng khi manufacturer không khớp).
  static const List<String> _pdaModelKeywords = [
    'pda',
    'mc3',
    'mc33',
    'tc2',
    'tc5',
    'tc7',
    'rs3',
    'ds2',
    'ct4',
    'ct6',
    'ct8',
    'et4',
    'rt1',
    'sd8',
    'm9',
    'm93',
  ];

  /// Thiết bị hiện tại có phải PDA hay không.
  ///
  /// Trả về `false` nếu không lấy được thông tin thiết bị.
  static Future<bool> isPdaDevice() async {
    try {
      if (Platform.isAndroid) {
        final info = await _deviceInfo.androidInfo;
        final manufacturer = info.manufacturer.toLowerCase();
        final model = info.model.toLowerCase();

        debugPrint('[PDA] thiết bị: ${info.manufacturer} / ${info.model}');

        if (_pdaManufacturers.contains(manufacturer)) return true;
        return _pdaModelKeywords.any(
          (keyword) => model.contains(keyword),
        );
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  /// Thông tin manufacturer + model của thiết bị (để debug/log).
  static Future<String> describeDevice() async {
    try {
      if (Platform.isAndroid) {
        final info = await _deviceInfo.androidInfo;
        return '${info.manufacturer} ${info.model}';
      }
      if (Platform.isIOS) {
        final info = await _deviceInfo.iosInfo;
        return info.model;
      }
    } catch (e) {
      return 'unknown';
    }
    return 'unknown';
  }
}
