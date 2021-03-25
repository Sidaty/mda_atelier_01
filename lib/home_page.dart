import 'package:flutter/material.dart';
import 'package:mda_atelier_01/create_menu_item_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Le menu'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
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

                    navigateTo(context, CreateMenuItemPage());
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
