import 'package:car_clean/pages/screens.dart';
import 'package:car_clean/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:car_clean/constant/constant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';

class ServiceProvider extends StatefulWidget {
  final String heroTag;

  const ServiceProvider({Key key, @required this.heroTag}) : super(key: key);
  @override
  _ServiceProviderState createState() => _ServiceProviderState();
}

class _ServiceProviderState extends State<ServiceProvider> {
  Set<Marker> markers;
  bool favorite = false;
  bool services = true, about = false, reviews = false;
  bool bodyWash = true,
      interiorCleaning = false,
      engineDetailing = false,
      lightService = false;
  int total = 0;

  @override
  void initState() {
    super.initState();
    calculateTotal();
    markers = Set.from([]);
  }

  calculateTotal() {
    total = 0;
    if (bodyWash) {
      total = total + 50;
    }
    if (interiorCleaning) {
      total = total + 80;
    }
    if (engineDetailing) {
      total = total + 90;
    }
    if (lightService) {
      total = total + 70;
    }
    setState(() {
      total = total;
    });
  }

  final reviewList = [
    {
      'name': 'Emilli Williamson',
      'image': 'assets/user/user_3.jpg',
      'time': '20 Feb, 2021',
      'rating': 5,
      'review': 'Best Services.'
    },
    {
      'name': 'Ollie Green',
      'image': 'assets/user/user_5.jpg',
      'time': '20 Feb, 2021',
      'rating': 5,
      'review': 'Good.'
    },
    {
      'name': 'John Smith',
      'image': 'assets/user/user_1.jpg',
      'time': '19 Feb, 2021',
      'rating': 4,
      'review': 'Its really good car service center.'
    },
    {
      'name': 'David Johnson',
      'image': 'assets/user/user_8.jpg',
      'time': '18 Feb, 2021',
      'rating': 3,
      'review': 'Decent service.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: (services)
          ? Material(
              elevation: 1.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: SelectCar(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  color: primaryColor,
                  alignment: Alignment.center,
                  child: Text(
                    'Book now (\$$total)',
                    style: white18BoldTextStyle,
                  ),
                ),
              ),
            )
          : Container(
              height: 0.0,
              width: 0.0,
            ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 350.0,
                pinned: true,
                forceElevated: true,
                automaticallyImplyLeading: false,
                backgroundColor: primaryColor,
                elevation: 0.0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      (favorite) ? Icons.favorite : Icons.favorite_border,
                      color: whiteColor,
                    ),
                    onPressed: () {
                      setState(() {
                        favorite = !favorite;
                      });

                      if (favorite) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Added to favorite')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Remove from favorite')));
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.navigation,
                      color: whiteColor,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.call,
                      color: whiteColor,
                    ),
                    onPressed: () {},
                  ),
                ],
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: widget.heroTag,
                    child: Container(
                      width: width,
                      // height: 350.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/service_provider/provider_1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            children: [
              nameAddressReview(),
              serviceAboutReviewsTabs(),
              (services)
                  ? servicesData()
                  : (about)
                      ? aboutData()
                      : reviewsData(),
            ],
          ),
        ),
      ),
    );
  }

  nameAddressReview() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Perfect Wash Services',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          Text(
            '108, Yogi Point, New York',
            style: grey14MediumTextStyle,
          ),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '4.5',
                style: black14RegularTextStyle,
              ),
              width5Space,
              Icon(
                Icons.star,
                color: Colors.lime,
                size: 18.0,
              ),
              width5Space,
              Text(
                '728 Reviews',
                style: black14RegularTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  serviceAboutReviewsTabs() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  if (!services) {
                    setState(() {
                      services = true;
                      about = false;
                      reviews = false;
                    });
                  }
                },
                child: Container(
                  width: (width - 2.0) / 3,
                  height: 40.0,
                  alignment: Alignment.center,
                  color: (services) ? primaryColor : whiteColor,
                  child: Text(
                    'Services',
                    style: (services)
                        ? white14BoldTextStyle
                        : black14BoldTextStyle,
                  ),
                ),
              ),
              Container(
                width: 1.0,
                height: 40.0,
                color: Colors.grey,
              ),
              InkWell(
                onTap: () {
                  if (!about) {
                    setState(() {
                      services = false;
                      about = true;
                      reviews = false;
                    });
                  }
                },
                child: Container(
                  width: (width - 2.0) / 3,
                  height: 40.0,
                  alignment: Alignment.center,
                  color: (about) ? primaryColor : whiteColor,
                  child: Text(
                    'About',
                    style:
                        (about) ? white14BoldTextStyle : black14BoldTextStyle,
                  ),
                ),
              ),
              Container(
                width: 1.0,
                height: 40.0,
                color: Colors.grey,
              ),
              InkWell(
                onTap: () {
                  if (!reviews) {
                    setState(() {
                      services = false;
                      about = false;
                      reviews = true;
                    });
                  }
                },
                child: Container(
                  width: (width - 2.0) / 3,
                  height: 40.0,
                  alignment: Alignment.center,
                  color: (reviews) ? primaryColor : whiteColor,
                  child: Text(
                    'Reviews',
                    style:
                        (reviews) ? white14BoldTextStyle : black14BoldTextStyle,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  servicesData() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Body Wash Start
              InkWell(
                onTap: () {
                  setState(() {
                    bodyWash = !bodyWash;
                  });
                  calculateTotal();
                },
                child: Container(
                  width: (width - fixPadding * 6.0 - 2.0) / 2,
                  height: (width - fixPadding * 6.0 - 2.0) / 2,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        spreadRadius: 2.0,
                        color: blackColor.withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: (width - fixPadding * 6.0 - 2.0) / 2,
                        height: (width - fixPadding * 6.0 - 2.0) / 2,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: (bodyWash) ? primaryColor : whiteColor,
                                border: Border.all(
                                  width: 1.0,
                                  color: primaryColor,
                                ),
                              ),
                              child: Icon(
                                Icons.directions_car,
                                size: 29.0,
                                color: (bodyWash) ? whiteColor : primaryColor,
                              ),
                            ),
                            heightSpace,
                            height5Space,
                            Text(
                              'Body Wash',
                              style: black14BoldTextStyle,
                            ),
                            heightSpace,
                            Text(
                              '\$50',
                              style: black18BoldTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10.0,
                        right: 10.0,
                        child: (bodyWash)
                            ? Container(
                                height: 24.0,
                                width: 24.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: primaryColor,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: whiteColor,
                                  size: 15.0,
                                ),
                              )
                            : Container(
                                height: 0.0,
                                width: 0.0,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              // Body Wash End

              // Interior Cleaning Start
              InkWell(
                onTap: () {
                  setState(() {
                    interiorCleaning = !interiorCleaning;
                  });
                  calculateTotal();
                },
                child: Container(
                  width: (width - fixPadding * 6.0 - 2.0) / 2,
                  height: (width - fixPadding * 6.0 - 2.0) / 2,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        spreadRadius: 2.0,
                        color: blackColor.withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: (width - fixPadding * 6.0 - 2.0) / 2,
                        height: (width - fixPadding * 6.0 - 2.0) / 2,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: (interiorCleaning)
                                    ? primaryColor
                                    : whiteColor,
                                border: Border.all(
                                  width: 1.0,
                                  color: primaryColor,
                                ),
                              ),
                              child: Icon(
                                Icons.airline_seat_recline_extra,
                                size: 29.0,
                                color: (interiorCleaning)
                                    ? whiteColor
                                    : primaryColor,
                              ),
                            ),
                            heightSpace,
                            height5Space,
                            Text(
                              'Interior Cleaning',
                              style: black14BoldTextStyle,
                            ),
                            heightSpace,
                            Text(
                              '\$80',
                              style: black18BoldTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10.0,
                        right: 10.0,
                        child: (interiorCleaning)
                            ? Container(
                                height: 24.0,
                                width: 24.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: primaryColor,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: whiteColor,
                                  size: 15.0,
                                ),
                              )
                            : Container(
                                height: 0.0,
                                width: 0.0,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              // Interior Cleaning End
            ],
          ),
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Engine Detailing Start
              InkWell(
                onTap: () {
                  setState(() {
                    engineDetailing = !engineDetailing;
                  });
                  calculateTotal();
                },
                child: Container(
                  width: (width - fixPadding * 6.0 - 2.0) / 2,
                  height: (width - fixPadding * 6.0 - 2.0) / 2,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        spreadRadius: 2.0,
                        color: blackColor.withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: (width - fixPadding * 6.0 - 2.0) / 2,
                        height: (width - fixPadding * 6.0 - 2.0) / 2,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: (engineDetailing)
                                    ? primaryColor
                                    : whiteColor,
                                border: Border.all(
                                  width: 1.0,
                                  color: primaryColor,
                                ),
                              ),
                              child: Icon(
                                Icons.dashboard,
                                size: 29.0,
                                color: (engineDetailing)
                                    ? whiteColor
                                    : primaryColor,
                              ),
                            ),
                            heightSpace,
                            height5Space,
                            Text(
                              'Engine Detailing',
                              style: black14BoldTextStyle,
                            ),
                            heightSpace,
                            Text(
                              '\$90',
                              style: black18BoldTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10.0,
                        right: 10.0,
                        child: (engineDetailing)
                            ? Container(
                                height: 24.0,
                                width: 24.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: primaryColor,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: whiteColor,
                                  size: 15.0,
                                ),
                              )
                            : Container(
                                height: 0.0,
                                width: 0.0,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              // Engine Detailing End

              // Light Service Start
              InkWell(
                onTap: () {
                  setState(() {
                    lightService = !lightService;
                  });
                  calculateTotal();
                },
                child: Container(
                  width: (width - fixPadding * 6.0 - 2.0) / 2,
                  height: (width - fixPadding * 6.0 - 2.0) / 2,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        spreadRadius: 2.0,
                        color: blackColor.withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: (width - fixPadding * 6.0 - 2.0) / 2,
                        height: (width - fixPadding * 6.0 - 2.0) / 2,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color:
                                    (lightService) ? primaryColor : whiteColor,
                                border: Border.all(
                                  width: 1.0,
                                  color: primaryColor,
                                ),
                              ),
                              child: Icon(
                                Icons.highlight,
                                size: 29.0,
                                color:
                                    (lightService) ? whiteColor : primaryColor,
                              ),
                            ),
                            heightSpace,
                            height5Space,
                            Text(
                              'Light Service',
                              style: black14BoldTextStyle,
                            ),
                            heightSpace,
                            Text(
                              '\$70',
                              style: black18BoldTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10.0,
                        right: 10.0,
                        child: (lightService)
                            ? Container(
                                height: 24.0,
                                width: 24.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: primaryColor,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: whiteColor,
                                  size: 15.0,
                                ),
                              )
                            : Container(
                                height: 0.0,
                                width: 0.0,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              // Light Service End
            ],
          ),
        ],
      ),
    );
  }

  aboutData() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Opening Hours',
            style: black18BoldTextStyle,
          ),
          height5Space,
          Text(
            'Open now (09:00 AM - 22:00 PM)',
            style: primaryColor12RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            'About',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit pharetra luctus turpis quis senectus vitae dis nisl porttitor. Et id venenatis, potenti sapien purus aliquam est. Tellus ut tincidunt id mi cum. Bibendum vestibulum blandit semper aenean egestas nunc dignissim id.',
            style: black14RegularTextStyle,
            textAlign: TextAlign.justify,
          ),
          heightSpace,
          heightSpace,
          Text(
            'Location',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  color: Colors.grey[300],
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: GoogleMap(
                markers: markers,
                onMapCreated: (GoogleMapController controller) {
                  Marker m = Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(51.361005, -0.1746394));
                  setState(() {
                    markers.add(m);
                  });
                },
                initialCameraPosition: CameraPosition(
                    target: LatLng(51.361005, -0.1746394), zoom: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  reviewsData() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: ColumnBuilder(
        itemCount: reviewList.length,
        itemBuilder: (context, index) {
          final item = reviewList[index];
          return Padding(
            padding: (index != 0)
                ? EdgeInsets.only(top: fixPadding * 2.0)
                : EdgeInsets.only(top: 0.0),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: black14BoldTextStyle,
                                ),
                                height5Space,
                                Text(
                                  item['time'],
                                  style: grey12MediumTextStyle,
                                ),
                              ],
                            ),
                            ratingBar(item['rating']),
                          ],
                        ),
                      ),
                    ],
                  ),
                  heightSpace,
                  Text(
                    item['review'],
                    style: black14RegularTextStyle,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ratingBar(ratingNumber) {
    print(ratingNumber);
    if (ratingNumber == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.lime, size: 15.0),
        ],
      );
    }
    if (ratingNumber == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
        ],
      );
    }
    if (ratingNumber == 3) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
        ],
      );
    }
    if (ratingNumber == 4) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
        ],
      );
    }
    if (ratingNumber == 5) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
        ],
      );
    }
  }
}
