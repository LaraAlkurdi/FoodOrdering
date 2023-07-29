import 'package:flutter/material.dart';
import 'package:food_1/core/Data/repositories/user_repository.dart';
import 'package:food_1/core/enums/message_type.dart';
import 'package:food_1/core/services/base_controller.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_toast.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class LoginController extends BaseController{
  RxBool isLoding = false.obs;
  TextEditingController emailController = TextEditingController(); //للكونترولر
  TextEditingController passwordController = TextEditingController();
   final GlobalKey<FormState> formKey =GlobalKey<FormState>(); 

   void Login(){
          if(formKey.currentState!.validate()) {
           runFullLoadingFutuerFunction(
            function: UserRepository().login(
                          email: emailController.text,
                          password: passwordController.text
                          ).then((value) {
                        value.fold((l) {
                          isLoding.value = false;
                          CustomToast.showMessage(
                              messageType: MessageType.REJECTED,
                              message: l, );
                        }, (r) {
                         storage.setTokenInfo(r);
                           Get.off(MainView());
                        });
                      }));
   }
}
}