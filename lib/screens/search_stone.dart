import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sugam_gems/components/advance_search_fields.dart';
import 'package:sugam_gems/components/black_inc_category.dart';
import 'package:sugam_gems/components/call_service.dart';
import 'package:sugam_gems/components/certificate_category.dart';
import 'package:sugam_gems/components/clarity_widget.dart';
import 'package:sugam_gems/components/colour_list.dart';
import 'package:sugam_gems/components/cut_category.dart';
import 'package:sugam_gems/components/fluorescence_category.dart';
import 'package:sugam_gems/components/hna_category.dart';
import 'package:sugam_gems/components/luster_category.dart';
import 'package:sugam_gems/components/polish_category.dart';
import 'package:sugam_gems/components/shades_category.dart';

import 'package:sugam_gems/components/stone_shapes.dart';
import 'package:sugam_gems/components/symmetry_category.dart';
import 'package:sugam_gems/components/white_inc_category.dart';
import 'package:sugam_gems/screens/search_results.dart';

class StoneSearch extends StatefulWidget {
  @override
  _StoneSearchState createState() => _StoneSearchState();
}

class _StoneSearchState extends State<StoneSearch> {
  Set<String> _caratList = Set();
  TextEditingController fromCaratCntrlr = TextEditingController(),
      toCaratCntrlr = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool advSearchHidden = true;

