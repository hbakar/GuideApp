import 'package:flutter/material.dart';
import 'package:rehberapp/utils/size_config.dart';

const String baseUrl = 'https://reqres.in/api/';

/* COLORS starts */
const kPrimaryColor = Color(0xFFE76B12);
const kSecondaryColor = Color(0xFFFFCCA7);
const kBlackColor = Color(0xFF000000);
const kDarkBlackColor = Color(0xFF353535);
const kWhiteColor = Color(0xFFFFFFFF);
const kGreyColor = Color(0xFF737373);
const kLightGreyColor = Color(0xFFD4D4D4);
const kGreenColor = Color(0xFF56C568);
const kBlueColor = Color(0xFF3FA2F7);
const kRedColor = Color(0xFFEB5757);
const kButtonColor = Color(0xFFE76B12);
/* COLORS ends */

const String kFontFamilyRaleway = "Raleway";
const String kFontFamilyPoppins = "Poppins";

/* TEXT STYLES starts */
final primaryTextStyle = new TextStyle(
    color: kBlackColor,
    fontFamily: kFontFamilyPoppins,
    fontSize: getProportionateScreenWidth(16.0),
    fontWeight: FontWeight.normal);

final secondaryTextStyle = new TextStyle(
    color: kDarkBlackColor,
    fontFamily: kFontFamilyPoppins,
    fontSize: getProportionateScreenWidth(20.0),
    fontWeight: FontWeight.normal);

final headerTextStyle = new TextStyle(
    color: kDarkBlackColor,
    fontFamily: kFontFamilyRaleway,
    fontSize: getProportionateScreenWidth(42.0),
    fontWeight: FontWeight.normal);

final navSecondaryTextStyle = new TextStyle(
    color: kBlackColor,
    fontFamily: kFontFamilyPoppins,
    fontSize: getProportionateScreenWidth(16.0),
    fontWeight: FontWeight.w500);

final listHeaderTextStyle = new TextStyle(
    color: kBlackColor,
    fontFamily: kFontFamilyPoppins,
    fontSize: getProportionateScreenWidth(16.0),
    fontWeight: FontWeight.w500);

final listSubtitleTextStyle = new TextStyle(
    color: kDarkBlackColor,
    fontFamily: kFontFamilyPoppins,
    fontSize: getProportionateScreenWidth(12.0),
    fontWeight: FontWeight.w400);

final onboardHeaderTextStyle = new TextStyle(
  color: kBlackColor,
  fontFamily: kFontFamilyRaleway,
  fontSize: getProportionateScreenWidth(42.0),
  fontWeight: FontWeight.w600,
);

final onboardTextStyle = new TextStyle(
  color: kDarkBlackColor,
  fontFamily: kFontFamilyRaleway,
  fontSize: getProportionateScreenWidth(14.0),
  fontWeight: FontWeight.normal,
);

final onboardButtonStyle = new TextStyle(
  color: kWhiteColor,
  fontFamily: kFontFamilyRaleway,
  fontSize: getProportionateScreenWidth(14.0),
  fontWeight: FontWeight.normal,
);
/* TEXT STYLES ends */

const kLoginGradientColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [kPrimaryColor, kSecondaryColor],
);
