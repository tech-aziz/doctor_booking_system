import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../res/components/custom_button.dart';
import '../../../res/style/app_string.dart';
import '../../../res/style/color.dart';
import '../../about/view/about_view.dart';
import '../../helpers/launch_dialer_helper.dart';
import '../../more/view/more_view.dart';
import '../../profile/view/profile_view.dart';
import '../controller/language_controller.dart';
import 'home_body_static_view.dart';

class HomeBottomView extends StatefulWidget {
  const HomeBottomView({super.key});

  @override
  State<HomeBottomView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeBottomView> {
  LanguageController languageController = Get.find();

  int currentIndex = 0;
  Color iconColor = Colors.grey;
  final screens = [
    const HomeBodyViewStatic(),
    // const HomeBodyViewStatic(),
    const ProfileDetails(),
    const AboutView(),
    MoreView()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeBodyViewStatic();
  // Widget currentScreen = const HomeBodyViewStatic();

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

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      setState(() {
        iconColor = AppColors.primaryColor;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        body: PageStorage(bucket: bucket, child: screens[currentIndex]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          onPressed: () {
            openDialer('01823-749394');
          },
          child: SvgPicture.asset(
            'assets/images/phone.svg',
            height: 22,
            width: 22,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //left tabBar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = const HomeBottomView();
                            currentIndex = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/home.svg',
                              height: 22,
                              width: 22,
                              color: iconColor,
                            ),
                            Text(
                                languageController.isEnglish.value
                                    ? AppString.homeEn
                                    : AppString.homeBn,
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'TiroBangla-Italic',
                                    fontWeight: FontWeight.normal))
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = const ProfileDetails();
                            currentIndex = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/profile.svg',
                              height: 23,
                              width: 23,
                              color: iconColor,
                            ),
                            Text(
                                languageController.isEnglish.value
                                    ? AppString.bookingEn
                                    : AppString.bookingBn,
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'TiroBangla-Italic',
                                    fontWeight: FontWeight.normal))
                          ],
                        ),
                      ),
                    ],
                  ),
                  //right tabBar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = const AboutView();
                            currentIndex = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/about.svg',
                              height: 23,
                              width: 23,
                              color: iconColor,
                            ),
                            Text(
                              languageController.isEnglish.value
                                  ? AppString.aboutEn
                                  : AppString.aboutBn,
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'TiroBangla-Italic',
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = MoreView();
                            currentIndex = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/more.svg',
                              height: 22,
                              width: 22,
                              color: iconColor,
                            ),
                            Text(
                              languageController.isEnglish.value
                                  ? AppString.profileEn
                                  : AppString.profileBn,
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'TiroBangla-Italic',
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
