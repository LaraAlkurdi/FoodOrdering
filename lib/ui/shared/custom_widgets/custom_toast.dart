import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_1/core/enums/message_type.dart';
import 'package:food_1/ui/shared/colors.dart';
import 'package:food_1/ui/shared/utils.dart';
//لاظهار رسالة للمستخدم 
class CustomToast{
  static showMessage(
    {
    required String message ,
    MessageType? messsageType = MessageType.INFO, required MessageType messageType}){
      String imageName ='info';
      Color shadowColor = AppColors.mainRedColor;
      switch(messsageType){

        case MessageType.SUCCESS:
          imageName ='approved1-01';
          shadowColor = AppColors.mainGreenColor;
          break;
        case MessageType.REJECTED:
         imageName ='rejected-01';
         shadowColor = AppColors.mainRedColor;
          break;
        case MessageType.WARNING:
          imageName ='warning';
          shadowColor = AppColors.mainOrangeColor;
          break;
        case MessageType.INFO:
          imageName ='info';
          shadowColor = AppColors.mainblueColor;
          break;
          default: break;
      }
      BotToast.showCustomText(
        duration: Duration(seconds: 10),
        toastBuilder: (value){
          return Container(
            width: screenWidth(1.5),
            decoration: BoxDecoration(
              color: AppColors.mainWhiteColor,
              borderRadius: BorderRadius.circular(30), 
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: screenWidth(30),
                ),
                SvgPicture.asset('images/$imageName.svg',
                width: screenWidth(15),
                height:screenWidth(15),),
                Text(message,
                style: TextStyle(
                  fontSize: screenWidth(22),
                ),),
                 SizedBox(
                  height: screenWidth(15),
                ),
                
              ],
            ),

          );

        }
      );
    }
}