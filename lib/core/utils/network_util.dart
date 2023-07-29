import 'dart:convert';
import 'package:food_1/core/enums/message_type.dart';
import 'package:food_1/core/enums/request_type.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_toast.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';

//عشان بكج http
class NetworkUtil {
  static String baseUrl = 'training.owner-tech.com'; //سيرفر apiعشان عنوان
  static var client = http.Client(); //to calling

  static Future<dynamic> sendRequest({
    required String url,
    required RequestType type,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params, //للشغلات الي بدون اهمية
  }) async {
    try {
      //!--Required for request ---
      //*--- make full api url --
      //url(key+value)رابط السيرفر الرئيسي/نرسل معلومات ضمن / (.com)لاحقة بعد
      var uri = Uri.https(baseUrl, url, params);

      //?--To save api response ---
      // api response لخزن قيمة
      late http.Response response;

      //?--To save api status code  ---
      // int statusCode = 0 ;

      //!--to convert api response to map --
      // String strResponse ='';
      // response=response الراجع+status code  لدمج:
      Map<String, dynamic> jsonResponse = {};

      //!--to call correct  request type -- uri+type
      switch (type) {
        case RequestType.GET: //بتعطي بيانات
          response = await client.get(uri, headers: headers);
          break;
        case RequestType.POST: //بتضيف بيانات جديدة
          //jsonEncode(body):api unformat json تعتبر بالنسبة لل  mapوقت مرقت body فوق كان
          response =
              await client.post(uri, body: jsonEncode(body), headers: headers);
          break;
        case RequestType.PUT: //تحدث البيانات
          response =
              await client.put(uri, body: jsonEncode(body), headers: headers);
          break;
        case RequestType.DELETE:
          response = await client.delete(uri,
              body: jsonEncode(body), headers: headers);
          break;
      }
      //!--
      // statusCode =response.statusCode; //الرقم الي اجى من api
      // strResponse = Utf8Codec().decode(response.bodyBytes); //convert body bytes to string
      // //لادمجها مع map
      // jsonResponse.putIfAbsent('response', () => jsonDecode(strResponse)); //convert string to json
      // jsonResponse.putIfAbsent('statusCode', () => statusCode);
      // print(jsonResponse);
      // return jsonResponse;

      dynamic result;

      try {
        result = jsonDecode(Utf8Codec().decode(response.bodyBytes)); //map
      } catch (e) {}

      //putIfAbsent: function to add key &value to map

      // jsonResponse.putIfAbsent(
      //     'response',
      //     () => result == null
      //         ?
      //         {'title': Utf8Codec().decode(response.bodyBytes)} //to string
      //         : jsonDecode(Utf8Codec().decode(response.bodyBytes)));

      jsonResponse.putIfAbsent('statusCode', () => response.statusCode);
      jsonResponse.putIfAbsent('response',
          () => result ?? {'title': Utf8Codec().decode(response.bodyBytes)});
      print(jsonResponse);
      return jsonResponse;
    } catch (e) {
      CustomToast.showMessage(
        message: Error().toString(),
        messageType: MessageType.REJECTED,
      );
      // print(e); //عسان تكتبلي الخطا وين
    }
  }

// api لارسال صورة ل
//upload file
  static Future<dynamic> sendMultipartRequest({
    required RequestType type,
    required String url,
    Map<String, String>? headers = const {}, //key+vule بتطلع مع --> request
    Map<String, String>? fields = const {}, //key +value --> string (مو file)
    Map<String, String>? files =
        const {}, //value string ( لمرق path ---> الصورة)
    Map<String, dynamic>? params,
  }) async {
    // assert(
    //   type == RequestType.GET || type == RequestType.MULTIPART,
    //   'Focus pls');
    try {
      //*---upload file to server
      var request = http.MultipartRequest(
          type.toString(), Uri.https(baseUrl, url, params));

      //!-- all list (files)

      var _filesKeyList = files!.keys.toList(); //(name file)
      var _filesNameList = files.values.toList(); //(مسار الملف)

      //?---
      for (int i = 0; i < _filesKeyList.length; i++) {
        if (_filesNameList[i].isNotEmpty) {
          var multipartFile = http.MultipartFile.fromPath(
            _filesKeyList[i],
            _filesNameList[i], // path
            filename: path.basename(
                _filesNameList[i]), // بترجع اسم الملف الي بجهاز المستخدم
            contentType: getContentType(_filesNameList[i]),
          );
          request.files.add(await multipartFile);
        }
      }
      request.headers.addAll(headers!);
      request.fields.addAll(fields!);

      var response = await request.send();

      Map<String, dynamic> responseJson = {};

      var value =
          await response.stream.bytesToString(); //convert byte to string
      responseJson.putIfAbsent('statusCode', () => response.statusCode);
      responseJson.putIfAbsent('response', () => jsonDecode(value));

      return responseJson;
    } catch (error) {
      print(error.toString());
    }
  }
//*--- //  file type(word, exl,...) ,لاحقة

  static MediaType getContentType(String name) {
    var ext = name.split('.').last;
    if (ext == "png" || ext == "jpeg") {
      return MediaType.parse("image/jpg");
    } else if (ext == 'pdf') {
      return MediaType.parse("application/pdf");
    } else {
      return MediaType.parse("image/jpg");
    }
  }
}
