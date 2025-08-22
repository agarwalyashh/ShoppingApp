import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/product_card.dart';
import 'package:shopping_app/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Use SafeArea to avoid notches and system UI overlaps
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Shoes\nCollection',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ),
              Expanded(
                // All remaining space will be used by the TextField
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(225, 225, 225, 1),
                      ),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filters[index];
                      });
                    },
                    child: Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: BorderSide(color: Color.fromRGBO(245, 247, 249, 1)),
                      backgroundColor: selectedFilter == filters[index]
                          ? Color.fromRGBO(254, 206, 1, 1)
                          : Color.fromRGBO(245, 247, 249, 1),
                      label: Text(
                        filters[index],
                        style: TextStyle(fontSize: 12),
                      ),
                      padding: EdgeInsets.all(12.0),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsPage(product: product);
                        },
                      ),
                    );
                  },
                  child: ProductCard(product: product, index: index.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
