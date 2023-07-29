// import 'package:flutter/material.dart';
// import 'package:food_1/core/Data/models/apis/category_models.dart';
// import 'package:food_1/core/Data/repositories/category_repository.dart';
// import 'package:food_1/core/enums/message_type.dart';
// import 'package:food_1/ui/shared/colors.dart';
// import 'package:food_1/ui/shared/custom_widgets/custom_button.dart';
// import 'package:food_1/ui/shared/custom_widgets/custom_toast.dart';
// class HomeView extends StatefulWidget {
//   final Function() onMenuTap;
//   HomeView({Key? key, required this.onMenuTap}) : super(key: key);

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   List<CategoryModel> categoryList = [];
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return ListView(
//       children: [
//         Visibility(
//           visible: categoryList.length == 0,
//           child: CustomButton(
//             text: 'Get Categories',
//             onPressed: () {
//               CategoryRepository().getAll().then((value) {
//                 value.fold((l) {
//                   CustomToast.showMessage(
//                       size: size,
//                       message: l,
//                       messageType: MessageType.REJECTED);
//                 }, (r) {
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   setState(() {});
//                 });
//               });
//             },
//           ),
//         ),
//         Visibility(
//           visible: categoryList.length > 0, //بيظهر
//           child: ListView.separated(
//             physics: BouncingScrollPhysics(),
//             shrinkWrap: true, //تاخد حجم حسب الي بقلبها
//             itemCount: categoryList.length,
//             addAutomaticKeepAlives: true,
//             // cacheExtent: 10,// قرارنا
//             itemBuilder: (BuildContext context, int index) {

//               return Text(
//                 categoryList[index].name ?? '',
//                 style: TextStyle(fontSize: 60),
//               );
//             },
//              separatorBuilder: (BuildContext context, int index) { //للفصل بين الايتم
//               return Container(
//                 width: 100,
//                 height: 5,
//                 color: AppColors.mainOrangeColor,
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
////
///
///
// class HomeView extends StatefulWidget {
//   final Function() onMenuTap;
//   HomeView({Key? key, required this.onMenuTap}) : super(key: key);

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   List<CategoryModel> categoryList = [];
//   List<MealModel> mealList = [];
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return ListView(
//       children: [
// FutureBuilder(
//   future: CategoryRepository().getAll(),
//   builder: (context, snapshot) {
//     if (snapshot.data != null) {
//       snapshot.data!.fold((l) {
//         CustomToast.showMessage(
//             size: size, message: l,
//             messageType: MessageType.REJECTED);
//       }, (r) {
//         categoryList.clear();
//         categoryList.addAll(r);

//       });
//     }
//     return snapshot.data == null
//         ? SpinKitCircle(
//             color: AppColors.mainOrangeColor,
//           )
//         : ListView.separated(
//             physics: BouncingScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: categoryList.length,
//             addAutomaticKeepAlives: true,
//             itemBuilder: (BuildContext context, int index) {
//               return
//               SizedBox(
//                 height: 130,
//                 child: Text(
//                   categoryList[index].name ?? '',
//                   style: TextStyle(fontSize: 30),
//                 ),
//               );

//             },
//             separatorBuilder: (BuildContext context, int index) {
//               return Container(
//                 width: 100,
//                 height: 5,
//                 color: AppColors.mainOrangeColor,
//               );
//             },
//           );
//   },
// ),

//         FutureBuilder(
//           future: MealRepository().getAll(),
//           builder: (context, snapshot) {
//             if (snapshot.data != null) {
//               snapshot.data!.fold((l) {
//                 CustomToast.showMessage(
//                     size: size, message: l,
//                     messageType: MessageType.REJECTED);
//               }, (r) {
//                 mealList.clear();
//                 mealList.addAll(r);

//               });
//             }
//             return snapshot.data == null
//                 ? SpinKitCircle(
//                     color: AppColors.mainOrangeColor,
//                   )
//                 : ListView.separated(
//                     physics: BouncingScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: mealList.length,
//                     addAutomaticKeepAlives: true,
//                     itemBuilder: (BuildContext context, int index) {
//                       return SizedBox(
//                         height: 200,
//                         child: ListView(

//                           children: [
//                             CachedNetworkImage(
//                               imageUrl: mealList[index].images!.length > 0
//                                   ? getFullImageUrl(mealList[index].images![0])
//                                   : '',
//                               placeholder: (context, url) =>
//                                   CircularProgressIndicator(), // عنصر الذي يتم عرضه بينما يتم تحميل الصورة
//                               errorWidget: (context, url, error) =>
//                                   Icon(Icons.error), //لما بصير خطأ بتحميل الصورة
//                             ),
//                         Text(
//                               mealList[index].name ?? '',
//                               style: TextStyle(fontSize: 30),
//                             ),

//                           ],
//                         ),
//                       );
//                     },
//                     separatorBuilder: (BuildContext context, int index) {
//                       return Container(
//                         width: 100,
//                         height: 5,
//                         color: AppColors.mainOrangeColor,
//                       );
//                     },
//                   );
//           },
//         ),
//       ],
//     );
//   }

// String getFullImageUrl(String url) {
//     var splitedString = url.split('Images/');
//     return 'https://${NetworkUtil.baseUrl}/Images/${splitedString[1]}';
//   }
// }


//!----sign 
  //   child: Stack(
              //     alignment: AlignmentDirectional.bottomEnd,
              //     children: [
              //       InkWell(
              //         onTap: selectedFile == null
              //             ? () {
              //                 setShowOption(true);
              //               }
              //             : null,
              //         child: CircleAvatar(
              //           backgroundColor: AppColors.mainOrangeColor,
              //           radius:45 ,
              //           child: selectedFile == null || selectedFile!.path.isEmpty
              //               ? Icon(Icons.image)
              //               : selectedFile!.type != FileTypeEnum.FILE
              //                   ? ClipOval(child: Image.file(File(selectedFile!.path)))
              //                   : Icon(Icons.file_copy),
              //         ),
              //       ),
              //       Visibility(
              //         visible: selectedFile != null,
              //         child: InkWell(
              //           onTap: () {
              //             setShowOption(true);
              //           },
              //           child: CircleAvatar(
              //             radius: 18,
              //             backgroundColor: AppColors.mainOrangeColor,
              //             child: Icon(Icons.edit),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Visibility(
              //   visible: showOption,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       CustomButton(
              //         text: 'Camera',
              //         onPressed: () {
              //           pickFile(FileTypeEnum.CAMERA)
              //               .then((value) => selectedFile = value);
              //         },
              //       ),
              //       CustomButton(
              //         text: 'Gallery',
              //         onPressed: () {
              //           pickFile(FileTypeEnum.GALLERY)
              //               .then((value) => selectedFile = value);
              //         },
              //       ),
              //       CustomButton(
              //         text: 'File',
              //         onPressed: () {
              //           pickFile(FileTypeEnum.FILE)
              //               .then((value) => selectedFile = value);
              //         },
              //       ),
              //     ],
              //   ),
              // ),
