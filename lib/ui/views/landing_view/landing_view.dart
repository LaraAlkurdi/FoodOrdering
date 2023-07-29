import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_1/core/translation/app_translation.dart';
import 'package:food_1/ui/shared/colors.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/landing_view/landing_controller.dart';
import 'package:food_1/ui/views/login_view/login_view.dart';
// import 'package:food_1/ui/views/login_view/login_view.dart';
import 'package:food_1/ui/views/signup_view/signup_view.dart';
import 'package:get/get.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  LandingController controller = Get.put(LandingController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Stack(
          children: [
            CustomPaint(
              painter: _ClipShadowShadowPainter(
                clipper: LandingClipper(),
                shadow: Shadow(blurRadius: 12),
              ),
              child: ClipPath(
                clipper: LandingClipper(),
                child: Container(
                  width: screenWidth(1),
                  height: screenHeight(3),
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    'assets/images/Background objects.svg',
                    fit: BoxFit.fitWidth,
                    width: screenWidth(1),
                  ),
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(252, 96, 17, 1)),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight(3.5)),
                child: SvgPicture.asset(
                  'assets/images/Logo.svg',
                  width: screenWidth(2),
                  height: screenWidth(2.5),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenWidth(15)),
          child: Text(
            tr('key_Fast_door_delivery'),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: screenWidth(25)),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(25), vertical: screenWidth(13)),
          child: ListView(shrinkWrap: true, children: [
            CustomButton(
              backgroundColor: controller.buttonColor.value,
              text: tr('key_login'),
              onPressed: () async {
                Get.to(LoginView());

                // controller.Landing();
              },
            ),
            SizedBox(
              height: screenHeight(25),
            ),
            CustomButton(
              text: tr('key_Create_an_Account'),
              onPressed: () {
                Get.to(SignUpView());
              },
              textColor: AppColors.mainOrangeColor,
              backgroundColor: AppColors.mainWhiteColor,
              borderColor: AppColors.mainOrangeColor,
            ),
          ]),
        )
      ],
    )));
  }
}

class LandingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0008333, size.height * 0.0014286);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width, size.height * 0.6964286, size.width,
        size.height * 0.9285714);
    path0.quadraticBezierTo(size.width * 0.9968083, size.height * 1.0063571,
        size.width * 0.9591667, size.height);
    path0.lineTo(size.width * 0.6664500, size.height);
    path0.quadraticBezierTo(size.width * 0.6596000, size.height * 0.7251000,
        size.width * 0.5001750, size.height * 0.7281714);
    path0.quadraticBezierTo(size.width * 0.3309417, size.height * 0.7312429,
        size.width * 0.3327583, size.height);
    path0.lineTo(size.width * 0.0460500, size.height);
    path0.quadraticBezierTo(size.width * 0.0006667, size.height * 1.0078714, 0,
        size.height * 0.9271429);
    path0.quadraticBezierTo(size.width * 0.0002083, size.height * 0.6957143,
        size.width * 0.0008333, size.height * 0.0014286);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//الظل:
class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint(); //يحوله لرسمه
    var clipPath =
        clipper.getClip(size).shift(shadow.offset); //لقص الظل مع الكونتينر
    canvas.drawPath(clipPath, paint);
  } //بدي ارسم فيها

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; //مابغير شي فيها
  }
}
