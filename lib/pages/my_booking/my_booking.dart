import 'package:car_clean/constant/constant.dart';
import 'package:car_clean/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyBooking extends StatefulWidget {
  @override
  _MyBookingState createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  final bookingList = [
    {
      'image': 'assets/service_provider/provider_1.jpg',
      'providerName': 'Perfect Car Wash Services',
      'address': '105, Apple Square, New york',
      'car': 'BMW X7',
      'dateTime': '10:00 AM, 20 Feb 2021',
      'services': 'Interier Cleaning, Engine Detailing',
      'status': 'uncomplete'
    },
    {
      'image': 'assets/service_provider/provider_2.jpg',
      'providerName': 'Quicky Car Wash Services',
      'address': '115, Opera Hub, New york',
      'car': 'Mercedes E Class',
      'dateTime': '04:00 PM, 30 March 2021',
      'services': 'Body Wash',
      'status': 'complete'
    },
    {
      'image': 'assets/service_provider/provider_3.jpg',
      'providerName': 'Speedy Car Services',
      'address': 'G-8, My Honest Hub, New york',
      'car': 'Volvo S90',
      'dateTime': '02:00 PM,  02 April 2021',
      'services': 'Body Wash, Interier Cleaning',
      'status': 'uncomplete'
    }
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
          'My Booking',
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
      body: ListView.builder(
        itemCount: bookingList.length,
        itemBuilder: (context, index) {
          final item = bookingList[index];
          return Padding(
            padding: (index == bookingList.length - 1)
                ? EdgeInsets.all(fixPadding * 2.0)
                : EdgeInsets.fromLTRB(
                    fixPadding * 2.0,
                    fixPadding * 2.0,
                    fixPadding * 2.0,
                    0.0,
                  ),
            child: Container(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.0),
                    ),
                    child: Image.asset(
                      item['image'],
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(fixPadding * 2.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['providerName'],
                          style: black18BoldTextStyle,
                        ),
                        height5Space,
                        Text(
                          item['address'],
                          style: grey12MediumTextStyle,
                        ),
                        heightSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Car:',
                              style: black14BoldTextStyle,
                            ),
                            width5Space,
                            Text(
                              item['car'],
                              style: black14RegularTextStyle,
                            ),
                          ],
                        ),
                        heightSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date & Time:',
                              style: black14BoldTextStyle,
                            ),
                            width5Space,
                            Text(
                              item['dateTime'],
                              style: black14RegularTextStyle,
                            ),
                          ],
                        ),
                        heightSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Services:',
                              style: black14BoldTextStyle,
                            ),
                            width5Space,
                            Expanded(
                              child: Text(
                                item['services'],
                                style: black14RegularTextStyle,
                              ),
                            ),
                          ],
                        ),
                        heightSpace,
                        heightSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                if (item['status'] == 'complete') {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: RateProvider(),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: BookingDetails(),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.fromLTRB(fixPadding * 1.5,
                                    7.0, fixPadding * 1.5, 7.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: whiteColor,
                                  border: Border.all(
                                    width: 1.0,
                                    color: primaryColor,
                                  ),
                                ),
                                child: Text(
                                  (item['status'] == 'complete')
                                      ? 'Rate Now'
                                      : 'More Details',
                                  style: black14MediumTextStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
