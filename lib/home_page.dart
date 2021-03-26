import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Le menu'),
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
          return MenuItemCard(menuItem: menuItem);
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

navigateTo(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return page;
    }),
  );
}
