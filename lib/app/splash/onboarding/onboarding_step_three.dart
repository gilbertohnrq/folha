import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konoha/konoha.dart';

class OnboardingStepThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double imageSize = width * 0.5278;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: imageSize,
              height: imageSize,
              margin: const EdgeInsets.only(bottom: 36),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage('https://p2.trrsf.com/image/fget/cf/940/0/images.terra.com/2020/02/27/jornais.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(300.0),
                border: Border.all(
                  color: KonohaColors.laranja_total,
                  width: 4,
                ),
              ),
            ),
            Text(
              'Leia quando quiser',
              style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              width: width * 0.0833333,
              height: 2,
              color: KonohaColors.laranja_total,
              margin: const EdgeInsets.only(bottom: 24),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.0639),
              child: Text(
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
