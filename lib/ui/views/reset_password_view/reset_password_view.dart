import 'package:flutter/material.dart';
import 'package:food_1/core/translation/app_translation.dart';
import 'package:food_1/ui/shared/colors.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/verification_code_view/verification_code_view.dart';
import 'package:get/get.dart';

class ReSetPasswordView extends StatefulWidget {
  const ReSetPasswordView({super.key});

  @override
  State<ReSetPasswordView> createState() => _ReSetPasswordViewState();
}

class _ReSetPasswordViewState extends State<ReSetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(18), vertical: screenWidth(10)),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                  text:tr('key_Reset_Password'),
                  textColor: AppColors.mainTextColor,
                  textsize: screenWidth(15)),
              SizedBox(height: screenWidth(30)),
              CustomText(
                  text: tr('key_create_a_new_password_via_email'),
                  textColor: AppColors.mainTextColor,
                  textsize: screenWidth(25),
                  fontWeight: FontWeight.normal),
              SizedBox(height: screenWidth(10)),
              CustomTextField(
                hintext: tr('key_Email'),
              ),
              SizedBox(height: screenWidth(20)),
              CustomButton(
                text: tr('key_send'),
                onPressed: () {
                  Get.off(VerificationCodeView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
