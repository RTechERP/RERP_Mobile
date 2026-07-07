import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/constants/index.dart';
import 'package:rtc_erp/common/utils/snack_bar_helper.dart';
import 'package:rtc_erp/features/workplace/app/general_form/data/datasource/model/general_form_model.dart';
import 'package:rtc_erp/features/workplace/app/general_form/view/bloc/general_form_bloc.dart';

import '../../../../../../base/network/errors/extension.dart';

class GeneralFormDetailScreen extends StatefulWidget {
  const GeneralFormDetailScreen({
    super.key,
    required this.documentId,
    required this.documentName,
  });

  final int documentId;
  final String documentName;

  @override
  State<GeneralFormDetailScreen> createState() => _GeneralFormDetailScreenState();
}

class _GeneralFormDetailScreenState extends State<GeneralFormDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GeneralFormBloc>().add(
            GeneralFormEvent.fetchDetail(documentId: widget.documentId),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GeneralFormBloc, GeneralFormState>(
      listenWhen: (prev, curr) => prev.downloadMessage != curr.downloadMessage,
      listener: (context, state) {
        if (state.downloadMessage != null) {
          final isSuccess = state.downloadMessage!.contains('thành công');
          context.showMessage(
            state.downloadMessage!,
            type: isSuccess ? SnackBarType.success : SnackBarType.error,
          );
        }
      },
      child: BlocBuilder<GeneralFormBloc, GeneralFormState>(
        builder: (context, state) {
          return BaseScaffold(
            backgroundColor: const Color(0xFFF4F7FB),
            appBar: AppBarCommon(
              onBackTap: () => context.pop(),
              title: Text(widget.documentName),
            ),
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, GeneralFormState state) {
    final isLoading = state.isDetailLoading;

    if (isLoading) {
      final skeletonItems = List.generate(3, (i) => _skeletonItem(i));
      return Skeletonizer(
        containersColor: AppColors.white,
        enabled: true,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: skeletonItems.length,
          itemBuilder: (context, index) => _FileTile(
            isDownloading: false,
            item: skeletonItems[index],
            onDownload: () {},
          ),
        ),
      );
    }

    if (state.detailFiles.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.missing, width: 280),
            const SizedBox(height: 10),
            const Text('Không có file đính kèm'),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<GeneralFormBloc>().add(
              GeneralFormEvent.fetchDetail(documentId: widget.documentId),
            );
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: state.detailFiles.length,
        itemBuilder: (context, index) {
          final file = state.detailFiles[index];
          return _FileTile(
            item: file,
            isDownloading: state.isDownloading,
            onDownload: () {
              // context.read<GeneralFormBloc>().add(
              //       GeneralFormEvent.downloadFile(
              //         fileName: file.fileName ?? 'file',
              //       ),
              //     );
            },
          );
        },
      ),
    );
  }

  static FormDetailItem _skeletonItem(int i) => FormDetailItem(
        id: i,
        fileName: 'Tên file skeleton data',
        fileNameOrigin: 'File skeleton $i.pdf',
        filePath: '/path/to/file.pdf',
        documentId: i,
      );
}

class _FileTile extends StatelessWidget {
  const _FileTile({
    required this.item,
    required this.isDownloading,
    required this.onDownload,
  });

  final FormDetailItem item;
  final bool isDownloading;
  final VoidCallback onDownload;

  String get _extension {
    final name = item.fileNameOrigin ?? item.fileName ?? '';
    final dotIndex = name.lastIndexOf('.');
    return dotIndex > 0 ? name.substring(dotIndex + 1).toUpperCase() : 'FILE';
  }

  IconData get _icon {
    switch (_extension.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'xls':
      case 'xlsx':
        return Icons.table_chart;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow;
      case 'png':
      case 'jpg':
      case 'jpeg':
        return Icons.image;
      default:
        return Icons.insert_drive_file;
    }
  }

  Color get _iconColor {
    switch (_extension.toLowerCase()) {
      case 'pdf':
        return Colors.red;
      case 'doc':
      case 'docx':
        return Colors.blue;
      case 'xls':
      case 'xlsx':
        return Colors.green;
      case 'ppt':
      case 'pptx':
        return Colors.orange;
      case 'png':
      case 'jpg':
      case 'jpeg':
        return Colors.purple;
      default:
        return AppColors.primaryERP;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryERP.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: _iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(_icon, color: _iconColor, size: 28),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.fileNameOrigin ?? item.fileName ?? 'Tệp đính kèm',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.enableText,
                      ),
                    ),
                    if (item.fileName != null && item.fileName!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        _extension,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: _iconColor,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 12),
              InkWell(
                onTap: onDownload,
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Icon(Icons.download_rounded, size: 18, color: AppColors.primaryERP),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
