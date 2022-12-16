import 'package:car_clean/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final favoriteList = [
    {
      'image': 'assets/service_provider/provider_1.jpg',
      'name': 'Perfect Car Wash Services',
      'address': '104, Apple Square, New York.'
    },
    {
      'image': 'assets/service_provider/provider_3.jpg',
      'name': 'Quicky Car Services',
      'address': 'G-9, Opera Canter, New York.'
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
          'Favorites',
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
      body: (favoriteList.isEmpty)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 50.0,
                    color: greyColor,
                  ),
                  heightSpace,
                  Text(
                    'No item in favorite',
                    style: grey20BoldTextStyle,
                  ),
                ],
              ),
            )
           : ListView.builder(
          //     itemCount: favoriteList.length,
          //     itemBuilder: (context, index) {
          //       final item = favoriteList[index];
          //       return Slidable(
          //         actionPane: SlidableDrawerActionPane(),
          //         actionExtentRatio: 0.25,
          //         secondaryActions: <Widget>[
          //           Container(
          //             margin: EdgeInsets.only(
          //               top: fixPadding * 2.0,
          //               bottom: (index == favoriteList.length - 1)
          //                   ? fixPadding * 2.0
          //                   : 0.0,
          //             ),
          //             child: IconSlideAction(
          //               caption: 'Delete',
          //               color: Colors.red,
          //               icon: Icons.delete,
          //               onTap: () {
          //                 setState(() {
          //                   favoriteList.removeAt(index);
          //                 });
          //
          //                 // Then show a snackbar.
          //                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //                   content: Text('Provider Removed from Favorite'),
          //                 ));
          //               },
          //             ),
          //           ),
          //         ],
          //         child: Padding(
          //           padding: (index == favoriteList.length - 1)
          //               ? EdgeInsets.all(fixPadding * 2.0)
          //               : EdgeInsets.fromLTRB(
          //                   fixPadding * 2.0,
          //                   fixPadding * 2.0,
          //                   fixPadding * 2.0,
          //                   0.0,
          //                 ),
          //           child: Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10.0),
          //               color: whiteColor,
          //               boxShadow: [
          //                 BoxShadow(
          //                   blurRadius: 4.0,
          //                   spreadRadius: 2.0,
          //                   color: blackColor.withOpacity(0.25),
          //                 ),
          //               ],
          //             ),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 ClipRRect(
          //                   borderRadius: BorderRadius.vertical(
          //                     top: Radius.circular(10.0),
          //                   ),
          //                   child: Image.asset(
          //                     item['image'],
          //                     height: 170.0,
          //                     width: double.infinity,
          //                     fit: BoxFit.cover,
          //                   ),
          //                 ),
          //                 Container(
          //                   padding: EdgeInsets.all(fixPadding * 2.0),
          //                   child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.start,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(
          //                         item['name'],
          //                         style: black18BoldTextStyle,
          //                       ),
          //                       heightSpace,
          //                       Text(
          //                         item['address'],
          //                         style: grey16MediumTextStyle,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     },
             ),

    );
  }
}
