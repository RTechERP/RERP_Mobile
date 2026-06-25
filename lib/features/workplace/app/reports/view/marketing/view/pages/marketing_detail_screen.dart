import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/constants/index.dart';
import '../../../../../../../../routes/route_names.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../bloc/marketing_bloc.dart';
import '../widgets/glass_container.dart';

class MarketingDetailScreen extends StatefulWidget {
  const MarketingDetailScreen({super.key});

  @override
  State<MarketingDetailScreen> createState() => _MarketingDetailScreenState();
}

class _MarketingDetailScreenState
    extends
        BaseState<
          MarketingDetailScreen,
          MarketingEvent,
          MarketingState,
          MarketingBloc
        > {
  int? _dailyId;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra;

      if (extra is int) {
        _dailyId = extra;
        bloc.add(MarketingEvent.selectReport(dailyID: _dailyId!));
      }
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(title: const Text('Chi tiết báo cáo')),
      body: BlocBuilder<MarketingBloc, MarketingState>(
        builder: (context, state) {
          if (state.isLoadingDetail) {
            return const Center(child: CircularProgressIndicator());
          }

          final wrapper = state.detailReport;
          final detail = wrapper?.dailyData;
          final files = wrapper?.dailyFileData ?? [];

          if (detail == null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImages.missing, width: 320),
                  const SizedBox(height: 12),
                  const Text('Không có báo cáo'),
                ],
              ),
            );
          }

          final dateStr = detail.dateReport != null
              ? DateFormat('dd/MM/yyyy').format(DateTime.parse(detail.dateReport!))
              : '-';

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      /// Header Card
                      GlassContainer(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryERP.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.assignment_outlined,
                                    color: AppColors.primaryERP,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Báo cáo công việc ngày',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF1A1C1E),
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        dateStr,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryERP,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      /// Nội dung công việc
                      _SectionCard(
                        icon: Icons.work_outline,
                        iconColor: Colors.blue,
                        title: 'Nội dung công việc',
                        content: detail.content,
                      ),

                      const SizedBox(height: 12),

                      /// Kết quả công việc
                      _SectionCard(
                        icon: Icons.check_circle_outline,
                        iconColor: Colors.green,
                        title: 'Kết quả công việc',
                        content: detail.results,
                      ),

                      const SizedBox(height: 12),

                      /// Kế hoạch ngày tiếp theo
                      _SectionCard(
                        icon: Icons.arrow_forward_rounded,
                        iconColor: Colors.orange,
                        title: 'Kế hoạch ngày tiếp theo',
                        content: detail.planNextDay,
                      ),

                      const SizedBox(height: 12),

                      /// Đề xuất cải tiến
                      _SectionCard(
                        icon: Icons.lightbulb_outline,
                        iconColor: Colors.purple,
                        title: 'Đề xuất cải tiến',
                        content: detail.note,
                      ),

                      const SizedBox(height: 12),

                      /// File đính kèm
                      GlassContainer(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.attach_file,
                                  size: 20,
                                  color: AppColors.primaryERP,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'File đính kèm',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1A1C1E),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            _buildFiles(files),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryERP,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    minimumSize: const Size.fromHeight(48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () async {
                    final result = await context.push(
                      RouteNames.reportMarketingdepartEdit,
                      extra: _dailyId,
                    );

                    if (result == true && context.mounted) {
                      context.pop(true);
                    }
                  },
                  child: const Text(
                    'Sửa',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFiles(List<MarketingDailyFile> files) {
    if (files.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Không có file đính kèm',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Column(
      children: files.map((file) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryERP.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.insert_drive_file_outlined,
                size: 20,
                color: AppColors.primaryERP,
              ),
            ),
            title: Text(
              file.fileName,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.content,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    final hasContent = content?.isNotEmpty == true;

    return GlassContainer(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: iconColor),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1C1E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              hasContent ? content! : 'Không có',
              style: TextStyle(
                fontSize: 13,
                color: hasContent ? Colors.grey[800] : Colors.grey[400],
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
