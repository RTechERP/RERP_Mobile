import 'dart:typed_data';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../../base/bloc/index.dart';
import '../../../../../../../common/app/app_config.dart';
import '../../../../../../../common/app_theme/app_bar_common.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../di/injection.dart';
import '../../../../../../base/network/errors/extension.dart';
import '../../data/datasource/models/newsfeed_model.dart';
import '../bloc/newsfeed_bloc.dart';
import '../widgets/newsfeed_calendar_widgets.dart';
import '../widgets/newsfeed_html_content_view.dart';
import '../widgets/newsfeed_month_picker.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NewsfeedBloc>()..add(const NewsfeedEvent.init()),
      child: const _NewsFeedView(),
    );
  }
}

class _NewsFeedView extends StatefulWidget {
  const _NewsFeedView();

  @override
  State<_NewsFeedView> createState() => _NewsFeedViewState();
}

class _NewsFeedViewState extends State<_NewsFeedView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _currentTabIndex = 0;

  static const _tabTitles = ['Bảng tin', 'Lịch làm việc'];
  static const _tabIcons = [Icons.campaign, Icons.calendar_month];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(_handleTabChanged);
  }

  void _handleTabChanged() {
    if (_tabController.indexIsChanging) return;
    if (_currentTabIndex == _tabController.index) return;
    setState(() {
      _currentTabIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController
      ..removeListener(_handleTabChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBarCommon(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                gradient: AppColors.gradientERP,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1FEE4623),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                _tabIcons[_currentTabIndex],
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              _tabTitles[_currentTabIndex],
              style: const TextStyle(
                color: AppColors.heading,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(58),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.bgCard,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFD9DEEA)),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: AppColors.primaryERP,
                unselectedLabelColor: AppColors.gray,
                splashBorderRadius: const BorderRadius.all(Radius.circular(14)),
                indicator: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  border: Border.fromBorderSide(
                    BorderSide(color: AppColors.primaryERP, width: 1.2),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1FEE4623),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                tabs: const [
                  Tab(text: 'Bảng tin'),
                  Tab(text: 'Lịch làm việc'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [_NewsfeedTab(), _WorkingCalendarTab()],
      ),
    );
  }
}

class _NewsfeedTab extends StatelessWidget {
  const _NewsfeedTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsfeedBloc, NewsfeedState>(
      builder: (context, state) {
        if (state.status == BaseStateStatus.loading &&
            state.newsfeeds.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == BaseStateStatus.failed && state.newsfeeds.isEmpty) {
          return _NewsfeedError(
            message: state.message ?? 'Không tải được bảng tin',
            onRetry: () =>
                context.read<NewsfeedBloc>().add(const NewsfeedEvent.refresh()),
          );
        }

        if (state.newsfeeds.isEmpty) {
          return const _NewsfeedEmpty();
        }

        return RefreshIndicator(
          color: AppColors.primaryERP,
          onRefresh: () async {
            context.read<NewsfeedBloc>().add(const NewsfeedEvent.refresh());
          },
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: state.newsfeeds.length + 1,
            separatorBuilder: (_, index) => index == 0
                ? const SizedBox(height: 10)
                : const SizedBox(height: 12),
            itemBuilder: (context, index) {
              if (index == 0) {
                return const _SectionHeader();
              }

              final item = state.newsfeeds[index - 1];
              return _FeedCard(item: item);
            },
          ),
        );
      },
    );
  }
}

