import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String category;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.category,
    required this.description,
    required this.imageUrl,
  });
}

class ProductsProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'منتج تجريبي 1',
      price: 100.0,
      quantity: 50,
      category: 'إلكترونيات',
      description: 'منتج عالي الجودة',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: '2',
      name: 'منتج تجريبي 2',
      price: 200.0,
      quantity: 30,
      category: 'ملابس',
      description: 'منتج ممتاز',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(String id, Product product) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index != -1) {
      _products[index] = product;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  double getTotalInventoryValue() {
    return _products.fold(0, (sum, product) => sum + (product.price * product.quantity));
  }
}
