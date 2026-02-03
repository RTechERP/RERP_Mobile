import 'package:flutter/material.dart';

class AppCardReport extends StatelessWidget {
  final String project;
  final String category;
  final double progress; // 0.0 to 1.0
  final DateTime time;
  final VoidCallback? onTap;

  const AppCardReport({
    super.key,
    required this.project,
    required this.category,
    required this.progress,
    required this.time,
    this.onTap,
  });

  String _formatTime(DateTime dt) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(dt.day)}/${two(dt.month)}/${dt.year} '
        '${two(dt.hour)}:${two(dt.minute)}:${two(dt.second)}';
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hàng đầu: Badge dự án & Circle Progress
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Tiêu đề báo cáo
                  Text(
                    project,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1C1E),
                    ),
                    softWrap: true,      // cho phép xuống dòng
                  ),
                  const SizedBox(height: 6),

                  // Thời gian
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
              _CircleProgressSmall(progress: progress),

            ],
          ),
        ),
      ),
    );
  }
}

/// ================== CIRCLE PROGRESS (GÓC PHẢI TRÊN) ==================
class _CircleProgressSmall extends StatelessWidget {
  final double progress;

  const _CircleProgressSmall({required this.progress});

  @override
  Widget build(BuildContext context) {
    final percent = (progress.clamp(0.0, 1.0) * 100).round();

    return SizedBox(
      width: 54,   // 36 * 1.5 = 54
      height: 54,  // 36 * 1.5 = 54
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 54,
            height: 54,
            child: CircularProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              strokeWidth: 6, // 4 * 1.5 = 6
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          Text(
            '$percent%',
            style: const TextStyle(
              fontSize: 12, // 9 * 1.3 ~ 12 cho dễ đọc
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}