import 'package:flutter/material.dart';


class SplashScreenTablet extends StatelessWidget {
  const SplashScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Image.asset(
          'assets/images/logo.png',
          width: 550,
        ),
      ),
    );
  }
}
