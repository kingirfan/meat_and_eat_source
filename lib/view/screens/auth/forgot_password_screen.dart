import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get_core/get_core.dart';
import 'package:meat_and_eat/logic/controllers/auth_controllers.dart';
import 'package:meat_and_eat/utils/strings.dart';
import 'package:meat_and_eat/utils/theme.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/view/widgets/auth/auth_button.dart';
import 'package:meat_and_eat/view/widgets/auth/auth_textform_field.dart';
import 'package:meat_and_eat/view/widgets/text_utils.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final forgotPasswordController = Get.find<AuthControllers>();

  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Forgot Password',
            style: TextStyle(color: mainColor),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextUtils(
                    text:
                        'If you want to recover your account then please provide your email-Id below ...',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    colors: Colors.black,
                    textDecoration: TextDecoration.none,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 250,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AuthTextFormField(
                      controller: emailController,
                      obscureText: false,
                      validation: (value) {
                        if (value.toString().length <= 2 ||
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
                    height: 50,
                  ),
                  GetBuilder<AuthControllers>(
                    builder: (controller) {
                      return AuthButton(
                        text: 'SEND',
                        function: () {
                          if (formKey.currentState!.validate()) {
                            forgotPasswordController.resetPassword(
                              email: emailController.text.trim(),
                            );
                          }
                          ;
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
