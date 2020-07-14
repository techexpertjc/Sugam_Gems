import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/img9.jpg'),
                fit: BoxFit.fitHeight,
                colorFilter:
                    ColorFilter.mode(Colors.black87, BlendMode.srcATop))),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 30, 10, 10),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Our Offices',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 20, 30, 10),
                child: Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 20, 30, 10),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Head Office - Sugam Gems BVBA',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 10, 30, 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '2 hoveniersstraat',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 10, 30, 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Office 441',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 10, 30, 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Antwerp, 2018',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 10, 30, 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Belgium',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 10, 30, 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phone: +32473969477',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 10, 30, 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email: sales@sugamgems.com',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 20, 30, 10),
                child: Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 20, 30, 10),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'VVS Diamonds DMCC',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 10, 30, 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Unit No. 30-01-3196,',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 10, 30, 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Jewelry & Gemplex3,',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 10, 30, 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Plot PH2-JPLEXS,',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 10, 30, 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Dubai, U.A.E',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 10, 30, 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phone: +32472695202',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 10, 30, 20),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email: sales@sugamgems.com',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
