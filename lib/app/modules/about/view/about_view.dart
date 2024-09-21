import 'package:flutter/material.dart';


import '../../../res/style/app_string.dart';
import '../../../res/style/color.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'আমাদের সম্পর্কে',
          style: TextStyle(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
              fontFamily: 'TiroBangla-Italic',
              fontWeight: FontWeight.normal),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.justify,
                AppString.about,
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
