import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:kafiil_test/core/shared_components/custom_text_form_field.dart';
import 'package:kafiil_test/core/shared_components/size_box.dart';
import 'package:kafiil_test/feature/register/presentation/manager/register_cubit/register_cubit.dart';

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = RegisterCubit.get(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            key: cubit.formKey,
            child: Column(
              children: [
                FadeInRight(
                    delay: const Duration(milliseconds: 300),
                    duration: const Duration(milliseconds: 1500),
                     child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: TextFormField(
                              controller: cubit.firstNameController,
                              keyboardType: TextInputType.text,
                             decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "First Name",

                                ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'First Name must\'n be empty ';

                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: cubit.lastNameController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Last Name",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Last Name must\'n be empty ';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    )),
                sizeBoxH(20),
                FadeInLeft(
                  delay: const Duration(milliseconds: 300),
                  duration: const Duration(milliseconds: 1500),
                  child: TextFormField(
                    controller: cubit.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email Address",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email must\'n be empty ';
                      }
                      return null;
                    },
                  ),
                ),
                sizeBoxH(20),               
                FadeInRight(
                  delay: const Duration(milliseconds: 300),
                  duration: const Duration(milliseconds: 1500),
                  child: SizedBox(
                    child: TextFormField(
                      controller: cubit.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: cubit.visiblePassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changeVisiblePassword(!cubit.visiblePassword);
                          },
                          icon: Icon(
                            cubit.visiblePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'password must\'n be empty ';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                sizeBoxH(20),
                FadeInLeft(
                  delay: const Duration(milliseconds: 300),
                  duration: const Duration(milliseconds: 1500),
                  child: SizedBox(
                    child: TextFormField(
                      controller: cubit.confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: cubit.visiblePassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changeVisibleConfirmPassword(!cubit.visibleConfirmPassword);
                          },
                          icon: Icon(
                            cubit.visibleConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      labelText: "Confirm Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Confirm password must\'n be empty ';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                sizeBoxH(20),
                FadeInLeft(
                  delay: const Duration(milliseconds: 300),
                  duration: const Duration(milliseconds: 1500),
                  child: SizedBox(
                    child:DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "User Type",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'User type must\'n be empty ';
                        }
                        return null;
                      },
                      value: cubit.userType,
                      icon: const Icon(
                        IconBroken.Arrow___Down_2,
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: "Seller",
                          child: Text("Seller"),
                        ),
                        DropdownMenuItem(
                          value: "Buyer",
                          child: Text("Buyer"),
                        ),
                        DropdownMenuItem(
                          value: "Both",
                          child: Text("Both"),
                        ),
                      ],
                      onChanged: (c) {
                        cubit.userType = c.toString();
                      },                      
                    )
                  ),
                ),
              ],
            ),
          );
        });
  }
}
