import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:meat_and_eat/logic/controllers/auth_controllers.dart';
import 'package:meat_and_eat/routes/routes.dart';
import 'package:meat_and_eat/utils/strings.dart';
import 'package:meat_and_eat/utils/theme.dart';
import 'package:meat_and_eat/view/widgets/auth/auth_button.dart';
import 'package:meat_and_eat/view/widgets/auth/auth_textform_field.dart';
import 'package:meat_and_eat/view/widgets/auth/check_box_widget.dart';
import 'package:meat_and_eat/view/widgets/auth/container_under.dart';
import 'package:meat_and_eat/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final signUpController = Get.find<AuthControllers>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 1.3,
                padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextUtils(
                          text: 'LOG',
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          colors: mainColor,
                          textDecoration: TextDecoration.none,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        TextUtils(
                          text: 'IN',
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          colors: Colors.black,
                          textDecoration: TextDecoration.none,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthTextFormField(
                        controller: emailController,
                        obscureText: false,
                        validation: (value) {
                          if (value
                              .toString()
                              .length <= 2 ||
                              !RegExp(validationEmail).hasMatch(value)) {
                            return 'In Valid Email';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Image.asset(
                          'assets/images/email.png',
                        ),
                        suffixIcon: const SizedBox.shrink(),
                        hintText: "Email"),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<AuthControllers>(
                      builder: (controller) {
                        return AuthTextFormField(
                            controller: passwordController,
                            obscureText: controller.isVisibility ? false : true,
                            validation: (value) {
                              if (value
                                  .toString()
                                  .length <= 5) {
                                return 'Enter Proper Password';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Image.asset(
                              'assets/images/lock.png',
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.checkVisibility();
                              },
                              icon: controller.isVisibility
                                  ? const Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              )
                                  : const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                            hintText: "Password");
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.forgotPasswordScreen);
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.topRight,
                        child: TextUtils(
                          text: 'Forgot Password',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          colors: Colors.grey,
                          textDecoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GetBuilder<AuthControllers>(
                      builder: (controller) {
                        if (!controller.isLoading) {
                          return AuthButton(
                            text: 'LOG IN',
                            function: () {
                              if (formKey.currentState!.validate()) {
                                controller.logInUsingFirebase(
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                );
                              }
                            },
                          );
                        }
                        else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextUtils(
                      text: 'OR',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      colors: Colors.grey,
                      textDecoration: TextDecoration.none,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GetBuilder<AuthControllers>(builder: (controller) {
                          return InkWell(
                            onTap: () {
                              controller.googleSignIn();
                            },
                            child: Image.asset(
                              'assets/images/google.png',
                            ),
                          );
                        },),
                        const SizedBox(
                          width: 0,
                        ),
                        /*InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/facebook.png',
                          ),
                        )*/
                      ],
                    )
                  ],
                ),
              ),
              ContainerUnder(
                text: "Dont have an Account?",
                textType: "Sign Up ",
                function: () {
                  Get.offNamed(Routes.signUpScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
