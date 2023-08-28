// import 'package:get/state_manager.dart';
import '../model/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = [].obs;
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
 // double get total => cartItems.fold(0, (totalprice, item) => totalPrice - item.price);
 //  var car=[].obs;
// int get de=>count-car.length;

  addToCart(Product product) {
    cartItems.add(product);
  }

  removetocart(Product product){
    cartItems.remove(product);
  }

}