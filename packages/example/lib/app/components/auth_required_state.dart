import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRequiredState<T extends StatefulWidget>
    extends SupabaseAuthRequiredState<T> {
  @override
  void onUnauthenticated() {
    if (mounted) {
      /// Users will be sent back to the LoginPage if they sign out.
      context.go('/login');
      // Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    }
  }
}

class AuthRequiredWrapper extends StatefulWidget {
  final Widget page;

  const AuthRequiredWrapper(
    this.page, {
    Key? key,
  }) : super(key: key);

  @override
  State<AuthRequiredWrapper> createState() => _AuthRequiredWrapperState();
}

class _AuthRequiredWrapperState extends AuthRequiredState<AuthRequiredWrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.page;
  }
}
