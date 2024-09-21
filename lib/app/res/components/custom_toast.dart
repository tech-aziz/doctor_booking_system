import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../style/color.dart';

Future<bool?> customToast({required String msg}){
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.primaryColor,
      textColor: Colors.white,
      fontSize: 16.0
  );
}