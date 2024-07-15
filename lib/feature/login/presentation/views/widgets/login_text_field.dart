import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:kafiil_test/core/shared_components/size_box.dart';
import 'package:kafiil_test/feature/login/presentation/manager/login_cubit/login_cubit.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              FadeInRight(
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 1500),
                child: TextFormField(
                  controller: cubit.emailController,
                  validator: cubit.validateEmail,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(IconBroken.Profile),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              sizeBoxH(20),
              FadeInLeft(
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 1500),
                child: TextFormField(
                  controller: cubit.passwordController,
                  validator: cubit.validatePassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(IconBroken.Lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        cubit.visiblePassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () => cubit.changeVisiblePassword(!cubit.visiblePassword),
                    ),
                  ),
                  obscureText: !cubit.visiblePassword,
                ),                
              ),
              sizeBoxH(20),
            ],
          ),
        );
      },
    ); }
}
