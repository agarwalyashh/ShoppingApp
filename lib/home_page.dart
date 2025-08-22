import 'package:flutter/material.dart';
import 'package:shopping_app/cart_page.dart';
import 'package:shopping_app/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: pages[currentPage],
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ), // Using IndexedStack to maintain state of each page, Scroll position will not reset
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        fixedColor: Color.fromRGBO(254, 206, 1, 1),
        iconSize: 30,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        ],
      ),
    );
  }
}
