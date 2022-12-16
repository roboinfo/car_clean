import 'package:car_clean/constant/constant.dart';
import 'package:flutter/material.dart';

class AddNewCar extends StatefulWidget {
  @override
  _AddNewCarState createState() => _AddNewCarState();
}

class _AddNewCarState extends State<AddNewCar> {
  String selectedColor = '';

  final colorList = [
    {'color': Colors.red, 'colorName': 'red'},
    {'color': Colors.blue, 'colorName': 'blue'},
    {'color': Colors.white, 'colorName': 'white'},
    {'color': Colors.grey, 'colorName': 'grey'},
    {'color': Colors.black, 'colorName': 'black'},
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
          'Add New Car',
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
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(50.0),
                onTap: () => _selectOptionBottomSheet(),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                      width: 1.0,
                      color: primaryColor,
                    ),
                  ),
                  child: Icon(
                    Icons.add_a_photo,
                    size: 30.0,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          // Car brand textfield start
          Theme(
            data: Theme.of(context).copyWith(
              primaryColor: primaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
              child: TextField(
                style: black16BoldTextStyle,
                decoration: InputDecoration(
                  hintText: "Enter car brand name",
                  hintStyle: grey16BoldTextStyle,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: primaryColor, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                  ),
                ),
              ),
            ),
          ),
          // car brand textfield end
          heightSpace,
          heightSpace,
          // Car model textfield start
          Theme(
            data: Theme.of(context).copyWith(
              primaryColor: primaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
              child: TextField(
                style: black16BoldTextStyle,
                decoration: InputDecoration(
                  hintText: "Enter car model",
                  hintStyle: grey16BoldTextStyle,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: primaryColor, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                  ),
                ),
              ),
            ),
          ),
          // car model textfield end
          heightSpace,
          heightSpace,
          // Car number textfield start
          Theme(
            data: Theme.of(context).copyWith(
              primaryColor: primaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
              child: TextField(
                style: black16BoldTextStyle,
                decoration: InputDecoration(
                  hintText: "Enter car number",
                  hintStyle: grey16BoldTextStyle,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: primaryColor, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                  ),
                ),
              ),
            ),
          ),
          // car number textfield end

          selectColor(),

          Padding(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(fixPadding * 1.5),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: primaryColor),
                child: Text(
                  'Add Car',
                  style: white18BoldTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  selectColor() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        heightSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'Select color',
            style: black18BoldTextStyle,
          ),
        ),
        heightSpace,
        Container(
          height: 50.0,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: colorList.length,
            itemBuilder: (context, index) {
              final item = colorList[index];
              return Padding(
                padding: (index == colorList.length - 1)
                    ? EdgeInsets.only(
                        left: fixPadding * 2.0, right: fixPadding * 2.0)
                    : EdgeInsets.only(left: fixPadding * 2.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(25.0),
                  onTap: () {
                    setState(() {
                      selectedColor = item['colorName'];
                    });
                  },
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: item['color'],
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                        width: 1.0,
                        color: blackColor,
                      ),
                    ),
                    child: (selectedColor == item['colorName'])
                        ? Icon(
                            Icons.check,
                            color: (item['color'] == Colors.white)
                                ? blackColor
                                : whiteColor,
                          )
                        : Container(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Bottom Sheet for Select Options (Camera or Gallery) Start Here
  void _selectOptionBottomSheet() {
    double width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: whiteColor,
            child: new Wrap(
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.all(fixPadding),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: width,
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Choose Option',
                            textAlign: TextAlign.center,
                            style: black18BoldTextStyle,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: width,
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.camera_alt,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Camera', style: black16MediumTextStyle),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: width,
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.photo_album,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Upload from Gallery',
                                  style: black16MediumTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
  // Bottom Sheet for Select Options (Camera or Gallery) Ends Here
}
