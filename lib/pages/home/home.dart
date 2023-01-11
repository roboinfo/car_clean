import 'dart:io';

import 'package:car_clean/constant/constant.dart';
import 'package:car_clean/pages/auth/loginscreen.dart';
import 'package:car_clean/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime currentBackPressTime;
  final serviceProviderList = [
    {
      'name': 'Perfect Wash Services',
      'address': '108, Yogi Point, New York.',
      'locationLat': 48.866483,
      'locationLang': 2.362437,
      'image': 'assets/service_provider/provider_1.jpg',
      'cost': '50',
      'rating': '4.5',
      'distance': '3.5 km',
      'heroTag': 'hero_1'
    },
    {
      'name': 'Perfect Wash Services',
      'address': '108, Yogi Point, New York.',
      'locationLat': 48.863682,
      'locationLang': 2.360077,
      'image': 'assets/service_provider/provider_1.jpg',
      'cost': '50',
      'rating': '4.5',
      'distance': '3.5 km',
      'heroTag': 'hero_2'
    },
    {
      'name': 'Perfect Wash Services',
      'address': '108, Yogi Point, New York.',
      'locationLat': 48.855418,
      'locationLang': 2.292332,
      'image': 'assets/service_provider/provider_1.jpg',
      'cost': '50',
      'rating': '4.5',
      'distance': '3.5 km',
      'heroTag': 'hero_3'
    },
    {
      'name': 'Perfect Wash Services',
      'address': '108, Yogi Point, New York.',
      'locationLat': 48.883499,
      'locationLang': 2.325640,
      'image': 'assets/service_provider/provider_1.jpg',
      'cost': '50',
      'rating': '4.5',
      'distance': '3.5 km',
      'heroTag': 'hero_4'
    },
    {
      'name': 'Perfect Wash Services',
      'address': '108, Yogi Point, New York.',
      'locationLat': 48.850444,
      'locationLang': 2.283868,
      'image': 'assets/service_provider/provider_1.jpg',
      'cost': '50',
      'rating': '4.5',
      'distance': '3.5 km',
      'heroTag': 'hero_5'
    },
    {
      'name': 'Perfect Wash Services',
      'address': '108, Yogi Point, New York.',
      'locationLat': 48.863755,
      'locationLang': 2.293532,
      'image': 'assets/service_provider/provider_1.jpg',
      'cost': '50',
      'rating': '4.5',
      'distance': '3.5 km',
      'heroTag': 'hero_6'
    },
    {
      'name': 'Perfect Wash Services',
      'address': '108, Yogi Point, New York.',
      'locationLat': 48.871619,
      'locationLang': 2.315213,
      'image': 'assets/service_provider/provider_1.jpg',
      'cost': '50',
      'rating': '4.5',
      'distance': '3.5 km',
      'heroTag': 'hero_7'
    },
    {
      'name': 'Perfect Wash Services',
      'address': '108, Yogi Point, New York.',
      'locationLat': 48.865037,
      'locationLang': 2.332377,
      'image': 'assets/service_provider/provider_1.jpg',
      'cost': '50',
      'rating': '4.5',
      'distance': '3.5 km',
      'heroTag': 'hero_8'
    }
  ];

  GoogleMapController _controller;

  List<Marker> allMarkers = [];

  PageController _pageController;

  int prevPage;

  @override
  void initState() {
    super.initState();
    serviceProviderList.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element['name']),
          draggable: false,
          infoWindow:
              InfoWindow(title: element['name'], snippet: element['address']),
          position: LatLng(element['locationLat'], element['locationLang'])));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _serviceProviderFinalList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 185.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 600),
              child: ServiceProvider(
                heroTag: serviceProviderList[index]['heroTag'],
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                height: 175.0,
                width: 275.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      ),
                    ]),
                child: Container(
                  padding: EdgeInsets.all(fixPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: serviceProviderList[index]['heroTag'],
                            child: Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: DecorationImage(
                                    image: AssetImage(
                                        serviceProviderList[index]['image']),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          widthSpace,
                          Container(
                            width: 275.0 - 60.0 - 10.0 - 28.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  serviceProviderList[index]['name'],
                                  style: black14BoldTextStyle,
                                ),
                                height5Space,
                                Text(
                                  serviceProviderList[index]['address'],
                                  style: grey12RegularTextStyle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                height5Space,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      serviceProviderList[index]['rating'],
                                      style: black12RegularTextStyle,
                                    ),
                                    width5Space,
                                    Icon(
                                      Icons.star,
                                      size: 16.0,
                                      color: Colors.lime,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Distance',
                                style: grey12RegularTextStyle,
                              ),
                              height5Space,
                              Text(
                                serviceProviderList[index]['distance'],
                                style: black14BoldTextStyle,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Cost',
                                style: grey12RegularTextStyle,
                              ),
                              height5Space,
                              Text(
                                serviceProviderList[index]['cost'],
                                style: black14BoldTextStyle,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                fixPadding, 5.0, fixPadding, 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 1.0,
                                color: primaryColor,
                              ),
                            ),
                            child: Text(
                              'Book now',
                              style: black12RegularTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  logoutDialog() {
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
                      'Are you sure want to logout?',
                      style: black14BoldTextStyle,
                      textAlign: TextAlign.center,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
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
                              'Logout',
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
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          'CarSpa',
          style: appBarTextStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: blackColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Notifications(),
                ),
              );
            },
          ),
        ],
      ),
      body: WillPopScope(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(serviceProviderList[0]['locationLat'],
                        serviceProviderList[0]['locationLang']),
                    zoom: 12.0),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
                zoomControlsEnabled: false,
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: serviceProviderList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _serviceProviderFinalList(index);
                  },
                ),
              ),
            )
          ],
        ),
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(
            serviceProviderList[_pageController.page.toInt()]['locationLat'],
            serviceProviderList[_pageController.page.toInt()]['locationLang']),
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }

  Drawer drawer() {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            heightSpace,
            heightSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                      image: AssetImage('assets/user.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                height5Space,
                Text(
                  'Roboinfocom Pvt Ltd',
                  style: black14RegularTextStyle,
                ),
                height5Space,
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                  child: Text(
                    'View Profile',
                    style: grey12MediumItalicTextStyle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.0),
            ListTile(
              onTap: () => Navigator.pop(context),
              leading: Icon(
                Icons.home,
                color: blackColor,
              ),
              title: Text(
                'Home',
                style: black14RegularTextStyle,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyBooking(),
                  ),
                );
              },
              leading: Icon(
                Icons.security,
                color: blackColor,
              ),
              title: Text(
                'My Booking',
                style: black14RegularTextStyle,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyCars(),
                  ),
                );
              },
              leading: Icon(
                Icons.directions_car,
                color: blackColor,
              ),
              title: Text(
                'My Cars',
                style: black14RegularTextStyle,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Favorites(),
                  ),
                );
              },
              leading: Icon(
                Icons.favorite,
                color: blackColor,
              ),
              title: Text(
                'Favorites',
                style: black14RegularTextStyle,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAddress(),
                  ),
                );
              },
              leading: Icon(
                Icons.location_on,
                color: blackColor,
              ),
              title: Text(
                'My Address',
                style: black14RegularTextStyle,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUs(),
                  ),
                );
              },
              leading: Icon(
                Icons.email,
                color: blackColor,
              ),
              title: Text(
                'Contact us',
                style: black14RegularTextStyle,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Settings(),
                  ),
                );
              },
              leading: Icon(
                Icons.settings,
                color: blackColor,
              ),
              title: Text(
                'Settings',
                style: black14RegularTextStyle,
              ),
            ),
            ListTile(
              onTap: () => logoutDialog(),
              leading: Icon(
                Icons.exit_to_app,
                color: primaryColor,
              ),
              title: Text(
                'Logout',
                style: primaryColor14RegularTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
