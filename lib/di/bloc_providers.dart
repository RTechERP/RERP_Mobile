import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/app/app_env.dart';

List<BlocProvider> blocProviders(AppEnv env) {
  return [
    // BlocProvider<AuthBloc>(
    //   create: (_) => getIt<AuthBloc>(),
    // ),

    // 👉 thêm các global bloc khác ở đây
    // BlocProvider<AppBloc>(...)
  ];
}
