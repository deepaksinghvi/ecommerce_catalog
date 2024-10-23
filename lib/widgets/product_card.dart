import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0), // Padding around the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.imageUrl,
                height: 80, // Height for the product image
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5), // Space between image and title
            Text(
              product.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // Ensure title fits within 2 lines
            ),
            SizedBox(height: 5), // Space between title and description
            Text(
              product.description,
              style: TextStyle(fontSize: 12), // Font size for description
              maxLines: 2, // Limit description to 2 lines
              overflow: TextOverflow.ellipsis, // Ellipsis for overflow
            ),
            SizedBox(height: 5), // Space between description and price
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.green, fontSize: 12),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product), // This line passes the product
                  ),
                );
              },
              child: Text('View Details', style: TextStyle(fontSize: 12)),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}