import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../style/color.dart';
import 'custom_text_widget.dart';
import 'custom_toast.dart';
Widget customEditButton(context) {
  return InkWell(
    onTap: () {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 125,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        final pickedFile = await ImagePicker()
                            .pickImage(source: ImageSource.camera);
                        if (pickedFile != null) {
                          customToast(msg: 'ছবি আপলোড সফল হয়েছে');
                        }
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                width: 1,
                                color: Colors.black.withOpacity(0.5))),
                        child: DecoratedBox(
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/icons/camera.png'),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    displayMedium(
                      text: 'Camera',
                      color: Colors.black,
                      fontSize: 18,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        final pickedFile = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (pickedFile != null) {
                          customToast(msg: 'ছবি আপলোড সফল হয়েছে');
                        }

                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                width: 1,
                                color: Colors.black.withOpacity(0.5))),
                        child: DecoratedBox(
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/icons/gallery.png'),
                          ),
                        ),
                      ),
                    ),
                    // const CircleAvatar(
                    //     radius: 35,
                    //     backgroundImage: AssetImage('assets/icons/gallery.png',)),
                    const SizedBox(
                      height: 5,
                    ),
                    displayMedium(
                      text: 'Gallery',
                      color: Colors.black,
                      fontSize: 18,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
    child: Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white60,
        border: Border.all(color: AppColors.primaryColor, width: 1.5),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.edit,
        color: AppColors.primaryColor,
        size: 18,
      ),
    ),
  );
}
