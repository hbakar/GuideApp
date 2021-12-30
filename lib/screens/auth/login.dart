import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rehberapp/utils/constant.dart';
import 'package:rehberapp/utils/size_config.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final txtUserName = TextEditingController();
  final txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: kWhiteColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 42.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Devam etmek için",
                  textAlign: TextAlign.left,
                  style: new TextStyle(
                      color: kGreyColor,
                      fontFamily: kFontFamilyPoppins,
                      fontSize: 12.0),
                ),
              ),
              Text(
                "Giriş yap",
                textAlign: TextAlign.left,
              ),
              Form(
                key: null,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: txtUserName,
                      cursorColor: kPrimaryColor,
                      maxLength: 50,
                    ),
                    TextFormField(
                      controller: txtUserName,
                      cursorColor: kPrimaryColor,
                      maxLength: 50,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kPrimaryColor),

                          //  textStyle: MaterialStateProperty.all(kWhiteColor),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Giriş yap",
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontFamily: kFontFamilyPoppins,
                                  fontSize: getProportionateScreenWidth(13.0),
                                  letterSpacing: 1.1),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(11.0),
                            ),
                            SvgPicture.asset(
                              'assets/icons/sagOk.svg',
                              color: kWhiteColor,
                            )
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
