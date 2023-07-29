// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_1/core/enums/bottum_navigation.dart';
import 'package:food_1/ui/shared/colors.dart';
import 'package:food_1/ui/shared/utils.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum bottomNavigationEnum; //نمرر الاينم لنعرف وين كبسنا
  final Function(BottomNavigationEnum, int)
      onTap; //عشان رقم الصفحة واللون من الاينم
  BottomNavigationWidget(
      {Key? key, required this.bottomNavigationEnum, required this.onTap})
      : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomPaint(
          painter: _ClipShadowPainter(
              clipper: BottomClipper(),
              shadow:
                  Shadow(blurRadius: 12, color: AppColors.mainTextGreyColor)),
          child: ClipPath(
            clipper: BottomClipper(),
            child: Container(
              width: screenWidth(1),
              height: screenHeight(10),
              alignment: Alignment.bottomCenter,
              color: AppColors.mainWhiteColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth(25),
          ),
          child: Positioned(
            bottom: screenWidth(30),
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                navItem(
                  imageName: 'ic_menu',
                  text: 'Menu',
                  isSelected:
                      widget.bottomNavigationEnum == BottomNavigationEnum.MENU,
                  //on tap:mainViewوقت يكبس على زر بحرك شغلة من
                  //Viewpage بحرك الكونترولر ل
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.MENU, 0);
                  },
                ),
                navItem(
                  imageName: 'ic_shopping',
                  text: 'Offers',
                  isSelected: widget.bottomNavigationEnum ==
                      BottomNavigationEnum.OFFERS,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.OFFERS, 1);
                  },
                ),
                SizedBox(
                  width: screenWidth(30),
                ),
                navItem(
                  imageName: 'ic_user',
                  text: 'Profile',
                  isSelected: widget.bottomNavigationEnum ==
                      BottomNavigationEnum.PROFILE,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.PROFILE, 3);
                  },
                ),
                navItem(
                  imageName: 'ic_more',
                  text: 'More',
                  isSelected:
                      widget.bottomNavigationEnum == BottomNavigationEnum.MORE,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.MORE, 4);
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: screenWidth(10)),
          child: InkWell(
            onTap: () {
              widget.onTap(BottomNavigationEnum.HOME, 2);
            },
            child: CircleAvatar(
              radius: screenWidth(10), //نصف القطر
              backgroundColor:
                  widget.bottomNavigationEnum == BottomNavigationEnum.HOME
                      ? AppColors.mainOrangeColor
                      : AppColors.mainTextGreyColor,
              child: SvgPicture.asset(
                'assets/images/ic_home.svg',
                color: AppColors.mainWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget navItem({
    required String imageName,
    required String text,
    required bool isSelected,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/images/$imageName.svg',
            color: isSelected
                ? AppColors.mainOrangeColor
                : AppColors.mainTextGreyColor,
            width: screenWidth(30),
          ),
          SizedBox(
            height: screenWidth(50),
          ),
          Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? AppColors.mainOrangeColor
                  : AppColors.mainTextGreyColor,
              fontSize: screenWidth(30),
            ),
          ),
          SizedBox(
            height: screenWidth(40),
          ),
        ],
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.3381500, 0);
    path0.quadraticBezierTo(size.width * 0.3731500, size.height * 0.0069000,
        size.width * 0.3757000, size.height * 0.1236000);
    path0.quadraticBezierTo(size.width * 0.4022000, size.height * 0.5633000,
        size.width * 0.5006000, size.height * 0.5896000);
    path0.quadraticBezierTo(size.width * 0.5955500, size.height * 0.5727000,
        size.width * 0.6200000, size.height * 0.1240000);
    path0.quadraticBezierTo(size.width * 0.6204500, size.height * -0.0157000,
        size.width * 0.6646000, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.lineTo(size.width * 0.6225000, size.height * 0.6100000);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _ClipShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
