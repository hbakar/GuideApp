import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rehberapp/components/alerts/MyAlertBasic.dart';
import 'package:rehberapp/utils/constant.dart';

void verticalScreenSupport() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

hideKeyBoard() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}

showAlertBasic(
    BuildContext context, String title, String description, Function fnc) {
  showDialog(
      context: context,
      builder: (_) => MyAlertBasic(
            title,
            description,
            fnc,
          ));
}

bool isEmailValid(String email) {
  return RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email)
      ? true
      : false;
}

Padding leftAlignText({text, leftPadding, textColor, fontSize, fontWeight}) {
  return Padding(
    padding: EdgeInsets.only(left: leftPadding),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(text,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: kFontFamilyPoppins,
              fontSize: fontSize,
              fontWeight: fontWeight ?? FontWeight.w500,
              color: textColor)),
    ),
  );
}

Padding rightAlignText({text, rightPadding, textColor, fontSize, fontWeight}) {
  return Padding(
    padding: EdgeInsets.only(right: rightPadding),
    child: Align(
      alignment: Alignment.centerRight,
      child: Text(text,
          textAlign: TextAlign.right,
          style: TextStyle(
              fontFamily: 'Museo',
              fontSize: fontSize,
              fontWeight: fontWeight ?? FontWeight.w500,
              color: textColor)),
    ),
  );
}
