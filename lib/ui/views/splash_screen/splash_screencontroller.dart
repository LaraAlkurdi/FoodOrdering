
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/intro_view/intro_view.dart';
import 'package:food_1/ui/views/landing_view/landing_view.dart';
import 'package:food_1/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
@override
  void onInit() {
     Future.delayed(Duration(seconds: 3))
        .then((value) {
           if (storage.getFirstLunch())
           Get.off(IntroView());
            else{
               Get.off(storage.isLoggedIn? MainView():LandingView());
               }
      storage.setFirstLunch(false);
      });
    super.onInit();
  }
}