import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    precacheImage(AssetImage('images/home_carousel/mob01.jpg'), context);
    precacheImage(AssetImage('images/home_carousel/mob02.jpg'), context);
    precacheImage(AssetImage('images/home_carousel/mob03.jpg'), context);

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: primaryBlack.shade500,
              image: DecorationImage(
                  image: AssetImage('images/img9.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      primaryBlack.shade500, BlendMode.luminosity))),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HomeCarousel(),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/searchPage');
                    },
                    elevation: 5.0,
                    // fillColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Container(
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
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/aboutUs");
                    },
                    elevation: 5.0,
                    // fillColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Container(
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
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: RaisedButton(
                    onPressed: () {},
                    elevation: 5.0,
                    // fillColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Container(
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
                )
              ],
            ),
          )),
    );
  }
}
