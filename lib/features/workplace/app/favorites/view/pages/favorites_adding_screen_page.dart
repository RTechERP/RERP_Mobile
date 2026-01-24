import 'package:flutter/material.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../common/utils/navigation/navigation_utils.dart';

class FavoritesAddingScreen extends StatelessWidget {
  const FavoritesAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            onBack(context);
          },
        ),
        centerTitle: true,

        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Thêm vào mục yêu thích',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Đã thêm (0)',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {
              // search
            },
          ),
          const SizedBox(width: 8),
        ],
      ),


      body: Center(child: Text('Hello')),
    );
  }
}
