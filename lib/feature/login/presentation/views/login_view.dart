import 'package:flutter/material.dart';
import 'package:kafiil_test/feature/login/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoginViewBody(),
      ),
    );
  }
}
