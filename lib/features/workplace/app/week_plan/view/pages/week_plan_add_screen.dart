import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';

class WeekPlanAddScreen extends StatelessWidget {
  const WeekPlanAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo công việc'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.assignment_add, size: 64, color: AppColors.gray),
            SizedBox(height: 16),
            Text(
              'Tạo công việc',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.heading,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Màn hình tạo công việc mới',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
