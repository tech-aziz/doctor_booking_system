import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/style/app_string.dart';
import '../../res/style/color.dart';
import '../home/view/home_bottom_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  // void authCheck() async {
  //   var isUserKeep = await MySharedPref.getBool();
  //   if (isUserKeep == true) {
  //     // Get.offAll( HomeBodyView());
  //     Get.offAll(()=> const HomeView());
  //   } else {
  //     Get.offAll(const LoginView());
  //   }
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(const Duration(seconds: 2), () => authCheck());
  // }

  @override
  void initState() {
    // Timer(const Duration(seconds: 2), () => Get.offAll(()=> const HomeView()));
    Timer(const Duration(seconds: 2), () {
      Get.offAll(()=> const HomeBottomView());
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.transparent,),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Column(
                  children: [
                    Image.asset('assets/images/logo.jpg',width: 170,),
                    const SizedBox(height: 5,),
                    AutoSizeText(
                      AppString.appName,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontFamily: 'TiroBangla-Italic',
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),

                    AutoSizeText(
                      AppString.slogan1,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontFamily: 'TiroBangla-Italic',
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),

                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            AppString.slogan,
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: 'TiroBangla-Italic',
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      indent: 0,
                      thickness: 1,
                      color: Colors.black.withOpacity(0.15),
                      endIndent: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          AppString.developedBy,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontFamily: 'TiroBangla-Italic',
                            fontSize: 8,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          child: AutoSizeText(
                            AppString.companyName,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                                fontFamily: 'TiroBangla-Italic',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
