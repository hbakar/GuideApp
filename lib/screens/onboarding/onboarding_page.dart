import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rehberapp/models/onboardingContent.dart';
import 'package:rehberapp/screens/home/home.dart';
import 'package:rehberapp/screens/locations/locations.dart';
import 'package:rehberapp/utils/constant.dart';
import 'package:rehberapp/utils/size_config.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late PageController _controller;

  late AnimationController animationController;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        /*
        Future.delayed(
          const Duration(milliseconds: 500),
        );
*/
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LocationsPage()));
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: contents.length,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, i) {
              return Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Lottie.asset(contents[i].image,
                        height: getProportionateScreenHeight(300.0),
                        animate: true),
                    Text(
                      contents[i].title,
                      style: onboardHeaderTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20.0),
                    ),
                    Text(
                      contents[i].description,
                      style: onboardTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  contents.length, (index) => buildDot(index, context))),
        ),
        Container(
            height: getProportionateScreenHeight(55.0),
            margin: const EdgeInsets.all(40.0),
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: getProportionateScreenWidth(10),
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      textStyle: MaterialStateProperty.all(onboardButtonStyle)),
                  child: const Text("Önceki"),
                  onPressed: () {
                    _controller.previousPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  },
                ),
                continueButton(context),
              ],
            ))
      ],
    ));
  }

  ElevatedButton continueButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
          textStyle: MaterialStateProperty.all(onboardButtonStyle)),
      child: Text(currentIndex == contents.length - 1 ? "Devam Et" : "İleri"),
      onPressed: () {
        if (currentIndex == contents.length - 1) {
          showDoneDialog();
          //HomePage()));
        }

        _controller.nextPage(
            duration: const Duration(milliseconds: 100),
            curve: Curves.bounceIn);
      },
    );
  }

  void showDoneDialog() => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('assets/images/done.json',
                    repeat: false,
                    controller: animationController, onLoaded: (composition) {
                  animationController.forward();
                }),
                Text(
                  "Haydi Yolculuk Başlasın!",
                  style: onboardTextStyle,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ));

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(10.0),
      width: currentIndex == index
          ? getProportionateScreenWidth(25.0)
          : getProportionateScreenWidth(10.0),
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: kPrimaryColor,
      ),
    );
  }
}
