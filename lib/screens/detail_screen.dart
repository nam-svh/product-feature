import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/product.dart';
import '../repositories/product_repository.dart';

class DetailScreen extends StatefulWidget {
  final Product? product;

  const DetailScreen({super.key, this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final ProductRepository _productRepository = ProductRepository();
  late Product? _currentProduct;

  @override
  void initState() {
    super.initState();
    // Fetch the product from repository to ensure we have the latest state
    _currentProduct = widget.product != null 
      ? _productRepository.getProductById(widget.product!.id) 
      : null;
  }

  @override
  Widget build(BuildContext context) {
    if (_currentProduct == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Product Detail'),
        ),
        body: const Center(
          child: Text('No product selected'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              _currentProduct!.icon,
              size: 200,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              _currentProduct!.name,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              '\$${_currentProduct!.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              _currentProduct!.description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline, size: 40),
                  onPressed: () {
                    setState(() {
                      _productRepository.updateProductQuantity(
                        _currentProduct!.id, 
                        _currentProduct!.quantity > 0 ? _currentProduct!.quantity - 1 : 0
                      );
                    });
                  },
                ),
                const SizedBox(width: 16),
                Text(
                  '${_productRepository.getProductById(_currentProduct!.id)?.quantity}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, size: 40),
                  onPressed: () {
                    setState(() {
                      _productRepository.updateProductQuantity(
                        _currentProduct!.id, 
                        _currentProduct!.quantity + 1
                      );
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
