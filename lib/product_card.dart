import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, Object> product;
  final String index;
  const ProductCard({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: int.parse(index) % 1 == 0
            ? Color.fromRGBO(245, 247, 249, 1)
            : Color.fromRGBO(216, 240, 253, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product['title'].toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              '\$${product['price']}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Center(
              child: Image(
                image: AssetImage(product['imageUrl'].toString()),
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
