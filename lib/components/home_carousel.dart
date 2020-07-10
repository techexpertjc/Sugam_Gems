import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatefulWidget {
  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  List<Image> myImages;

  @override
  void initState() {
    super.initState();
    myImages = [
      Image.asset('images/home_carousel/mob01.jpg'),
      Image.asset('images/home_carousel/mob02.jpg'),
      Image.asset('images/home_carousel/mob03.jpg')
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(myImages[0].image, context);
    precacheImage(myImages[1].image, context);
    precacheImage(myImages[2].image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/home_carousel/mob01.jpg'),
          AssetImage('images/home_carousel/mob02.jpg'),
          AssetImage('images/home_carousel/mob03.jpg')
        ],
        animationCurve: Curves.fastOutSlowIn,
        showIndicator: false,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );
  }
}
