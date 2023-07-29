// import 'package:file_picker/file_picker.dart';
// import 'package:food_1/core/Data/models/file_type_model.dart';
// import 'package:food_1/core/enums/file_type_model.dart';
// import 'package:image_picker/image_picker.dart';
// final ImagePicker picker = ImagePicker();
//   bool showOption = false;
// Future<FileTypeModel> pickFile(FileTypeEnum type) async {
//     String? path;
//     switch (type) {
//       case FileTypeEnum.GALLERY:
//         await picker
//             .pickImage(source: ImageSource.gallery)
//             .then((value) => path = value?.path ?? '');
//         break;
//       case FileTypeEnum.CAMERA:
//         await picker
//             .pickImage(source: ImageSource.camera)
//             .then((value) => path = value?.path ?? '');
//         break;
//       case FileTypeEnum.FILE:
//         await FilePicker.platform
//             .pickFiles()
//             .then((value) => path = value?.paths[0] ?? '');
//         break;
//     }
//     showOption=false;
//     return FileTypeModel(path ?? '', type);
//   }