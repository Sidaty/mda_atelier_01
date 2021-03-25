import 'package:flutter/material.dart';

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
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Amadou Konate'),
              accountEmail: Text('amadou.konate@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Checkbox(
              value: checkboxValue,
              onChanged: (value) {
                print('Checkbox clicked : $value');
                checkboxValue = value;

                setState(() {});
              },
            ),
            Container(
              height: 200,
              width: 200.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.green, width: 10.0)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
