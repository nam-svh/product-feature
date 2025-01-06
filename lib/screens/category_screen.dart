import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/checkout_infor.dart';
import '../repositories/product_repository.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ProductRepository _productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
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
                            _productRepository.updateProductQuantity(product.id, product.quantity > 0 ? product.quantity - 1 : 0);
                          });
                        },
                      ),
                      Text('${product.quantity}'),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            _productRepository.updateProductQuantity(product.id, product.quantity + 1);
                          });
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    context.go('/product/detail', extra: product);
                  },
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 32.0),
            child: ElevatedButton(
              child: const Text('Checkout'),
              onPressed: () {
                final checkOutInfor = CheckoutInfor(
                  totalQuantity: _productRepository.totalQuantity(),
                  totalPrice: _productRepository.totalPrice(),
                  totalDiscount: _productRepository.totalDiscount(),
                  totalAfterDiscount: _productRepository.totalAfterDiscount(),
                );
                debugPrint('Product featute  $checkOutInfor');
                context.go('/checkout', extra: checkOutInfor);
              },
            ),
          ),
        ],
      ),
    );
  }
}
