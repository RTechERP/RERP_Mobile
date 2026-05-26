import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../di/injection.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../data/datasource/models/work_requirement_model.dart';
import '../bloc/work_requirement_bloc.dart';

class WorkRequirementDetailScreen extends StatelessWidget {
  const WorkRequirementDetailScreen({
    super.key,
    int? itemId,
    WorkRequirementItem? item,
  }) : item = item ?? null,
       itemId = itemId ?? 0;

  final WorkRequirementItem? item;
  final int? itemId;

  @override
  Widget build(BuildContext context) {
    final effectiveId = item?.id ?? itemId ?? 0;
    return BlocProvider(
      create: (_) =>
          getIt<WorkRequirementBloc>()..add(WorkRequirementEvent.initDetail(effectiveId)),
      child: _WorkRequirementDetailContent(
        itemId: effectiveId,
        item: item,
      ),
    );
  }
}

class _WorkRequirementDetailContent extends StatelessWidget {
  const _WorkRequirementDetailContent({
    required this.itemId,
    required this.item,
  });

  final int itemId;
  final WorkRequirementItem? item;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkRequirementBloc, WorkRequirementState>(
      listenWhen: (prev, curr) =>
          prev.isDetailLoading != curr.isDetailLoading ||
          prev.status != curr.status ||
          prev.message != curr.message,
      listener: (context, state) {
        if (state.status == BaseStateStatus.failed &&
            state.message != null) {
          context.showMessage(state.message!, type: SnackBarType.error);
        }
      },
      builder: (context, state) {
        final canEdit = item != null && item!.isApprovedTBP != true;
        return BaseScaffold(
          appBar: AppBarCommon(
            title: const Text('Chi tiết yêu cầu'),
            onBackTap: () => context.pop(),
            actions: [
              if (canEdit)
                IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  tooltip: 'Chỉnh sửa',
                  onPressed: () async {
                    final result = await context.push<bool>(
                      RouteNames.workRequirementEdit,
                      extra: item,
                    );
                    if (result == true && context.mounted) {
                      context.pop(true);
                    }
                  },
                ),
            ],
          ),
          body: state.isDetailLoading
              ? const Center(child: CircularProgressIndicator())
              : state.detailData == null
                  ? _buildEmptyState()
                  : _buildContent(context, state.detailData!),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 64, color: AppColors.gray),
          SizedBox(height: 16),
          Text(
            'Không có dữ liệu',
            style: TextStyle(color: AppColors.gray, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, WorkRequirementDetailData data) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (data.detailsCategory != null && data.detailsCategory!.isNotEmpty)
            _buildInfoCard(data.detailsCategory!.first),
          const SizedBox(height: 16),
          if (data.approves != null && data.approves!.isNotEmpty)
            _buildApproveStepper(data.approves!),
          const SizedBox(height: 16),
          if (data.details != null && data.details!.isNotEmpty)
            _buildDetailsSection(data.details!),
          const SizedBox(height: 16),
          if (data.files != null && data.files!.isNotEmpty)
            _buildFilesSection(data.files!),
        ],
      ),
    );
  }

  Widget _buildInfoCard(WorkRequirementDetailCategory info) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryERP.withValues(alpha: 0.08),
            AppColors.primaryERP.withValues(alpha: 0.02),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryERP.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          _buildInfoHeader(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildInfoGridItem(
                  icon: Icons.person_outline,
                  label: 'Người yêu cầu',
                  value: info.requestedBy ?? '-',
                  color: AppColors.secondaryERP,
                ),
                _buildInfoGridItem(
                  icon: Icons.description_outlined,
                  label: 'Nội dung yêu cầu',
                  value: info.requestContent ?? '-',
                  color: AppColors.primaryERP,
                ),
                _buildInfoGridItem(
                  icon: Icons.help_outline,
                  label: 'Lý do',
                  value: info.reason ?? '-',
                  color: AppColors.warning,
                ),
                _buildInfoGridItem(
                  icon: Icons.location_on_outlined,
                  label: 'Địa điểm',
                  value: info.location ?? '-',
                  color: AppColors.stateInfoColor,
                ),
                _buildInfoGridItem(
                  icon: Icons.calendar_today_outlined,
                  label: 'Thời gian hoàn thành',
                  value: info.deadlineDate ?? '-',
                  color: AppColors.alert,
                ),
              ],
            ),
          ),
          _buildQuantityQualityRow(info),
        ],
      ),
    );
  }

  Widget _buildInfoHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryERP.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryERP,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.assignment_outlined, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          const Text(
            'Thông tin yêu cầu',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.heading,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoGridItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 18, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.heading,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityQualityRow(WorkRequirementDetailCategory info) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildMiniStat(
              label: 'Số lượng - Đơn vị tính',
              value: '${info.quantity ?? '-'}${info.unit?.isNotEmpty == true ? ' - ${info.unit}' : ''}',
            ),
          ),
          Container(
            width: 1,
            height: 40,
            color: AppColors.borderColor,
          ),
          Expanded(
            child: _buildMiniStat(
              label: 'Chất lượng',
              value: info.quality ?? '-',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniStat({
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.gray,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryERP,
          ),
        ),
      ],
    );
  }

  void _openFullScreenMedia(BuildContext ctx, List<WorkRequirementFileItem> media, int index) {
    showDialog(
      context: ctx,
      barrierColor: Colors.black,
      builder: (ctx) => _FullScreenMediaViewer(media: media, initialIndex: index),
    );
  }

  Widget _buildApproveStepper(List<WorkRequirementApproveItem> approves) {
    final lastApprovedIndex = approves.lastIndexWhere((a) => a.isApproved == 1);
    final activeStep = lastApprovedIndex >= 0
        ? (lastApprovedIndex < approves.length - 1 ? lastApprovedIndex + 1 : lastApprovedIndex)
        : 0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildApproveHeader(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: List.generate(approves.length, (index) {
                final item = approves[index];
                final isApproved = item.isApproved == 1;
                final isActive = index == activeStep;
                final isLast = index == approves.length - 1;

                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildVerticalStepIndicator(
                        isApproved: isApproved,
                        isActive: isActive,
                        isLast: isLast,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
                          child: _buildStepContent(item, isApproved, isActive),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalStepIndicator({
    required bool isApproved,
    required bool isActive,
    required bool isLast,
  }) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isApproved
                ? AppColors.stateSuccessColor
                : (isActive ? AppColors.primaryERP : AppColors.bgCard),
            shape: BoxShape.circle,
            border: Border.all(
              color: isApproved
                  ? AppColors.stateSuccessColor
                  : (isActive ? AppColors.primaryERP : AppColors.borderColor),
              width: 2,
            ),
          ),
          child: Icon(
            isApproved ? Icons.check : Icons.schedule,
            size: 18,
            color: isApproved
                ? Colors.white
                : (isActive ? Colors.white : AppColors.hintText),
          ),
        ),
        if (!isLast)
          Expanded(
            child: Container(
              width: 2,
              color: isApproved
                  ? AppColors.stateSuccessColor
                  : AppColors.borderColor,
            ),
          ),
      ],
    );
  }

  Widget _buildStepContent(WorkRequirementApproveItem item, bool isApproved, bool isActive) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primaryERP.withValues(alpha: 0.08)
            : AppColors.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive
              ? AppColors.primaryERP.withValues(alpha: 0.3)
              : AppColors.borderColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.stepName ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isApproved ? AppColors.stateSuccessColor : AppColors.heading,
                  ),
                ),
                const SizedBox(height: 4),
                if ((item.employeeName ?? '').isNotEmpty)
                  Row(
                    children: [
                      const Icon(Icons.person_outline, size: 14, color: AppColors.gray),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item.employeeName!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.label,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                if (item.dateApproved != null)
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 14, color: AppColors.gray),
                      const SizedBox(width: 4),
                      Text(
                        DateFormat('dd/MM/yyyy HH:mm').format(item.dateApproved!),
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                if ((item.reasonCancel ?? '').isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.alert.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.cancel_outlined, size: 14, color: AppColors.alert),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            item.reasonCancel!,
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.alert,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: isApproved
                  ? AppColors.stateSuccessColor.withValues(alpha: 0.15)
                  : AppColors.supportBtn,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              isApproved ? 'Đã duyệt' : 'Đang chờ',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isApproved ? AppColors.stateSuccessColor : AppColors.hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApproveHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.stateInfoColor.withValues(alpha: 0.08),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.stateInfoColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.history, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          const Text(
            'Lịch sử duyệt',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.heading,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection(List<WorkRequirementDetailResponse> details) {
    // Lọc bỏ các details trùng với detailsCategory
    final filteredDetails = details.where((d) {
      final catName = d.category?.toLowerCase().trim();
      return catName != null;
    }).toList();

    if (filteredDetails.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 12),
          child: Row(
            children: [
              Icon(Icons.list_alt, size: 20, color: AppColors.heading),
              SizedBox(width: 8),
              Text(
                'Đề mục yêu cầu',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                ),
              ),
            ],
          ),
        ),
        ...filteredDetails.map((d) => _DetailExpandCard(item: d)),
      ],
    );
  }

  List<String> _getImageExtensions() => ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp'];
  List<String> _getVideoExtensions() => ['mp4', 'mov', 'avi', 'mkv', 'webm', '3gp'];
  List<String> _getDocExtensions() => ['pdf', 'doc', 'docx', 'xls', 'xlsx'];

  bool _isImage(String? fileName) {
    if (fileName == null) return false;
    final ext = fileName.split('.').last.toLowerCase();
    return _getImageExtensions().contains(ext);
  }

  bool _isVideo(String? fileName) {
    if (fileName == null) return false;
    final ext = fileName.split('.').last.toLowerCase();
    return _getVideoExtensions().contains(ext);
  }

  bool _isDoc(String? fileName) {
    if (fileName == null) return false;
    final ext = fileName.split('.').last.toLowerCase();
    return _getDocExtensions().contains(ext);
  }

  String _fixFileUrl(String? path) {
    if (path == null || path.isEmpty) return '';

    const newPrefix = 'https://erp.rtc.edu.vn/api/api/share';

    // Thêm http:// nếu thiếu scheme (//192.168.1.190/... → http://192.168.1.190/...)
    final normalized = path.startsWith('//')
        ? 'https:${path}'
        : path;

    if (normalized.contains('192.168.1.190')) {
      final relative = normalized.split('192.168.1.190').last;
      return '$newPrefix$relative';
    }
    if (normalized.startsWith('http://') || normalized.startsWith('https://')) {
      return normalized;
    }
    return 'http://$normalized';
  }

  Widget _buildFilesSection(List<WorkRequirementFileItem> files) {
    final images = files.where((f) => _isImage(f.filePath) || _isVideo(f.filePath)).toList();
    final docs = files.where((f) => _isDoc(f.filePath)).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 12),
          child: Row(
            children: [
              Icon(Icons.attach_file, size: 20, color: AppColors.heading),
              SizedBox(width: 8),
              Text(
                'File đính kèm',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                ),
              ),
            ],
          ),
        ),
        if (images.isNotEmpty) _buildMediaCarousel(images),
        if (docs.isNotEmpty) ...[
          if (images.isNotEmpty) const SizedBox(height: 12),
          _buildDocList(docs),
        ],
        if (files.isEmpty)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.bgCard,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'Không có file đính kèm',
                style: TextStyle(color: AppColors.gray, fontSize: 13),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildMediaCarousel(List<WorkRequirementFileItem> media) {
    if (media.isEmpty) return const SizedBox.shrink();

    final controller = PageController();

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: controller,
            itemCount: media.length,
            itemBuilder: (context, index) {
              final item = media[index];
              final isVideo = _isVideo(item.filePath);
              final url = _fixFileUrl(item.filePath);

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.bgCard,
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (isVideo)
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.primaryERP.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.play_circle_fill,
                                size: 48,
                                color: AppColors.primaryERP,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                item.fileName ?? '',
                                style: const TextStyle(
                                  color: AppColors.heading,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      GestureDetector(
                        onTap: () => _openFullScreenMedia(context, media, index),
                        child: Stack(
                          children: [
                            SizedBox.expand(
                              child: WebViewWidget(
                                controller: WebViewController()
                                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                                  ..setBackgroundColor(Colors.transparent)
                                  ..setNavigationDelegate(NavigationDelegate(
                                    onProgress: (progress) {},
                                    onPageStarted: (_) {},
                                    onPageFinished: (_) {},
                                  ))
                                  ..loadRequest(Uri.parse(url)),
                              ),
                            ),
                            Positioned.fill(child: Container(color: Colors.transparent)),
                          ],
                        ),
                      ),
                    Positioned(
                      right: 8,
                      bottom: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${index + 1}/${media.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDocList(List<WorkRequirementFileItem> docs) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        children: docs.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isLast = index == docs.length - 1;

          return Column(
            children: [
              _buildDocItem(item),
              if (!isLast) const Divider(height: 1),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDocItem(WorkRequirementFileItem item) {
    final ext = (item.fileName ?? '').split('.').last.toLowerCase();
    final isPdf = ext == 'pdf';
    final isWord = ['doc', 'docx'].contains(ext);
    final isExcel = ['xls', 'xlsx'].contains(ext);

    IconData docIcon;
    Color docColor;
    if (isPdf) {
      docIcon = Icons.picture_as_pdf;
      docColor = Colors.red;
    } else if (isWord) {
      docIcon = Icons.description;
      docColor = AppColors.stateInfoColor;
    } else if (isExcel) {
      docIcon = Icons.table_chart;
      docColor = AppColors.stateSuccessColor;
    } else {
      docIcon = Icons.insert_drive_file;
      docColor = AppColors.gray;
    }

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: docColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(docIcon, color: docColor, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.fileName ?? '',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (item.createdDate != null)
                    Text(
                      DateFormat('dd/MM/yyyy').format(item.createdDate!),
                      style: const TextStyle(fontSize: 11, color: AppColors.gray),
                    ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryERP.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.download, size: 16, color: AppColors.primaryERP),
                  SizedBox(width: 4),
                  Text(
                    'Tải về',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryERP,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FullScreenMediaViewer extends StatefulWidget {
  const _FullScreenMediaViewer({required this.media, required this.initialIndex});

  final List<WorkRequirementFileItem> media;
  final int initialIndex;

  @override
  State<_FullScreenMediaViewer> createState() => _FullScreenMediaViewerState();
}

class _FullScreenMediaViewerState extends State<_FullScreenMediaViewer> {
  late PageController _controller;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _fixFileUrl(String? path) {
    if (path == null || path.isEmpty) return '';

    const newPrefix = 'https://erp.rtc.edu.vn/api/api/share';

    // Thêm http:// nếu thiếu scheme (//192.168.1.190/... → http://192.168.1.190/...)
    final normalized = path.startsWith('//')
        ? 'https:${path}'
        : path;

    if (normalized.contains('192.168.1.190')) {
      final relative = normalized.split('192.168.1.190').last;
      return '$newPrefix$relative';
    }
    if (normalized.startsWith('http://') || normalized.startsWith('https://')) {
      return normalized;
    }
    return 'http://$normalized';
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: widget.media.length,
          onPageChanged: (index) => setState(() => _currentIndex = index),
          itemBuilder: (context, index) {
            final item = widget.media[index];

            return InteractiveViewer(
              minScale: 0.5,
              maxScale: 4.0,
              child: Center(
                child: WebViewWidget(
                  controller: WebViewController()
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..setBackgroundColor(Colors.black)
                    ..setNavigationDelegate(NavigationDelegate(
                      onProgress: (progress) {},
                      onPageStarted: (_) {},
                      onPageFinished: (_) {},
                    ))
                    ..loadRequest(Uri.parse(_fixFileUrl(item.filePath))),
                ),
              ),
            );
          },
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '${_currentIndex + 1} / ${widget.media.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close, color: Colors.white, size: 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailExpandCard extends StatefulWidget {
  const _DetailExpandCard({required this.item});

  final WorkRequirementDetailResponse item;

  @override
  State<_DetailExpandCard> createState() => _DetailExpandCardState();
}

class _DetailExpandCardState extends State<_DetailExpandCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _isExpanded 
              ? AppColors.primaryERP.withValues(alpha: 0.4)
              : AppColors.borderColor,
          width: _isExpanded ? 1.5 : 1,
        ),
        boxShadow: _isExpanded
            ? [
                BoxShadow(
                  color: AppColors.primaryERP.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.primaryERP, AppColors.primaryERP.withValues(alpha: 0.8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${widget.item.stt ?? 0}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(
                    _getCategoryIcon(widget.item.category ?? ''),
                    size: 20,
                    color: AppColors.primaryERP,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.category ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.heading,
                          ),
                        ),
                        if (widget.item.description?.isNotEmpty == true)
                          Text(
                            widget.item.description!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.gray,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: _isExpanded ? AppColors.primaryERP : AppColors.gray,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: _isExpanded ? _buildExpandedContent() : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'noi dung yeu cau':
        return Icons.description_outlined;
      case 'nguoi yeu cau':
        return Icons.person_outline;
      case 'ly do':
        return Icons.help_outline;
      case 'so luong':
        return Icons.tag;
      case 'don vi tinh':
        return Icons.straighten;
      case 'chat luong':
        return Icons.verified_outlined;
      case 'dia diem':
        return Icons.location_on_outlined;
      case 'thoi gian hoan thanh de nghi':
        return Icons.schedule;
      default:
        return Icons.article_outlined;
    }
  }

  Widget _buildExpandedContent() {
    final hasContent = widget.item.description?.isNotEmpty == true ||
        widget.item.target?.isNotEmpty == true ||
        widget.item.note?.isNotEmpty == true;

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Column(
        children: [
          const Divider(height: 1),
          const SizedBox(height: 12),
          if (hasContent) ...[
            if (widget.item.description?.isNotEmpty == true)
              _buildDetailField(
                icon: Icons.short_text,
                label: 'Diễn giải',
                value: widget.item.description ?? '',
              ),
            if (widget.item.target?.isNotEmpty == true)
              _buildDetailField(
                icon: Icons.flag_outlined,
                label: 'Mục tiêu cần đạt',
                value: widget.item.target ?? '',
              ),
            if (widget.item.note?.isNotEmpty == true)
              _buildDetailField(
                icon: Icons.note_outlined,
                label: 'Ghi chú',
                value: widget.item.note ?? '',
              ),
          ] else
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.info_outline, size: 16, color: AppColors.hintText),
                  const SizedBox(width: 8),
                  const Text(
                    'Không có nội dung',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.hintText,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDetailField({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: AppColors.gray),
          const SizedBox(width: 8),
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.gray,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.heading,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
