import 'package:flutter/material.dart';

import 'package:particles_flutter/particles_flutter.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final particleKey = new GlobalKey();

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).popAndPushNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: particleKey,
      body: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
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
            Container(
              color: Color(0xAA000000),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Image.asset('images/LogoNew.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 75.0),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'images/diamond_png/Heart.png',
                        height: 100,
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      Image.asset(
                        'images/diamond_png/Pear.png',
                        height: 100,
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      Image.asset(
                        'images/diamond_png/Emerald.png',
                        height: 100,
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      Image.asset(
                        'images/diamond_png/Round.png',
                        height: 100,
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
