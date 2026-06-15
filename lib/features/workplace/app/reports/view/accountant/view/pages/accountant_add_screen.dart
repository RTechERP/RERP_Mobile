import 'package:flutter/material.dart';

class AccountantAddScreen extends StatelessWidget {
  const AccountantAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm báo cáo kế toán'),
      ),
      body: const Center(
        child: Text('Accountant Add Screen'),
      ),
    );
  }
}
