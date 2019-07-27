import 'base_cart_item.dart';
import 'base_cart_item_controller.dart';

class BaseCart{

  List<BaseCartItem> items;

  BaseCart(this.items);

  BaseCart.fromJson( Map<String,dynamic> jsonObject ){
    this.items = BaseCartItemController.toBaseCartItems(jsonObject['items']);
  }




}