import 'package:flutter/material.dart';
import 'package:konoha/konoha.dart';

class DownloadedEditionsEmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.download, color: KonohaColors.laranja_total, size: 56),
        Padding(
          padding: const EdgeInsets.only(left: 48, right: 48, top: 16),
          child: Text(
            'As edições que você baixar vão aparecer aqui',
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
