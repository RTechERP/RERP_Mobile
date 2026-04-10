import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../base/bloc/bloc_status.dart';
import '../../../routes/route_names.dart';
import '../../auth/view/bloc/auth_bloc.dart';

final getIt = GetIt.instance;

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
        centerTitle: true,
      ),
      body: BlocListener<AuthBloc,AuthState>(
        listener: (context, state) {
          if (state.user == null &&
              state.status == BaseStateStatus.init) {
            context.go(RouteNames.login);
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final user = state.user;

            final name = user?.fullName ?? 'User Name';
            final email = user?.loginName ?? 'user@email.com';

            final isLoading =
                state.status == BaseStateStatus.loading;

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const SizedBox(height: 8),

                Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person, size: 40),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style:
                      const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                _MoreItem(
                  icon: Icons.settings,
                  title: 'Cài đặt',
                  onTap: () {},
                ),
                _MoreItem(
                  icon: Icons.info_outline,
                  title: 'Giới thiệu',
                  onTap: () {},
                ),

                const SizedBox(height: 24),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                  ),
                  onPressed: isLoading
                      ? null
                      : () {
                    context.read<AuthBloc>().add(
                      const AuthEvent.logout(),
                    );
                  },
                  child: isLoading
                      ? const SizedBox(
                    height: 18,
                    width: 18,
                    child:
                    CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                      : const Text(
                    'Đăng xuất',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _MoreItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MoreItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}