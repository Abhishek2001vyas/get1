import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/cart.dart';
import 'controller/shoppin.dart';
import 'controller/remove.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  final remove = Get.put(RemoveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GetX<ShoppingController>(
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(12),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${controller.products[index].productName}',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        Text(
                                            '${controller.products[index].productDescription}'),
                                      ],
                                    ),
                                    Text('${controller.products[index].price}',
                                        style: TextStyle(fontSize: 24)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          cartController.addToCart(
                                              controller.products[index]);
                                        },
                                        icon: Icon(Icons.add)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          cartController.removetocart(controller.products[index]);
                                        },
                                        icon: Icon(Icons.remove))
                                  ],
                                )
                                // ElevatedButton(
                                //   style: ButtonStyle(),
                                //   onPressed: () {
                                //     cartController
                                //         .addToCart(controller.products[index]);
                                //   },
                                //
                                // // color: Colors.blue,
                                // // textColor: Colors.white,
                                //   child: Text('Add to Cart',
                                //       style: TextStyle(color: Colors.white)),
                                // ),
                                // Obx(() => IconButton(
                                //       icon: controller
                                //               .products[index].isFavorite.value
                                //           ? Icon(Icons.check_box_rounded)
                                //           : Icon(Icons
                                //               .check_box_outline_blank_outlined),
                                //       onPressed: () {
                                //         controller.products[index].isFavorite
                                //             .toggle();
                                //       },
                                //     ))
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              GetX<CartController>(builder: (controller) {
                return Text(
                  'Total amount:  ${controller.totalPrice}',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                );
              }),
              SizedBox(height: 100),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.amber,
          icon: Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.black,
          ),
          label: GetX<CartController>(builder: (controller) {
            return Text(
              controller.count.toString(),
              style: TextStyle(color: Colors.black, fontSize: 24),
            );
          }),
        ));
  }
}
