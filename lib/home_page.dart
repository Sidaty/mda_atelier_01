import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mda_atelier_01/cart_page.dart';
import 'package:mda_atelier_01/create_menu_item_page.dart';
import 'package:mda_atelier_01/menu_item_card.dart';
import 'package:mda_atelier_01/models/menu_item.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  bool checkboxValue = false;

  onMenuItemAdded() {
    setState(() {});
  }

  onItemAdd(MenuItem menuItem) {
    print('#### item added : ${menuItem.title}');
    MenuItemCart menuItemCart;
    if (cart.containsKey(menuItem.id)) {
      menuItemCart = cart[menuItem.id];
    } else {
      menuItemCart = MenuItemCart(
        menuItem: menuItem,
        quantity: 0,
      );
      cart[menuItem.id] = menuItemCart;
    }
    menuItemCart.quantity++;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int totalQuantity = 0;
    for(MenuItemCart menuItemCart in cart.values) {
      totalQuantity += menuItemCart.quantity;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Le menu'),
        actions: [
          CartItemCounter(itemCount: totalQuantity),
          SizedBox(width: 10.0),
        ],
      ),
      drawer: MyDrawer(onMenuItemAdded: onMenuItemAdded),
      body: ListView.separated(
        itemCount: menus.length,
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40.0,
        ),
        itemBuilder: (context, index) {
          MenuItem menuItem = menus[index];
          return MenuItemCard(menuItem: menuItem, onItemAdd: onItemAdd);
        },
        separatorBuilder: (_, __) => SizedBox(height: 25.0),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function onMenuItemAdded;

  const MyDrawer({Key key, this.onMenuItemAdded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Amadou Konate'),
            accountEmail: Text('amadou.konate@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.account_circle),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.add),
                  ),
                  title: Text('Ajouter un plat'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pop(context);

                    navigateTo(
                      context,
                      CreateMenuItemPage(onMenuItemAdded: onMenuItemAdded),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemCounter extends StatelessWidget {
  final int itemCount;

  const CartItemCounter({Key key, this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String countString = '';
    if (itemCount < 10) {
      countString = '$itemCount';
    } else {
      countString = '+9';
    }
    return InkWell(
      onTap: () => navigateTo(context, CartPage()),
      child: Stack(
        children: [
          CircleAvatar(
            child: Icon(Icons.shopping_cart),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: CircleAvatar(
              radius: 12.0,
              backgroundColor: Colors.red,
              child: Text(countString),
            ),
          ),
        ],
      ),
    );
  }
}

navigateTo(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return page;
    }),
  );
}
