import 'package:food_1/core/enums/request_type.dart';
import 'package:food_1/ui/shared/utils.dart';

//request-> api ملف الاعدادات الي عم يدير كامل
class NetworkConfig {
  static String BAS_API =
      'api/web/'; //المشترك بكل الراوتات ونفس تسمية المفتاح بشيردبرفرانس
  static String getFullApiRoute(String api) {
    //وهي بترجع الرابط كامل api بمرق الجزء الاخير من
    return BAS_API + api;
  }

//headers with eequest
  static Map<String, String> getHeaders(
      {bool? needAuth = true,
      RequestType? type = RequestType.POST,
      Map<String, String>? extraHeaders}) {
    return {
      if (needAuth!)
        "Authorization": "Bearer ${storage.getTokenInfo()?.accessToken ?? ''}",
      if (type != RequestType.GET) "Content-Type": "application/json",
      ...extraHeaders ?? {}
    };
  }
}
