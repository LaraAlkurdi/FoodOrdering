import 'package:flutter/material.dart';
import 'package:food_1/core/services/base_controller.dart';
import 'package:food_1/ui/views/new_password_view/new_password_view.dart';
import 'package:get/get.dart';

class VerificationController extends BaseController {
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void Verification() {
    if (formKey.currentState!.validate()) {
      Get.off(NewPasswordView());
    }
  }
}
