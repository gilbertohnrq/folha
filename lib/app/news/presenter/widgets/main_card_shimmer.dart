import 'package:app_client/app/core/components/shimmer/konoha_shimmer.dart';
import 'package:app_client/app/core/components/shimmer/konoha_shimmer_container.dart';
import 'package:flutter/material.dart';

class MainCardShimmer extends StatelessWidget {
  const MainCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KonohaShimmer(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          KonohaShimmerContainer(width: double.infinity, height: 45),
          SizedBox(height: 10),
          KonohaShimmerContainer(width: double.infinity, height: 140),
          SizedBox(height: 5),
          KonohaShimmerContainer(width: 100, height: 10),
        ],
      ),
    );
  }
}
