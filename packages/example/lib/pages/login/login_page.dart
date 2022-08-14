import 'package:example/app/environment.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  late final TextEditingController _emailController;

  Future<void> _signInWithGoogle() async {
    final messenger = context.scaffoldMessenger;
    setState(() {
      _isLoading = true;
    });
    final success = await supabase.auth.signInWithProvider(
      Provider.google,
      options: AuthOptions(
        redirectTo: kIsWeb ? null : 'jolt://login-callback',
      ),
    );

    if (success) {
      messenger.showSnackBarSuccess();
    } else {
      messenger.showSnackBarError(message: 'An error occured');
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _signIn() async {
    final messenger = context.scaffoldMessenger;
    setState(() {
      _isLoading = true;
    });
    final response = await supabase.auth.signIn(
      email: _emailController.text,
      options: AuthOptions(
        redirectTo: kIsWeb ? null : 'jolt://login-callback',
      ),
    );
    final error = response.error;
    if (error != null) {
      messenger.showSnackBarError(message: error.message);
    } else {
      messenger.showSnackBarSuccess(
          message: 'Check your email for login link!');
      _emailController.clear();
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO investigate icon sizing standards
    print(context.theme.iconTheme.size);

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Column(
        children: [
          JoltText(
            'Test',
            style: context.textStyle.displayLarge,
          ),
          Center(
            child: JoltButton(
              onPressed: () async {
                context.showSnackBarSuccess(message: 'Great Work!');
                await Future.delayed(const Duration(seconds: 1));
              },
              backgroundColor: context.color.success,
              label: 'Documentation Complete',
              icon: Icons.menu_book_rounded,
              // textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
      // body: ListView(
      //   padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      //   children: [
      //     JoltText(
      //       'Sign in via the magic link with your email below',
      //       // scaleText: false,
      //     ),
      //     const SizedBox(height: 18),
      //     TextFormField(
      //       controller: _emailController,
      //       decoration: const InputDecoration(labelText: 'Email'),
      //     ),
      //     const SizedBox(height: 18),
      //     ElevatedButton(
      //       onPressed: _isLoading ? null : _signIn,
      //       child: Text(_isLoading ? 'Loading' : 'Send Magic Link'),
      //     ),
      //     const SizedBox(height: 18),
      //     ElevatedButton(
      //       onPressed: _isLoading ? null : _signInWithGoogle,
      //       child: Text(_isLoading ? 'Loading' : 'Login With Google'),
      //     ),
      //   ],
      // ),
    );
  }
}
