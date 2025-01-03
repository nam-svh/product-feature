import 'package:flutter/material.dart';
import 'navigator/app_router.dart';

void main() {
  runApp(const ProductFeature());
}

class ProductFeature extends StatelessWidget {
  const ProductFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Product Feature',
      routerConfig: AppRouter.router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}