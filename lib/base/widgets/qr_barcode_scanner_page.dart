import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

/// Chế độ quét.
enum ScanMode {
  /// Chỉ quét mã QR.
  qr,

  /// Chỉ quét mã vạch.
  barcode,

  /// Hỗ trợ cả QR + Barcode.
  all,
}

/// Trang quét QR / Barcode sử dụng `mobile_scanner`.
/// Trả về chuỗi quét được qua `Navigator.pop` (hoặc `null` nếu huỷ).
class QrBarcodeScannerPage extends StatefulWidget {
  const QrBarcodeScannerPage({
    super.key,
    this.scanMode = ScanMode.all,
    this.title,
  });

  final ScanMode scanMode;
  final String? title;

  static Future<String?> open(
    BuildContext context, {
    ScanMode scanMode = ScanMode.all,
    String? title,
  }) {
    return Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => QrBarcodeScannerPage(
          scanMode: scanMode,
          title: title,
        ),
      ),
    );
  }

  @override
  State<QrBarcodeScannerPage> createState() => _QrBarcodeScannerPageState();
}

class _QrBarcodeScannerPageState extends State<QrBarcodeScannerPage> {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );
  bool _handled = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Lọc kết quả theo chế độ đang chọn.
  bool _isAccepted(BarcodeCapture capture) {
    if (widget.scanMode == ScanMode.all) return true;
    final allowed = _formatsForMode(widget.scanMode);
    return capture.barcodes.any((b) => allowed.contains(b.format));
  }

  /// Quay lại màn hình trước với kết quả quét được.
  void _onDetect(BarcodeCapture capture) {
    if (_handled) return;
    for (final b in capture.barcodes) {
      final value = b.rawValue;
      if (value != null && value.isNotEmpty) {
        _handled = true;
        Navigator.of(context).pop(value);
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(widget.title ?? _defaultTitle(widget.scanMode)),
        actions: [
          ValueListenableBuilder<MobileScannerState>(
            valueListenable: _controller,
            builder: (context, state, _) {
              final isOn = state.torchState == TorchState.on;
              return IconButton(
                icon: Icon(
                  isOn ? Icons.flash_on : Icons.flash_off,
                  color: Colors.white,
                ),
                onPressed: () => _controller.toggleTorch(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.cameraswitch, color: Colors.white),
            onPressed: () => _controller.switchCamera(),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _controller,
            errorBuilder: (context, error) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    _errorMessage(error),
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            onDetect: (capture) {
              if (_isAccepted(capture)) {
                _onDetect(capture);
              }
            },
          ),
          // Khung overlay
          Center(
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryERP, width: 3),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Column(
              children: [
                Text(
                  _hintText(widget.scanMode),
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                TextButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: Colors.white),
                  label: const Text(
                    'Huỷ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _defaultTitle(ScanMode mode) {
    switch (mode) {
      case ScanMode.qr:
        return 'Quét mã QR';
      case ScanMode.barcode:
        return 'Quét mã vạch';
      case ScanMode.all:
        return 'Quét mã';
    }
  }

  String _hintText(ScanMode mode) {
    switch (mode) {
      case ScanMode.qr:
        return 'Đưa mã QR vào trong khung để quét';
      case ScanMode.barcode:
        return 'Đưa mã vạch vào trong khung để quét';
      case ScanMode.all:
        return 'Đưa mã QR hoặc mã vạch vào trong khung để quét';
    }
  }

  String _errorMessage(MobileScannerException error) {
    switch (error.errorCode) {
      case MobileScannerErrorCode.permissionDenied:
        return 'Vui lòng cấp quyền truy cập camera trong cài đặt.';
      case MobileScannerErrorCode.unsupported:
        return 'Thiết bị không hỗ trợ camera.';
      case MobileScannerErrorCode.controllerUninitialized:
        return 'Camera chưa sẵn sàng, vui lòng thử lại.';
      default:
        return error.errorDetails?.message ??
            'Không thể khởi động camera (${error.errorCode.name}).';
    }
  }
}

/// Trả về danh sách format được phép theo chế độ quét.
List<BarcodeFormat> _formatsForMode(ScanMode mode) {
  final qrFormats = <BarcodeFormat>[
    BarcodeFormat.qrCode,
    BarcodeFormat.dataMatrix,
    BarcodeFormat.aztec,
    BarcodeFormat.pdf417,
  ];
  final barcodeFormats = <BarcodeFormat>[
    BarcodeFormat.code128,
    BarcodeFormat.code39,
    BarcodeFormat.code93,
    BarcodeFormat.dataBar,
    BarcodeFormat.dataBarExpanded,
    BarcodeFormat.dataBarLimited,
    BarcodeFormat.ean13,
    BarcodeFormat.ean8,
    BarcodeFormat.itf14,
    BarcodeFormat.upcA,
    BarcodeFormat.upcE,
  ];
  return mode == ScanMode.qr ? qrFormats : barcodeFormats;
}
