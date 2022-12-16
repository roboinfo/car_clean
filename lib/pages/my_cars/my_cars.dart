import 'package:car_clean/constant/constant.dart';
import 'package:car_clean/pages/screens.dart';
import 'package:car_clean/widget/column_builder.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyCars extends StatefulWidget {
  @override
  _MyCarsState createState() => _MyCarsState();
}

class _MyCarsState extends State<MyCars> {
  final carList = [
    {'image': 'assets/bmw-x7.jpg', 'name': 'BMW X7', 'number': 'ABC 007'},
    {
      'image': 'assets/mercedes-s-class.jpg',
      'name': 'Mercedes Benz S Class',
      'number': 'ABC 007'
    }
  ];

  deleteCarDialog(index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        double width = MediaQuery.of(context).size.width;
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Are you sure delete this car?',
                      style: black16BoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: (width - fixPadding * 14.0) / 2,
                            padding: EdgeInsets.symmetric(vertical: fixPadding),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 1.0,
                                color: blackColor,
                              ),
                              color: whiteColor,
                            ),
                            child: Text(
                              'Cancel',
                              style: black16MediumTextStyle,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              carList.removeAt(index);
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: (width - fixPadding * 14.0) / 2,
                            padding: EdgeInsets.symmetric(vertical: fixPadding),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: primaryColor,
                            ),
                            child: Text(
                              'Delete',
                              style: white16MediumTextStyle,
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'My Cars',
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
          (carList.length == 0)
              ? Container(
                  width: double.infinity,
                  height: 160.0,
                  alignment: Alignment.center,
                  child: Text(
                    'No Cars available.',
                    style: grey16BoldTextStyle,
                  ),
                )
              : carListData(),
          addNewCar(),
        ],
      ),
    );
  }

  carListData() {
    return ColumnBuilder(
      itemCount: carList.length,
      itemBuilder: (context, index) {
        final item = carList[index];
        return Padding(
          padding: EdgeInsets.fromLTRB(
              fixPadding * 2.0, fixPadding * 2.0, fixPadding * 2.0, 0.0),
          child: Container(
            padding: EdgeInsets.all(fixPadding),
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
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(item['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                widthSpace,
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: black16BoldTextStyle,
                            ),
                            heightSpace,
                            Text(
                              item['number'],
                              style: grey16MediumTextStyle,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => deleteCarDialog(index),
                        child: Icon(
                          Icons.delete_forever,
                          color: primaryColor,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  addNewCar() {
    return Padding(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: AddNewCar(),
            ),
          );
        },
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(10.0),
          strokeWidth: 1.2,
          color: blackColor,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(fixPadding * 2.0),
              color: whiteColor,
              alignment: Alignment.center,
              child: Text(
                'Add new car',
                style: black16BoldTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
