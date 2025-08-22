import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 35,
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
              color: Colors.red,
            ),
            title: Text(
              cartItem['title'].toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Size: ${cartItem['size']}'),
          );
        },
      ),
    );
  }
}
