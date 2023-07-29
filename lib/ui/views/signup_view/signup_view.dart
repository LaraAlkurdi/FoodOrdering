import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_1/core/Data/models/file_type_model.dart';
import 'package:food_1/core/enums/file_type_model.dart';
import 'package:food_1/core/translation/app_translation.dart';
import 'package:food_1/core/utils/pick_file.dart';
import 'package:food_1/ui/shared/colors.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/signup_view/signUp_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignUpController controller = Get.put(SignUpController());
  
  final ImagePicker picker = ImagePicker();
  FileTypeModel? selectedFile;
  bool showOption = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenWidth(15)),
                child: CustomText(
                    text: tr('key_Sign_Up'),
                    textColor: AppColors.mainTextColor,
                    textsize: screenWidth(15)),
              ),
              SizedBox(height: screenWidth(30)),
              CustomText(
                  text: tr('key_Add_your_details_to_sign_up'),
                  textColor: AppColors.mainTextGreyColor,
                  textsize: screenWidth(30),
                  fontWeight: FontWeight.normal),

              SizedBox(height: screenWidth(30)),

              Center(
                child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      InkWell(
                        onTap: selectedFile == null
                            ? () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                          height: 200,
                                          child: Column(children: [
                                            ListTile(
                                              leading: Icon(Icons.camera_alt),
                                              title: Text('Camera'),
                                              onTap: () {
                                                pickFile(FileTypeEnum.CAMERA).then(
                                                    (value) =>
                                                        selectedFile = value);
                                                Navigator.pop(
                                                    context); // close the bottom sheet
                                              },
                                            ),
                                            ListTile(
                                              leading:
                                                  Icon(Icons.photo_library),
                                              title: Text('Gallery'),
                                              onTap: () {
                                                pickFile(FileTypeEnum.GALLERY)
                                                    .then((value) =>
                                                        selectedFile = value);
                                                Navigator.pop(
                                                    context); // close the bottom sheet
                                              },
                                            ),
                                            ListTile(
                                              leading: Icon(Icons.folder),
                                              title: Text('File'),
                                              onTap: () {
                                                pickFile(FileTypeEnum.FILE).then(
                                                    (value) =>
                                                        selectedFile = value);
                                                Navigator.pop(
                                                    context); // close the bottom sheet
                                              },
                                            ),
                                          ]
                                          )
                                          );
                                    }
                                    );
                              }
                            : null,
                        child: CircleAvatar(
                         radius: 50,
                        backgroundColor: AppColors.mainTextGreyColor,
                          child:
                              selectedFile == null || selectedFile!.path.isEmpty
                                  ? Icon(Icons.image,
                                      size: screenWidth(10),
                                color: AppColors.mainGreyColor)
                                  : selectedFile!.type != FileTypeEnum.FILE
                                      ? ClipOval(
                                          child: Image.file(
                                          File(selectedFile!.path),
                                          fit: BoxFit.cover,
                                          width: screenWidth(1),
                                          height: screenHeight(1),
                                        ))
                                      : Icon(Icons.insert_drive_file,
                                      size: screenWidth(10),
                                    color: AppColors.mainGreyColor
                                        ),
                        ),
                      ),
                      Visibility(
                        visible: selectedFile != null,
                        child: Positioned(
                          bottom: screenWidth(130),
                        right: screenWidth(180),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                        height: 200,
                                        child: Column(children: [
                                          ListTile(
                                            leading: Icon(Icons.camera_alt),
                                            title: Text('Camera'),
                                            onTap: () {
                                              pickFile(FileTypeEnum.CAMERA).then(
                                                  (value) =>
                                                      selectedFile = value);
                                              Navigator.pop(
                                                  context); // close the bottom sheet
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.photo_library),
                                            title: Text('Gallery'),
                                            onTap: () {
                                              pickFile(FileTypeEnum.GALLERY).then(
                                                  (value) =>
                                                      selectedFile = value);
                                              Navigator.pop(
                                                  context); // close the bottom sheet
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.folder),
                                            title: Text('File'),
                                            onTap: () {
                                              pickFile(FileTypeEnum.FILE).then(
                                                  (value) =>
                                                      selectedFile = value);
                                              Navigator.pop(
                                                  context); // close the bottom sheet
                                            },
                                          ),
                                        ]));
                                  });
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: AppColors.mainOrangeColor,
                              child: Icon(Icons.edit,
                                  size: screenWidth(15),
                                  color: AppColors.mainGreyColor)),
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
              SizedBox(height: screenWidth(30)),
              CustomTextField(
                hintext: tr('Key_FirstName'),
                controller: controller.firstnameController,
                validator: (value) {
                  if (value!.isEmpty || !isFirstName(value)) {
                    return 'Please enter your FirstName';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenWidth(30)),
              CustomTextField(
                hintext: tr('key_LastName'),
                controller: controller.lastnameController,
                validator: (value) {
                  if (value!.isEmpty || !isLastName(value)) {
                    return 'Please enter your LastName';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenWidth(30)),
              CustomTextField(
                hintext: tr('key_Age'),
                controller: controller.ageController,
                validator: (value) {
                  if (value!.isEmpty || !isAgeValid(value)) {
                    return 'Please enter age more than 18';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenWidth(30)),
              CustomTextField(
                hintext: tr('key_Email'),
                controller: controller.emailController,
                validator: (value) {
                  if (value!.isEmpty || !isEmail(value)) {
                    return 'check your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenWidth(30)),

              CustomTextField(
                hintext: tr('key_Password'),
                controller: controller.passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter you password';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenWidth(30)),
              CustomTextField(
                hintext: tr('key_Confirm_Password'),
                controller: controller.confirmPasswordController,
                validator: (value) {
                  if (value!.isEmpty ||
                      controller.passwordController ==
                          controller.confirmPasswordController) {
                    return 'please enter you password';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenWidth(30)),
              controller.isLoding.value
                  ? SpinKitThreeBounce(
                      color: AppColors.mainOrangeColor,
                    )
                  : CustomButton(
                      text: tr('key_Sign_Up'),
                      onPressed: () {
                        controller.SignUp();
                      }),
              Padding(
                padding: EdgeInsets.only(top: screenWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: tr('key_Already_have_an_Account?'),
                        textColor: AppColors.mainTextGreyColor,
                        textsize: screenWidth(30),
                        fontWeight: FontWeight.normal),
                     CustomText(
                        text: tr('key_login'),
                        textColor: AppColors.mainTextGreyColor,
                        textsize: screenWidth(33)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void setShowOption(bool value) {
    setState(() {
    showOption = value;
    });
  }

  Future<FileTypeModel> pickFile(FileTypeEnum type) async {
    String? path;
    switch (type) {
      case FileTypeEnum.GALLERY:
        await picker
            .pickImage(source: ImageSource.gallery)
            .then((value) => path = value?.path ?? '');
        break;
      case FileTypeEnum.CAMERA:
        await picker
            .pickImage(source: ImageSource.camera)
            .then((value) => path = value?.path ?? '');
        break;
      case FileTypeEnum.FILE:
        await FilePicker.platform
            .pickFiles()
            .then((value) => path = value?.paths[0] ?? '');
        break;
    }
    setShowOption(false);
    return FileTypeModel(path ?? '', type);
  }
}
