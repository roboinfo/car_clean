import 'package:car_clean/constant/constant.dart';
import 'package:car_clean/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'Profile',
          style: appBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: blackColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: EditProfile(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 30.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                    image: AssetImage('assets/user.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              heightSpace,
              Text(
                'Roboinfocom Pvt Ltd',
                style: black18BoldTextStyle,
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Phone number',
                  style: black16BoldTextStyle,
                ),
                heightSpace,
                Text(
                  '7756955502',
                  style: grey14MediumTextStyle,
                ),
                height5Space,
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: greyColor.withOpacity(0.7),
                ),
                heightSpace,
                heightSpace,
                Text(
                  'Email',
                  style: black16BoldTextStyle,
                ),
                heightSpace,
                Text(
                  'info@roboinfocom.com',
                  style: grey14MediumTextStyle,
                ),
                height5Space,
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: greyColor.withOpacity(0.7),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
