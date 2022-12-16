import 'package:car_clean/constant/constant.dart';
import 'package:car_clean/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'Settings',
          style: appBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: black14RegularTextStyle,
                ),
                SizedBox(height: 10.0),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: PrivacyPolicy()));
                  },
                  child: settingTile('Privacy policy'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: TermsOfUse()));
                  },
                  child: settingTile('Terms of use'),
                ),
                SizedBox(height: 30.0),
                Text(
                  'App',
                  style: black14RegularTextStyle,
                ),
                SizedBox(height: 10.0),
                InkWell(
                  onTap: () {},
                  child: settingTile('Support'),
                ),
                InkWell(
                  onTap: () {},
                  child: settingTile('Report a bug'),
                ),
                InkWell(
                  onTap: () {},
                  child: settingTile('App version 1.0'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  settingTile(title) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: black16MediumTextStyle,
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 24.0,
                color: blackColor,
              ),
            ],
          ),
          heightSpace,
          Container(
            width: double.infinity,
            height: 1.0,
            color: greyColor.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
