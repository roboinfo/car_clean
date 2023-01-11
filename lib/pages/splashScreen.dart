import 'dart:async';

import 'package:car_clean/constant/constant.dart';
import 'package:car_clean/pages/auth/loginscreen.dart';
import 'package:car_clean/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.3, 0.5, 0.7, 0.9],
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.55),
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(1.0),
              ],
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text(
                    'CarSpa',
                    style: white48MediumTextStyle,
                  ),

                ),
              ),
              Positioned(
                bottom: 50.0,
                left: 0.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: SpinKitRing(
                    color: whiteColor,
                    size: 40.0,
                    lineWidth: 1.2,
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
