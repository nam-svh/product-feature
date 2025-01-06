import 'package:go_router/go_router.dart';
import '../screens/category_screen.dart';
import '../screens/product_detail_screen.dart';
import '../models/product.dart';

class ProductRouter {
  static List<GoRoute> get routes => [
        GoRoute(
          path: '/product',
          builder: (context, state) => const CategoryScreen(),
          
        ),
        GoRoute(
          path: '/product/detail',
          builder: (context, state) {
            final product = state.extra as Product?;
            return ProductDetailScreen(product: product);
          },
        ),
      ];
}
