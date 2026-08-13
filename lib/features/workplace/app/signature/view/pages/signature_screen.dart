import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../bloc/my_signature_bloc.dart';

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({super.key});

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState
    extends BaseState<SignatureScreen, MySignatureEvent, MySignatureState, MySignatureBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const MySignatureEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<MySignatureBloc, MySignatureState>(
      builder: (context, state) {
        return BaseScaffold(
          appBar: AppBarCommon(
            title: Text(
              'Chữ ký cá nhân',
              style: AppStyles.headingTitle2,
            ),
            onBackTap: () => context.pop(),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  bloc.add(const MySignatureEvent.init());
                },
              ),
            ],
          ),
          body: Column(
            children: [
              // Bảng vẽ chữ ký - toàn bộ màn hình
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: state.employeeSignature != null
                      ? _buildSignatureDisplay(state)
                      : _buildEmptySignature(),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final reload = await context.push<bool?>(RouteNames.signatureAdd);
              if (!mounted) return;
              if (reload == true) {
                bloc.add(const MySignatureEvent.init());
              }
            },
            backgroundColor: AppColors.primaryERP,
            elevation: 6,
            shape: const CircleBorder(),
            child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
        );
      },
    );
  }

  Widget _buildSignatureDisplay(MySignatureState state) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryERP.withValues(alpha: 0.08),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Row(
            children: [
              Icon(Icons.verified_outlined, size: 20, color: AppColors.primaryERP),
              const SizedBox(width: 8),
              Text(
                'Chữ ký của bạn',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryERP,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryERP, width: 1.5),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.memory(
                state.employeeSignature!,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.broken_image_outlined,
                        size: 48,
                        color: AppColors.textSecondaryColor.withValues(alpha: 0.5),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Không thể hiển thị chữ ký',
                        style: TextStyle(
                          color: AppColors.textSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptySignature() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryERP.withValues(alpha: 0.08),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline, size: 20, color: AppColors.primaryERP),
              const SizedBox(width: 8),
              Text(
                'Chưa có chữ ký',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryERP,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.draw_outlined,
                  size: 64,
                  color: AppColors.textSecondaryColor.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 16),
                Text(
                  'Bạn chưa có chữ ký',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Nhấn nút "Thêm chữ ký" bên dưới để tạo',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondaryColor.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
