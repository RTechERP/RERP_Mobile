import 'package:flutter/material.dart';

import '../../app_theme/index.dart';

class AppCardReport extends StatelessWidget {
  final String? projectName;
  final String? projectCode;
  final double? progress; // 0.0 to 1.0
  final DateTime? time;
  final String? employeeName;
  final String? position;
  final bool showProgress;
  final VoidCallback? onTap;

  final String? category;

  final String? project;

  const AppCardReport({
    super.key,
    this.projectName,
    this.projectCode,
    this.progress,
    this.time,
    this.employeeName,
    this.position,
    this.showProgress = true,
    this.onTap,
    this.category,
    this.project,
  });

  String _formatTime(DateTime? dt) {
    if (dt == null) return '--/--/----';
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(dt.day)}/${two(dt.month)}/${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// LEFT CONTENT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Badge category
                    /// 🔰 CATEGORY + POSITION (BADGE TRÊN CÙNG)
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        if (projectCode?.isNotEmpty == true)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              projectCode!,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                          ),

                        if (position?.isNotEmpty == true)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.12), // 👈 màu khác category
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              position!,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),


                    if (employeeName?.isNotEmpty == true)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.person_outline, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            employeeName!,
                            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    const SizedBox(height: 6),

                    /// Project
                    if (projectName?.isNotEmpty == true) ...[
                      Text(
                        projectName!,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1C1E),
                        ),
                        softWrap: true,
                      ),
                      const SizedBox(height: 6),
                    ],

                    const SizedBox(height: 6),

                    /// Name + Position (Badge)


                    /// Time
                    Row(
                      children: [
                        const Icon(Icons.access_time_rounded, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          _formatTime(time),
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// RIGHT PROGRESS
              if (showProgress)
                _CircleProgressSmall(progress: progress),
            ],
          ),
        ),
      ),
    );
  }
}

/// ================== CIRCLE PROGRESS ==================
class _CircleProgressSmall extends StatelessWidget {
  final double? progress;

  const _CircleProgressSmall({this.progress});

  @override
  Widget build(BuildContext context) {
    final safeProgress = (progress ?? 0).clamp(0.0, 1.0);
    final percent = (safeProgress * 100).round();

    return SizedBox(
      width: 54,
      height: 54,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 54,
            height: 54,
            child: CircularProgressIndicator(
              value: safeProgress,
              strokeWidth: 6,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryERP),
            ),
          ),
          Text(
            '$percent%',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}