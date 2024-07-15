import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kafiil_test/core/shared_components/customButton.dart';
import 'package:kafiil_test/core/shared_components/size_box.dart';
import 'package:kafiil_test/feature/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:kafiil_test/feature/login/presentation/views/login_view.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = RegisterCubit.get(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          children: [
            const Spacer(),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 1500),
              child: customButton(
                width: 200,
                function: () {
                  if (cubit.formKey.currentState!.validate() &&
                      cubit.passwordController.text ==
                          cubit.confirmPasswordController.text) {
                    cubit.changePage();
                  }
                },
                widget: const Text("Next"),
              ),
            ),
          ],
        );
      },
    );
  }
}
