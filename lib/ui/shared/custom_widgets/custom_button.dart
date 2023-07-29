import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_1/ui/shared/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton( 
      {Key? key,
      this.onPressed,
      this.backgroundColor = const Color.fromRGBO(252, 96, 17, 1),//لازم شيل لللون
      required this.text,
      this.textColor = const Color.fromRGBO(252, 252, 252, 1),//لازم شيل اللون
      this.borderColor, this.imageName})
      : super(key: key);

  final Function? onPressed;
  final Color? backgroundColor;
  final String text; 
  final String? imageName ; 
  final Color? textColor;
  final Color? borderColor;
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: size.width*0.04),
      child: ElevatedButton(
        onPressed: () {
          if (onPressed != null) onPressed!();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           if(imageName != null) ...[
           SvgPicture.asset('images/$imageName.svg'),
           SizedBox(
            width: size.width*0.05,
           ),
           ],
            Text(
              text,
              style: TextStyle(color: textColor,
              fontWeight: FontWeight.bold),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(size.width, size.width * 0.13),
          shape: StadiumBorder(),
          backgroundColor: backgroundColor ?? AppColors.mainOrangeColor,
          side: borderColor != null 
              ? BorderSide(
                  width: 1.0,
                  color: borderColor!, 
                )
              : null,
        ),
      ),
    );
  }
}