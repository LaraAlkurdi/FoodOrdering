import 'package:bot_toast/bot_toast.dart';
import 'package:food_1/core/enums/operation_type.dart';
import 'package:food_1/core/enums/request_status.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:get/get.dart';

//voice34
class BaseController extends GetxController {
  var requestStatus = RequestStatus.DEFAULT.obs;
  var operationType = OperationType.NONE.obs;
  //الهدف منها اني حط قيمة
  set setRequestStatus(RequestStatus value) {
    requestStatus.value = value;
  }

  set setOpertionType(OperationType value) {
    operationType.value = value;
  }

//function api
  Future runFutuerFunction({required Future function}) async {
    checkConnection(() async {
      await function;
    });
  }

  Future runLoadingFutuerFunction(
      {required Future function,
      OperationType? type = OperationType.NONE}) async {
    checkConnection(() async {
      setRequestStatus = RequestStatus.LOADING;
      setOpertionType = type!;
      await function;
      setRequestStatus = RequestStatus.DEFAULT;
      setOpertionType = OperationType.NONE;
    });
  }

  Future runFullLoadingFutuerFunction(
      {required Future function,
      OperationType? type = OperationType.NONE}) async {
    checkConnection(() async {
      CustomLoader();
      await function;
      BotToast.closeAllLoading();
    });
  }
}
