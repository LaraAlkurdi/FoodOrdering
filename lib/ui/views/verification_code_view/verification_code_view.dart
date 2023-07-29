import 'package:flutter/material.dart';
import 'package:food_1/core/translation/app_translation.dart';
import 'package:food_1/ui/shared/colors.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/new_password_view/new_password_view.dart';
import 'package:food_1/ui/views/verification_code_view/verification_controller.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({super.key});

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
   VerificationController controller = Get.put(VerificationController());

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(15),
               vertical: screenWidth(15)),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                CustomText(
                    text: tr('key_Otp_code'),
                    textColor: AppColors.mainTextColor,
                    textsize: screenWidth(14)),
                SizedBox(height: screenWidth(20)),
                 CustomText(
                    text: tr('key_check_your_Email'),
                    textColor: AppColors.mainTextColor,
                    textsize: screenWidth(25),
                    fontWeight: FontWeight.normal),
                SizedBox(height: screenWidth(15)),

                PinCodeTextField(
                  hintCharacter: '*',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  length: 4,
                  controller: controller.controller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'pin code working';
                    }
                    return null;
                  },
                  obscureText: true, //بتخفي الرقم
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: screenWidth(8),
                    fieldWidth: screenWidth(8),
                    activeFillColor: AppColors.mainGreyColor, //لمابدو ينتقل
                    selectedFillColor: AppColors.mainGreyColor,
                    inactiveFillColor: AppColors.mainGreyColor,
                    inactiveColor: AppColors.mainGreyColor,
                  ),
                  animationDuration: Duration(milliseconds: 300), //مدة التنقل
                  // backgroundColor: AppColors.mainWhiteColor,
                  enableActiveFill: true, //بدك اللون  للتنقل يتغير
                  // errorAnimationController: errorController,
                  // controller: textEditingController,
                  onChanged: (value) {
                    //عند كل تغير للقيمة بتحسسها
                    print(value);
                    setState(() {});
                  },
                  // onCompleted: (value) {

                  // },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    return true;
                  },
                  appContext: context,
                ),
                SizedBox(height: screenWidth(20)),
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    controller.Verification();
                    // if (controller.formKey.currentState!.validate()) {
                    //   return Get.off(NewPasswordView());
                    // }
                  },
                ),
                SizedBox(height: screenWidth(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                    text: tr('Key_Didn\'t_Receive'),
                    textColor: AppColors.mainTextColor,
                    textsize: screenWidth(27),
                    fontWeight: FontWeight.normal),
                    CustomText(
                    text:tr('key_Click_Here'),
                    textColor: AppColors.mainOrangeColor,
                    textsize: screenWidth(27),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//otp
