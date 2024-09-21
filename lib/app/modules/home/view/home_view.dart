import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import '../../../res/style/color.dart';
import '../controller/language_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  LanguageController languageController = Get.find();
  bool switchValue = false;
  bool isEnglish = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Text(
            'Dr. Md. Joynal Abdin',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            constraints: const BoxConstraints(),
            icon: Image.asset(
              'assets/images/menu.png',
              width: 26,
            ),
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlutterSwitch(
                  height: 25.0,
                  width: 40.0,
                  padding: 1.0,
                  toggleSize: 24.0,
                  borderRadius: 25.0,
                  activeColor: Colors.white10,
                  value: languageController.isEnglish.value,
                  onToggle: (value) {
                    languageController.toggleLanguage(value);
                  },
                ),
                const SizedBox(
                  width: 6,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    languageController.isEnglish.value ? 'En' : 'Bn',
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'TiroBangla-Italic',
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Home Screen'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
