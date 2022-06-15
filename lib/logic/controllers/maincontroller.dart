import 'package:get/get.dart';
import 'package:meat_and_eat/view/screens/category_screen.dart';
import 'package:meat_and_eat/view/screens/favourite_screen.dart';
import 'package:meat_and_eat/view/screens/home_screen.dart';
import 'package:meat_and_eat/view/screens/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    SettingsScreen(),
  ].obs;

  final titles = [
    'Shop',
    'Category ',
    'Favourite ',
    'Settings ',
  ].obs;
}
