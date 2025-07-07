import 'package:flutter/material.dart';

class UiHelper {
  static ElButton(
      {required String buttontext,
      required VoidCallback callback,
      required Color buttoncolor,
      double? height,
      double? width}) {
    return SizedBox(
      height: height ?? 56,
      width: width ?? 300,
      child: ElevatedButton(
          onPressed: callback,
          style: ElevatedButton.styleFrom(
              backgroundColor: buttoncolor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
          child: Text(
            buttontext,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.black,
            ),
          )),
    );
  }

  static UiText({
    required String data,
    required double textsize,
    required FontWeight textweight,
    Color? textcolor,
  }) {
    return Text(
      data,
      style: TextStyle(
          fontSize: textsize,
          fontWeight: textweight,
          color: textcolor ?? Colors.black,
          fontFamily: 'Manrope'),
    );
  }
}
