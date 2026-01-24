import 'package:flutter/material.dart';

class Greetings extends StatelessWidget {
  final String employeeName;
  final String quote;

  const Greetings({
    super.key,
    required this.employeeName,
    required this.quote,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.orange.shade200,
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ===== Greeting =====
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              children: [
                const TextSpan(text: 'Xin chào, '),
                TextSpan(
                  text: employeeName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          /// ===== Quote =====
          Text(
            quote,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey.shade700,
              fontStyle: FontStyle.italic,
            ),
          ),

          const SizedBox(height: 16),

          /// ===== Notice =====
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.orange.shade300,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.touch_app_outlined,
                  color: Colors.orange,
                  size: 22,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Bạn không có quyền chấm công trên ứng dụng',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.orange.shade800,
                      height: 1.4,
                    ),
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
