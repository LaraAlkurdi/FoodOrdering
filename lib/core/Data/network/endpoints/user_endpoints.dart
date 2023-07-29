import 'package:food_1/core/Data/network/network_config.dart';
//url
class UserEndpoints{
  static String login = NetworkConfig.getFullApiRoute('user/login');
   static String register = NetworkConfig.getFullApiRoute('User/Register');
}