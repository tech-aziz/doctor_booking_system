import 'dart:async';
import 'dart:io';
import 'package:doctor_booking_system/app/modules/home/view/carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../../models/category_detail_model.dart';
import '../../../res/components/custom_button.dart';
import '../../../res/components/custom_text_widget.dart';
import '../../../res/style/app_string.dart';
import '../../../res/style/app_url.dart';
import '../../../res/style/color.dart';
import '../controller/language_controller.dart';

class HomeBodyViewStatic extends StatefulWidget {
  const HomeBodyViewStatic({super.key});

  @override
  State<HomeBodyViewStatic> createState() => _HomeBodyViewStaticState();
}

class _HomeBodyViewStaticState extends State<HomeBodyViewStatic> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool switchValue = false;
  bool isEnglish = false;
  final LanguageController languageController = Get.find();

  //user will exit or not section start
  Future<bool> showExitPopup(context) async {
    return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              elevation: 10,
              contentPadding: const EdgeInsets.all(20.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              // alignment: Alignment.center,
              content: Text(AppString.exitMessage,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.9)),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          exit(0);
                        },
                        child: customButton(
                            textColor: Colors.black,
                            btnName: 'Yes',
                            borderColor: Colors.black.withOpacity(.1),
                            color: Colors.white60,
                            context: context,
                            border: Border.all(
                                width: 1,
                                color: Colors.black.withOpacity(0.5))),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          Get.back();
                        },
                        child: customButton(
                            textColor: Colors.black,
                            btnName: 'No',
                            borderColor: Colors.black.withOpacity(.1),
                            context: context,
                            color: Colors.white60,
                            border: Border.all(
                                width: 1,
                                color: Colors.black.withOpacity(0.5))),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(
            icon: Image.asset('assets/images/menu.png',
                width: 25.0, color: Colors.white),
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
          centerTitle: true,
          title: Text(
              languageController.isEnglish.value
                  ? AppString.appName
                  : AppString.appName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  overflow: TextOverflow.ellipsis,
                  fontFamily: 'TiroBangla-Italic',
                  fontWeight: FontWeight.bold)),
          actions: [
            FlutterSwitch(
              height: 24.0,
              width: 38.0,
              padding: .6,
              toggleSize: 24.0,
              borderRadius: 25.0,
              activeColor: Colors.blue.withOpacity(0.8),
              value: switchValue,
              onToggle: (value) {
                setState(() {
                  isEnglish = !isEnglish;
                  switchValue = value;
                });
              },
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              switchValue ? 'En' : 'Bn',
              style: const TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                  fontFamily: 'TiroBangla-Italic',
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        drawer: Drawer(
          child: IntrinsicHeight(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.primaryColor),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 2),
                          child: displayMedium(
                              text: AppString.appName,
                              fontSize: 16,
                              color: Colors.white,
                              textAlign: TextAlign.center)),
                    ),
                    accountEmail: displayMedium(
                        text: "dr_joynal_abdin.help@gmail.com",
                        fontSize: 12,
                        color: Colors.black,
                        textAlign: TextAlign.start),
                    currentAccountPicture: Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.jpeg'),
                          fit: BoxFit.fill,
                        ),
                        border: Border(),
                        shape: BoxShape.circle,
                      ),
                    ),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    otherAccountsPictures: const [],
                  ),
                  ListTile(
                    onTap: () {
                      // Get.to(() => const PrivacyView());
                    },
                    title: displayMedium(
                        text: languageController.isEnglish.value
                            ? 'Booking history'
                            : 'বুকিং হিস্টোরি',
                        fontSize: 14,
                        color: Colors.black,
                        textAlign: TextAlign.start),
                    leading: SvgPicture.asset('assets/images/history.svg',
                        height: 25, width: 25, color: Colors.grey),
                    trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  ),
                  ListTile(
                    onTap: () {
                      Get.back();
                    },
                    title: displayMedium(
                        text: languageController.isEnglish.value
                            ? AppString.ratingEn
                            : AppString.ratingBn,
                        fontSize: 14,
                        color: Colors.black,
                        textAlign: TextAlign.start),
                    leading: SvgPicture.asset(
                      'assets/images/rating.svg',
                      height: 22,
                      width: 22,
                      color: Colors.grey,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  ),
                  // Divider(
                  //   color: Colors.grey.withOpacity(0.09),
                  // ),

                  // Divider(color: Colors.grey.withOpacity(0.09)),
                  // ListTile(
                  //   onTap: () {
                  //     Get.back();
                  //   },
                  //   title: displayMedium(
                  //       text: languageController.isEnglish.value
                  //           ? 'Terms & Conditions'
                  //           : 'শর্তাবলী',
                  //       fontSize: 14,
                  //       color: Colors.black,
                  //       textAlign: TextAlign.start),
                  //   leading: Image.asset('assets/icons/term_condition.png',
                  //       height: 22, width: 22, color: Colors.grey),
                  //   trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  // ),
                  // Divider(color: Colors.grey.withOpacity(0.09)),
                  // ListTile(
                  //   onTap: () {
                  //     Get.back();
                  //   },
                  //   title: displayMedium(
                  //       text: languageController.isEnglish.value
                  //           ? 'Refund & Return Policy'
                  //           : 'রিফান্ড এবং রিটার্ন নীতি',
                  //       fontSize: 14,
                  //       color: Colors.black,
                  //       textAlign: TextAlign.start),
                  //   leading: Image.asset('assets/icons/refund.png',
                  //       height: 22, width: 22, color: Colors.grey),
                  //   trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  // ),
                  // Divider(color: Colors.grey.withOpacity(0.09)),
                  ListTile(
                    onTap: () {
                      Get.back();
                    },
                    title: displayMedium(
                        text: languageController.isEnglish.value
                            ? 'Update'
                            : 'আপডেট',
                        fontSize: 14,
                        color: Colors.black,
                        textAlign: TextAlign.start),
                    leading: SvgPicture.asset(
                      'assets/images/logout.svg',
                      height: 22,
                      width: 22,
                      color: Colors.grey,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  ),
                  // Divider(color: Colors.grey.withOpacity(0.09)),
                  ListTile(
                    onTap: () {
                      Get.back();
                    },
                    title: displayMedium(
                        text: languageController.isEnglish.value
                            ? 'Change Language'
                            : 'ভাষা পরিবর্তন করুন',
                        fontSize: 14,
                        color: Colors.black,
                        textAlign: TextAlign.start),
                    leading: SvgPicture.asset('assets/images/language.svg',
                        height: 22, width: 22, color: Colors.grey),
                    trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  ),
                  // Divider(color: Colors.grey.withOpacity(0.09)),
                  ListTile(
                    onTap: () async {
                      Timer(const Duration(seconds: 1), () {
                        // MySharedPref.logout();
                      });
                    },
                    title: displayMedium(
                        text: languageController.isEnglish.value
                            ? 'Log Out'
                            : ' লগ আউট',
                        fontSize: 14,
                        color: Colors.black,
                        textAlign: TextAlign.start),
                    leading: SvgPicture.asset('assets/images/home.svg',
                        height: 22, width: 22, color: Colors.grey),
                    trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: () => showExitPopup(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                ImageCarousel(),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                    flex: 4,
                    child: GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: getCategoryData.length,
                        itemBuilder: (_, index) {
                          final data = getCategoryData[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 80,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color(0xffE6F1F2),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.green,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    data.icon,
                                    height: 100,
                                  ),
                                  Text(data.title.toString())
                                ],
                              ),
                            ),
                          );
                        })),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(
                          //   AppString.fbUrl,
                          //   style: TextStyle(
                          //       color: AppColors.primaryColor,
                          //       fontSize: 18,
                          //       overflow: TextOverflow.ellipsis,
                          //       fontFamily: 'TiroBangla-Italic',
                          //       fontWeight: FontWeight.normal),
                          // ),

                          InkWell(
                            onTap: () => launch(AppUrl.fbUrl),
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1, color: AppColors.primaryColor)),
                              child: Image.asset(
                                'assets/images/fb_page.jpeg',
                                width: 145,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
