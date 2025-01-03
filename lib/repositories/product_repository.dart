import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductRepository {
  static final ProductRepository _instance = ProductRepository._internal();
  
  factory ProductRepository() {
    return _instance;
  }
  
  ProductRepository._internal();

  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Smartphone X',
      description: 'High-end smartphone with advanced features',
      price: 999.99,
      icon: Icons.phone_android,
    ),
    Product(
      id: '2',
      name: 'Wireless Earbuds',
      description: 'Noise-cancelling bluetooth earbuds',
      price: 199.99,
      icon: Icons.headphones,
    ),
    Product(
      id: '3',
      name: 'Smart Watch',
      description: 'Fitness tracker with heart rate monitor',
      price: 249.99,
      icon: Icons.watch,
    ),
  ];

  int totalQuantity() {
    return _products.fold(0, (total, product) => total + product.quantity);
  }

  double totalPrice() =>  _products.fold(0, (total, product) => total + (product.price * product.quantity));


  double totalDiscount() => _products.fold(0, (total, product) => total + (product.price * product.quantity * 0.1));
  

  double totalAfterDiscount() => totalPrice() - totalDiscount();
  

  List<Product> get products => _products;

  Product? getProductById(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  void updateProductQuantity(String id, int quantity) {
    final product = getProductById(id);
    if (product != null) {
      product.quantity = quantity;
    }
  }
}
