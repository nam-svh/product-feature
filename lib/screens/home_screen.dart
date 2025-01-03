import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../repositories/product_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductRepository _productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
      ),
      body: ListView.builder(
        itemCount: _productRepository.products.length,
        itemBuilder: (context, index) {
          final product = _productRepository.products[index];
          return ListTile(
            leading: CircleAvatar(
              child: Icon(product.icon),
            ),
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    setState(() {
                      _productRepository.updateProductQuantity(
                        product.id, 
                        product.quantity > 0 ? product.quantity - 1 : 0
                      );
                    });
                  },
                ),
                Text('${product.quantity}'),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    setState(() {
                      _productRepository.updateProductQuantity(
                        product.id, 
                        product.quantity + 1
                      );
                    });
                  },
                ),
              ],
            ),
            onTap: () {
              context.go('/detail', extra: product);
            },
          );
        },
      ),
    );
  }
}
