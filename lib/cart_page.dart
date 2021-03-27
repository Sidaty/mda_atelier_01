import 'package:flutter/material.dart';
import 'package:mda_atelier_01/models/menu_item.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<MenuItemCart> _cart = cart.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon panier'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          MenuItemCart menuItemCart = _cart[index];
          return Dismissible(
            key: ValueKey(menuItemCart.menuItem.id),
            background: Container(color: Colors.red),
            onDismissed: (direction) {
              print('### Direction : $direction');
              cart.remove(menuItemCart.id);
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(menuItemCart.menuItem.primaryImage),
              ),
              title: Text('${menuItemCart.menuItem.title}'),
              subtitle: Text('${menuItemCart.menuItem.description}'),
              trailing: RawChip(
                label: Text('${menuItemCart.totalPrice}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
