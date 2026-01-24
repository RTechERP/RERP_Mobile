import 'package:flutter/material.dart';

class Approval extends StatelessWidget {
  const Approval({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // 👈 BẮT BUỘC
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Của tôi'),
                Tab(text: 'Tôi duyệt'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Danh sách đơn của tôi')),
                  Center(child: Text('Danh sách đơn tôi duyệt')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}