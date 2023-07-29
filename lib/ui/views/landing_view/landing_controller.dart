import 'package:flutter/material.dart';
import 'package:food_1/core/enums/notifction_type.dart';
import 'package:food_1/core/services/base_controller.dart';
import 'package:food_1/ui/shared/colors.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/map_view/map_view.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class LandingController extends BaseController {
  Rx<Color> buttonColor = AppColors.mainOrangeColor.obs;
  Future<void> Landing() async {
    LocationData? cureentLocation =
        await locationService.getUserCurrentLocation();
    if (cureentLocation != null)
      Get.to(MapView(currentLocation: cureentLocation));
  }

  @override
  void onInit() async {
    notificationService.notifcationStream.stream.listen((event) {
      if (event.notifctionType == NotificationType.CHANGECOLOR.name) {
        buttonColor.value = AppColors.mainblueColor;
      }
    });
    super.onInit();
  }
}
