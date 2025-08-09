import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final String title;
  final String image;
  final double price;
  final List<int> sizes;
  const ProductDetailsPage({
    super.key,
    required this.title,
    required this.image,
    required this.sizes,
    required this.price,
  });
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late int size;

  @override
  void initState() {
    super.initState();
    size = widget.sizes[0]; // Default to the first size
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details'), leading: Icon(Icons.arrow_back)),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(), // used for relative spacing
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image(image: AssetImage(widget.image)),
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
                      '\$${widget.price}',
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
                      itemCount: widget.sizes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                size = widget.sizes[index];
                              });
                            },
                            child: Chip(
                              backgroundColor: size == widget.sizes[index]
                                  ? Color.fromRGBO(254, 206, 1, 1)
                                  : Colors.white,
                              label: Text(widget.sizes[index].toString()),
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
                      onPressed: () {},
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
