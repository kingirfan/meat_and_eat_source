import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/routes/routes.dart';
import 'package:meat_and_eat/utils/theme.dart';
import 'package:meat_and_eat/view/widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  final Size size = Get.size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              color: Colors.black.withOpacity(0.2),
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: size.height / 2,
                  width: size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height / 3.5,
                      ),
                      Container(
                        height: size.height / 10,
                        width: size.width / 2,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: TextUtils(
                            text: 'Welcome',
                            fontSize: size.width / 10,
                            fontWeight: FontWeight.bold,
                            textDecoration: TextDecoration.none,
                            colors: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Container(
                        height: size.height / 11,
                        width: size.width / 1.5,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextUtils(
                              text: 'Asroo',
                              fontSize: size.width / 9,
                              textDecoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              colors: mainColor,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            TextUtils(
                                text: 'ShoP',
                                fontSize: size.width / 9.5,
                                fontWeight: FontWeight.bold,
                                colors: Colors.white,
                                textDecoration: TextDecoration.none),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 3.5,
                  width: size.width,
                ),
                SizedBox(
                    width: size.width / 1.9,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12)),
                      onPressed: () {
                        Get.offNamed(Routes.loginScreen);
                      },
                      child: TextUtils(
                          text: 'Get Started',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          colors: Colors.white,
                          textDecoration: TextDecoration.none)),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                        text: 'Dont have an Account ?',
                        fontSize: size.width / 20,
                        fontWeight: FontWeight.normal,
                        colors: Colors.white,
                        textDecoration: TextDecoration.none
                    ),
                    TextButton(onPressed: (){
                      Get.offNamed(Routes.signUpScreen);
                    }, child: TextUtils(
                      text: 'Sign Up',
                      fontSize: size.width / 20,
                      fontWeight: FontWeight.normal,
                      colors: Colors.white,
                      textDecoration: TextDecoration.underline,
                    ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