class _WorkingCalendarTab extends StatelessWidget {
  const _WorkingCalendarTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsfeedBloc, NewsfeedState>(
      builder: (context, state) {
        final monthDate = DateTime(state.selectedYear, state.selectedMonth);
        final holidaysByDay = {
          for (final holiday in state.holidays)
            if (holiday.holidayDate != null) holiday.holidayDate!.day: holiday,
        };

        return RefreshIndicator(
          color: AppColors.primaryERP,
          onRefresh: () async {
            context.read<NewsfeedBloc>().add(
              const NewsfeedEvent.refreshCalendar(),
            );
          },
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            children: [
              CalendarToolbar(
                selectedMonth: state.selectedMonth,
                selectedYear: state.selectedYear,
                onPreviousMonth: () {
                  final previous = DateTime(
                    state.selectedYear,
                    state.selectedMonth - 1,
                  );
                  context.read<NewsfeedBloc>().add(
                    NewsfeedEvent.changeCalendarMonth(
                      month: previous.month,
                      year: previous.year,
                    ),
                  );
                },
                onNextMonth: () {
                  final next = DateTime(
                    state.selectedYear,
                    state.selectedMonth + 1,
                  );
                  context.read<NewsfeedBloc>().add(
                    NewsfeedEvent.changeCalendarMonth(
                      month: next.month,
                      year: next.year,
                    ),
                  );
                },
                onPickMonthYear: () => _showMonthYearPicker(context, state),
              ),
              const SizedBox(height: 14),
              if (state.calendarStatus == BaseStateStatus.failed &&
                  state.holidays.isEmpty)
                _NewsfeedError(
                  message:
                      state.calendarMessage ?? 'Không tải được lịch làm việc',
                  onRetry: () => context.read<NewsfeedBloc>().add(
                    const NewsfeedEvent.refreshCalendar(),
                  ),
                )
              else ...[
                HolidayLegend(count: state.holidays.length),
                const SizedBox(height: 12),
                CalendarMonthCard(
                  monthDate: monthDate,
                  holidaysByDay: holidaysByDay,
                  isLoading: state.calendarStatus == BaseStateStatus.loading,
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Future<void> _showMonthYearPicker(
    BuildContext context,
    NewsfeedState state,
  ) async {
    await NewsfeedMonthPicker.show(
      context,
      selectedMonth: DateTime(state.selectedYear, state.selectedMonth),
      onApply: (month) {
        if (!context.mounted) return;
        context.read<NewsfeedBloc>().add(
          NewsfeedEvent.changeCalendarMonth(
            month: month.month,
            year: month.year,
          ),
        );
      },
    );
  }
}

class _NewsfeedError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _NewsfeedError({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 38, color: AppColors.alert),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.heading),
            ),
            const SizedBox(height: 14),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
                foregroundColor: Colors.white,
              ),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NewsfeedEmpty extends StatelessWidget {
  const _NewsfeedEmpty();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                color: AppColors.primaryERP.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.newspaper_outlined,
                size: 36,
                color: AppColors.primaryERP,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Chưa có bản tin nào',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Bảng tin sẽ hiển thị tại đây khi có nội dung mới được cập nhật.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: AppColors.gray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            color: AppColors.primaryERP,
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Tin nổi bật',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.heading,
          ),
        ),
      ],
    );
  }
}

class _FeedCard extends StatelessWidget {
  final NewsletterItem item;

  const _FeedCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final label = item.newsletterTypeName?.trim().isNotEmpty == true
        ? item.newsletterTypeName!.trim()
        : 'Bản tin';
    final (icon, accentColor) = _resolveNewsTypeAppearance(label);
    final dateText = item.createdDate == null
        ? '--/--/----'
        : DateFormat('dd/MM/yyyy').format(item.createdDate!);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () async {
          context.read<NewsfeedBloc>().add(
            NewsfeedEvent.loadNewsfeedDetail(item: item),
          );
          await DialogService.showFullscreen<void>(
            context: context,
            child: BlocProvider.value(
              value: context.read<NewsfeedBloc>(),
              child: const _NewsfeedDetailDialog(),
            ),
          );
          if (!context.mounted) return;
          context.read<NewsfeedBloc>().add(
            const NewsfeedEvent.clearNewsfeedDetail(),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withValues(alpha: 0.82),
                    Colors.white.withValues(alpha: 0.58),
                  ],
                ),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.55),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withValues(alpha: 0.10),
                    blurRadius: 22,
                    offset: const Offset(0, 10),
                  ),
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.35),
                    blurRadius: 10,
                    offset: const Offset(-2, -2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FeedCardHeader(
                    icon: icon,
                    accentColor: accentColor,
                    label: label,
                    date: dateText,
                  ),
                  _FeedCardContent(
                    title: item.title?.trim().isNotEmpty == true
                        ? item.title!.trim()
                        : 'Không có tiêu đề',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FeedCardHeader extends StatelessWidget {
  final IconData icon;
  final Color accentColor;
  final String label;
  final String date;

  const _FeedCardHeader({
    required this.icon,
    required this.accentColor,
    required this.label,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accentColor.withValues(alpha: 0.14),
            Colors.white.withValues(alpha: 0.08),
          ],
        ),
        border: Border(
          bottom: BorderSide(color: Colors.white.withValues(alpha: 0.35)),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  accentColor.withValues(alpha: 0.95),
                  accentColor.withValues(alpha: 0.72),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.28),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Icon(icon, size: 18, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: accentColor,
                letterSpacing: 0.35,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.42),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: Colors.white.withValues(alpha: 0.45)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.schedule, size: 12, color: AppColors.gray),
                const SizedBox(width: 4),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.gray,
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
}

class _FeedCardContent extends StatelessWidget {
  final String title;

  const _FeedCardContent({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      child: Text(
        title,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          height: 1.45,
          color: AppColors.heading,
        ),
      ),
    );
  }
}

