import 'dart:convert';
import 'package:food_1/app/app_config.dart';
import 'package:food_1/core/Data/models/apis/token_info.dart';
import 'package:food_1/core/Data/models/cart_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../enums/data_type.dart';

//dataمخزن لل للمستخدم
class SharedPreferencesRepository {
  SharedPreferences storage = Get.find();
  //!---key---

  String PREF_FIRST_LUNCH = 'first_lunch';
  String PREF_TOKEN = 'token';
  String PREF_APP_LANG = 'app_lang';
  String PREF_CART_LIST = 'cart_list';
  String PREF_SUB_STATUS = 'sub_status';
  //!--نعرف المفتاح--

  void setTokenInfo(TokenInfo value) {
    setPreferenc(
      dataType: DataType.STRING,
      key: PREF_TOKEN,
      value: jsonEncode(value.toJson()),
    );
  }

  TokenInfo? getTokenInfo() {
    if (storage.containsKey(PREF_TOKEN)) {
      return TokenInfo.fromJson(
        jsonDecode(getPrefernce(key: PREF_TOKEN)),
      );
    } else {
      return null;
    }
  }
//----

  bool get isLoggedIn => getTokenInfo() != null ? true : false;
// لمسح التوكن
//     void clearTokenInfo(){
// storage.remove(PREF_TOKEN);
// storage.clear();
//    }

  void setFirstLunch(bool value) {
    setPreferenc(
      dataType: DataType.BOOL,
      key: PREF_FIRST_LUNCH,
      value: value,
    );
  }

  bool getFirstLunch() {
    if (storage.containsKey(PREF_FIRST_LUNCH)) {
      return getPrefernce(key: PREF_FIRST_LUNCH);
    } else {
      return true;
    }
  }

//---
  void setAppLanguage(String value) {
    setPreferenc(
      dataType: DataType.STRING,
      key: PREF_APP_LANG,
      value: value,
    );
  }

  String getAppLanguage() {
    if (storage.containsKey(PREF_APP_LANG)) {
      return getPrefernce(key: PREF_APP_LANG);
    } else {
      return AppConfig.defultLanguge;
    }
  }

//---
  void setCartList(List<CartModel> list) {
    setPreferenc(
      dataType: DataType.STRING,
      key: PREF_CART_LIST,
      value: CartModel.encode(list),
    );
  }

  List<CartModel> getCartList() {
    if (storage.containsKey(PREF_CART_LIST)) {
      return CartModel.decode(getPrefernce(key: PREF_CART_LIST));
    } else {
      return [];
    }
  }

  void setSubStatus(bool value) {
    setPreferenc(
      dataType: DataType.BOOL,
      key: PREF_SUB_STATUS,
      value: value,
    );
  }

  bool getSubStatus() {
    if (Get.find<SharedPreferences>().containsKey(PREF_SUB_STATUS)) {
      return getPrefernce(key: PREF_SUB_STATUS);
    } else {
      return true;
    }
  }

//!-- main function --
  setPreferenc(
      {required DataType dataType,
      required String key,
      required dynamic value}) async {
    switch (dataType) {
      case DataType.INT:
        await storage.setInt(key, value);
        break;
      case DataType.DOUBLE:
        await storage.setDouble(key, value);
        break;
      case DataType.BOOL:
        await storage.setBool(key, value);
        break;
      case DataType.STRING:
        await storage.setString(key, value);
        break;
      case DataType.STRINGLIST:
        await storage.setStringList(key, value);

        break;
      default:
        break;
    }
  }

  dynamic getPrefernce({required String key}) {
    return storage.get(key);
  }
}
