import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../style/color.dart';
import '../style/text_style.dart';

PreferredSizeWidget customAppBar(
    {required String title, List<Widget>? actions}) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        )),
    backgroundColor: AppColors.primaryColor,
    title: Text(
      title,
      style: textStyle(
        textColor: Colors.white,
        fontFamily: 'TiroBangla-Italic',
        fontWeight: FontWeight.normal,
      ),
    ),
    centerTitle: false,
    actions: actions,
  );
}