class _NewsfeedDetailDialog extends StatefulWidget {
  const _NewsfeedDetailDialog();

  @override
  State<_NewsfeedDetailDialog> createState() => _NewsfeedDetailDialogState();
}

class _NewsfeedDetailDialogState extends State<_NewsfeedDetailDialog> {
  late final Dio _dio;
  bool _isDownloading = false;

  @override
  void initState() {
    super.initState();
    _dio = getIt<Dio>();
  }

  String? _resolveFileUrl(String? rawPath) {
    final path = rawPath?.trim();
    if (path == null || path.isEmpty) return null;
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return path;
    }

    var baseUrl = AppConfig.baseUrl.trim();
    if (baseUrl.endsWith('/')) {
      baseUrl = baseUrl.substring(0, baseUrl.length - 1);
    }

    var normalizedPath = path.replaceAll('\\', '/');
    normalizedPath = normalizedPath.replaceAll(RegExp(r'^/+'), '/');
    final lowerPath = normalizedPath.toLowerCase();

    final apiShareIndex = lowerPath.indexOf('/api/api/share/');
    if (apiShareIndex >= 0) {
      normalizedPath = normalizedPath.substring(
        apiShareIndex + '/api/api'.length,
      );
    } else {
      final shareIndex = lowerPath.indexOf('/share/');
      if (shareIndex >= 0) {
        normalizedPath = normalizedPath.substring(shareIndex);
      } else {
        final ipPathMatch = RegExp(
          r'^/(?:\d{1,3}\.){3}\d{1,3}/(.+)$',
        ).firstMatch(normalizedPath);
        if (ipPathMatch != null) {
          normalizedPath = '/share/${ipPathMatch.group(1)!}';
        }
      }
    }

    if (!normalizedPath.startsWith('/')) {
      normalizedPath = '/$normalizedPath';
    }

