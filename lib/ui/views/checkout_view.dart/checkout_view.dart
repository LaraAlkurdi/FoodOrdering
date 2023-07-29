import 'package:flutter/material.dart';
import 'package:food_1/core/services/cart_services.dart';
import 'package:food_1/ui/shared/custom_widgets/button.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
     onWillPop: ()async{
      CartService().clearCart();
      Get.off(MainView());
      return true;
     },
     child: SafeArea(child: Scaffold(
      body: Column(
        children: [
               Text('Sub Total ${cartService.subTotal.value}',
              style: TextStyle(fontSize: screenWidth(20))),

               Text('Tax ${cartService.tax.value}',
              style: TextStyle(fontSize: screenWidth(20))),
              
                 Text('Delivery ${cartService.deliverFees.value}',
              style: TextStyle(fontSize: screenWidth(20))),

               Text('Total ${cartService.total.value}',
              style: TextStyle(fontSize: screenWidth(20))),

              CustomButton(text: 'Continue shopping',
              onPressed: (){
                cartService.clearCart();
                Get.off(MainView());
              },),
              
        ],
      ),
     )),
     );
  }
}