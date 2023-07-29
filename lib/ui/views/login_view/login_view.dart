import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_1/app/my_app.dart';
// import 'package:food_1/core/Data/repositories/shared_prefernce_repository.dart';
import 'package:food_1/core/translation/app_translation.dart';
import 'package:food_1/ui/shared/colors.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/login_view/login_view_controller.dart';
import 'package:food_1/ui/views/reset_password_view/reset_password_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:lottie/lottie.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(35)),
          child: Form(
            key: controller.formKey,
            child: ListView(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: screenWidth(40)),
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Get.defaultDialog(
                          title: "choose Language",
                          content: Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    storage.setAppLanguage('en');
                                    Get.updateLocale(getLocal());
                                    Get.back();
                                  },
                                  child: Text('English')),
                              InkWell(
                                  onTap: () {
                                    storage.setAppLanguage('ar');
                                    Get.updateLocale(getLocal());
                                    Get.back();
                                  },
                                  child: Text('العربية')),
                              InkWell(
                                  onTap: () {
                                    storage.setAppLanguage('tr');
                                    Get.updateLocale(getLocal());
                                    Get.back();
                                  },
                                  child: Text('Turk')),
                            ],
                          ));
                    },
                    child: Icon(Icons.sign_language)),
                Padding(
                  padding: EdgeInsets.only(top: screenWidth(35)),
                  child: CustomText(
                      text: tr('key_login'),
                      textColor: AppColors.mainTextColor,
                      textsize: screenWidth(15)),
                ),
                SizedBox(height: screenHeight(120)),
                CustomText(
                    text: tr('key_Add_your_details_to_login'),
                    textColor: AppColors.mainTextGreyColor,
                    textsize: screenWidth(28),
                    fontWeight: FontWeight.normal),
                SizedBox(height: screenHeight(40)),
                CustomTextField(
                  hintext: tr('key_Your_Email'),
                  controller: controller.emailController,
                  validator: (value) {
                    if (value!.isEmpty || !isEmail(value)) {
                      return 'please check your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight(40)),
                CustomTextField(
                    hintext: tr('key_Password'),
                    // prifexIcon: Icons.search,
                    controller: controller.passwordController,
                    validator: (value) {
                      if (value!.isEmpty || !isPassword(value)) {
                        return 'please enter a valid password';
                      }
                      return null;
                    }),
                SizedBox(height: screenHeight(20)),
                Obx(() {
                  return controller.isLoding.value
                      ? Lottie.asset('assets/animation/burger.json')
                      // SpinKitThreeBounce(
                      //     color: AppColors.mainOrangeColor,
                      //   )
                      : CustomButton(
                          text: tr('key_login'),
                          onPressed: () {
                            controller.Login();
                            // CustomLoader();
                            //                  String? encodeQueryParameters(Map<String, String> params) {
                            //                 return params.entries
                            //                   .map((MapEntry<String, String> e) =>
                            //              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            //                                .join('&');
                            //                                  }
                            // // ···
                            //             final Uri emailLaunchUri = Uri(
                            //            scheme: 'mailto',
                            //             path: 'smith@example.com',
                            //            query: encodeQueryParameters(<String, String>{
                            //            'subject': 'Example Subject & Symbols are allowed!',
                            //             }),
                            //             );
                            //             launchUrl(emailLaunchUri);
                          });
                }),
                SizedBox(height: screenHeight(40)),
                InkWell(
                  onTap: () {
                    Get.off(ReSetPasswordView());
                  },
                  child: CustomText(
                      text: tr('key_forget_password?'),
                      textColor: AppColors.mainTextGreyColor,
                      textsize: screenWidth(29),
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: screenHeight(60)),
                CustomText(
                  text: tr('key_Or_Login_With'),
                  textColor: AppColors.mainTextGreyColor,
                  textsize: screenWidth(30),
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: screenWidth(15)),
                CustomButton(
                  text: tr('Key_Login_With_Facebook'),
                  backgroundColor: AppColors.mainblueColor,
                  imageName: 'Facebook',
                ),
                SizedBox(height: screenWidth(25)),
                CustomButton(
                  text: tr('key_Login_With_Google'),
                  imageName: 'google-plus-logo',
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenWidth(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          text: tr('key_Don\'t_have_an_account?'),
                          textColor: AppColors.mainTextGreyColor,
                          textsize: screenWidth(30),
                          fontWeight: FontWeight.normal),
                      CustomText(
                          text: tr('key_Sign_Up'),
                          textColor: AppColors.mainOrangeColor,
                          textsize: screenWidth(30)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
