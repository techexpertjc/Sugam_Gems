import 'dart:convert';

import 'package:cache_image/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:sugam_gems/components/call_service.dart';

class MyGallery extends StatefulWidget {
  @override
  _MyGalleryState createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  List<dynamic> imgUrls;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImageUrls();
  }

  bool dataLoaded = false;
  loadImageUrls() async {
    print('inside init');
    CallService temp = CallService();
    var res = await temp.callService(
        'http://sugamgems.com/MobAppService.svc/GetGellery', '{}');
    var resjSon = json.decode(res);
    print(resjSon);
    setState(() {
      imgUrls = resjSon["GetGelleryResult"];
      dataLoaded = true;
    });
  }

  List<Widget> getGalleryImages() {
    List<Widget> temp = List();
    imgUrls.forEach((element) {
      temp.add(Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3)),
            child: FadeInImage(
                placeholder: AssetImage('images/loading1.gif'),
                image: CacheImage(
                  element["Link"],
                ))),
      ));
    });
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: Container(
        // padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
        child: SingleChildScrollView(
          child: Container(
            height: dataLoaded ? null : MediaQuery.of(context).size.height,
            padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/BackImg.png'),
              fit: BoxFit.fitHeight,
            )),
            child: dataLoaded
                ? Column(
                    children: getGalleryImages(),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
