// Date: 08/09/2026
// Nội dung/Chức năng: Màn quét QR trên bảng ESL.
//
// Flow:
//   1. Mở camera bằng overlay trên chính màn này (không push thêm page).
//   2. User quét được URL dạng:
//        {FRONTEND_BASE_URL}/esl-test-registration?barcode=XYZ&tableside=1
//   3. Parse `barcode` + `tableside` (1 hoặc 2).
//   4. Dispatch `TestTableEvent.findTestTableByBarcode` — bloc tự lookup
//      trong cache (gọi API nếu cache rỗng).
//   5. BlocListener:
//      - qrLookupMessage có lỗi → showError + đóng overlay scanner
//        để user có thể bấm nút "Quét lại".
//      - foundTestTable có giá trị → đóng scanner, navigate sang
//        TestTableAddScreen với `?testTableId={id}`.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../di/injection.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../bloc/test_table_bloc.dart';

/// Màn quét QR bàn test ESL.
/// Toàn bộ màn hình là camera — không có scaffold nền.
class TestTableQrScanScreen extends StatefulWidget {
  const TestTableQrScanScreen({super.key});

  @override
  State<TestTableQrScanScreen> createState() => _TestTableQrScanScreenState();
}

class _TestTableQrScanScreenState extends BaseShareState<
    TestTableQrScanScreen,
    TestTableEvent,
    TestTableState,
    TestTableBloc> {
  final MobileScannerController _scannerCtrl = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    // autoStart: true (mặc định) — widget tự khởi động camera khi mount.
  );

  /// Debounce các lần scan liên tiếp — chỉ xử lý lần scan cuối cùng
  /// sau khi user giữ yên 800ms.
  Timer? _debounceScan;

  /// Đã navigate sang add screen chưa — chặn listener xử lý lặp.
  bool _navigated = false;

  /// Key của lần dispatch gần nhất — tránh gửi trùng khi camera detect
  /// cùng QR liên tục.
  String? _lastDispatchedKey;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      // Reset trạng thái scan để tránh dùng lại foundTestTable cũ.
      bloc.add(const TestTableEvent.resetSubmitFlags());
    });
  }

  @override
  void dispose() {
    _debounceScan?.cancel();
    _scannerCtrl.dispose();
    super.dispose();
  }

  /// Parse URL dạng:
  ///   https://.../esl-test-registration?barcode=XYZ&tableside=1
  /// Trả về null nếu thiếu param hoặc tableside không phải 1/2.
  _DeepLinkParams? _parseDeepLink(String raw) {
    final uri = Uri.tryParse(raw.trim());
    if (uri == null) return null;

    // Chấp nhận mọi path — quan trọng là query params có barcode + tableside.
    final barcode = uri.queryParameters['barcode']?.trim();
    final sideRaw = uri.queryParameters['tableside']?.trim();
    if (barcode == null || barcode.isEmpty) return null;
    final side = int.tryParse(sideRaw ?? '');
    if (side == null || (side != 1 && side != 2)) return null;

    return _DeepLinkParams(barcode: barcode, tableSide: side);
  }

  /// Xử lý khi camera phát hiện mã QR.
  /// Debounce để chỉ nhận mã cuối cùng (tránh spam khi camera detect
  /// liên tục cùng 1 QR). Chỉ dispatch nếu QR mới khác QR vừa gửi.
  void _onDetect(BarcodeCapture capture) {
    if (_navigated) return;
    for (final b in capture.barcodes) {
      final raw = b.rawValue;
      if (raw == null || raw.isEmpty) continue;

      final parsed = _parseDeepLink(raw);
      if (parsed == null) continue;

      final key = '${parsed.barcode}|${parsed.tableSide}';
      if (key == _lastDispatchedKey) return;

      _lastDispatchedKey = key;
      _debounceScan?.cancel();
      _debounceScan = Timer(const Duration(milliseconds: 800), () {
        if (!mounted || _navigated) return;
        bloc.add(TestTableEvent.findTestTableByBarcode(
          barcode: parsed.barcode,
          tableSide: parsed.tableSide,
        ));
      });
      return;
    }
  }

  /// Xử lý kết quả lookup từ bloc.
  /// Chỉ trigger khi state có `qrLookupMessage` hoặc `foundTestTable` —
  /// bỏ qua emit reset (transient) của handler.
  @override
  void listener(BuildContext context, TestTableState state) {
    super.listener(context, state);

    if (_navigated) return;

    final found = state.foundTestTable;
    final msg = state.qrLookupMessage;

    // Bỏ qua emit transient (reset đầu handler: cả 2 field null).
    if (msg == null && found == null) return;

    if (msg != null && msg.isNotEmpty) {
      // Lỗi: không tìm thấy / bàn đang dùng → báo + reset để user có thể
      // quét lại cùng QR (ví dụ sau khi BE đã cập nhật trạng thái bàn).
      _lastDispatchedKey = null;
      getIt<SnackBarHelper>().showError(context, msg);
      return;
    }

    if (found != null && found.id != null) {
      _navigated = true;
      _navigateAndReload(found.id!);
    }
  }

  /// UI không cần rebuild khi state thay đổi vì dùng listener.

  /// Pop QR → push Add. Nếu Add submit thành công (pop true) → truyền
  /// giá trị đó lên cho List screen khi pop QR để List biết cần init().
  Future<void> _navigateAndReload(int testTableId) async {
    final reload = await context.push<bool?>(
      '${RouteNames.testTableAdd}?testTableId=$testTableId',
    );
    if (!mounted) return;
    // Truyền kết quả lên cho route phía dưới (List screen).
    context.pop(reload);
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

  @override
  Widget renderUI(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Quét QR trên bảng ESL'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: Stack(
        children: [
          // Camera
          MobileScanner(
            controller: _scannerCtrl,
            onDetect: _onDetect,
            errorBuilder: (context, error) => Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  _errorMessage(error),
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Khung quét
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
          // Gợi ý
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Column(
              children: [
                const Text(
                  'Đưa mã QR trên bảng ESL vào trong khung để quét',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                TextButton.icon(
                  onPressed: () => context.pop(),
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
}

class _DeepLinkParams {
  const _DeepLinkParams({required this.barcode, required this.tableSide});
  final String barcode;
  final int tableSide;
}
