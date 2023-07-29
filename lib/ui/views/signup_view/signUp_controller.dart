import 'package:flutter/material.dart';
import 'package:food_1/core/Data/models/file_type_model.dart';
import 'package:food_1/core/Data/repositories/user_repository.dart';
import 'package:food_1/core/enums/message_type.dart';
import 'package:food_1/core/services/base_controller.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_toast.dart';
import 'package:food_1/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends BaseController {
  RxBool isLoding = false.obs;
  FileTypeModel? selectedFile;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ImagePicker picker = ImagePicker();
  bool showOption = false;
  void SignUp() {
    if (formKey.currentState!.validate()) {
      isLoding.value = true;
      CustomToast.showMessage(
          message: 'every thing ok', messageType: MessageType.SUCCESS);
      if (selectedFile == null) {
        CustomToast.showMessage(
            message: 'please choose image', messageType: MessageType.REJECTED);
        return;
      }
    }
    UserRepository()
        .register(
            email: emailController.text,
            password: passwordController.text,
            age: int.parse(ageController.text),
            lastname: lastnameController.text,
            firstname: firstnameController.text,
            photoPath: selectedFile!.path)
        .then((value) {
      value.fold((l) {
        isLoding.value = false;
        CustomToast.showMessage(messageType: MessageType.REJECTED, message: l);
      }, (r) {
        Get.off(MainView());
      });
    });
  }
}
