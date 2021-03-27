import 'package:mda_atelier_01/image_selector.dart';
import 'package:uuid/uuid.dart';

class MenuItem {
  String id;
  String title;
  String description;
  int price;
  String primaryImage;
  String secondaryImage;

  MenuItem({
    this.id,
    this.title,
    this.description,
    this.price,
    this.primaryImage,
    this.secondaryImage,
  });
}

class MenuItemCart {
  MenuItem menuItem;
  int quantity;

  String get id => menuItem.id;

  int get totalPrice => quantity * menuItem.price;

  MenuItemCart({this.menuItem, this.quantity});
}


List<MenuItem> menus = [
  MenuItem(
    id: Uuid().v4(),
    title: 'Lafri',
    description: 'Lafri',
    price: 4000,
    primaryImage: images[5],
    secondaryImage: images[10],
  ),
  MenuItem(
    id: Uuid().v4(),
    title: 'Yassa',
    description: 'Yassa poulet',
    price: 2000,
    primaryImage: images[7],
    secondaryImage: images[9],
  ),
  MenuItem(
    id: Uuid().v4(),
    title: 'To',
    description: 'Le de segou',
    price: 2000,
    primaryImage: images[3],
    secondaryImage: images[4],
  ),
];


Map<String, MenuItemCart> cart = <String, MenuItemCart>{};
