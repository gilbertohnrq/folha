import 'package:app_client/app/splash/onboarding/onboarding_step_one.dart';
import 'package:app_client/app/splash/onboarding/onboarding_step_three.dart';
import 'package:app_client/app/splash/onboarding/onboarding_step_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:konoha/konoha.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  late final PageController pageController;

  int currentPage = 0;

  final List<Widget> _pages = [
    OnboardingStepOne(),
    OnboardingStepTwo(),
    OnboardingStepThree(),
  ];

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (int value) {
                setState(() {
                  currentPage = value;
                });
              },
              children: _pages,
            ),
            if (currentPage != 0)
              Align(
                alignment: Alignment.topLeft,
                child: TextButton.icon(
                  onPressed: () => pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease),
                  icon: const Icon(Icons.arrow_back, color: KonohaColors.text_color_light, size: 16),
                  label: const Text(''),
                ),
              ),
            if (currentPage != 2)
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () => Modular.to.navigate('/home/news'),
                  child: Text(
                    'PULAR',
                    style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            if (currentPage == 2)
              Align(
                alignment: Alignment.topRight,
                child: TextButton.icon(
                  onPressed: () => Modular.to.navigate('/home/news'),
                  icon: const Icon(Icons.close, color: KonohaColors.text_color_light, size: 16),
                  label: const Text(''),
                ),
              ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    final List<Widget> list = [];
    for (int i = 0; i < _pages.length; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 16 : 8,
      width: isActive ? 16 : 8,
      decoration: BoxDecoration(
        color: isActive ? KonohaColors.laranja_total : KonohaColors.cinza_10,
        borderRadius: const BorderRadius.all(Radius.circular(300)),
      ),
    );
  }
}
