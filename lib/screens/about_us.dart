import 'dart:ui';

import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> with SingleTickerProviderStateMixin {
  TabController tabContrlr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabContrlr = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.home), onPressed: () => Navigator.of(context).pushNamed('/home'))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.black54,
            image: DecorationImage(
                image: AssetImage('images/img9.jpg'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black87, BlendMode.srcATop))),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 200,
              child: TabBarView(controller: tabContrlr, children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'images/diamond_png/Heart.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                      child: Text(
                        'History & Vision',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Sugam Gems B.V.B.A was founded in Antwerp, Belgium in 1983 by the young, ambitious, and innovative Sunil Rasiklal Shah. In a few years, the Company expanded from a small business manufacturing and trading uncut rough diamonds to one of the leading traders and wholesalers of polished diamonds and custom made jewelry in Europe. At Sugam Gems, we believe in providing the highest quality of diamonds while maintaining utmost transparency to our worldwide network of customers. Trust and credibility are the core pillars of our business values and are reflected in our company ethos. We envision becoming a leader in the industry by continuing to be the most trusted supplier of premium certified diamonds and custom made jewelry.',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 20,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'images/diamond_png/Round.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                      child: Text(
                        'Pillars of Trust & Transparency',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "We, at Sugam Gems, have built a reputation of being one of the most trusted brands in the diamond industry for over three decades. From the beginning of the supply chain, until the final product is delivered to the customer, we believe in being as clear as our most flawless diamonds in its dealings with its customers. Our legacy is based on trust and we believe transparency is at the core building sustainable relationships with our customers. We strive to give you complete customer satisfaction. That's why we provide our customers with the most attractive rates in the market and also maintain a buyback policy to ensure buyers feel confident in our product as well as in pursuing a long term relationship with our brand. We guarantee that each product purchased from us is meticulously valued and set to yield capital gains in the future.",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 20,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'images/diamond_png/Emerald.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                      child: Text(
                        'Prioritize Customer Satisfaction & Relationships',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Buying a diamond or an intricate custom-made piece of jewelry at Sugam Gems is a bespoke and one of a kind experience. We strive to give you the finest jewelry purchasing journey by servicing your needs at every touch-point and taking a personal interest in understanding each of your personal requirements and vision. At Sugam Gems, our success hinges on customer satisfaction, which is why we make it a priority to keep our clients up to date with honest, accurate and precise market information - creating a bond based on our core principles of trust, transparency and shared growth.',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 20,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'images/diamond_png/Pear.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                      child: Text(
                        'Emotion & Luxury- An Art Form',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'At Sugam Gems, we believe that buying a diamond transcends just being a luxury investment and is in reality a bold step towards your future promise. Since we understand the emotion behind this decision we’re committed to providing our customers with the finest diamond buying experience. We consider a sale to be complete only when you, our customers are entirely pleased with the exquisiteness, quality, and value of your diamond. We aim to morph designs from unique inspiration to items of universal aspiration. As a premier luxury brand, we are consumed with creating pieces that reflect perfection and individuality for each client.',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 20,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ]),
            ),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.height,

              // color: Colors.transparent,
              child: TabBar(
                indicator: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0x40999999), Color(0x40000000)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
                controller: tabContrlr,
                tabs: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.transparent,
                      width: 70,
                      // height: 70,
                      child: Image.asset("images/diamond_png/Heart.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: 70,
                      // height: 70,
                      child: Image.asset("images/diamond_png/Round.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: 70,
                      // height: 70,
                      child: Image.asset("images/diamond_png/Emerald.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: 70,
                      // height: 70,
                      child: Image.asset("images/diamond_png/Pear.png"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
