import 'package:flutter/material.dart';

import 'OAuth_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign in with Google'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OAuthView()),
          ),
        ),
      ),
    );
  }
}
