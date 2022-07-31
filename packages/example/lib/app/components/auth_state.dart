import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_utilities.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthState<T extends StatefulWidget> extends SupabaseAuthState<T> {
  @override
  void onUnauthenticated() {
    if (mounted) {
      context.go('/login');
      // Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    }
  }

  @override
  void onAuthenticated(Session session) {
    if (mounted) {
      context.go('/');
      // Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    }
  }

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onErrorAuthenticating(String message) {
    context.showSnackBarError(message: message);
  }
}

class AuthWrapper extends StatefulWidget {
  final Widget page;

  const AuthWrapper(
    this.page, {
    Key? key,
  }) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends AuthState<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.page;
  }
}
