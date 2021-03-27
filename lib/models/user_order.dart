
import 'package:mda_atelier_01/models/menu_item.dart';
import 'package:mda_atelier_01/models/users.dart';

enum UserOrderStatus {
  initial,
  inProcess,
  ready,
  inDelivery,
  delivered
}

class UserOrder {
  User user;
  DateTime createdDate;
  List<MenuItemCart> orderItems;
  int totalAmount;
  UserOrderStatus orderStatus;

  UserOrder({
    this.user,
    this.createdDate,
    this.orderItems,
    this.totalAmount,
    this.orderStatus,
  });

}

final orders = <UserOrder>[];