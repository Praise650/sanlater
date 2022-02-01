import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppColor {
  //color
  static const Color colorBlue = Color(0xff279AED);
}

class AppFont {
  AppFont._();
  //fonts
  static String euclidCircularABold = 'EuclidCircularA-Bold';
  static String euclidCircularALight = 'EuclidCircularA-Light';
  static String euclidCircularAMedium = 'EuclidCircularA-Medium';
  static String euclidCircularARegular = 'EuclidCircularA-Regular';
  static String euclidCircularASemiBold = 'EuclidCircularA-SemiBold';
}

class AppResponse {
  static showSuccess(String message,BuildContext context) {
    ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
              content: Text('Success'),
              backgroundColor: Colors.green.withOpacity(.4),
              ));
  }

  static showError(dynamic e, BuildContext context) {
    assert(context != null);
    if (e is SocketException) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
              content: Text('Error, Unable To Connect At This Time'),
              backgroundColor: Colors.red.withOpacity(.4),
              ));
      return;
    }
  //   if (e is DioError) {
  //     try {
  //       e.response!.statusCode != null
  //           ? Get.snackbar("Error", '${e.response!.data['message']}',
  //               backgroundColor: Colors.red.withOpacity(.4))
  //           : Get.snackbar('Error', "Unable To Connect At This Time",
  //               backgroundColor: Colors.red.withOpacity(.4));
  //     } catch (e) {
  //       debugPrint(e.toString());
  //     }
  //   }
  }
}

class AppStrings {
  static String firstName = "first_name";
  static String lastName = "last_name";
  static String id = "id";
  static String balance = "balance";
  static String xIdKey = "x-id-key";
  static String email = "email";
  static String emailPref = "emailPref";
  static String passwordPref = "passwordPref";
}

class AppHelpers {
  static String formatDate(String date) {
    DateFormat df = DateFormat('MMM d, yyyy   hh:mm aa');
    DateTime dt = DateTime.parse(date);
    String formattedDate = df.format(dt);
    return formattedDate;
  }
}
