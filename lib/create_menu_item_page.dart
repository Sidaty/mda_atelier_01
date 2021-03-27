import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mda_atelier_01/home_page.dart';
import 'package:mda_atelier_01/image_selector.dart';
import 'package:mda_atelier_01/models/menu_item.dart';

class CreateMenuItemPage extends StatefulWidget {
  final Function onMenuItemAdded;

  const CreateMenuItemPage({Key key, this.onMenuItemAdded}) : super(key: key);

  @override
  _CreateMenuItemPageState createState() => _CreateMenuItemPageState();
}

class _CreateMenuItemPageState extends State<CreateMenuItemPage> {
  String primaryImage;
  String secondaryImage;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  createMenuItem(BuildContext context) {
    bool isValid = formKey.currentState.validate();
    if (!isValid) {
      return;
    }

    String title = titleController.text;
    String description = descriptionController.text;
    int price = int.parse(priceController.text);

    MenuItem menuItem = MenuItem(
      title: title,
      description: description,
      price: price,
      primaryImage: primaryImage,
      secondaryImage: secondaryImage,
    );

    menus.add(menuItem);

    Navigator.pop(context);

    widget.onMenuItemAdded();
  }

  @override
  void initState() {
    super.initState();

    priceController.text = '1000';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ajouter un plat')),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 700),
          child: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              children: [
                Text('Titre', style: TextStyle(fontSize: 25.0)),
                SizedBox(height: 5.0),
                TextFormField(
                  controller: titleController,
                  validator: (value) {
                    if (value.isEmpty) return 'Merci de saisir le titre';
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Titre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text('Description', style: TextStyle(fontSize: 25.0)),
                SizedBox(height: 5.0),
                TextFormField(
                  minLines: 2,
                  maxLines: 10,
                  controller: descriptionController,
                  validator: (value) {
                    if (value.isEmpty) return 'Merci de saisir la description';
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                SizedBox(height: 20.0),
                Text('Prix', style: TextStyle(fontSize: 25.0)),
                SizedBox(height: 5.0),
                TextFormField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) return 'Merci de saisir le prix';
                    try {
                      int.parse(value);
                    } catch (e) {
                      return 'Merci de saisir un prix correct';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Prix',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                ElevatedButton.icon(
                  label: Text('Image principale'),
                  icon: Icon(Icons.camera_alt_outlined),
                  onPressed: () {
                    navigateTo(
                      context,
                      ImageSelector(onImageSelected: primaryImageSelected),
                    );
                  },
                ),
                if (primaryImage != null) Image.asset(primaryImage),
                SizedBox(height: 40.0),
                ElevatedButton.icon(
                  label: Text('Image secondaire'),
                  icon: Icon(Icons.camera_alt_outlined),
                  onPressed: () {
                    navigateTo(
                      context,
                      ImageSelector(onImageSelected: secondaryImageSelected),
                    );
                  },
                ),
                if (secondaryImage != null) Image.asset(secondaryImage),
                SizedBox(height: 40.0),
                ElevatedButton(
                  child: Text('Creer'),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                  ),
                  onPressed: () => createMenuItem(context),
                ),
              ],
            ),
          ),
        ),
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

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();

    super.dispose();
  }
}
