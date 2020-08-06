import 'package:flutter/material.dart';
import 'package:sugam_gems/components/hex_color.dart';
import 'package:sugam_gems/components/ozone_diaicon_icons.dart';

class StoneShapes extends StatefulWidget {
  final customFunction;
  StoneShapes({Key key, this.customFunction}) : super(key: key);
  @override
  _StoneShapesState createState() => _StoneShapesState();
}

class _StoneShapesState extends State<StoneShapes> {
  bool changeColorAll = false;
  bool changeColorRound = false;
  bool changeColorPrincess = false;
  bool changeColorCushion = false;
  bool changeColorOval = false;
  bool changeColorEmerald = false;
  bool changeColorPear = false;
  bool changeColorAsscher = false;
  bool changeColorHeart = false;
  bool changeColorRadiant = false;
  bool changeColorMarquise = false;
  bool changeColorOther = false;
  bool size = false;

  Color c1 = HexColor("#6b82d8f2");
  Color c2 = HexColor("1270e6f2");
  static String all,
      round,
      princess,
      cushion,
      oval,
      emerald,
      pear,
      asscher,
      heart,
      radiant,
      marquise,
      other;

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    widget.customFunction(
        changeColorAll,
        changeColorRound,
        changeColorPrincess,
        changeColorCushion,
        changeColorOval,
        changeColorEmerald,
        changeColorPear,
        changeColorAsscher,
        changeColorHeart,
        changeColorRadiant,
        changeColorMarquise,
        changeColorOther);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 71.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.only(bottom: 1.0, left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topLeft,
                        colors: changeColorAll
                            ? [Colors.blue[300], Colors.blue[900]]
                            : [Colors.transparent, Colors.transparent])),
                child: Column(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          OzoneDiaicon.all,
                          size: 30.0,
                          color:
                              changeColorAll ? Colors.white : Colors.grey[700],
                        ),
                        onPressed: () {
                          // print(changeColorAll);
                          //TODO Implement function of All clicked in shapes

                          setState(() {
                            changeColorAll = !changeColorAll;
                            changeColorAsscher = changeColorAll;
                            changeColorCushion = changeColorAll;
                            changeColorEmerald = changeColorAll;
                            changeColorHeart = changeColorAll;
                            changeColorMarquise = changeColorAll;
                            changeColorOther = changeColorAll;
                            changeColorOval = changeColorAll;
                            changeColorPear = changeColorAll;
                            changeColorPrincess = changeColorAll;
                            changeColorRadiant = changeColorAll;
                            changeColorRound = changeColorAll;
                          });
                        }),
                    Text(
                      'All',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color:
                              changeColorAll ? Colors.white : Colors.grey[700]),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.only(bottom: 1.0, left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topLeft,
                        colors: changeColorRound
                            ? [Colors.blue[300], Colors.blue[900]]
                            : [Colors.transparent, Colors.transparent])),
                child: Column(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(OzoneDiaicon.round,
                            size: 30.0,
                            color: changeColorRound
                                ? Colors.white
                                : Colors.grey[700]),
                        onPressed: () {
                          //TODO Implement function of Round clicked in shapes
                          changeColorRound = !changeColorRound;
                          setState(() {});
                        }),
                    Text(
                      'Round',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: changeColorRound
                              ? Colors.white
                              : Colors.grey[700]),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.only(bottom: 1.0, left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topLeft,
                        colors: changeColorPrincess
                            ? [Colors.blue[300], Colors.blue[900]]
                            : [Colors.transparent, Colors.transparent])),
                child: Column(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(OzoneDiaicon.princess,
                            size: 30.0,
                            color: changeColorPrincess
                                ? Colors.white
                                : Colors.grey[700]),
                        onPressed: () {
                          //TODO Implement function of Round clicked in shapes
                          changeColorPrincess = !changeColorPrincess;
                          setState(() {});
                        }),
                    Text(
                      'Princess',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: changeColorPrincess
                              ? Colors.white
                              : Colors.grey[700]),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.only(bottom: 1.0, left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topLeft,
                        colors: changeColorCushion
                            ? [Colors.blue[300], Colors.blue[900]]
                            : [Colors.transparent, Colors.transparent])),
                child: Column(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(OzoneDiaicon.cushion,
                            size: 30.0,
                            color: changeColorCushion
                                ? Colors.white
                                : Colors.grey[700]),
                        onPressed: () {
                          //TODO Implement function of Cushion clicked in shapes
                          changeColorCushion = !changeColorCushion;
                          setState(() {});
                        }),
                    Text(
                      'Cushion',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: changeColorCushion
                              ? Colors.white
                              : Colors.grey[700]),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.only(bottom: 1.0, left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topLeft,
                        colors: changeColorOval
                            ? [Colors.blue[300], Colors.blue[900]]
                            : [Colors.transparent, Colors.transparent])),
                child: Column(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(OzoneDiaicon.oval,
                            size: 30.0,
                            color: changeColorOval
                                ? Colors.white
                                : Colors.grey[700]),
                        onPressed: () {
                          //TODO Implement function of Oval clicked in shapes
                          changeColorOval = !changeColorOval;
                          setState(() {});
                        }),
                    Text(
                      'Oval',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: changeColorOval
                              ? Colors.white
                              : Colors.grey[700]),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.only(bottom: 1.0, left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topLeft,
                        colors: changeColorEmerald
                            ? [Colors.blue[300], Colors.blue[900]]
                            : [Colors.transparent, Colors.transparent])),
                child: Column(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(OzoneDiaicon.emerald,
                            size: 30.0,
                            color: changeColorEmerald
                                ? Colors.white
                                : Colors.grey[700]),
                        onPressed: () {
                          //TODO Implement function of Emerald clicked in shapes
                          changeColorEmerald = !changeColorEmerald;
                          setState(() {});
                        }),
                    Text(
                      'Emerald',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: changeColorEmerald
                              ? Colors.white
                              : Colors.grey[700]),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.only(bottom: 1.0, left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topLeft,
                        colors: changeColorPear
                            ? [Colors.blue[300], Colors.blue[900]]
                            : [Colors.transparent, Colors.transparent])),
                child: Column(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(OzoneDiaicon.pear,
                            size: 30.0,
                            color: changeColorPear
                                ? Colors.white
                                : Colors.grey[700]),
                        onPressed: () {
                          //TODO Implement function of Pear clicked in shapes
                          changeColorPear = !changeColorPear;
                          setState(() {});
                        }),
                    Text(
                      'Pear',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: changeColorPear
                              ? Colors.white
                              : Colors.grey[700]),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.only(bottom: 1.0, left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topLeft,
                        colors: changeColorAsscher
                            ? [Colors.blue[300], Colors.blue[900]]
                            : [Colors.transparent, Colors.transparent])),
                child: Column(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(OzoneDiaicon.asscher,
                            size: 30.0,
                            color: changeColorAsscher
                                ? Colors.white
                                : Colors.grey[700]),
                        onPressed: () {
                          //TODO Implement function of Asscher clicked in shapes
                          changeColorAsscher = !changeColorAsscher;
                          setState(() {});
                        }),
                    Text(
                      'Asscher',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: changeColorAsscher
                              ? Colors.white
                              : Colors.grey[700]),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.only(bottom: 1.0, left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topLeft,
                        colors: changeColorHeart
                            ? [Colors.blue[300], Colors.blue[900]]
                            : [Colors.transparent, Colors.transparent])),
                child: Column(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(OzoneDiaicon.heart,
                            size: 30.0,
                            color: changeColorHeart
                                ? Colors.white
                                : Colors.grey[700]),
                        onPressed: () {
                          //TODO Implement function of Heart clicked in shapes
                          changeColorHeart = !changeColorHeart;
                          setState(() {});
                        }),
                    Text(
                      'Heart',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: changeColorHeart
                              ? Colors.white
                              : Colors.grey[700]),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.only(bottom: 1.0, left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topLeft,
                        colors: changeColorRadiant
                            ? [Colors.blue[300], Colors.blue[900]]
                            : [Colors.transparent, Colors.transparent])),
                child: Column(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(OzoneDiaicon.radiant,
                            size: 30.0,
                            color: changeColorRadiant
                                ? Colors.white
                                : Colors.grey[700]),
                        onPressed: () {
                          //TODO Implement function of Radiant clicked in shapes
                          changeColorRadiant = !changeColorRadiant;
                          setState(() {});
                        }),
                    Text(
                      'Radiant',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: changeColorRadiant
                              ? Colors.white
                              : Colors.grey[700]),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.only(bottom: 1.0, left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topLeft,
                        colors: changeColorMarquise
                            ? [Colors.blue[300], Colors.blue[900]]
                            : [Colors.transparent, Colors.transparent])),
                child: Column(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(OzoneDiaicon.marquise,
                            size: 30.0,
                            color: changeColorMarquise
                                ? Colors.white
                                : Colors.grey[700]),
                        onPressed: () {
                          //TODO Implement function of Marquise clicked in shapes
                          changeColorMarquise = !changeColorMarquise;
                          setState(() {});
                        }),
                    Text(
                      'Marquise',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: changeColorMarquise
                              ? Colors.white
                              : Colors.grey[700]),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.only(bottom: 1.0, left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: changeColorOther
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent]),
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  // color: changeColorOther
                  //     ? Colors.transparent
                  //     : Colors.transparent
                ),
                child: Column(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(OzoneDiaicon.other,
                            size: 30.0,
                            color: changeColorOther
                                ? Colors.white
                                : Colors.grey[700]),
                        onPressed: () {
                          //TODO Implement function of Other clicked in shapes
                          changeColorOther = !changeColorOther;
                          setState(() {});
                        }),
                    Text(
                      'Other',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: changeColorOther
                              ? Colors.white
                              : Colors.grey[700]),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
