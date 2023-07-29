import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_1/core/translation/app_translation.dart';
import 'package:food_1/ui/shared/colors.dart';
import 'package:food_1/ui/shared/custom_widgets/button.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/main_view/home_view/home_view_controller.dart';
import 'package:food_1/ui/views/main_view/meal_details/meal_details_view.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  final Function() onMenuTap;
  HomeView({Key? key, required this.onMenuTap}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());

  // List<String> stars = [
  //   '4.9',
  //   '5',
  //   '3.5',
  //   '4',
  // ];
  // List<String> ratings = [
  //   '(124 rating) ',
  //   '(200 rating) ',
  //   '(90 rating)',
  //   '(350 rating)',
  // ];
  // List<String> kindsFood = [
  //   ' Westren Food',
  //   ' Asian Food',
  //   'Arab Food',
  //   'Westren Food',
  // ];
  // String? valueChoose;
  // List listItem = [
  //   'alhamra',
  //   'alwaeer',
  //   'enshaat',
  //   'qusor',
  // ];

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: Container(
          color: AppColors.mainOrangeColor,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(20), vertical: screenWidth(17)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: tr('key_Good_morning'),
                      textColor: AppColors.mainTextColor,
                      textsize: screenWidth(17),
                      fontWeight: FontWeight.bold),
                  Obx(() {
                    return Icon(
                      controller.isOnline.value ? Icons.wifi : Icons.wifi_off,
                      color:
                          controller.isOnline.value ? Colors.green : Colors.red,
                      size: screenWidth(15),
                    );
                  }),
                  Obx(() {
                    return Stack(
                      children: [
                        IconButton(
                            onPressed: () {
                              cartService.cartCount.value;
                            },
                            icon: Icon(Icons.shopping_cart)),
                        if (cartService.cartCount.value > 0)
                          Positioned(
                            top: 6,
                            right: 7,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.mainRedColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                '${cartService.cartCount.value}',
                                style: TextStyle(
                                    fontSize: screenWidth(30),
                                    color: AppColors.mainWhiteColor),
                              ),
                            ),
                          )
                      ],
                    );
                  }),
                  Obx(() {
                    return IconButton(
                      icon: Stack(
                        children: [
                          Icon(Icons.notifications),
                          if (controller.notificationsCount.value > 0)
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.mainRedColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  '${controller.notificationsCount.value}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ),
                        ],
                      ),
                      onPressed: () {
                        controller.resetNotifications();
                      },
                    );
                  })
                ],
              ),
              SizedBox(height: screenWidth(50)),
              Padding(
                padding: EdgeInsetsDirectional.only(end: screenWidth(1.8)),
                child: CustomText(
                    text: tr('key_Delivering_to'),
                    textColor: AppColors.mainTextColor,
                    textsize: screenWidth(22),
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: screenWidth(20)),
              CustomTextField(
                  hintext: tr('key_Search_food'), prifexIcon: Icons.search),
              Obx(() {
                return controller.isCategoryLoading
                    ? SpinKitCircle(
                        color: AppColors.mainOrangeColor,
                      )
                    : controller.categoryList.isEmpty
                        ? Text('No category')
                        : Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.categoryList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListView(
                                  children: [
                                    CachedNetworkImage(
                                      height: 100,
                                      width: 100,
                                      imageUrl: controller.categoryList[index]
                                                  .logo!.length >
                                              0
                                          ? controller
                                              .categoryList[index].logo![0]
                                          : '',
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    SizedBox(height: screenWidth(20)),
                                    Text(
                                      controller.categoryList[index].name ?? '',
                                      style:
                                          TextStyle(fontSize: screenWidth(20)),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
              }),
              Obx(() {
                return controller.isMealLoading
                    ? SpinKitCircle(
                        color: AppColors.mainOrangeColor,
                      )
                    : Expanded(
                        child: ListView.builder(
                          // scrollDirection: Axis.vertical,
                          //  physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.mealList.length,
                          // addAutomaticKeepAlives: true,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onLongPress: () {
                                controller
                                    .addToCart(controller.mealList[index]);
                              },
                              child: SizedBox(
                                height: 150,
                                child: ListView(
                                  scrollDirection: Axis.vertical,
                                  physics: BouncingScrollPhysics(),
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await Get.to(MealDetalis(
                                            model: controller.mealList[index]));
                                      },
                                      child: CachedNetworkImage(
                                        height: 100,
                                        width: 50,
                                        imageUrl: controller.mealList[index]
                                                    .images!.length >
                                                0
                                            ? controller
                                                .mealList[index].images![0]
                                            : '',
                                        // 'https://training.owner-tech.com/Images/91b43499-de8b-4d6d-9af8-3f18872bdc5c.png',
                                        //  'http://via.placeholder.com/350x150',
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Obx(() {
                                          return Button(
                                            text:
                                                "${cartService.cartCount.value}",
                                            onPressed: () {
                                              controller.addToCart(
                                                  controller.mealList[index]);
                                            },
                                          );
                                        }),
                                        Text(
                                          controller.mealList[index].name ?? '',
                                          style: TextStyle(
                                              fontSize: screenWidth(20)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
              }),

              //             Obx(() {
              //               return controller.isMealLoading
              //                   ? SpinKitCircle(
              //                       color: AppColors.mainOrangeColor,
              //                     )
              //                   : Expanded(
              //                       child: ListView.builder(
              //                         scrollDirection: Axis.vertical,
              //                         shrinkWrap: true,
              //                         itemCount: controller.mealList.length,
              //                         itemBuilder: (BuildContext context, int index) {
              //                           return Column(
              //                         children: [
              //                           Container(
              //                             width: double.infinity,
              //                             height: screenWidth(5),
              //                             //color: AppColors.mainColor,
              //                             child: CachedNetworkImage(
              //                               imageUrl:controller. mealList[index].images!.length > 0
              //                                   ? getFullImageUrl(
              //                                      controller. mealList[index].images![0])
              //                                   : '',
              //                               placeholder: (context, url) =>
              //                                   CircularProgressIndicator(),
              //                               errorWidget: (context, url, error) =>
              //                                   Icon(Icons.error),
              //                             ),
              //                           ),
              //                           Padding(
              //                             padding: EdgeInsets.only(
              //                                 top:   screenWidth(20),
              //                                 left:  screenWidth(20)),
              //                             child: Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceBetween,
              //                               children: [
              //                                 CustomText(
              //                                     text: controller.mealList[index].name ?? '',
              //                                     textColor: AppColors.mainblueColor,
              //                                     textsize: screenWidth(20),
              //                                     fontWeight: FontWeight.bold),
              //                               ],
              //                             ),
              //                           ),
              //                           Padding(
              //                             padding: EdgeInsets.only(
              //                                 top:   screenWidth(50),
              //                                 left:  screenWidth(50)),
              //                             child: Row(
              //                               children: [
              //                                 Icon(
              //                                   Icons.star,
              //                                   color: AppColors.mainTextColor,
              //                                   size: screenWidth(20),
              //                                 ),
              //                                 CustomText(
              //                                    text: ratings[index],
              //                                   textColor: AppColors.mainTextColor,
              //                                   textsize: screenWidth(20),
              //                                 ),
              //                                 CustomText(
              //                                   text: ratings[index],
              //                                   textColor: AppColors.mainTextColor,
              //                                   textsize: screenWidth(20),
              //                                 ),
              //                                 CustomText(
              //                                    text: 'cafe',
              //                                    textColor: AppColors.mainTextColor,
              //                                   textsize: screenWidth(20),
              //                                 ),
              //                                 CustomText(
              //                                   text: '.',
              //                                    textColor: AppColors.mainTextColor,
              //                                   textsize: screenWidth(20),
              //                                 ),
              //                                 CustomText(
              //                                   text: kindsFood[index],
              //                                   textColor: AppColors.mainTextColor,
              //                                   textsize: screenWidth(20),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         ],
              //                       );
              //             }));

              // }
              //         )
            ],
          ),
        ),
      ),
    );
  }
  // String getFullImageUrl(String url) {
  //   var splitedString = url.split('Images/');
  //   return 'https://${NetworkUtil.baseUrl}/Images/${splitedString[1]}';
  // }
}
