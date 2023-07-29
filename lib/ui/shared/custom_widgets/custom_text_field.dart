import 'package:flutter/material.dart';
import 'package:food_1/ui/shared/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintext,
       this.controller,
      this.validator,
      this.suffexIcon, this.prifexIcon});
  final String hintext;
  final IconData? suffexIcon;
  final IconData? prifexIcon;
  final String? Function(String?)?  validator; //المدقق:لفحص المدخلات التي يدخلها المستخدم نفس شغل الكونترولر
  final TextEditingController?   controller; //للحصول على المدخلات التي يقوم المستخدم بادخالها
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.01),
      child: TextFormField(
        validator: validator,
        controller: controller,
      
        decoration: InputDecoration(
          suffixIcon: Icon(suffexIcon),
          prefixIcon: Icon(prifexIcon),
          contentPadding: EdgeInsets.symmetric(
              vertical: size.width * 0.04, horizontal: size.width * 0.05),
          filled: true,
          fillColor: AppColors.mainGreyColor,
          hintText: hintext,
          hintStyle: TextStyle(
              color: Color.fromRGBO(182, 183, 183, 1),
              fontSize: size.width * 0.04),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
      ),
    );
  }
}
