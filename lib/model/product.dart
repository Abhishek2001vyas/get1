
import 'package:get/get.dart';

class Product {
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;

  Product({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.productDescription,
    required this.price,
  });

  // final isFavorite = false.obs;
  //
  // get rating => null;
  //
  // String? get name => null;
  //
  // String? get imageLink => null;

}