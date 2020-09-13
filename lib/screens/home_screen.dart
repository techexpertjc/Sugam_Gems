import 'dart:io';

import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:sugam_gems/components/drawer_custom.dart';
import 'package:sugam_gems/components/home_carousel.dart';

const int _blackPrimaryValue = 0xCC202020;
const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(0xCC000000),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final particleKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // color: Colors.black,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              // image: DecorationImage(
              //     image: AssetImage('images/BackImg.png'),
              //     fit: BoxFit.fitHeight,
              backgroundBlendMode: BlendMode.srcATop,
              color: Colors.black87),
          child: SingleChildScrollView(
            child: Stack(children: <Widget>[
              CircularParticle(
                key: particleKey,
                awayRadius: 50,
                numberOfParticles: 50,
                speedOfParticles: 0.5,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                onTapAnimation: true,
                particleColor: Colors.white.withAlpha(150),
                awayAnimationDuration: Duration(milliseconds: 1000),
                maxParticleSize: 15,
                isRandSize: true,
                isRandomColor: false,
                randColorList: [
                  Colors.red.withAlpha(210),
                  Colors.white.withAlpha(210),
                  Colors.yellow.withAlpha(210),
                  Colors.green.withAlpha(210)
                ],
                awayAnimationCurve: Curves.easeInCubic,
                enableHover: true,
                hoverColor: Colors.white,
                hoverRadius: 50,
                connectDots: false, //not recommended
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/img9.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                primaryBlack.shade500, BlendMode.luminosity))),
                    child: Image.asset('images/LogoNew.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
                    child: RaisedButton(
                      onPressed: () {
                        if (!FocusScope.of(context).hasPrimaryFocus) {
                          FocusScope.of(context).unfocus();
                        }
                        Navigator.of(context).pushNamed('/searchPage');
                      },
                      elevation: 5.0,
                      // fillColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Container(
                        width: 280,
                        height: 60,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.search),
                            ),
                            Padding(
                                padding: EdgeInsets.all(5),
                                child: Text('Search Stone'))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: RaisedButton(
                      onPressed: () async {
                        try {
                          final result =
                              await InternetAddress.lookup('google.com');
                          if (result.isNotEmpty &&
                              result[0].rawAddress.isNotEmpty) {
                            print('connected');
                            Navigator.of(context).pushNamed("/gallery");
                          }
                        } on SocketException catch (_) {
                          scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text(
                                  'Please connect the device to active Internet')));
                        }
                      },
                      elevation: 5.0,
                      // fillColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Container(
                        width: 280,
                        height: 60,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.photo_album),
                            ),
                            Padding(
                                padding: EdgeInsets.all(5),
                                child: Text('Gallery'))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: RaisedButton(
                      onPressed: () {
                        if (!FocusScope.of(context).hasPrimaryFocus) {
                          FocusScope.of(context).unfocus();
                        }
                        Navigator.of(context).pushNamed("/aboutUs");
                      },
                      elevation: 5.0,
                      // fillColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Container(
                        width: 280,
                        height: 60,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.info),
                            ),
                            Padding(
                                padding: EdgeInsets.all(5),
                                child: Text('About Us'))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: RaisedButton(
                      onPressed: () {
                        if (!FocusScope.of(context).hasPrimaryFocus) {
                          FocusScope.of(context).unfocus();
                        }
                        Navigator.of(context).pushNamed('/contact');
                      },
                      elevation: 5.0,
                      // fillColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Container(
                        width: 280,
                        height: 60,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.mail),
                            ),
                            Padding(
                                padding: EdgeInsets.all(5),
                                child: Text('Contact Us'))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          )),
    );
  }
}
