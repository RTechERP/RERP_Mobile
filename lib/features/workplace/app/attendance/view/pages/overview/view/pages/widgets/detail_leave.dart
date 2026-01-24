import 'package:flutter/material.dart';

class DetailLeave extends StatelessWidget {
  const DetailLeave({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.insert_drive_file_outlined,
            size: 72,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'Bạn chưa có dữ liệu ngày phép trong năm nay',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
