import 'package:food_1/core/services/base_controller.dart';
import 'package:food_1/ui/views/landing_view/landing_view.dart';
import 'package:get/get.dart';

class IntroViewController extends BaseController {
  RxInt currentIndex = 0.obs;
  void IntroView() {
    if (currentIndex != 2) {
      //تعيد بناء الواجهة
      currentIndex += 1;
    } else
      Get.off(() => LandingView());
  }
}
