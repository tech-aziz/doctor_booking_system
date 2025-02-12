import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/style/app_string.dart';
import '../../../../../res/style/color.dart';
import '../../../../home/controller/language_controller.dart';


class CarWashView extends StatelessWidget {
  CarWashView({super.key});

  LanguageController languageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          languageController.isEnglish.value
              ? AppString.carWashEn
              : AppString.carWashBn,
          style: const TextStyle(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
              fontFamily: 'TiroBangla-Italic',
              fontWeight: FontWeight.normal),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Text(
            'Car Wash',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
