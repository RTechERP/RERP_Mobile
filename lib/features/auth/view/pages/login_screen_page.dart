import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../common/app_theme/index.dart';
import '../../../../common/constants/index.dart';
import '../../../../common/widgets/form/index.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({super.key});

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  late final FocusNode _accountFocus;
  late final FocusNode _passwordFocus;

  @override
  void initState() {
    super.initState();

    _accountFocus = FocusNode();
    _passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    _accountFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Stack(
        children: [
          MediaQuery.removeViewInsets(
            context: context,
            removeBottom: true,
            child: Stack(
              children: const [
                Positioned(top: -120, left: -140, child: _Circle(size: 230)),
                Positioned(top: 150, left: 350, child: _Circle(size: 140)),
              ],
            ),
          ),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              physics: const ClampingScrollPhysics(),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 40),

                    Image.asset(AppImages.logo_login, height: 220),

                    const SizedBox(height: 16),

                    const Text(
                      'R-ERP',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// Account
                    InputField(
                      nameForm: 'auth',
                      nameTextField: 'auth_account',
                      label: 'Tài khoản',
                      icon: Icons.person_outline,
                      focusNode: _accountFocus,
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.required(
                        errorText: 'Vui lòng nhập tài khoản',
                      ),
                      onSubmitted: (_) => _passwordFocus.requestFocus(),
                    ),

                    const SizedBox(height: 12),

                    /// Password
                    InputField(
                      nameForm: 'auth',
                      nameTextField: 'auth_password',
                      label: 'Mật khẩu',
                      icon: Icons.lock_outline,
                      obscureText: true,
                      focusNode: _passwordFocus,
                      validator: FormBuilderValidators.required(
                        errorText: 'Vui lòng nhập mật khẩu',
                      ),
                    ),

                    const SizedBox(height: 18),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          final isValid =
                              _formKey.currentState?.validate() ?? false;

                          if (!isValid) return;

                          // Nếu cần lấy data
                          final values = _formKey.currentState!.value;

                          context.push('/dashboard');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryERPlight,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  final double size;

  const _Circle({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primaryERPlight.withOpacity(0.25),
        shape: BoxShape.circle,
      ),
    );
  }
}
