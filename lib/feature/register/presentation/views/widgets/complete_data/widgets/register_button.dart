import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kafiil_test/core/shared_components/customButton.dart';
import 'package:kafiil_test/core/shared_components/size_box.dart';
import 'package:kafiil_test/feature/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:kafiil_test/feature/login/presentation/views/login_view.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = RegisterCubit.get(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is ChangeUIdDoneState) {
        Fluttertoast.showToast(
          msg: "Registration Done",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        cubit.emailController.text = '';
        cubit.firstNameController.text = '';
        cubit.lastNameController.text = '';
        cubit.passwordController.text = '';
        cubit.confirmPasswordController.text = '';
        cubit.salaryController.text = '';
        cubit.aboutController.text = '';
        cubit.currentPage = 0;

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginView()),
            (Route<dynamic> route) => false);
      }
    }, builder: (context, state) {
      return FadeInUp(
        delay: const Duration(milliseconds: 300),
        duration: const Duration(milliseconds: 1500),
        child: cubit.registerDone
            ? Container(
                // width: myLoginCubit.get(context).constraints! > 350
                //     ? 350
                //     : double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: customButton(
                  function: () {
                    if (cubit.formKey.currentState!.validate() &&
                        cubit.passwordController.text ==
                            cubit.confirmPasswordController.text) {
                      cubit.userRegister(
                        context: context,
                        firstName: cubit.firstNameController.text,
                        lastName: cubit.lastNameController.text,
                        email: cubit.emailController.text,
                        password: cubit.passwordController.text,
                        salary: cubit.salaryController.text,
                        about: cubit.aboutController.text,
                        userType: cubit.userType,
                      );
                    }
                  },
                  widget: const Text("Sign Up"),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                color: Colors.red,
              )),
      );
    });
  }
}
