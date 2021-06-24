import 'package:app_client/app/core/components/shimmer/konoha_shimmer.dart';
import 'package:app_client/app/core/components/shimmer/konoha_shimmer_container.dart';
import 'package:flutter/material.dart';

class DetailsCardShimmer extends StatelessWidget {
  const DetailsCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KonohaShimmer(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            KonohaShimmerContainer(width: double.infinity, height: 60, radius: 5), // titulo
            SizedBox(height: 8), // espacamento
            KonohaShimmerContainer(width: 150, height: 40, radius: 5), //publicado por
            SizedBox(height: 22),
            KonohaShimmerContainer(width: double.infinity, height: 180) , // imagem
            SizedBox(height: 24),
            KonohaShimmerContainer(width: double.infinity , height: 35, radius: 5), //legenda
            SizedBox(height: 32),
            KonohaShimmerContainer(width: double.infinity, height: 350, radius: 5), // texto
          ],
        ),
      ),
    );
  }
}
