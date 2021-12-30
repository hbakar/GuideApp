import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rehberapp/utils/constant.dart';
import 'package:rehberapp/utils/size_config.dart';

class LocationsPage extends StatefulWidget {
  @override
  _LocationsPageState createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
        child: Scaffold(
      appBar: buildAppBar(),
      body: buildListView(),
    ));
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/backArrow.svg',
          color: kBlackColor,
          width: getProportionateScreenWidth(10.0),
          height: 17,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        "Yerler",
        style: navSecondaryTextStyle,
      ),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }

  ListView buildListView() {
    return ListView(children: [
      buildListile(),
      buildListile(),
      buildListile(),
    ]);
  }

  ListTile buildListile() {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: CachedNetworkImage(
          imageUrl: 'https://picsum.photos/96/96',
          width: getProportionateScreenWidth(96.0),
          height: getProportionateScreenHeight(96.0),
        ),
      ),
      title: Text(
        "Ertuğrul Gazi Türbesi ",
        style: listHeaderTextStyle,
      ),
      subtitle: Text(
        "Ertuğrul Gazi veya Ertuğrul Bey, 13. yüzyılın ortalarınd...",
        style: listSubtitleTextStyle,
      ),
      trailing: Wrap(
        spacing: getProportionateScreenHeight(20.0),
        direction: Axis.vertical,
        children: [
          SvgPicture.asset('assets/icons/openIcon.svg'),
          SvgPicture.asset(
            'assets/icons/rightArrow.svg',
            width: getProportionateScreenWidth(24.0),
            height: getProportionateScreenHeight(24.0),
          )
        ],
      ),
    );
  }
}
