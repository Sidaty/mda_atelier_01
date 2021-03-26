import 'package:flutter/material.dart';
import 'package:mda_atelier_01/models/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;

  const MenuItemCard({Key key, this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(5, 5),
            ),
          ]),
      child: Column(
        children: [
          buildImages(context),
          buildContent(context),
        ],
      ),
    );
  }

  Widget buildImages(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(menuItem.primaryImage),
                  )),
            ),
            SizedBox(height: 60.0),
          ],
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          left: 0.0,
          child: Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(menuItem.secondaryImage),
                )),
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
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            menuItem.description,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
            ),
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
