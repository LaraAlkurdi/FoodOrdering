import 'package:food_1/core/Data/models/apis/category_models.dart';
import 'package:food_1/core/Data/models/apis/meal_model.dart';
import 'package:food_1/core/Data/models/notifction_model.dart';
import 'package:food_1/core/Data/repositories/category_repository.dart';
import 'package:food_1/core/Data/repositories/meal_repository.dart';
import 'package:food_1/core/enums/app_state.dart';
import 'package:food_1/core/enums/connectivity_status.dart';
import 'package:food_1/core/enums/message_type.dart';
import 'package:food_1/core/enums/notifction_type.dart';
import 'package:food_1/core/enums/operation_type.dart';
import 'package:food_1/core/enums/request_status.dart';
import 'package:food_1/core/services/base_controller.dart';
import 'package:food_1/ui/shared/custom_widgets/custom_toast.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<MealModel> mealList = <MealModel>[].obs;

  bool get isCategoryLoading =>
      requestStatus == RequestStatus.LOADING.obs &&
      operationType == OperationType.CATEGORY;

  bool get isMealLoading =>
      requestStatus == RequestStatus.LOADING.obs &&
      operationType == OperationType.MEAL;

  // RxInt cartCount = 0.obs;
  RxBool isOnline = true.obs;
  RxInt notificationsCount = 0.obs;
  @override
  void onInit() {
    getAllCategory();
    getAllMeal();

    notificationService.notifcationStream.stream.listen((event) {
      notificationsCount.value++;
    });
    super.onInit();
  }

  @override
  void onReady() {
    checkConnection();
    super.onReady();
  }

  void checkConnection() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      isOnline.value = event == ConnectivityStatus.ONLINE;
    });
  }

  void getAllCategory() {
    runLoadingFutuerFunction(
        type: OperationType.CATEGORY,
        function: CategoryRepository().getAll().then(
          (value) {
            value.fold((l) {
              CustomToast.showMessage(
                  message: l, messageType: MessageType.REJECTED);
            }, (r) {
              categoryList.addAll(r);
            });
          },
        ));
  }

  void getAllMeal() {
    runLoadingFutuerFunction(
        type: OperationType.MEAL,
        function: MealRepository().getAll().then(
          (value) {
            value.fold((l) {
              CustomToast.showMessage(
                  message: l, messageType: MessageType.REJECTED);
            }, (r) {
              mealList.addAll(r);
            });
          },
        ));
  }

  void addToCart(MealModel model) {
    cartService.addToCart(
        model: model,
        count: 1,
        afterAdd: () {
          CustomToast.showMessage(
              message: 'Added', messageType: MessageType.SUCCESS);
          //  cartCount.value =cartService.getCartCount();
        });
  }

  void resetNotifications() {
    notificationsCount.value = 0;
  }
}
