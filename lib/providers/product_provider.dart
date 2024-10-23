import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: '1',
      title: 'Laptop',
      description: 'A high performance laptop',
      price: 1200.0,
      imageUrl: 'https://example.com/laptop.jpg',
    ),
    Product(
      id: '2',
      title: 'Smartphone',
      description: 'A new generation smartphone',
      price: 800.0,
      imageUrl: 'https://example.com/phone.jpg',
    ),
  ];

  List<Product> get products => [..._products];

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}