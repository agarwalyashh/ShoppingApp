import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  // late int size;

  // @override
  // void initState() {
  //   super.initState();
  //   size = widget.sizes[0]; // Default to the first size
  // }

  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Text(
                widget.product['title'].toString(),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(), // used for relative spacing
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image(
                image: AssetImage(widget.product['imageUrl'].toString()),
                height: 250,
              ),
            ),
            Spacer(flex: 2),
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color.fromRGBO(245, 247, 249, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      '\$${widget.product['price']}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                              backgroundColor: selectedSize == size
                                  ? Color.fromRGBO(254, 206, 1, 1)
                                  : Colors.white,
                              label: Text(size.toString()),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(254, 206, 1, 1),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        Provider.of<CartProvider>(
                          context,
                        ).addProduct(widget.product);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart, color: Colors.black),
                          SizedBox(width: 5),
                          Text(
                            'Add to Cart',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
