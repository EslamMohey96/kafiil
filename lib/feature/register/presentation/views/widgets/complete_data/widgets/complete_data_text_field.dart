import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:kafiil_test/core/shared_components/custom_text_form_field.dart';
import 'package:kafiil_test/core/shared_components/size_box.dart';
import 'package:kafiil_test/feature/register/presentation/manager/register_cubit/register_cubit.dart';

class CompleteDataTextField extends StatelessWidget {
  const CompleteDataTextField({super.key});

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
              FadeInLeft(
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 1500),
                child: TextFormField(
                    controller: cubit.aboutController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "About",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'About Name must\'n be empty ';
                      }
                      return null;
                    },
                  ),               
              ),
              sizeBoxH(20),
              FadeInRight(
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 1500),
                child: TextFormField(
                  controller: cubit.salaryController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Salary",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Salary must\'n be empty ';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
