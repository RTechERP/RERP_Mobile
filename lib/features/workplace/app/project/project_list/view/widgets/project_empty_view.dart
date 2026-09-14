import 'package:flutter/material.dart';

import '../../../../../../../common/constants/index.dart';

/// Widget hiển thị trạng thái rỗng khi không có dữ liệu project.
class ProjectEmptyView extends StatelessWidget {
  const ProjectEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AppImages.missing, width: 320),
          const SizedBox(height: 12),
          const Text('Không có dữ liệu'),
        ],
      ),
    );
  }
}
