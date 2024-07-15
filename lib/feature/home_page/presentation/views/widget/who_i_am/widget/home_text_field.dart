import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_test/constants.dart';
import 'package:kafiil_test/core/shared_components/size_box.dart';
import 'package:kafiil_test/feature/home_page/presentation/manager/home_page/home_page_cubit.dart';
import 'package:kafiil_test/feature/home_page/presentation/manager/home_page/home_page_state.dart';
import 'package:kafiil_test/feature/register/presentation/manager/register_cubit/register_cubit.dart';

class HomeTextField extends StatelessWidget {
  const HomeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = RegisterCubit.get(context);
    TextEditingController firstNameController =
        TextEditingController(text: userModel?.firstName);
    TextEditingController lastNameController =
        TextEditingController(text: userModel?.lastName);
    TextEditingController emailController =
        TextEditingController(text: userModel?.email);
    TextEditingController aboutController =
        TextEditingController(text: userModel?.about);
    TextEditingController salaryController =
        TextEditingController(text: userModel?.salary);
        cubit.userType = userModel!.userType;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            // FadeInRight(
            //     delay: const Duration(milliseconds: 300),
            //     duration: const Duration(milliseconds: 1500),
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: TextField(
            //             readOnly: true,
            //             controller: firstNameController,
            //             decoration: const InputDecoration(
            //               border: OutlineInputBorder(),
            //               labelText: "First Name",
            //             ),
            //           ),
            //         ),
            //         const Spacer(),
            //         Expanded(
            //           child: TextField(
            //             readOnly: true,
            //             controller: lastNameController,
            //             keyboardType: TextInputType.text,
            //             decoration: const InputDecoration(
            //               border: OutlineInputBorder(),
            //               labelText: "Last Name",
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),),
            sizeBoxH(20),
            FadeInLeft(
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 1500),
              child: TextField(
                readOnly: true,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email Address",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            sizeBoxH(20),
            FadeInRight(
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 1500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "User Type",
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text("Seller"),
                          leading: Radio(
                            value: cubit.userType == "Seller" ? 1 : 0,
                            groupValue: 1,
                            onChanged: null,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text("Buyer"),
                          leading: Radio(
                            value: cubit.userType == "Buyer" ? 1 : 0,
                            groupValue: 1,
                            onChanged: null,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text("Both"),
                          leading: Radio(
                            value: cubit.userType == "Both" ? 1 : 0,
                            groupValue: 1,
                            onChanged: null,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            sizeBoxH(20),
            FadeInLeft(
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 1500),
              child: TextField(
                readOnly: true,
                controller: aboutController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "About",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            sizeBoxH(20),
            FadeInLeft(
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 1500),
              child: TextField(
                readOnly: true,
                controller: salaryController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Salary",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            sizeBoxH(20),
            FadeInLeft(
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 1500),
              child: const TextField(
                readOnly: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Birth Date",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            sizeBoxH(20),
            FadeInRight(
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 1500),
              child: const Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text("Male"),
                      leading: Radio(
                        value: 0,
                        groupValue: 1,
                        onChanged: null,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text("Female"),
                      leading: Radio(
                        value: 1,
                        groupValue: 1,
                        onChanged: null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sizeBoxH(20),
            FadeInLeft(
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 1500),
              child: const TextField(
                readOnly: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Skills",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            sizeBoxH(20),
            FadeInLeft(
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 1500),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Favorite Social Media",
                        ),
                        Checkbox(
                          value: true,
                          onChanged: null,
                        ),
                        Text("Facebook"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: null,
                        ),
                        Text("Twitter"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: null,
                        ),
                        Text("LinkedIn"),
                      ],
                    )
                  ],
                )),
            // FadeInRight(
            //   delay: const Duration(milliseconds: 300),
            //   duration: const Duration(milliseconds: 1500),
            //   child: SizedBox(
            //     child: TextFormField(
            //       controller: cubit.passwordController,
            //       keyboardType: TextInputType.visiblePassword,
            //       obscureText: cubit.visiblePassword,
            //       decoration: InputDecoration(
            //         border: const OutlineInputBorder(),
            //         suffixIcon: IconButton(
            //           onPressed: () {
            //             cubit.changeVisiblePassword(!cubit.visiblePassword);
            //           },
            //           icon: Icon(
            //             cubit.visiblePassword
            //                 ? Icons.visibility
            //                 : Icons.visibility_off,
            //           ),
            //         ),
            //       labelText: "Password",
            //       ),
            //       validator: (value) {
            //         if (value!.isEmpty) {
            //           return 'password must\'n be empty ';
            //         }
            //         return null;
            //       },
            //     ),
            //   ),
            // ),
            sizeBoxH(20),
          ],
        );
      },
    );
  }
}
