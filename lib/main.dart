import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:sugam_gems/screens/about_us.dart';
import 'package:sugam_gems/screens/contact_us.dart';
import 'package:sugam_gems/screens/gallery.dart';
import 'package:sugam_gems/screens/search_results.dart';
import 'package:sugam_gems/screens/search_stone.dart';
import 'package:sugam_gems/screens/home_screen.dart';
import 'package:sugam_gems/screens/splashScreen.dart';

void main() {
  FlutterDownloader.initialize();
  runApp(MyApp());
}

const int _blackPrimaryValue = 0xFF222222;
const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/searchPage": (BuildContext context) => StoneSearch(),
  "/searchResults": (BuildContext context) => SearchResults(),
  "/aboutUs": (BuildContext context) => AboutUs(),
  "/gallery": (BuildContext context) => MyGallery(),
  "/contact": (BuildContext context) => ContactUs()
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: primaryBlack,
          textTheme: TextTheme(
              button: TextStyle(fontFamily: 'ClearSansLight'),
              bodyText1: TextStyle(fontFamily: 'ClearSansLight'),
              bodyText2: TextStyle(fontFamily: 'ClearSansLight'),
              headline6: TextStyle(fontFamily: 'ClearSansLight'))),
      home: SplashScreen(),
      routes: routes,
    );
  }
}
