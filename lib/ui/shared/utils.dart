import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_1/app/my_app_controller.dart';
import 'package:food_1/core/Data/repositories/shared_prefernce_repository.dart';
import 'package:food_1/core/enums/connectivity_status.dart';
import 'package:food_1/core/enums/message_type.dart';
import 'package:food_1/core/services/cart_services.dart';
import 'package:food_1/core/services/connectivity_service.dart';
import 'package:food_1/core/services/location_service.dart';
import 'package:food_1/core/services/notifction_service.dart';
import 'package:food_1/ui/shared/colors.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

// //-----
// double screenWidth(double percent){
//   return Get.size.width/percent;
// }
// double screenHeight(double percent){
//   return Get.size.height/percent;
// }

// SharedPreferencesRepository get storage => Get.find<SharedPreferencesRepository>();
// CartService get cartService => Get.find<CartService>();
// //---
// Future claunchUrl(Uri url) async {
//   if (!await launchUrl(url,
//   mode: LaunchMode.externalApplication))
//   {
//    CustomToast.showMessage(message: 'cant launch url',
//     messageType: MessageType.REJECTED);
//   }
// }
// //--
// void CustomLoader()=> BotToast.showCustomLoading(toastBuilder: (context) {
//   return Container(
//     decoration: BoxDecoration(
//       color: AppColors.transparentColor.withOpacity(0.5),
//       borderRadius: BorderRadius.circular(10),
//     ),
//     width: screenWidth(4),
//     height: screenWidth(4),
//     child:Lottie.asset('assets/animation/burger.json',
//     width: screenWidth(2),
//     height: screenWidth(3)),
//     //  SpinKitCircle(color: AppColors.mainblueColor,
//     // size: screenWidth(8),),
//   );
// });

// double get taxAmount=>0.18;
// double get deliverAmount=>0.1;
///
// bool isAgeValid(String ageText) {
//   int age = int.tryParse(ageText) ?? 0;
//   return age > 18;
// }

// bool isFirstName(String value) {
//   RegExp regExp = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
//   return regExp.hasMatch(value);
// }

// bool isLastName(String value) {
//   RegExp regExp = RegExp(r"^\s*([A-Za-z]{1,})*$");
//   return regExp.hasMatch(value);
// }

// bool isEmail(String value) {
//   RegExp regExp = new RegExp(
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
//   return regExp.hasMatch(value);
// }

// bool isValidNumber(String value) {
//   RegExp regExp =
//       RegExp(r'^(?:\+971|00971|0)?(?:50|51|52|55|56|2|3|4|6|7|9)\d{7}$');
//   return regExp.hasMatch(value);
// }

//regExp:

bool isValidNumber(String value) {
  RegExp regExp =
      RegExp(r'^(?:\+971|00971|0)?(?:50|51|52|55|56|2|3|4|6|7|9)\d{7}$');

  return regExp.hasMatch(value);
}

bool isPassword(String value) {
  RegExp regExp = new RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*])[A-Za-z0-9!@#\$%^&*]{8,20}$');
  return regExp.hasMatch(value);
}

bool isAge(String value) {
  RegExp regExp = new RegExp(r'^(1[89]|[2-9]\d)$');
  return regExp.hasMatch(value);
}

bool isAgeValid(String ageText) {
  int age = int.tryParse(ageText) ?? 0;
  return age > 18;
}

bool isFirstName(String value) {
  RegExp regExp = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
  return regExp.hasMatch(value);
}

bool isLastName(String value) {
  RegExp regExp = RegExp(r"^\s*([A-Za-z]{1,})*$");
  return regExp.hasMatch(value);
}

bool isEmail(String value) {
  RegExp regExp = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}

double screenWidth(double percent) {
  return Get.size.width / percent;
}

double screenHeight(double percent) {
  return Get.size.height / percent;
}

SharedPreferencesRepository get storage =>
    Get.find<SharedPreferencesRepository>();

CartService get cartService => Get.find<CartService>();
LocationService get locationService => Get.find<LocationService>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();
NotificationService get notificationService => Get.find<NotificationService>();

Future cLaunchUrl(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    CustomToast.showMessage(
        message: 'Cant lunch url', messageType: MessageType.REJECTED);
  }
}

void CustomLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.transparentColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        width: screenWidth(4),
        height: screenWidth(4),
        child: Lottie.asset('assets/animation/burger.json',
            width: screenWidth(2), height: screenWidth(3)),
        //  SpinKitCircle(color: AppColors.mainblueColor,
        // size: screenWidth(8),),
      );
    });
double get taxAmount => 0.18;

double get deliverAmount => 0.1;

bool get isOnline =>
    Get.find<MyAppController>().connectivityStatus == ConnectivityStatus.ONLINE;

bool get isOffline =>
    Get.find<MyAppController>().connectivityStatus ==
    ConnectivityStatus.OFFLINE;

void checkConnection(Function function) {
  if (isOnline)
    function();
  else
    showNoConnectionMessage();
}

void showNoConnectionMessage() {
  CustomToast.showMessage(
      message: 'Please check internet connection',
      messageType: MessageType.WARNING);
}
