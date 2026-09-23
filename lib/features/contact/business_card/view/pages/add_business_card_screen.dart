import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/bloc/index.dart';
import '../../../../../common/utils/snack_bar_helper.dart';
import '../bloc/business_card_bloc.dart';

/// Màn hình quét danh thiếp sử dụng cunning_document_scanner.
///
/// Sử dụng iOS VisionKit / Android Document Scanner native để:
/// - Tự động phát hiện cạnh danh thiếp
/// - Tự động chỉnh sửa perspective
/// - Cắt ảnh tự động
///
/// Sau khi quét xong → gửi ảnh đã cắt sang BLoC để OCR.
class AddBusinessCardScreen extends StatefulWidget {
  const AddBusinessCardScreen({super.key});

  @override
  State<AddBusinessCardScreen> createState() => _AddBusinessCardScreenState();
}

class _AddBusinessCardScreenState extends State<AddBusinessCardScreen> {
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _startScanning();
  }

  Future<void> _startScanning() async {
    if (_isProcessing) return;
    setState(() => _isProcessing = true);

    try {
      final docs = await CunningDocumentScanner.getPictures(
        noOfPages: 1,
        androidScannerMode: AndroidScannerMode.base,
      );

      if (!mounted) return;

      if (docs == null || docs.isEmpty) {
        // User hủy hoặc không có ảnh → quay về
        Navigator.pop(context);
        return;
      }

      final path = docs.first;
      context.read<BusinessCardBloc>().add(BusinessCardEvent.scanCard(path));
    } on CunningDocumentScannerException catch (e) {
      if (!mounted) return;
      SnackBarHelper().showError(context, 'Lỗi khi quét: ${e.message}');
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      SnackBarHelper().showError(context, 'Lỗi khi quét: $e');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<BusinessCardBloc, BusinessCardState>(
        listenWhen: (prev, curr) => prev.status != curr.status,
        listener: (context, state) {
          if (state.status == BaseStateStatus.success &&
              state.scannedData.isNotEmpty) {
            Navigator.pop(context, state.scannedData);
          } else if (state.status == BaseStateStatus.failed) {
            SnackBarHelper().showError(
              context,
              state.message ?? 'Lỗi khi quét danh thiếp',
            );
            Navigator.pop(context);
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Loading state khi đang xử lý
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 48,
                    height: 48,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _isProcessing ? 'Đang mở máy quét...' : 'Đang xử lý...',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Nút hủy
            Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              left: 8,
              right: 8,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close, color: Colors.white, size: 22),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Quét danh thiếp',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
