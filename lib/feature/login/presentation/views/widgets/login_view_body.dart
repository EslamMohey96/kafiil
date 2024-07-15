import 'package:flutter/material.dart';
import 'package:kafiil_test/feature/login/presentation/views/widgets/do_not_have_account.dart';
import 'package:kafiil_test/feature/login/presentation/views/widgets/image_view.dart';
import 'package:kafiil_test/feature/login/presentation/views/widgets/logIn_button.dart';
import 'package:kafiil_test/feature/login/presentation/views/widgets/login_text_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageView(),
            LoginTextField(),
            LogInButton(),
            DoNotHaveAccount(),
          ],
        ),
      ),
    );
  }
}
