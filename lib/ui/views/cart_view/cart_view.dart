import 'package:flutter/material.dart';
import 'package:food_1/ui/shared/colors.dart';
import 'package:food_1/ui/shared/custom_widgets/button.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/cart_view/cart_controller.dart';
import 'package:get/get.dart';

class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Obx(() {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: controller.cartList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.cartList[index].meal!.name ?? '',
                          style: TextStyle(fontSize: screenWidth(10)),
                        ),
                        IconButton(
                            onPressed: () {
                              controller
                                  .removeFromCart(controller.cartList[index]);
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          text: '+',
                          onPressed: () {
                            controller.changeCount(
                                increase: true,
                                model: controller.cartList[index]);
                          },
                        ),
                        Text(controller.cartList[index].count.toString(),
                            style: TextStyle(fontSize: screenWidth(10))),
                        Button(
                          text: '-',
                          onPressed: () {
                            controller.changeCount(
                                increase: false,
                                model: controller.cartList[index]);
                          },
                        ),
                      ],
                    ),
                    Text(controller.cartList[index].total.toString(),
                        style: TextStyle(fontSize: screenWidth(10))),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  color: AppColors.mainOrangeColor,
                  width: screenWidth(1),
                  height: 2,
                );
              },
            );
          }),
          SizedBox(height: 20),
          Obx(() {
            return Column(
              children: [
                Text('Sub Total ${cartService.subTotal.value}',
                    style: TextStyle(fontSize: screenWidth(20))),

                Text('Tax ${cartService.tax.value}',
                    style: TextStyle(fontSize: screenWidth(20))),

                Text('Delivery ${cartService.deliverFees.value}',
                    style: TextStyle(fontSize: screenWidth(20))),

                Text('Total ${cartService.total.value}',
                    style: TextStyle(fontSize: screenWidth(20))),

                CustomButton(
                  text: 'Checkout',
                  onPressed: () {
                    controller.checkout();
                  },
                )

                // Text("Tax: ${controller.formatCurrency(controller.tax)}"),
                //   Text(
                //       "Delivery Fee: ${controller.formatCurrency(controller.deliveryFee)}"),
                //   SizedBox(height: 20),
                //   Text(
                //     "Total Amount: ${controller.formatCurrency(controller.totalAmount)}",
                //     style: TextStyle(
                //         decoration: TextDecoration.overline,
                //         backgroundColor: Color.fromARGB(255, 208, 206, 206),
                //         color: AppColors.mainOrangeColor,
                //         fontSize: screenWidth(15),
                //         fontWeight: FontWeight.bold),
                //   ),
                // SizedBox(height: 20),
                //   Text(
                //     "invoice date: ${DateFormat('dd/MM/yyyy - hh:mm a').format(controller.dateTime)}",
                //     style: TextStyle(fontSize: screenWidth(20)),
                //   ),
              ],
            );
          }),
        ],
      )),
    );
  }
}
