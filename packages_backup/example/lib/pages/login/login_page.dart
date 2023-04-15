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
  late final TextEditingController _emailController;

  Future<void> _signInWithGoogle() async {
    final messenger = context.scaffoldMessenger;
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
  }

  Future<void> _signIn() async {
    final messenger = context.scaffoldMessenger;

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

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Column(
        children: [
          JoltText(
            'Test',
            style: context.textStyle.displayLarge,
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle_outline_outlined),
                  SizedBox(width: 8),
                  Text('Mark as complete'),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
              ),
              // child: Text('Outlined Button'),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 2));
              },
              style: ElevatedButton.styleFrom(
                primary: context.color.primary,
                onPrimary: context.color.onPrimary,
              ),
              child: Text('Styled button'),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: JoltButton(
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 2));
              },
              textStyle: context.textStyle.labelSmall,
              icon: Icons.check_circle_outline_outlined,
              label: 'Complete Documentation',
              labelProcessing: 'Submitting',
              // outlined: true,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Wrap(
              children: [
                JoltButton(
                  onPressed: () async {
                    await Future.delayed(const Duration(seconds: 2));
                  },
                  icon: Icons.check_circle_outline_outlined,
                  // backgroundColor: context.color.secondary,
                  label: 'Complete Documentation',
                  labelProcessing: 'Submitting',
                  // outlined: true,
                  // borderColor: context.color.primary,
                  // textDirection: TextDirection.rtl,
                ),
                SizedBox(width: 10),
                JoltButton(
                  onPressed: () async {
                    context.showSnackBarSuccess(message: 'Great Work!');
                    await Future.delayed(const Duration(seconds: 2));
                    context.showSnackBar(message: 'Second message');
                  },
                  backgroundColor: context.color.primary,
                  icon: Icons.menu_book_rounded,
                ),
                SizedBox(width: 10),
                JoltButton(
                  onPressed: () async {
                    context.showSnackBarSuccess(message: 'Great Work!');
                    await Future.delayed(const Duration(seconds: 2));
                    context.showSnackBar(message: 'Second message');
                  },
                  outlined: true,
                  icon: Icons.menu_book_rounded,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: JoltButton(
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 2));
              },
              textStyle: context.textStyle.bodyLarge,
              icon: Icons.check_circle_outline_outlined,
              label: 'Complete Documentation',
              labelProcessing: 'Submitting',
              backgroundColor: context.color.primary,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: JoltButton(
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 2));
              },
              textStyle: context.textStyle.headlineSmall,
              icon: Icons.check_circle_outline_outlined,
              label: 'Complete Documentation',
              labelProcessing: 'Submitting',
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
      //     Center(
      //       child: JoltButton(
      //         onPressed: _signIn,
      //         label: 'Send magic link',
      //         labelProcessing: 'Loading',
      //       ),
      //     ),
      //     const SizedBox(height: 18),
      //     Center(
      //       child: JoltButton(
      //         onPressed: _signInWithGoogle,
      //         label: 'Login with Google',
      //         labelProcessing: 'Loading',
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
