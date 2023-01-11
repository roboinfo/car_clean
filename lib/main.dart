import 'package:car_clean/constant/constant.dart';
import 'package:car_clean/pages/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final storage = new FlutterSecureStorage();

  Future<bool> checkLoginStatus() async{
    String value = await storage.read(key: "uid");
    if (value == null){
      return false;
    }
    return true;
  }

  static const String title = 'V_Choice';

  MyApp({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Clean',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es'),
        const Locale('en'),
      ],
      //home: SplashScreen(),
        home: FutureBuilder(
          future: checkLoginStatus(),
          builder:(BuildContext context,AsyncSnapshot<bool> snapshot ){
            if (snapshot.data == false){
              return SplashScreen();
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Container(color: Colors.white,child: Center(child: CircularProgressIndicator()));
            }
            return Home();
          },

        ),
    );
  }
}
