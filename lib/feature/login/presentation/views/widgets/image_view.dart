import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 300),
      duration: const Duration(milliseconds: 1500),
      child: Image.asset('assets/images/login.png'),
    );
  }
}
