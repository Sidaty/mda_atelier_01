import 'package:flutter/material.dart';
import 'package:mda_atelier_01/home_page.dart';
import 'package:mda_atelier_01/image_selector.dart';

class CreateMenuItemPage extends StatefulWidget {
  @override
  _CreateMenuItemPageState createState() => _CreateMenuItemPageState();
}

class _CreateMenuItemPageState extends State<CreateMenuItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un plat'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        children: [
          Text(
            'Titre',
            style: TextStyle(fontSize: 25.0),
          ),
          SizedBox(height: 5.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Titre',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Description',
            style: TextStyle(fontSize: 25.0),
          ),
          SizedBox(height: 5.0),
          TextFormField(
            minLines: 5,
            maxLines: 10,
            decoration: InputDecoration(
              hintText: 'Description',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Prix',
            style: TextStyle(fontSize: 25.0),
          ),
          SizedBox(height: 5.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Prix',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          SizedBox(height: 40.0),
          ElevatedButton.icon(
            label: Text('Image principale'),
            icon: Icon(Icons.camera_alt_outlined),
            onPressed: () {
              navigateTo(context, ImageSelector());
            },
          ),
          SizedBox(height: 40.0),
          ElevatedButton.icon(
            label: Text('Image secondaire'),
            icon: Icon(Icons.camera_alt_outlined),
            onPressed: () {
              navigateTo(context, ImageSelector());
            },
          ),
          SizedBox(height: 40.0),
          ElevatedButton.icon(
            label: Text('Image secondaire'),
            icon: Icon(Icons.camera_alt_outlined),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).accentColor
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
