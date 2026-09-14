import 'package:flutter/material.dart';

import '../../../../../../../common/constants/index.dart';

/// Widget hiển thị trạng thái lỗi khi load dữ liệu project thất bại.
class ProjectErrorView extends StatelessWidget {
  final String? message;

  const ProjectErrorView({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AppImages.error, width: 320),
          const SizedBox(height: 12),
          Text(message ?? 'Load dữ liệu thất bại'),
        ],
      ),
    );
  }
}
