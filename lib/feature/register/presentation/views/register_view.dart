import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';
import 'package:kafiil_test/core/shared_components/size_box.dart';
import 'package:kafiil_test/feature/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:kafiil_test/feature/register/presentation/views/widgets/register/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = RegisterCubit.get(context);
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(children: [
            sizeBoxH(50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlutterStepIndicator(
                onClickItem: (i) {
                  print("-------------------------------");
                  print(i);
                  switch (i) {
                    case 1:
                      if (i == 1 &&
                          cubit.formKey.currentState!.validate() &&
                          cubit.passwordController.text ==
                              cubit.confirmPasswordController.text) {
                        cubit.changeToPage(i);
                      }
                      break;
                     case 1:
                    cubit.changeToPage(i);                  
                      break;
                  }
                },
                onChange: (i) {
                  print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
                  print(i);
                },
                list: const [0, 1, 2],
                page: cubit.currentPage + 1,
                height: 30,
              ),
            ),
            cubit.pages[cubit.currentPage],
          ]);
        },
      ),
    );
  }
}
