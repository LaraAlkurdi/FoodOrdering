import 'package:dartz/dartz.dart';
import 'package:food_1/core/Data/models/apis/token_info.dart';
import 'package:food_1/core/Data/models/common_response.dart';
import 'package:food_1/core/Data/network/endpoints/user_endpoints.dart';
import 'package:food_1/core/Data/network/network_config.dart';
import 'package:food_1/core/enums/request_type.dart';
import 'package:food_1/core/utils/network_util.dart';

//package dartz :String, TokenInfo بحاجه نرجع قيمتين 
class UserRepository {
  Future<Either<String, TokenInfo>> login({
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(

          type: RequestType.POST,
          url: UserEndpoints.login,
          headers: NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'userName': email,
            'password': password,
          }).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(
            commonResponse.data ?? {},
          ));
        } else {
          return Left(commonResponse.message ?? ''); //رسالة الخطأ
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

Future<Either<String, bool>> register({
    required String email,
    required String password,
    required String lastname,
    required String firstname,
    required int age,
    required String photoPath,

  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        
          type: RequestType.POST,
          url: UserEndpoints.register,
          
          fields: {
            'Email': email,
            'FirstName': firstname,
            'LastName': lastname,
             'Password': password,
            'Age': age.toString(),
          },
          files: {"Photo":photoPath},
          headers: NetworkConfig.getHeaders(needAuth: false, extraHeaders: {
           
          }),
          ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? ''); //رسالة الخطأ
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  }