import 'package:flutter/material.dart';
import 'package:kafiil_test/feature/home_page/presentation/views/widget/who_i_am/widget/home_text_field.dart';

class WhoIAm extends StatelessWidget {
  const WhoIAm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: const SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
