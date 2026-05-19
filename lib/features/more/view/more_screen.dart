// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình "Thêm" - hiển thị thông tin cá nhân, cài đặt, giới thiệu và đăng xuất
//
// Giao diện:
//   - AppBar: title "Cá nhân"
//   - Profile header: avatar, tên, email, phòng ban, chức vụ, mã nhân viên
//   - Card cài đặt: Cài đặt chung, Thông báo, Bảo mật & quyền riêng tư
//   - Card hỗ trợ: Hướng dẫn sử dụng, Liên hệ hỗ trợ, Giới thiệu ứng dụng
//   - Card thông tin: Phiên bản ứng dụng
//   - Nút đăng xuất

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/app_theme/index.dart';
import '../../../../base/bloc/bloc_status.dart';
import '../../../../routes/route_names.dart';
import '../../auth/view/bloc/auth_bloc.dart';

/// Màn hình "Thêm" — tab thứ 5 trong DashboardScreen.
///
/// Hiển thị thông tin cá nhân của người dùng đang đăng nhập,
/// các mục cài đặt, hỗ trợ và nút đăng xuất.
/// Nghe [AuthState] để redirect về login khi logout thành công.
class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          'Cá nhân',
          style: TextStyle(
            color: AppColors.heading,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
          previous.status != current.status ||
          current.status == BaseStateStatus.init,
        listener: (context, state) {
          if (state.user == null && state.status == BaseStateStatus.init) {
            context.go(RouteNames.login);
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final user = state.user;
            final name = user?.fullName ?? 'User Name';
            final email = user?.loginName ?? 'user@rtc.edu.vn';
            final department = user?.departmentName ?? 'Phòng ban';

            final isLoading = state.status == BaseStateStatus.loading;

            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(height: 10),

                //---(Profile Header)---//
                _ProfileCard(
                  name: name,
                  email: email,
                  department: department,
                ),

                const SizedBox(height: 20),

                //---(Cài đặt)---//

                _SectionCard(
                  title: 'Cài đặt',
                  icon: Icons.settings_outlined,
                  children: [
                    // _SettingsTile(
                    //   icon: Icons.tune_outlined,
                    //   title: 'Cài đặt chung',
                    //   subtitle: 'Ngôn ngữ, giao diện, đơn vị',
                    //   onTap: () {},
                    // ),
                    _SettingsTile(
                      icon: Icons.notifications_outlined,
                      title: 'Thông báo',
                      subtitle: 'Âm thanh, tin nhắn, nhắc nhở',
                      onTap: () {
                        context.push(RouteNames.notificationSettings);
                      },
                    ),
                    // _SettingsTile(
                    //   icon: Icons.lock_outline,
                    //   title: 'Bảo mật & quyền riêng tư',
                    //   subtitle: 'Đổi mật khẩu, xác thực',
                    //   onTap: () {},
                    //   showDivider: false,
                    // ),
                  ],
                ),

                const SizedBox(height: 14),

                //---(Hỗ trợ)---//

                _SectionCard(
                  title: 'Hỗ trợ',
                  icon: Icons.help_outline,
                  children: [
                    // _SettingsTile(
                    //   icon: Icons.menu_book_outlined,
                    //   title: 'Hướng dẫn sử dụng',
                    //   subtitle: 'Tìm hiểu các tính năng',
                    //   onTap: () {},
                    // ),
                    _SettingsTile(
                      icon: Icons.chat_bubble_outline_outlined,
                      title: 'Liên hệ hỗ trợ',
                      subtitle: ' Hotline: 1900 xxxx',
                      onTap: () {},
                    ),
                    _SettingsTile(
                      icon: Icons.info_outline,
                      title: 'Giới thiệu ứng dụng',
                      subtitle: 'RERP 1.0.0',
                      onTap: () {},
                      showDivider: false,
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                //---(Đăng xuất)---//

                _LogoutButton(isLoading: isLoading),

                const SizedBox(height: 10),


              ],
            );
          },
        ),
      ),
    );
  }
}

//---(Profile)---//

/// Card hiển thị thông tin cá nhân người dùng.
///
/// Gồm: avatar gradient, tên, email, phòng ban, chức vụ.
class _ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String department;

  const _ProfileCard({
    required this.name,
    required this.email,
    required this.department,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A1A).withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar gradient
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              gradient: AppColors.gradientERP,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryERP.withValues(alpha: 0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                _initials(name),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Thông tin
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.gray,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // Tags: phòng ban & chức vụ
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    _InfoChip(
                      icon: Icons.business_outlined,
                      label: department,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Trích initials từ tên đầy đủ: "Nguyễn Văn An" -> "NVA".
  String _initials(String fullName) {
    final parts = fullName.trim().split(' ');
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    final first = parts.first.isNotEmpty ? parts.first[0] : '';
    final last = parts.last.isNotEmpty ? parts.last[0] : '';
    return '$first$last'.toUpperCase();
  }
}

/// Chip nhỏ hiển thị phòng ban / chức vụ.
class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.secondaryERP.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: AppColors.secondaryERP),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryERP,
            ),
          ),
        ],
      ),
    );
  }
}

//---(Section)---//

/// Card bao quanh một nhóm mục cài đặt / hỗ trợ.
class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A1A).withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFF0F2F5), width: 1),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, size: 18, color: AppColors.primaryERP),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                  ),
                ),
              ],
            ),
          ),
          // Children
          ...children,
        ],
      ),
    );
  }
}

//---(Settings Tile)---//

/// Một dòng tile trong _SectionCard.
class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool showDivider;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: AppColors.bgCard,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 20, color: AppColors.heading),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.heading,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ),
                // const Icon(
                //   Icons.chevron_right,
                //   color: AppColors.gray,
                //   size: 22,
                // ),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Padding(
            padding: EdgeInsets.only(left: 66),
            child: Divider(height: 1, color: Color(0xFFF0F2F5)),
          ),
      ],
    );
  }
}

//---(Logout)---//

/// Nút đăng xuất — màu đỏ, có loading indicator.
class _LogoutButton extends StatelessWidget {
  final bool isLoading;

  const _LogoutButton({required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading
          ? null
          : () => context.read<AuthBloc>().add(const AuthEvent.logout()),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.alert.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppColors.alert.withValues(alpha: 0.2),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading) ...[
              const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.alert,
                ),
              ),
              const SizedBox(width: 10),
            ] else ...[
              const Icon(
                Icons.logout_outlined,
                color: AppColors.alert,
                size: 20,
              ),
              const SizedBox(width: 10),
            ],
            Text(
              isLoading ? 'Đang đăng xuất...' : 'Đăng xuất',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.alert,
              ),
            ),
          ],
        ),
      ),
    );
  }
}