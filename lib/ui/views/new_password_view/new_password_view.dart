import 'package:flutter/material.dart';
import 'package:food_1/core/translation/app_translation.dart';
import 'package:food_1/ui/shared/colors.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/login_view/login_view.dart';
import 'package:get/get.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(19), vertical: screenWidth(20)),
          child: Column(
            children: [
              CustomText(
                  text: tr('key_New_Password'),
                  textColor: AppColors.mainTextColor,
                  textsize: screenWidth(15)),
              SizedBox(height: screenWidth(30)),
              CustomText(
                  text:tr('key_create_a_new_password_via_email'),
                  textColor: AppColors.mainTextColor,
                  textsize: screenWidth(25),
                  fontWeight: FontWeight.normal),
              SizedBox(height: screenWidth(10)),
              CustomTextField(hintext: tr('key_New_Password')),
              SizedBox(height: screenWidth(30)),
              CustomTextField(hintext: tr('key_Confirm_Password')),
              SizedBox(height: screenWidth(30)),
              CustomButton(text: tr('key_Next'),
              onPressed: (){
                Get.off(LoginView());
              },),
            ],
          ),
        ),
      ),
    );
  }
}
