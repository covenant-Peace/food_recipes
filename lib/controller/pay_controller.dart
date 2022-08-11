import 'package:food_recipes/model/food.dart';
import 'package:get/get.dart';
import 'shopping_controller.dart';

class PayController extends GetxController {
  var payItems = List<Food>().obs;

  int get count => payItems.length;

  double get totalPrice => payItems.fold(0, (sum, item) => sum + item.price);

  Food uis;
  ShoppingController oii;
  // bool vidi(int index) => payItems[index];

  // double get totalPrice1 =>
  //     payItems.value.fold(0, (sum, item) => sum + item.price);

  addToCart(Food food) {
    payItems.add(food);
    totalPrice;
  }

  removeFromCart1(int id1, String foodName1, String foodDescription1, double price1){
    final foodie = Food(id: id1, foodDescription: foodDescription1, foodName: foodName1, price: price1);
    payItems.remove(foodie);
  }

  removeFromCart(Food food) {
    payItems.remove(food);
    totalPrice;
  }

//   addToCart(Food food) {
//     if( oii.foods[0].id == 1 ) {
//       // uis.isFavorite[0]== true;
//       payItems.add(food);
//       return totalPrice;
//     }
//     else
//     if( oii.foods[0].id == 2 ) {
//       uis.isFavorite[1]== true;
//       payItems.add(food);
//       totalPrice;
//     }
//     else
//     if( oii.foods[0].id == 3 ) {
//       uis.isFavorite[2]== true;
//       payItems.add(food);
//       totalPrice;
//     }
//     else
//     if( oii.foods[0].id == 4 ) {
//       uis.isFavorite[3]== true;
//       payItems.add(food);
//       totalPrice;
//     }
//   }
}
