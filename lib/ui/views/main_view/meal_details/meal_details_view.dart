import 'package:flutter/material.dart';
import 'package:food_1/core/Data/models/apis/meal_model.dart';
import 'package:food_1/ui/shared/colors.dart';
import 'package:food_1/ui/shared/custom_widgets/button.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/main_view/meal_details/meal_details_controller.dart';
import 'package:get/get.dart';

class MealDetalis extends StatefulWidget {
  final MealModel model;
  const MealDetalis({super.key, required this.model});
  @override
  State<MealDetalis> createState() => _MealDetalisState();
}
class _MealDetalisState extends State<MealDetalis> {
  late MealDetalisController controller;
  @override
  void initState(){
    controller= Get.put(MealDetalisController(widget.model));
    super.initState();
  
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
         Column(
          children: [
            Text(
              'price:${widget.model.price ??'1000'}',
            style: TextStyle(fontSize: screenWidth(20)),),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    text: '-',
                   onPressed: (){
                    controller.changeCount(false);
                  },
                  backgroundColor: controller.count==1
                  ?AppColors.mainTextColor
                  :AppColors.mainOrangeColor),
                  Button(text: controller.count.value.toString()),
                  Button(
                    text: '+',
                  onPressed: (){
                    controller.changeCount(true);
                  },),
                ],
              );
            }),
            Obx(()
             {
              return Text('${controller.calcTotal()}',
              style: TextStyle(fontSize: screenWidth(20)));
            }),
             SizedBox(height: 20),
                  Button(text: 'add',
                  onPressed: (){
                    controller.addToCart();
                  },),
          ],
        ),
      ),
    );
  }
}

// Stack(children: [
//           Container(margin: EdgeInsets.only(top: 10),
//            padding: EdgeInsets.all(20),
//              width: 400,height: 493,
//            decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color:  Color.fromARGB(255, 3, 3, 3).withOpacity(0.4),
//                 spreadRadius: 3,
//                 blurRadius: 8,
//                 offset: Offset(7, -4),
//               ),
//             ],
//             color: Color.fromARGB(241, 243, 235, 235),
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(40),
//               topRight: Radius.circular(40),
//             )
//            ),
//            child:Column()),
//         ],),