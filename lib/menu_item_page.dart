import 'package:flutter/material.dart';
import 'package:mda_atelier_01/app_style.dart';
import 'package:mda_atelier_01/models/menu_item.dart';

class MenuItemPage extends StatelessWidget {
  final MenuItem menuItem;

  const MenuItemPage({Key key, this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuItem.title, style: menuItemTitleStyle),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: [
            buildImages(context),
            buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget buildImages(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Hero(
              tag: 'primary-image-${menuItem.title}',
              child: Container(
                height: 300.0,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(menuItem.primaryImage),
                  ),
                ),
              ),
            ),
            SizedBox(height: 80.0),
          ],
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          left: 0.0,
          child: Hero(
            tag: 'secondary-image-${menuItem.title}',
            child: Container(
              height: 160.0,
              width: 160.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(menuItem.secondaryImage),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          Text(
            menuItem.title,
            style: menuItemTitleStyle,
          ),
          SizedBox(height: 20.0),
          Text(
            menuItem.description,
            style: menuItemDescriptionStyle,
          ),
          SizedBox(height: 40.0),
          Row(
            children: [
              RawChip(
                backgroundColor: Colors.deepOrange,
                label: Text(
                  '${menuItem.price} F',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              Spacer(),
              ElevatedButton(
                child: Text('Ajouter au panier'),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  elevation: 0.0,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
