import 'package:flutter/material.dart';

import '../style/color.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? hintText;
  final bool? isSecured;
  final Widget? suffixIcon;
  final bool? isRequired;
  final bool? isLogin;
  final bool? enabled;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.keyboardType,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.isSecured,
    this.isRequired,
    this.isLogin,
    this.enabled,
    this.validator,
    // this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontFamily: 'TiroBangla-Italic',
        ),
        controller: controller,
        cursorColor: Colors.black.withOpacity(0.5),
        cursorRadius: const Radius.circular(10),
        keyboardType: keyboardType,
        obscureText: isSecured ?? false,
        validator: validator,
        // onChanged: (value) => ,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.black.withOpacity(0.5),
          labelStyle: const TextStyle(
              // color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.normal,
              fontSize: 13,
              fontFamily: 'TiroBangla-Italic'),
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.normal,
              fontSize: 13,
              fontFamily: 'TiroBangla-Italic'),
          labelText: labelText,
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 0.0),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.primaryColor, width: 0.9),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.5), width: 0.9),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.primaryColor, width: 0.9),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.green.withOpacity(0.5), width: 0.9),
          ),
        ),
      ),
    );
  }
}
