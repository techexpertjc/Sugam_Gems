import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

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

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            color: primaryBlack.shade500,
            image: DecorationImage(
                image: AssetImage('images/img9.jpg'),
                fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(
                    primaryBlack.shade500, BlendMode.srcATop))),
        child: ListView(children: <Widget>[
          DrawerHeader(
            child: Text(''),
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('images/LogoNew.png'))),
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed("/home");
            },
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/searchPage');
            },
            title: Text('Search', style: TextStyle(color: Colors.white)),
            leading: Icon(Icons.search, color: Colors.white),
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed("/aboutUs"),
            title: Text('About Us', style: TextStyle(color: Colors.white)),
            leading: Icon(Icons.info, color: Colors.white),
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            title: Text('Contact Us', style: TextStyle(color: Colors.white)),
            leading: Icon(Icons.mail, color: Colors.white),
          )
        ]),
      ),
    );
  }
}
