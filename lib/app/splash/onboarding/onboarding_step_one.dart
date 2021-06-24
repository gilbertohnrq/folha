import 'package:flutter/material.dart';
import 'package:konoha/konoha.dart';

class OnboardingStepOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double imageSize = width * 0.8222;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: KonohaImages.logoComBorda(width: imageSize),
      ),
    );
  }
}
