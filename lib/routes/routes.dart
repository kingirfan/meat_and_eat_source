import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/logic/bindings/auth_bindings.dart';
import 'package:meat_and_eat/logic/bindings/main_bindings.dart';
import 'package:meat_and_eat/logic/bindings/product_bindings.dart';
import 'package:meat_and_eat/view/screens/auth/forgot_password_screen.dart';
import 'package:meat_and_eat/view/screens/auth/login_screen.dart';
import 'package:meat_and_eat/view/screens/auth/signup_screen.dart';
import 'package:meat_and_eat/view/screens/main_screen.dart';
import 'package:meat_and_eat/view/screens/welcome_screen.dart';

class AppRoutes {
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  static final routes = [
    GetPage(
      name: welcome,
      page: () => WelcomeScreen(),
    ),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBindings()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUpScreen(),
        binding: AuthBindings()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUpScreen(),
        binding: AuthBindings()),
    GetPage(
        name: Routes.forgotPasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBindings()),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBindings(),
        MainBindings(),
        ProductBinding()
      ],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
}
