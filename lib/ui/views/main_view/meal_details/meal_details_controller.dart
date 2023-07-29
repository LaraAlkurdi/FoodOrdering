import 'package:food_1/core/Data/models/apis/meal_model.dart';
import 'package:food_1/core/services/base_controller.dart';
import 'package:food_1/ui/shared/utils.dart';
import 'package:food_1/ui/views/cart_view/cart_view.dart';
import 'package:food_1/ui/views/main_view/home_view/home_view_controller.dart';
import 'package:get/get.dart';

class MealDetalisController extends BaseController{
  MealDetalisController(MealModel mealModel){
  model= mealModel;
  }
  MealModel model =MealModel();
  RxInt count =1.obs;

  void changeCount(bool increase){
  if(increase)
  count++;
  else{
    if(count>1)
    {
      count--;
    }
  }
}
double calcTotal(){
  return (count.value*model.price!).toDouble() ;
}
 void addToCart() {
  cartService.addToCart(model: model, 
  count: count.value,
  afterAdd: (){
    //  Get.find<HomeController>().cartCount.value += count.value;
     Get.to(CartView());
  }
  );
    // List<CartModel> list = storage.getCartList();

    // CartModel? result =
    //     list.firstWhere((element) => element.meal!.id == model.id, orElse: () {
    //   return CartModel();
    // });

    // if (result.count != null) {
    //   int index = list.indexOf(result);
    //   list[index].count = list[index].count! + count.value;
    //   list[index].total = list[index].total! + calcTotal();
    // } else {
    //   list.add(CartModel(
    //     count: count.value,
    //     total: calcTotal(),
    //     meal: model,
    //   ));
    // }

    // storage.setCartList(list);  
    // Get.to(CartView());
  }

}