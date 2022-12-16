import 'package:car_clean/constant/constant.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'Privacy Policy',
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
          heightSpace,
          heightSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas aenean scelerisque egestas turpis suspendisse arcu eu. Vitae malesuada ac et arcu, luctus condimentum nec. Egestas adipiscing et, euismod elementum cras. Risus, est ullamcorper urna vel consequat, quis at.',
              style: black14RegularTextStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          heightSpace,
          heightSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas aenean scelerisque egestas turpis suspendisse arcu eu. Vitae malesuada ac et arcu, luctus condimentum nec. Egestas adipiscing et, euismod elementum cras. Risus, est ullamcorper urna vel consequat, quis at.',
              style: black14RegularTextStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          heightSpace,
          heightSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas aenean scelerisque egestas turpis suspendisse arcu eu. Vitae malesuada ac et arcu, luctus condimentum nec. Egestas adipiscing et, euismod elementum cras. Risus, est ullamcorper urna vel consequat, quis at.',
              style: black14RegularTextStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }
}
