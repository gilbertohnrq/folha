import 'package:flutter/material.dart';
import 'package:konoha/konoha.dart';

class ErrorScreenState extends StatefulWidget {
  const ErrorScreenState({Key? key}) : super(key: key);

  @override
  _ErrorScreenStateState createState() => _ErrorScreenStateState();
}

class _ErrorScreenStateState extends State<ErrorScreenState> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          KonohaImages.errorStateImage(),
          Padding(
            padding: const EdgeInsets.only(top: 36, bottom: 16),
            child: Text(
              'Oops!',
              style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold, color: KonohaColors.laranja_total),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Algo deu errado',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ),
          // KonohaButtomSecondary(isActive: true, label: 'Tente Novamente', onpressed: onpressed, width: width, height: height)
        ],
      ),
    );
  }
}
