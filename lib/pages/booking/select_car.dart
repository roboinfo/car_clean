import 'package:car_clean/constant/constant.dart';
import 'package:car_clean/pages/screens.dart';
import 'package:car_clean/widget/column_builder.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SelectCar extends StatefulWidget {
  @override
  _SelectCarState createState() => _SelectCarState();
}

class _SelectCarState extends State<SelectCar> {
  String selectedCar = 'BMW X7';
  final carList = [
    {
      'name': 'BMW X7',
      'image': 'assets/bmw-x7.jpg',
    },
    {
      'name': 'Mercedes Benz S Class',
      'image': 'assets/mercedes-s-class.jpg',
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
          'Select Car',
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
                child: SelectDateTime(),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 50.0,
            color: primaryColor,
            alignment: Alignment.center,
            child: Text(
              'Continue',
              style: white18BoldTextStyle,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColumnBuilder(
                itemCount: carList.length,
                itemBuilder: (context, index) {
                  final item = carList[index];
                  return Padding(
                    padding: (index == carList.length - 1)
                        ? EdgeInsets.all(fixPadding * 2.0)
                        : EdgeInsets.fromLTRB(fixPadding * 2.0,
                            fixPadding * 2.0, fixPadding * 2.0, 0.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: () {
                        setState(() {
                          selectedCar = item['name'];
                        });
                      },
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
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                                image: DecorationImage(
                                  image: AssetImage(item['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            widthSpace,
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    item['name'],
                                    style: black16MediumTextStyle,
                                  ),
                                  (selectedCar == item['name'])
                                      ? Container(
                                          width: 24.0,
                                          height: 24.0,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            color: primaryColor,
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            color: whiteColor,
                                            size: 16.0,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    fixPadding * 2.0, 0.0, fixPadding * 2.0, fixPadding * 2.0),
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
