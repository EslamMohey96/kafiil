import 'package:flutter/material.dart';
import 'package:kafiil_test/feature/register/presentation/views/widgets/register/widgets/next_button.dart';
import 'package:kafiil_test/feature/register/presentation/views/widgets/register/widgets/register_text_field.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: const SingleChildScrollView(
        child: Column(
          children: [
            RegisterTextField(),
            Padding(
              padding: EdgeInsets.only(top:50),
              child: NextButton(),
            ),
          ],
        ),
      ),
    );
  }
}
