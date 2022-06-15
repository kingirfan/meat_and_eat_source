import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meat_and_eat/routes/routes.dart';

class AuthControllers extends GetxController {
  bool isVisibility = false;
  bool isCheckBoxVisible = false;
  var displayName = '';
  var displayPhoto = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSigninAccount = GoogleSignIn();
  bool isLoading = false;
  bool isSignedIn = false;
  final GetStorage authBox = GetStorage();

  checkVisibility() {
    isVisibility = !isVisibility;
    update();
  }

  checkBoxVisibility() {
    isCheckBoxVisible = !isCheckBoxVisible;
    update();
  }

  signUpUsingFirebase(String username, String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayName = username;
        auth.currentUser!.updateDisplayName(username);
      });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error !',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  logInUsingFirebase({required String email, required String password}) async {
    isLoading = true;

    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayName = auth.currentUser!.displayName!;
        isSignedIn = true;
        authBox.write('auth', isSignedIn);

      });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error !',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  googleSignIn() async {
    //isLoading = true;
    try {
      final GoogleSignInAccount? googleUser =
          await googleSigninAccount.signIn();
      googleSigninAccount.signOut();
      displayName = googleUser!.displayName!;
      displayPhoto = googleUser.photoUrl!;
      isSignedIn = true;
      authBox.write('auth', isSignedIn);

      update();
      Get.offNamed(Routes.mainScreen);
    } catch (e) {
      Get.snackbar(
        'Error !',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  facebookSignIn() {}

  resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email).then((value) {
        displayName = auth.currentUser!.displayName!;
      });
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error !',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSigninAccount.signOut();
      displayName = '';
      isSignedIn = false;
      authBox.remove('auth');
      update();
      Get.offNamed(Routes.welcomeScreen);
    } catch (error) {}
  }
}
