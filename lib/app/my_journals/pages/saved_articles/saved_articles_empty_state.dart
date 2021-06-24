import 'package:flutter/material.dart';
import 'package:konoha/konoha.dart';

class SavedArticlesEmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.bookmark_border, color: KonohaColors.laranja_total, size: 56),
        Padding(
          padding: const EdgeInsets.only(left: 48, right: 48, top: 16),
          child: Text(
            'As matérias que você salvar vão aparecer aqui',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: KonohaColors.laranja_total,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
