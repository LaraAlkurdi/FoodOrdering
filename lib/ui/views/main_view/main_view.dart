import 'package:flutter/material.dart';
import 'package:food_1/core/enums/bottum_navigation.dart';
import 'package:food_1/ui/shared/colors.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/main_view/home_view/home_view.dart';
import 'package:food_1/ui/views/main_view/main_view_widgets/bottom_navigation_widget.dart';
import 'package:food_1/ui/views/main_view/menu_view/menu_view.dart';
import 'package:food_1/ui/views/main_view/more_view/more_view.dart';
import 'package:food_1/ui/views/main_view/offers_view/offers_view.dart';
import 'package:food_1/ui/views/main_view/profile_view/profile_view.dart';

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  BottomNavigationEnum selected = BottomNavigationEnum.HOME;
  PageController controller = PageController(
      initialPage: 2); //مسؤو عن تحريك الصفحة ووين بدي يااقلع يعني 2
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey, //لاتحكم بفتح واغلاق الدراور
      endDrawer: Container(
        width: screenWidth(2),
        color: AppColors.mainWhiteColor,
        child: Column(
          children: [
            Text('Option1'),
            Text('Option2'),
          ],
        ),
      ),
      // backgroundColor: AppColors.mainBlackColor,
      bottomNavigationBar: BottomNavigationWidget(
        bottomNavigationEnum: selected,
        onTap: (selectedEnum, pageNumber) {
          // scaffoldKey.currentState!.openEndDrawer();

          controller.animateToPage(pageNumber,
              duration: Duration(
                milliseconds: 500,
              ),
              curve: Curves.easeInCirc);
          setState(() {
            //للون
            selected = selectedEnum;
          });
        },
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(), //عشان مايتحرك بالسحب
        controller: controller, //للانتقال من صفحة لاخرى
        onPageChanged: (pageNumer) {},
        children: [
          MenuView(),
          OffersView(),
          HomeView(
            onMenuTap: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
          ),
          // HomeView(scaffoldKey: scaffoldKey),
          ProfileView(),
          MoreView()
        ],
      ),
    ));
  }
}
