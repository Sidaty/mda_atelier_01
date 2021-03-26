import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mda_atelier_01/home_page.dart';
import 'package:mda_atelier_01/image_selector.dart';

class CreateMenuItemPage extends StatefulWidget {
  @override
  _CreateMenuItemPageState createState() => _CreateMenuItemPageState();
}

class _CreateMenuItemPageState extends State<CreateMenuItemPage> {
  String primaryImage = images[0];
  String secondaryImage = images[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ajouter un plat')),
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
              // int index = Random().nextInt(12);
              // String image = images[index];
              // primaryImageSelected(image);
              navigateTo(
                context,
                ImageSelector(onImageSelected: primaryImageSelected),
              );
            },
          ),
          Image.asset(primaryImage),
          SizedBox(height: 40.0),
          ElevatedButton.icon(
            label: Text('Image secondaire'),
            icon: Icon(Icons.camera_alt_outlined),
            onPressed: () {
              int index = Random().nextInt(12);
              String image = images[index];
              secondaryImageSelected(image);
              // navigateTo(context, ImageSelector(
              //   onImageSelected: (selectedImage) {
              //     setState(() {
              //       secondaryImage = selectedImage;
              //     });
              //   },
              // ));
            },
          ),
          Image.asset(secondaryImage),
          SizedBox(height: 40.0),
          ElevatedButton(
            child: Text('Creer'),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).accentColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  primaryImageSelected(String selectedImage) {
    setState(() {
      primaryImage = selectedImage;
    });
  }

  secondaryImageSelected(String selectedImage) {
    setState(() {
      secondaryImage = selectedImage;
    });
  }
}
