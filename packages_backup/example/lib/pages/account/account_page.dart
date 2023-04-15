import 'package:example/app/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_widget.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  final _usernameController = TextEditingController();
  final _websiteController = TextEditingController();
  String? _userId;
  String? _avatarUrl;
  var _loading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = supabase.auth.user();
      if (user != null) {
        _userId = user.id;
        _getProfile(user.id);
      }
    });
  }

  /// Called once a user id is received within `onAuthenticated()`
  Future<void> _getProfile(String userId) async {
    final messenger = context.scaffoldMessenger;
    setState(() {
      _loading = true;
    });
    final response = await supabase
        .from('profiles')
        .select()
        .eq('id', userId)
        .single()
        .execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      messenger.showSnackBarError(message: error.message);
    }
    final data = response.data;
    if (data != null) {
      _usernameController.text = (data['username'] ?? '') as String;
      _websiteController.text = (data['website'] ?? '') as String;
      _avatarUrl = (data['avatar_url'] ?? '') as String;
    }
    setState(() {
      _loading = false;
    });
  }

  /// Called when user taps `Update` button
  Future<void> _updateProfile() async {
    setState(() {
      _loading = true;
    });
    final userName = _usernameController.text;
    final website = _websiteController.text;
    final user = supabase.auth.currentUser;
    final updates = {
      'id': user!.id,
      'username': userName,
      'website': website,
      'updated_at': DateTime.now().toIso8601String(),
    };
    final response = await supabase.from('profiles').upsert(updates).execute();
    final error = response.error;
    if (error != null) {
      context.showSnackBarError(message: error.message);
    } else {
      context.showSnackBarSuccess(message: 'Successfully updated profile!');
    }
    setState(() {
      _loading = false;
    });
  }

  Future<void> _signOut() async {
    final response = await supabase.auth.signOut();
    final error = response.error;
    if (error != null) {
      context.showSnackBarError(message: error.message);
    }
  }

  /// Called when image has been uploaded to Supabase storage from within Avatar widget
  Future<void> _onUpload(String imageUrl) async {
    final response = await supabase.from('profiles').upsert({
      'id': _userId,
      'avatar_url': imageUrl,
    }).execute();
    final error = response.error;
    if (error != null) {
      context.showSnackBarError(message: error.message);
    }
    setState(() {
      _avatarUrl = imageUrl;
    });
    context.showSnackBar(message: 'Updated your profile image!');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          // Avatar(
          //   imageUrl: _avatarUrl,
          //   onUpload: _onUpload,
          // ),
          const SizedBox(height: 18),
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'User Name'),
          ),
          const SizedBox(height: 18),
          TextFormField(
            controller: _websiteController,
            decoration: const InputDecoration(labelText: 'Website'),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
              onPressed: _updateProfile,
              child: Text(_loading ? 'Saving...' : 'Update')),
          const SizedBox(height: 18),
          TextButton(onPressed: _signOut, child: const Text('Sign Out')),
        ],
      ),
    );
  }
}
