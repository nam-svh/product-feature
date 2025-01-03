import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/detail_screen.dart';
import '../models/product.dart';

class ProductRouter {
  static List<GoRoute> get routes => [
        GoRoute(
          path: '/product',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/product/detail',
          builder: (context, state) {
            final product = state.extra as Product?;
            return DetailScreen(product: product);
          },
        ),
      ];
}
