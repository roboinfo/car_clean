import 'package:car_clean/constant/constant.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final notificationList = [
    {
      'title': 'Get 30% Off',
      'description': 'Use code carclean30 & get 30% off on your car service.'
    },
    {
      'title': 'Congratulations..',
      'description':
          'Congratulations.. Your car has been successfully serviced.'
    },
    {
      'title': 'Rate us now',
      'description':
          'Your feedback are very important for us. Tap here to rate us now.'
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
          'Notifications',
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
      body: (notificationList.isEmpty)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_off,
                    size: 60.0,
                    color: greyColor,
                  ),
                  heightSpace,
                  Text(
                    'No new notifications..',
                    style: grey20BoldTextStyle,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: notificationList.length,
              itemBuilder: (context, index) {
                final item = notificationList[index];
                return Dismissible(
                  key: Key('$item'),
                  onDismissed: (direction) {
                    setState(() {
                      notificationList.removeAt(index);
                    });

                    // Then show a snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${item['title']} dismissed")));
                  },
                  // Show a red background as the item is swiped away.
                  background: Container(
                    margin: (index == notificationList.length - 1)
                        ? EdgeInsets.symmetric(vertical: fixPadding * 2.0)
                        : EdgeInsets.only(top: fixPadding * 2.0),
                    color: Colors.red,
                  ),
                  child: Padding(
                    padding: (index == notificationList.length - 1)
                        ? EdgeInsets.all(fixPadding * 2.0)
                        : EdgeInsets.fromLTRB(fixPadding * 2.0,
                            fixPadding * 2.0, fixPadding * 2.0, 0.0),
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
                            width: 50.0,
                            height: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: primaryColor,
                            ),
                            child: Icon(
                              Icons.notifications,
                              size: 24.0,
                              color: whiteColor,
                            ),
                          ),
                          widthSpace,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'],
                                  style: black16SemiBoldTextStyle,
                                ),
                                height5Space,
                                Text(
                                  item['description'],
                                  style: black14MediumTextStyle,
                                ),
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
    );
  }
}
