import 'package:car_clean/constant/constant.dart';
import 'package:car_clean/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyAddress extends StatefulWidget {
  @override
  _MyAddressState createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  final addressList = [
    {'type': 'home', 'address': '121, Yogi Villa, Opera Street, New York.'},
    {'type': 'work', 'address': '121, Yogi Villa, Opera Street, New York.'},
    {'type': 'other', 'address': '121, Yogi Villa, Opera Street, New York.'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'My Address',
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
      bottomNavigationBar: Material(
        elevation: 1.0,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: AddNewAddress(),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 50.0,
            color: primaryColor,
            alignment: Alignment.center,
            child: Text(
              'Add new address',
              style: white18BoldTextStyle,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: addressList.length,
        itemBuilder: (context, index) {
          final item = addressList[index];
          return Padding(
            padding: (index == addressList.length - 1)
                ? EdgeInsets.all(fixPadding * 2.0)
                : EdgeInsets.fromLTRB(
                    fixPadding * 2.0, fixPadding * 2.0, fixPadding * 2.0, 0.0),
            child: Container(
              padding: EdgeInsets.all(fixPadding * 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                    color: blackColor.withOpacity(0.25),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60.0,
                    width: 60.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: greyColor.withOpacity(0.4),
                    ),
                    child: Icon(
                      (item['type'] == 'home')
                          ? Icons.home
                          : (item['type'] == 'work')
                              ? Icons.work
                              : Icons.language,
                      size: 30.0,
                      color: primaryColor,
                    ),
                  ),
                  widthSpace,
                  Expanded(
                    child: Text(
                      item['address'],
                      style: black14MediumTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
