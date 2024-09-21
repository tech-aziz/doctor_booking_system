import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res/components/custom_button.dart';
import '../../../res/components/custom_edit_button.dart';
import '../../../res/style/app_string.dart';
import '../../../res/style/color.dart';
import '../../home/controller/language_controller.dart';


class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});



  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  LanguageController languageController = Get.find();
  late String imagePath;

  @override
  void initState() {
    super.initState();
    // Default image path or placeholder image
    imagePath = 'assets/images/driver.jpg';
  }

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Log Out",
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'TiroBangla-Italic',
        ),
      ),
      content: const Text("Do you want to exit app?"),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () async {
                  Timer(const Duration(seconds: 1), () {
                    // MySharedPref.logout();
                  });
                },
                child: customButton(
                    textColor: Colors.black,
                    btnName: 'Yes',
                    borderColor: Colors.black.withOpacity(.1),
                    color: Colors.white60,
                    context: context,
                    border: Border.all(
                        width: 1, color: Colors.black.withOpacity(0.5))),
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
                        width: 1, color: Colors.black.withOpacity(0.5))),
              ),
            ),
          ],
        )
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          languageController.isEnglish.value
              ? AppString.profileEn
              : AppString.profileBn,
          style: const TextStyle(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
              fontFamily: 'TiroBangla-Italic',
              fontWeight: FontWeight.normal),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),

              Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 110,
                    width: 110,
                    decoration: const BoxDecoration(
                      // color: Colors.grey.withOpacity(0.1),
                      // borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage('assets/images/driver.jpg'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Positioned(
                    right: 0,
                      bottom: 8,
                      child: customEditButton(context),)
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              // InkWell(
              //   onTap: () {
              //     // Get.to(()=> const LoginView());
              //   },
              //   child: Container(
              //       width: 60,
              //       padding: const EdgeInsets.all(5),
              //       alignment: Alignment.center,
              //       decoration: BoxDecoration(
              //         color: Colors.grey.withOpacity(0.1),
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //       child: Text(
              //         'Login',
              //         textAlign: TextAlign.center,
              //         style: GoogleFonts.playfairDisplay(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 12,
              //             color: AppColors.primaryColor),
              //       )),
              // ),
              // const SizedBox(
              //   height: 35,
              // ),
              Container(
                padding: EdgeInsets.zero,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        print('personal details clicked');
                      },
                      leading: Image.asset(
                        'assets/images/personal_details.png',
                        color: Colors.grey,
                        width: 22,
                      ),
                      title: Text(
                        languageController.isEnglish.value
                            ? AppString.personalDetailsEn
                            : AppString.personalDetailsBn,
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey,
                        size: 19,
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Colors.white,
                      thickness: 1,
                    ),
                    ListTile(
                      onTap: () {
                        print('Location details clicked');
                      },
                      leading: Image.asset('assets/images/location.png',
                          color: Colors.grey, width: 22),
                      title: Text(
                        languageController.isEnglish.value
                            ? AppString.myLocationEn
                            : AppString.myLocationBn,
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey,
                        size: 19,
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Colors.white,
                      thickness: 1,
                    ),
                    ListTile(
                      onTap: () {
                        print('Vehicles clicked');
                      },
                      leading: Image.asset('assets/images/car.png',
                          color: Colors.grey, width: 22),
                      title: Text(
                        languageController.isEnglish.value
                            ? AppString.myVehiclesEn
                            : AppString.myVehiclesBn,
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey,
                        size: 19,
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Colors.white,
                      thickness: 1,
                    ),
                    ListTile(
                      onTap: () {
                        print('Order clicked');
                      },
                      leading: Image.asset('assets/images/order.png',
                          color: Colors.grey, width: 22),
                      title: Text(
                        languageController.isEnglish.value
                            ? AppString.myOrderEn
                            : AppString.myOrderBn,
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey,
                        size: 19,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        print('Wallet clicked');
                      },
                      leading: Image.asset('assets/images/wallet.png',
                          color: Colors.grey, width: 22),
                      title: Text(
                        languageController.isEnglish.value
                            ? AppString.myWalletEn
                            : AppString.myWalletBn,
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey,
                        size: 19,
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Colors.white,
                      thickness: 1,
                    ),
                    ListTile(
                      onTap: () {
                        print('Account settings clicked');
                      },
                      leading: Image.asset('assets/images/setting.png',
                          color: Colors.grey, width: 22),
                      title: Text(
                        languageController.isEnglish.value
                            ? AppString.accountSettingEn
                            : AppString.accountSettingBn,
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey,
                        size: 19,
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Colors.white,
                      thickness: 1,
                    ),
                    ListTile(
                      onTap: () {
                        print('Language clicked');
                      },
                      leading: SvgPicture.asset('assets/images/language.svg',
                          color: Colors.grey, width: 22),
                      title: Text(
                        languageController.isEnglish.value
                            ? AppString.languageEn
                            : AppString.languageBn,
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey,
                        size: 19,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        print('Terms and conditions clicked');
                      },
                      leading: Image.asset('assets/images/terms.png',
                          color: Colors.grey, width: 22),
                      title: Text(
                        languageController.isEnglish.value
                            ? AppString.termsAndConditionEn
                            : AppString.termsAndConditionBn,
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey,
                        size: 19,
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Colors.white,
                      thickness: 1,
                    ),
                    ListTile(
                      onTap: () {
                        print('call us clicked');
                      },
                      leading: Image.asset('assets/images/call.png',
                          color: Colors.grey, width: 22),
                      title: Text(
                        languageController.isEnglish.value
                            ? AppString.callUsEn
                            : AppString.callUsBn,
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Colors.white,
                      thickness: 1,
                    ),
                    ListTile(
                      onTap: () => showAlertDialog(context),
                      leading: Image.asset('assets/images/sign-out.png',
                          color: Colors.grey, width: 22),
                      title: Text(
                        languageController.isEnglish.value
                            ? AppString.signOutEn
                            : AppString.signOutBn,
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'v1.0.0',
                    style: TextStyle(color: Colors.grey),
                  )),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
