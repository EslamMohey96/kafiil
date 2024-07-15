import 'package:flutter/material.dart';
import 'package:kafiil_test/core/shared_components/size_box.dart';
import 'package:kafiil_test/feature/register/presentation/views/widgets/complete_data/widgets/complete_data_text_field.dart';
import 'package:kafiil_test/feature/register/presentation/views/widgets/complete_data/widgets/register_button.dart';
import 'package:kafiil_test/feature/register/presentation/views/widgets/complete_data/widgets/return_button.dart';

class CompleteData extends StatelessWidget {
  const CompleteData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: const SingleChildScrollView(
        child: Column(
          children: [
            CompleteDataTextField(),
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                children: [
                  Expanded(child: Padding(
                    padding: EdgeInsets.only(right:8.0),
                    child: ReturnButton(),
                  )),
                  Expanded(child: RegisterButton()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}