import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Product(
        id: item['id'].toString(),
        title: item['title'],
        description: item['description'],
        price: item['price'].toDouble(),
        imageUrl: item['image'],
      )).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}