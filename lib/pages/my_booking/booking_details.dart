import 'package:car_clean/constant/constant.dart';
import 'package:flutter/material.dart';

class BookingDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'Booking Details',
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
            Navigator.pop(context);
          },
          child: Container(
            width: double.infinity,
            height: 50.0,
            color: primaryColor,
            alignment: Alignment.center,
            child: Text(
              'Cancel Booking',
              style: white18BoldTextStyle,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          serviceProviderDetails(),
          devider(),
          carDetail(),
          devider(),
          dateTimeDetail(),
          devider(),
          services(),
          devider(),
          totalAmount(),
        ],
      ),
    );
  }

  serviceProviderDetails() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Service Provider Detail',
            style: primaryColor18BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            'Perfect Car Wash Service',
            style: black16MediumTextStyle,
          ),
          height5Space,
          Text(
            '104, Apple Square, New York.',
            style: black14RegularTextStyle,
          ),
        ],
      ),
    );
  }

  carDetail() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Car Detail',
            style: primaryColor18BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Car Model:',
                style: black14BoldTextStyle,
              ),
              width5Space,
              Text(
                'BMW X7',
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
                'Car Number:',
                style: black14BoldTextStyle,
              ),
              width5Space,
              Text(
                'XYZ 007',
                style: black14RegularTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  dateTimeDetail() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date & Time Detail',
            style: primaryColor18BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            '22 Feb, 2021',
            style: black16MediumTextStyle,
          ),
          height5Space,
          Text(
            '10:00 AM',
            style: black14RegularTextStyle,
          ),
        ],
      ),
    );
  }

  services() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Services',
            style: primaryColor18BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Engine Detailing',
                style: black14MediumTextStyle,
              ),
              width5Space,
              Text(
                '\$85',
                style: black14MediumTextStyle,
              ),
            ],
          ),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Body Wash',
                style: black14MediumTextStyle,
              ),
              width5Space,
              Text(
                '\$50',
                style: black14MediumTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  totalAmount() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Total Amount',
            style: black18BoldTextStyle,
          ),
          width5Space,
          Text(
            '\$135',
            style: primaryColor22BoldTextStyle,
          ),
        ],
      ),
    );
  }

  devider() {
    return Container(
      width: double.infinity,
      height: 5.0,
      color: greyColor.withOpacity(0.5),
    );
  }
}
