import 'package:flutter/material.dart';
import 'package:rehberapp/utils/constant.dart';
import 'package:rehberapp/utils/size_config.dart';

class MyAlertBasic extends StatefulWidget {
  final String title;
  final String description;
  final Function fncOk;

  const MyAlertBasic(this.title, this.description, this.fncOk, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAlertOkState();
}

class MyAlertOkState extends State<MyAlertBasic>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Center(
              child: ScaleTransition(
                  scale: scaleAnimation!,
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.42,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.cancel_outlined),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Text(
                                widget.title,
                                style: headerTextStyle,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  widget.description,
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 13,
                                      fontFamily: "CircularStdBook"),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: getProportionateScreenHeight(50.0)),
                              ),
                              MyOkButton(() => widget.fncOk(), "Tamam"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}

class MyOkButton extends StatelessWidget {
  final Function func;
  final String text;

  const MyOkButton(this.func, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var elementWidth = (SizeConfig.screenWidth! / 2) * 1.15;

    return MaterialButton(
      height: getProportionateScreenHeight(44.0),
      minWidth: elementWidth,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
      color: kButtonColor,
      elevation: 5,
      onPressed: () => func(),
      child: Text(
        this.text,
        style: TextStyle(
            color: Colors.white, fontSize: 13, fontFamily: "CircularStdBook"),
      ),
    );
  }
}