  List<Widget> _getCaratList() {
    List<Widget> caratList = [];
    _caratList.forEach((element) {
      // print(element);
      caratList.add(
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    element,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 30,
                  child: RaisedButton(
                      color: Colors.grey[200],
                      shape: CircleBorder(),
                      // color: Colors.black,
                      padding: EdgeInsets.only(bottom: 1, left: 0),
                      child: Icon(
                        Icons.close,
                        size: 20.0,
                      ),
                      onPressed: () {
                        _caratList.remove(element);
                        setState(() {});
                      }),
                )
              ],
            ),
          ),
        ),
      );
    });
    return caratList;
  }

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

  bool flSelected = false,
      ifSelected = false,
      vvs1Selected = false,
      vvs2Selected = false,
      vs1Selected = false,
      vs2Selected = false,
      si1Selected = false,
      si2Selected = false,
      si3Selected = false,
      i1Selected = false,
      i2Selected = false,
      i3Selected = false,
      i4Selected = false;
      

  void updateClarity(
      bool flSelected1,
      bool ifSelected1,
      bool vvs1Selected1,
      bool vvs2Selected1,
      bool vs1Selected1,
      bool vs2Selected1,
      bool si1Selected1,
      bool si2Selected1,
      bool si3Selected1,
      bool i1Selected1,
      bool i2Selected1,
      bool i3Selected1) {
    flSelected = flSelected1;
    ifSelected = ifSelected1;
    vvs1Selected = vvs1Selected1;
    vvs2Selected = vvs2Selected1;
    vs1Selected = vs1Selected1;
    vs2Selected = vs2Selected1;
    si1Selected = si1Selected1;
    si2Selected = si2Selected1;
    si3Selected = si3Selected1;
    i1Selected = i1Selected1;
    i2Selected = i2Selected1;
    i3Selected = i3Selected1;
  }

  void updateStones(
      bool changeColorAll1,
      bool changeColorRound1,
      bool changeColorPrincess1,
      bool changeColorCushion1,
      bool changeColorOval1,
      bool changeColorEmerald1,
      bool changeColorPear1,
      bool changeColorAsscher1,
      bool changeColorHeart1,
      bool changeColorRadiant1,
      bool changeColorMarquise1,
      bool changeColorOther1) {
    changeColorAll = changeColorAll1;
    changeColorRound = changeColorRound1;
    changeColorPrincess = changeColorPrincess1;
    changeColorCushion = changeColorCushion1;
    changeColorOval = changeColorOval1;
    changeColorEmerald = changeColorEmerald1;
    changeColorPear = changeColorPear1;
    changeColorAsscher = changeColorAsscher1;
    changeColorHeart = changeColorHeart1;
    changeColorRadiant = changeColorRadiant1;
    changeColorMarquise = changeColorMarquise1;
    changeColorOther = changeColorOther1;
  }

  var selectedColour = Map();
  void getColours(Map selectedColour1) {
    selectedColour = selectedColour1;
  }

  var selectedCut = Map();

  void getSelectedCut(Map cutVal) {
    selectedCut = cutVal;
  }

  var selectedPols = Map();
  void getSelectedPolish(Map polVal) {
    selectedPols = polVal;
  }

  var selectedSymms = Map();
  void getSelectedSymm(Map symmVal) {
    selectedSymms = symmVal;
  }

  var selectedFluo = Map();
  void getSelectedFluo(Map fluoVal) {
    selectedFluo = fluoVal;
  }

  var selectedCerti = Map();
  void getSelectedCerti(Map certiVal) {
    selectedCerti = certiVal;
  }

  Future<void> searchStone() async {
    String shape = '', carats = '', clarity = '', colourList = '';
    if (changeColorAll) {
      shape = 'RBC,PC,EM,AC,OV,RN,PS,HT,MQ,CS';
    } else {
      if (changeColorRound) {
        shape = shape + ',' + 'RBC';
      }

      if (changeColorPrincess) {
        shape = shape + ',' + 'PC';
      }

      if (changeColorEmerald) {
        shape = shape + ',' + 'EM';
      }

      if (changeColorAsscher) {
        shape = shape + ',' + 'AC';
      }

      if (changeColorOval) {
        shape = shape + ',' + 'OV';
      }

      if (changeColorRadiant) {
        shape = shape + ',' + 'RN';
      }

      if (changeColorPear) {
        shape = shape + ',' + 'PS';
      }

      if (changeColorHeart) {
        shape = shape + ',' + 'HT';
      }

      if (changeColorMarquise) {
        shape = shape + ',' + 'MQ';
      }

      if (changeColorCushion) {
        shape = shape + ',' + 'CS';
      }
    }
    if (shape.length > 0 && shape[0] == ',') shape = shape.substring(1);
    print(_caratList);
    carats = _caratList.join(',');

    if (flSelected) {
      clarity = clarity + ',' + 'FL';
    }
    if (ifSelected) {
      clarity = clarity + ',' + 'IF';
    }
    if (vvs1Selected) {
      clarity = clarity + ',' + 'VVS1';
    }
    if (vvs2Selected) {
      clarity = clarity + ',' + 'VVS2';
    }
    if (si1Selected) {
      clarity = clarity + ',' + 'SI1';
    }
    if (si2Selected) {
      clarity = clarity + ',' + 'SI2';
    }
    if (si3Selected) {
      clarity = clarity + ',' + 'SI3';
    }
    if (i1Selected) {
      clarity = clarity + ',' + 'I1';
    }
    if (i2Selected) {
      clarity = clarity + ',' + 'I2';
    }
    if (i3Selected) {
      clarity = clarity + ',' + 'I3';
    }
    if (clarity.length > 0 && clarity[0] == ',') clarity = clarity.substring(1);
    selectedColour.forEach((key, value) {
      if (value) {
        if (key != 'All') {
          colourList = colourList + ',' + key.toString().toUpperCase();
        }
      }
    });

    var cutList = '';
    selectedCut.forEach((key, value) {
      if (value) {
        cutList = cutList + ',' + key;
      }
    });

    if (cutList.length > 0 && cutList[0] == ',') cutList = cutList.substring(1);

    var polishList = '';
    selectedPols.forEach((key, value) {
      if (value) {
        polishList = polishList + ',' + key;
      }
    });
    if (polishList.length > 0 && polishList[0] == ',')
      polishList = polishList.substring(1);

    var symmList = '';
    selectedSymms.forEach((key, value) {
      if (value) {
        symmList = symmList + ',' + key;
      }
    });
    if (symmList.length > 0 && symmList[0] == ',')
      symmList = symmList.substring(1);

    var floroList = '';
    selectedFluo.forEach((key, value) {
      if (value) {
        floroList = floroList + ',' + key;
      }
    });
    if (floroList.length > 0 && floroList[0] == ',')
      floroList = floroList.substring(1);

    var certiList = '';
    selectedCerti.forEach((key, value) {
      if (value) {
        certiList = certiList + ',' + key;
      }
    });
    if (certiList.length > 0 && certiList[0] == ',')
      certiList = certiList.substring(0);

    if (colourList.length > 0 && colourList[0] == ',')
      colourList = colourList.substring(1);
    print(colourList);

    var data = Map<String, String>();
    data["Shape"] = shape;
    data["CtsFrom"] = "";
    data["CtsTo"] = "";
    data["Clarity"] = clarity;
    data["Color"] = colourList;
    data["Cut"] = cutList;
    data["Polish"] = polishList;
    data["Symm"] = symmList;
    data["Fls"] = floroList;
    data["Lab"] = "";
    data["MultiCts"] = carats;
    data["Token"] = "";
    data["StockType"] = "";
    data["SortBy"] = "";
    data["Start"] = "1";
    data["End"] = "10";

    // data = {
    //   '"Shape"': '"' + shape + '"',
    //   '"CtsFrom"': '""',
    //   '"CtsTo"': '""',
    //   '"Clarity"': '"' + clarity + '"',
    //   '"Color"': '"' + colourList + '"',
    //   '"Cut"': '"' + cutList + '"',
    //   '"Polish"': '"' + polishList + '"',
    //   '"Symm"': '"' + symmList + '"',
    //   '"Fls"': '"' + floroList + '"',
    //   '"Lab"': '""',
    //   '"MultiCts"': '"' + carats + '"',
    //   '"Token"': '""',
    //   '"StockType"': '""',
    //   '"SortBy"': '""',
    //   '"Start"': '"0"',
    //   '"End"': '"10"'
    // };
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchResults(
                  reqData: data,
                )));
    // print(res);
    // Navigator.of(context).pushNamed('/searchResults');
  }

  final GlobalKey<CutCategoryState> _cutKey = GlobalKey();
  final GlobalKey<PolishCategoryState> _polKey = GlobalKey();
  final GlobalKey<SymmetryCategoryState> _symmKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              // width: (MediaQuery.of(context).size.width - 40) / 2,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => StoneSearch(),
                      transitionDuration: Duration.zero,
                    ),
                  );
                },
                child: Text('Reset'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              // width: (MediaQuery.of(context).size.width - 40) / 2,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                onPressed: searchStone,
                child: Text('Search'),
              ),
            ),
          )
        ],
      ),
      appBar: AppBar(
        title: Text('Stone Search'),
      ),
      key: scaffoldKey,
      body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  // Stone ID/Cert No text box
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    child: TextFormField(
                      // style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            // borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: 'Stone ID / Cert No.',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                  ),

                  //Shapes option
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    child: Container(
                      height: 76,
                      color: Colors.transparent,
                      child: StoneShapes(
                        customFunction: updateStones,
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey),
                  //Carat Selection
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Carat: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.black),
                        ),
                        Container(
                          height: 35.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: fromCaratCntrlr,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'From',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Container(
                            height: 35.0,
                            width: 70.0,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: toCaratCntrlr,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'To',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: RawMaterialButton(
                              onPressed: () {
                                if (fromCaratCntrlr.text.trim() != '' &&
                                    toCaratCntrlr.text.trim() != '') {
                                  _caratList.add(fromCaratCntrlr.text.trim() +
                                      '-' +
                                      toCaratCntrlr.text.trim());
                                  setState(() {});
                                }
                                // // print(fromCaratCntrlr.text.trim() +
                                //     '-' +
                                //     toCaratCntrlr.text.trim());
                                // print(MediaQuery.of(context).size.width);
                              },
                              elevation: 2.0,
                              fillColor: Colors.grey[300],
                              child: Icon(
                                Icons.add,
                                size: 20,
                                // color: Colors.white,
                              ),
                              shape: CircleBorder(
                                  side: BorderSide(color: Colors.grey)),
                            )),
                      ],
                    ),
                  ),

                  //Carat Tags
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Container(
                              color: Colors.transparent,
                              width: 100,
                              child: (_caratList.length >= 1)
                                  ? RaisedButton(
                                      // color: Colors.transparent,
                                      shape: Border.all(color: Colors.grey),
                                      onPressed: () {
                                        _caratList.clear();
                                        setState(() {});
                                      },
                                      child: Text(
                                        'Clear All',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  : Container(),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 110 - 20,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: _getCaratList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Divider(
                    color: Colors.grey,
                  ),
                  //Clarity
                  ClarityChoices(
                    customFunction: updateClarity,
                  ),

                  Divider(color: Colors.grey),
                  //Colour component
                  Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Container(
                        // height: 30,
                        // width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              child: Text(
                                'Colour:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                child: ColourList(
                                  customFunction: getColours,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),

                  Divider(color: Colors.grey),
                  //Cut Selection
                  Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Container(
                        // height: 30,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              child: Text(
                                'Cut:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                child: CutCategory(
                                  customFunction: getSelectedCut,
                                  key: _cutKey,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),

                  Divider(color: Colors.grey),
                  //Polish Selection
                  Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Container(
                        // height: 30,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              child: Text(
                                'Polish:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Container(
                                height: 30,
                                // width: MediaQuery.of(context).size.width - 75,
                                child: PolishCategory(
                                  customFunction: getSelectedPolish,
                                  key: _polKey,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),

                  Divider(color: Colors.grey),
                  //Symmetry Selection
                  Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Container(
                        // height: 30,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              // width: 75,
                              child: Text(
                                'Symmetry:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Container(
                                height: 30,
                                // width: MediaQuery.of(context).size.width - 100,
                                child: SymmetryCategory(
                                  customFunction: getSelectedSymm,
                                  key: _symmKey,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),

                  Divider(color: Colors.grey),
                  //Fluorescence Selection
                  Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Container(
                        // height: 30,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              // width: 95,
                              child: Text(
                                'Fluorescence:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Container(
                                height: 30,
                                // width: MediaQuery.of(context).size.width - 125,
                                child: FuorescenceCategory(
                                  customFunction: getSelectedFluo,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),

                  Divider(color: Colors.grey),
                  //Certificate Selection
                  Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Container(
                        // height: 30,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              // width: 80,
                              child: Text(
                                'Certificate:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Container(
                                height: 30,
                                // width: MediaQuery.of(context).size.width - 105,
                                child: CertificateCategory(
                                  customFunction: getSelectedCerti,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),

                  Divider(color: Colors.grey),
                  //Luster Selection
                  Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Container(
                        // height: 30,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              // width: 50,
                              child: Text(
                                'Luster:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Container(
                                height: 30,
                                // width: MediaQuery.of(context).size.width - 75,
                                child: LusterCategory(),
                              ),
                            )
                          ],
                        ),
                      )),

                  Divider(color: Colors.grey),
                  //Shades Selection
                  Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Container(
                        // height: 30,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              // width: 55,
                              child: Text(
                                'Shades:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Container(
                                height: 30,
                                // width: MediaQuery.of(context).size.width - 80,
                                child: ShadesCategory(),
                              ),
                            )
                          ],
                        ),
                      )),
                  Divider(color: Colors.grey),
                  //HNA Selection
                  Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Container(
                        // height: 30,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              child: Text(
                                'H&A:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Container(
                                height: 30,
                                // width: MediaQuery.of(context).size.width - 65,
                                child: HNACategory(),
                              ),
                            )
                          ],
                        ),
                      )),

                  Divider(color: Colors.grey),
                  //Black Inclusion
                  Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 30,
                                child: Text(
                                  'Black Inclusion:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                child: BlackIncCategory(),
                              ),
                            )
                          ],
                        ),
                      )),

                  Divider(color: Colors.grey),
                  //White Inclusion
                  Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 30,
                                child: Text(
                                  'White Inclusion:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                child: WhiteIncCategory(),
                              ),
                            )
                          ],
                        ),
                      )),

                  Divider(color: Colors.grey),
                  advSearchHidden ? Container() : AdvanceSearchOptions(),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        advSearchHidden = !advSearchHidden;
                        setState(() {});
                      },
                      child: Text(advSearchHidden
                          ? 'Show Advanced Search Options'
                          : 'Hide Advanced Search Options'),
                    ),
                  ),
                ],
              ),
            ),
          )),
    ));
  }
}