    return '$baseUrl$normalizedPath';
  }

  Future<void> _openFilePreview(NewsletterFileItem item) async {
    final sourcePath = item.serverPath ?? item.originPath;
    final url = _resolveFileUrl(sourcePath);
    debugPrint('[NewsfeedPreview] rawPath: $sourcePath');
    debugPrint('[NewsfeedPreview] resolvedUrl: $url');
    if (url == null || url.isEmpty) {
      context.showMessage('Không tìm thấy đường dẫn file');
      return;
    }

    await showDialog<void>(
      context: context,
      useSafeArea: false,
      builder: (_) => _NewsfeedFilePreviewDialog(
        title: item.fileName?.trim().isNotEmpty == true
            ? item.fileName!.trim()
            : 'Xem file',
        url: url,
        fileName: item.fileName,
      ),
    );
  }

  Future<void> _downloadFile(NewsletterFileItem item) async {
    final sourcePath = item.serverPath ?? item.originPath;
    final url = _resolveFileUrl(sourcePath);
    debugPrint('[NewsfeedDownload] rawPath: $sourcePath');
    debugPrint('[NewsfeedDownload] resolvedUrl: $url');
    if (url == null || url.isEmpty) {
      context.showMessage('Không tìm thấy đường dẫn file');
      return;
    }

    if (_isDownloading) return;

    final rawFileName = item.fileName?.trim().isNotEmpty == true
        ? item.fileName!.trim()
        : 'newsletter_${item.id ?? DateTime.now().millisecondsSinceEpoch}';
    final sanitizedFileName = rawFileName.replaceAll('/', '_');
    final dotIndex = sanitizedFileName.lastIndexOf('.');
    final hasExtension =
        dotIndex > 0 && dotIndex < sanitizedFileName.length - 1;
    final name = hasExtension
        ? sanitizedFileName.substring(0, dotIndex)
        : sanitizedFileName;
    final extension = hasExtension
        ? sanitizedFileName.substring(dotIndex + 1)
        : '';

    setState(() {
      _isDownloading = true;
    });

    try {
      final response = await _dio.get<Uint8List>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      final bytes = response.data;
      if (bytes == null || bytes.isEmpty) {
        throw Exception('File rỗng');
      }

      await FileSaver.instance.saveFile(
        name: name,
        bytes: bytes,
        mimeType: _mimeTypeFromExtension(extension),
      );

      if (!mounted) return;

      final box = context.findRenderObject() as RenderBox?;
      await SharePlus.instance.share(
        ShareParams(
          files: [
            XFile.fromData(
              bytes,
              name: sanitizedFileName,
              mimeType: _customMimeTypeFromExtension(extension),
            ),
          ],
          title: sanitizedFileName,
          text: 'Đã tải xong file $sanitizedFileName',
          sharePositionOrigin: box == null
              ? null
              : Rect.fromLTWH(
                  0,
                  0,
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height / 2,
                ),
        ),
      );

      if (!mounted) return;
      context.showMessage('Tải file thành công');
    } catch (e) {
      if (!mounted) return;
      debugPrint('[NewsfeedDownload] error: $e');
      context.showMessage('Tải file thất bại: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isDownloading = false;
        });
      }
    }
  }

  MimeType _mimeTypeFromExtension(String extension) {
    switch (extension.toLowerCase()) {
      case 'pdf':
        return MimeType.pdf;
      case 'doc':
      case 'docx':
        return MimeType.microsoftWord;
      case 'xls':
      case 'xlsx':
        return MimeType.microsoftExcel;
      case 'ppt':
      case 'pptx':
        return MimeType.microsoftPresentation;
      case 'jpg':
      case 'jpeg':
        return MimeType.jpeg;
      case 'png':
        return MimeType.png;
      case 'gif':
        return MimeType.gif;
      case 'txt':
        return MimeType.text;
      case 'csv':
        return MimeType.csv;
      case 'zip':
        return MimeType.zip;
      default:
        return MimeType.other;
    }
  }

  String? _customMimeTypeFromExtension(String extension) {
    switch (extension.toLowerCase()) {
      case 'pdf':
        return 'application/pdf';
      case 'doc':
        return 'application/msword';
      case 'docx':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      case 'xls':
        return 'application/vnd.ms-excel';
      case 'xlsx':
        return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
      case 'ppt':
        return 'application/vnd.ms-powerpoint';
      case 'pptx':
        return 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'txt':
        return 'text/plain';
      case 'csv':
        return 'text/csv';
      case 'zip':
        return 'application/zip';
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsfeedBloc, NewsfeedState>(
      builder: (context, state) {
        final item = state.selectedNewsfeed;
        final detail = state.selectedNewsfeedDetail;
        final files = state.selectedNewsfeedFiles;
        final title = detail?.title?.trim().isNotEmpty == true
            ? detail!.title!.trim()
            : item?.title?.trim().isNotEmpty == true
            ? item!.title!.trim()
            : 'Chi tiết bản tin';

        return Dialog.fullscreen(
          backgroundColor: const Color(0xFFF5F7FB),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 16, 12, 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFE5EAF3)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.heading,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        borderRadius: BorderRadius.circular(999),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: AppColors.heading,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: state.detailStatus == BaseStateStatus.loading
                      ? const Center(child: CircularProgressIndicator())
                      : state.detailStatus == BaseStateStatus.failed &&
                            detail == null
                      ? _NewsfeedError(
                          message:
                              state.detailMessage ??
                              'Không tải được chi tiết bản tin',
                          onRetry: () {
                            if (item == null) return;
                            context.read<NewsfeedBloc>().add(
                              NewsfeedEvent.loadNewsfeedDetail(item: item),
                            );
                          },
                        )
                      : RefreshIndicator(
                          color: AppColors.primaryERP,
                          onRefresh: () async {
                            final selected = state.selectedNewsfeed;
                            if (selected == null) return;
                            context.read<NewsfeedBloc>().add(
                              NewsfeedEvent.loadNewsfeedDetail(item: selected),
                            );
                          },
                          child: ListView(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                            children: [
                              _DetailSectionCard(
                                title: 'Chi tiết',
                                icon: Icons.description_outlined,
                                child: _NewsfeedDetailContent(
                                  detail: detail,
                                  fallback: item,
                                ),
                              ),
                              const SizedBox(height: 16),
                              _DetailSectionCard(
                                title: 'File đính kèm',
                                icon: Icons.attach_file,
                                trailing: _isDownloading
                                    ? const SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : null,
                                child: _NewsfeedFileList(
                                  files: files,
                                  onOpen: _openFilePreview,
                                  onDownload: _downloadFile,
                                ),
                              ),
                              if (state.detailMessage != null &&
                                  state.detailMessage!.isNotEmpty &&
                                  detail != null) ...[
                                const SizedBox(height: 12),
                                Text(
                                  state.detailMessage!,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.alert,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DetailSectionCard extends StatelessWidget {
  const _DetailSectionCard({
    required this.title,
    required this.icon,
    required this.child,
    this.trailing,
  });

  final String title;
  final IconData icon;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: AppColors.primaryERP, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.heading,
                    ),
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFEAEFF6)),
          Padding(padding: const EdgeInsets.all(16), child: child),
        ],
      ),
    );
  }
}

class _NewsfeedDetailContent extends StatelessWidget {
  const _NewsfeedDetailContent({required this.detail, required this.fallback});

  final NewsletterDetailItem? detail;
  final NewsletterItem? fallback;

  @override
  Widget build(BuildContext context) {
    final title = detail?.title?.trim().isNotEmpty == true
        ? detail!.title!.trim()
        : fallback?.title?.trim().isNotEmpty == true
        ? fallback!.title!.trim()
        : 'Không có tiêu đề';
    final createdBy = detail?.createdBy?.trim().isNotEmpty == true
        ? detail!.createdBy!.trim()
        : fallback?.createdBy?.trim().isNotEmpty == true
        ? fallback!.createdBy!.trim()
        : '--';
    final createdDate = detail?.createdDate ?? fallback?.createdDate;
    final content = detail?.newsletterContent?.trim().isNotEmpty == true
        ? detail!.newsletterContent!.trim()
        : fallback?.newsletterContent?.trim().isNotEmpty == true
        ? fallback!.newsletterContent!.trim()
        : 'Không có nội dung';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.heading,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _InfoChip(icon: Icons.person_outline, label: createdBy),
            _InfoChip(
              icon: Icons.schedule,
              label: createdDate == null
                  ? '--/--/----'
                  : DateFormat('dd/MM/yyyy HH:mm').format(createdDate),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: NewsfeedHtmlContentView(html: content),
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.gray),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.gray,
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsfeedFileList extends StatelessWidget {
  const _NewsfeedFileList({
    required this.files,
    required this.onOpen,
    required this.onDownload,
  });

  final List<NewsletterFileItem> files;
  final ValueChanged<NewsletterFileItem> onOpen;
  final ValueChanged<NewsletterFileItem> onDownload;

  @override
  Widget build(BuildContext context) {
    if (files.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: Text(
            'Không có file đính kèm',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.gray,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    return Column(
      children: files
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _NewsfeedFileTile(
                item: item,
                onOpen: () => onOpen(item),
                onDownload: () => onDownload(item),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _NewsfeedFileTile extends StatelessWidget {
  const _NewsfeedFileTile({
    required this.item,
    required this.onOpen,
    required this.onDownload,
  });

  final NewsletterFileItem item;
  final VoidCallback onOpen;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    final fileName = item.fileName?.trim().isNotEmpty == true
        ? item.fileName!.trim()
        : 'Tệp đính kèm';

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFD),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5EAF3)),
      ),
      child: InkWell(
        onTap: onOpen,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.insert_drive_file_outlined,
                  color: AppColors.primaryERP,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.heading,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.createdDate == null
                          ? 'Nhấn để xem file'
                          : '${DateFormat('dd/MM/yyyy hh:mm').format(item.createdDate!)}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: onDownload,
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Icon(
                    Icons.download_rounded,
                    size: 16,
                    color: AppColors.primaryERP,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewsfeedFilePreviewDialog extends StatefulWidget {
  const _NewsfeedFilePreviewDialog({
    required this.title,
    required this.url,
    this.fileName,
  });

  final String title;
  final String url;
  final String? fileName;

  @override
  State<_NewsfeedFilePreviewDialog> createState() =>
      _NewsfeedFilePreviewDialogState();
}

class _NewsfeedFilePreviewDialogState
    extends State<_NewsfeedFilePreviewDialog> {
  late final WebViewController _controller;

  Uri get _previewUri => Uri.parse(widget.url);

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..loadRequest(_previewUri);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(child: WebViewWidget(controller: _controller)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    borderRadius: BorderRadius.circular(999),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

(IconData, Color) _resolveNewsTypeAppearance(String label) {
  final normalized = label.toLowerCase();

  if (normalized.contains('hr') ||
      normalized.contains('nhân sự') ||
      normalized.contains('tuyển dụng')) {
    return (Icons.badge_outlined, const Color(0xFF4F46E5));
  }
  if (normalized.contains('đào tạo') || normalized.contains('hướng dẫn')) {
    return (Icons.auto_stories_outlined, const Color(0xFF0F9D8F));
  }
  if (normalized.contains('sự kiện') || normalized.contains('event')) {
    return (Icons.celebration_outlined, const Color(0xFFF59E0B));
  }
  if (normalized.contains('chính sách') || normalized.contains('quy định')) {
    return (Icons.gavel_outlined, const Color(0xFFEF4444));
  }
  if (normalized.contains('khen thưởng') || normalized.contains('vinh danh')) {
    return (Icons.workspace_premium_outlined, const Color(0xFF8B5CF6));
  }

  return (Icons.campaign_outlined, AppColors.primaryERP);
}
