import 'package:flutter/material.dart';
import 'package:meat_and_eat/logic/controllers/auth_controllers.dart';
import 'package:meat_and_eat/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthControllers>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthControllers>(builder: (controller) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBoxVisibility();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(
                    10,
                  )),
              child: controller.isCheckBoxVisible ?
              Image.asset('assets/images/check.png') :
              SizedBox.shrink(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                text: "I Accept ",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                colors: Colors.black,
                textDecoration: TextDecoration.none,
              ),
              TextUtils(
                text: "Terms and Condition",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                colors: Colors.black,
                textDecoration: TextDecoration.underline,
              )
            ],
          )
        ],
      );
    },);
  }
}
