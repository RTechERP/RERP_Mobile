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
      // Đánh dấu đã scan xong, chuyển sang giai đoạn gọi API
      setState(() => _isProcessing = false);
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
      body: BlocConsumer<BusinessCardBloc, BusinessCardState>(
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
        buildWhen: (prev, curr) => prev.status != curr.status,
        builder: (context, state) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // Loading state với message động
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
                      _getLoadingMessage(state.status),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _getLoadingDescription(state.status),
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.7),
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
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
          );
        },
      ),
    );
  }

  /// Trả về message phù hợp với trạng thái hiện tại.
  String _getLoadingMessage(BaseStateStatus status) {
    if (_isProcessing) {
      return 'Đang mở máy quét...';
    }
    
    switch (status) {
      case BaseStateStatus.loading:
        return 'Đang xử lý AI...';
      default:
        return 'Đang xử lý...';
    }
  }

  /// Trả về mô tả chi tiết cho từng trạng thái.
  String _getLoadingDescription(BaseStateStatus status) {
    if (_isProcessing) {
      return 'Vui lòng chụp ảnh danh thiếp';
    }
    
    switch (status) {
      case BaseStateStatus.loading:
        return 'AI đang trích xuất thông tin từ danh thiếp\nVui lòng chờ trong giây lát...';
      default:
        return '';
    }
  }
}
