import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../base/bloc/index.dart';
import '../../../../base/network/errors/extension.dart';
import '../../../../base/widgets/base_widget.dart';
import '../../../../common/app_theme/index.dart';
import '../../../../common/constants/index.dart';
import '../../../../common/utils/snack_bar_helper.dart';
import '../../../../common/widgets/form/index.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState
    extends BaseState<LoginScreen, AuthEvent, AuthState, AuthBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  late final FocusNode _accountFocus;
  late final FocusNode _passwordFocus;

  bool _hasPrefilled = false;

  @override
  void initState() {
    super.initState();
    _accountFocus = FocusNode();
    _passwordFocus = FocusNode();
    bloc.add(const AuthEvent.init());
  }

  @override
  void dispose() {
    _accountFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  /// ===== LISTEN STATE =====
  @override
  void listener(BuildContext context, AuthState state) {
    super.listener(context, state);

    if (state.status == BaseStateStatus.loading) {
      // DialogService.showLoadingDialog(context);
    }

    if (state.status == BaseStateStatus.failed) {
      context.showMessage(state.message ?? '', type: SnackBarType.error);
    }

    if (state.status == BaseStateStatus.success && state.user != null) {
      context.go('/dashboard');
    }

    if (!_hasPrefilled &&
        (state.savedUsername != null || state.savedPassword != null)) {
      _hasPrefilled = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _formKey.currentState?.fields['auth_account']
            ?.didChange(state.savedUsername ?? '');

        _formKey.currentState?.fields['auth_password']
            ?.didChange(state.savedPassword ?? '');

        _formKey.currentState?.fields['remember_me']
            ?.didChange(state.rememberMe);
      });
    }
  }

  @override
  Widget renderUI(BuildContext context) {
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

                    /// ===== ACCOUNT =====
                    FormInputField(
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

                    /// ===== PASSWORD =====
                    FormInputField(
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

                    /// ===== REMEMBER ME =====
                    blocBuilder((context, state) {
                      return FormBuilderCheckbox(
                        name: 'remember_me',
                        title: const Text('Ghi nhớ đăng nhập'),
                        onChanged: (value) {
                          bloc.add(AuthEvent.toggleRememberMe(value ?? false));
                        },
                      );
                    }),

                    /// ===== SUBMIT =====
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: blocBuilder((context, state) {
                        final isLoading =
                            state.status == BaseStateStatus.loading;

                        return ElevatedButton(
                          onPressed: isLoading ? null : _onSubmitLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryERPlight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: isLoading
                              ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'Đăng nhập',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        );
                      }, buildWhen: (p, n) => p.status != n.status),
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

  /// ===== SUBMIT LOGIN =====
  void _onSubmitLogin() {
    final isValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isValid) return;

    final values = _formKey.currentState!.value;
    final loginName = values['auth_account'] as String;
    final password = values['auth_password'] as String;
    final rememberMe = values['remember_me'] as bool? ?? false;

    bloc.add(AuthEvent.login(loginName, password, rememberMe));
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
        color: AppColors.primaryERPlight.withValues(alpha: 0.25),
        shape: BoxShape.circle,
      ),
    );
  }
}
