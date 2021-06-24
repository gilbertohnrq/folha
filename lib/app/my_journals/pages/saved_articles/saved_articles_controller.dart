import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SavedArticlesController {
  void removeArticleDialog(BuildContext context, Function()? onPressed) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Deseja remover do Meus jornais?',
            style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Você não poderá visualizar esse conteúdo quando estiver offline.',
            style: Theme.of(context).textTheme.headline5,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Modular.to.pop(),
                  child: Text(
                    'Cancelar',
                    style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'Remover',
                    style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
