import 'package:get/get.dart';
import 'package:project_mobile/app/modules/meal/controllers/meal_controller.dart';


class MealBindings extends Bindings {
  @override
  void dependencies() {
    // Menginisialisasi FoodController secara lazy (hanya saat diperlukan)
    Get.lazyPut<MealController>(() => MealController());
  }
}