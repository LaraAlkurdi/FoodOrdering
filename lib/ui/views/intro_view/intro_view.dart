import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_1/core/translation/app_translation.dart';
import 'package:food_1/ui/shared/colors.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/intro_view/intro_controller.dart';
import 'package:get/get.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
 IntroViewController controller = Get.put(IntroViewController());

  List<String> titleList = [
    tr('key_Find_Food_You_Love'),
    tr('key_Fast_Delivery'),
    tr('key_Live_Tracking'),
  ];
  List<String> descriptionList = [
    tr('key_Fast_door_delivery'),
    tr( 'key_Fast_delivery_to_your_home'),
    tr('key_Real_time_tracking_of_your_food'),
  ];
  // int currentIndex = 0; //ترقيم العناصر
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: screenWidth(6),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/intro${controller.currentIndex}.svg',
              width: screenWidth(1.5),
              height: screenWidth(1.5),
            ),
            SizedBox(
              height: screenWidth(16),
            ),
            DotsIndicator(
              dotsCount: 3,
              position: controller.currentIndex.toDouble(),
              decorator: DotsDecorator(
                color: AppColors.mainGreyColor,
                activeColor: AppColors.mainOrangeColor,
              ),
            ),
            SizedBox(height: screenWidth(25)),
            Text(
              titleList[controller.currentIndex.value],
              style: TextStyle(
                  fontSize: screenWidth(16), 
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenWidth(25)),
            Text(
              descriptionList[controller.currentIndex.value],
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenWidth(10)),
            CustomButton(
              text:controller.currentIndex != 2 
              ?tr('key_Next') 
              : tr('key_Finish'),
              onPressed: () {
                controller.IntroView();
                // if (currentIndex != 2) {
                //   setState(() {
                //     //تعيد بناء الواجهة
                //     currentIndex += 1;
                //   });
                // } else
                //   Get.off(LandingView());
              },
            )
          ],
        ),
      ),
    ));
  }
}
