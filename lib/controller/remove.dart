import 'package:get/get.dart';
import '../model/product.dart';

class RemoveController extends GetxController{
  var cartItems = [].obs;
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(totalPrice, (sum,item) => totalPrice - item.price);


  addToCart(Product product) {
    cartItems.add(product);

  }

}