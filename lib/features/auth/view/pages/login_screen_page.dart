import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../common/app_theme/index.dart';
import '../../../../common/constants/index.dart';
import '../../../../common/utils/validators.dart';
import '../widgets/login_button.dart';
import '../widgets/login_input_field.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({super.key});

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // 👉 Giả lập gọi API
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isLoading = false);

    if (!mounted) return;

    // CustomToast.showToast(
    //   context: context,
    //   gravity: ToastGravity.TOP,
    //   child: Text('login_success'.tr()),
    // );

    context.go('/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF294A8E), // Background xanh
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 45), // khoảng hở để thấy nền xanh
          decoration: BoxDecoration(
            color: Colors.white, // Form nền trắng đè lên
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(), // 👈 đẩy nội dung xuống giữa

                  /// Logo
                  Center(
                    child: Image.asset(
                      AppImages.logo_login,
                      height: 220,
                      width: 220,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// Title
                  Text(
                    'auth.rtc'.tr(),
                    textAlign: TextAlign.center,
                    style: AppStyles.headingTitle4,
                  ),

                  const SizedBox(height: 32),

                  /// Email
                  LoginInputField(
                    icon: Icons.person_outline,
                    label: 'auth.email'.tr(),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidator.email,
                  ),

                  const SizedBox(height: 12),

                  /// Password
                  LoginInputField(
                    icon: Icons.lock_outline,
                    label: 'auth.password'.tr(),
                    controller: _passwordController,
                    obscureText: true,
                    validator: AppValidator.password,
                  ),

                  const SizedBox(height: 16),

                  /// Login button
                  LoginButton(
                    title: 'auth.login'.tr(),
                    loading: _isLoading,
                    onPressed: _login,
                  ),

                  const SizedBox(height: 16),

                  const Spacer(), // 👈 cân đối trên & dưới
                ],
              ),
            )

          ),
        ),
      ),
    );

  }
}
