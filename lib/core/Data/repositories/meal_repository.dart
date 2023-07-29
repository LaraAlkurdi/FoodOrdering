import 'package:dartz/dartz.dart';
import 'package:food_1/core/Data/models/apis/meal_model.dart';
import 'package:food_1/core/Data/models/common_response.dart';
import 'package:food_1/core/Data/network/endpoints/Meal_endpoints.dart';
import 'package:food_1/core/Data/network/network_config.dart';
import 'package:food_1/core/enums/request_type.dart';
import 'package:food_1/core/utils/network_util.dart';


class MealRepository{
  Future<Either<String, List<MealModel>>> getAll()
     async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.GET,
          url: MealEndpoints.getAll,
          headers: NetworkConfig.getHeaders(
            needAuth: false ,type: RequestType.GET),
                ).then((response) {
        CommonResponse<List< dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          List<MealModel> resultList =[];
          commonResponse.data!.forEach(
            (element){
              resultList.add(MealModel.fromJson(element));
            }
          );
          return Right(resultList);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}