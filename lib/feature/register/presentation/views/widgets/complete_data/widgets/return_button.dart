import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_test/core/shared_components/customButton.dart';
import 'package:kafiil_test/feature/register/presentation/manager/register_cubit/register_cubit.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = RegisterCubit.get(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return FadeInUp(
          delay: const Duration(milliseconds: 300),
          duration: const Duration(milliseconds: 1500),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: customButton(
              function: () {
                cubit.bachPage();
              },
              widget: const Text("Back"),
            ),
          ),
        );
      },
    );
  }
}
