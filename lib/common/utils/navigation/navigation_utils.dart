import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

Future<bool> onBack(
    BuildContext context, {
      Object? result,
      String? fallbackRoute,
    }) async {
  if (context.canPop()) {
    context.pop(result);
    return true; // đã pop
  }

  if (fallbackRoute != null) {
    context.go(fallbackRoute);
    return true;
  }

  return false;
}
