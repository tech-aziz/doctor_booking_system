import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/style/app_string.dart';
import '../../../res/style/color.dart';
import '../../home/controller/language_controller.dart';

class MoreView extends StatelessWidget {
  LanguageController languageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            languageController.isEnglish.value
                ? AppString.moreServiceEn
                : AppString.moreServiceBn,
            style: const TextStyle(
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
                fontFamily: 'TiroBangla-Italic',
                fontWeight: FontWeight.normal),
          ),
        ),
        body: Center(
          child: Text('asldkjfal'),
        ));
  }
}
