import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';

import 'package:sugam_gems/components/certificate_category.dart';
import 'package:sugam_gems/components/clarity_widget.dart';
import 'package:sugam_gems/components/colour_list.dart';
import 'package:sugam_gems/components/cut_category.dart';
import 'package:sugam_gems/components/fluorescence_category.dart';

import 'package:sugam_gems/components/polish_category.dart';

import 'package:sugam_gems/components/stone_shapes.dart';
import 'package:sugam_gems/components/symmetry_category.dart';

import 'package:sugam_gems/screens/search_results.dart';

class StoneSearch extends StatefulWidget {
  @override
  _StoneSearchState createState() => _StoneSearchState();
}

class _StoneSearchState extends State<StoneSearch> {
  Set<String> _caratList = Set();
  TextEditingController fromCaratCntrlr = TextEditingController(),
      toCaratCntrlr = TextEditingController(),
      CaratValueCntrlr = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool advSearchHidden = true;

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
      i3Selected = false;

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
    if (_caratList.length < 1) {
      if (fromCaratCntrlr.text != '') {
        if (toCaratCntrlr.text != '') {
          _caratList.add(
              fromCaratCntrlr.text.trim() + '-' + toCaratCntrlr.text.trim());
        } else {
          _caratList.add(fromCaratCntrlr.text.trim() + '-' + '99');
        }
        fromCaratCntrlr.text = '';
        toCaratCntrlr.text = '';
        CaratValueCntrlr.text = _caratList.join(',');
      }
    }
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

    String caratFrom = "", caratTo = "";
    if (carats == null || carats.length == 0 || carats == "") {
      caratFrom = fromCaratCntrlr.text;
      caratTo = toCaratCntrlr.text;
    }

    var data = Map<String, String>();
    data["Shape"] = shape;
    data["CtsFrom"] = caratFrom;
    data["CtsTo"] = caratTo;
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

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SearchResults(
                      reqData: data,
                    )));
      }
    } on SocketException catch (_) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Please connect the device to active Internet')));
    }

    // print(res);
    // Navigator.of(context).pushNamed('/searchResults');
  }

  final GlobalKey<CutCategoryState> _cutKey = GlobalKey();
  final GlobalKey<PolishCategoryState> _polKey = GlobalKey();
  final GlobalKey<SymmetryCategoryState> _symmKey = GlobalKey();
  bool is3EXSelected = false, is2VgSelected = false, is2ExSelected = false;

  final FocusNode _nodeText1 = FocusNode();
  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: [
          KeyboardActionsItem(focusNode: _nodeText1, toolbarButtons: [
            (node) {
              return GestureDetector(
                onTap: () => node.unfocus(),
                child: Container(
                  color: Color(0XFFB8C6FF),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "DONE",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              );
            }
          ])
        ]);
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: [Colors.black12, Colors.black54]),
                ),
                width: 100,
                height: 35,
                child: FlatButton(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {
                    if (!FocusScope.of(context).hasPrimaryFocus) {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        if (_caratList.length < 1) {
                          if (fromCaratCntrlr.text != '') {
                            if (toCaratCntrlr.text != '') {
                              _caratList.add(fromCaratCntrlr.text.trim() +
                                  '-' +
                                  toCaratCntrlr.text.trim());
                            } else {
                              _caratList.add(
                                  fromCaratCntrlr.text.trim() + '-' + '99');
                            }
                            fromCaratCntrlr.text = '';
                            toCaratCntrlr.text = '';
                            CaratValueCntrlr.text = _caratList.join(',');
                          }
                        }
                      });
                    }

                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => StoneSearch(),
                        transitionDuration: Duration.zero,
                      ),
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.refresh,
                        size: 15,
                        color: Colors.white,
                      ),
                      Text(
                        ' Reset',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: [Colors.black12, Colors.black54]),
                ),
                width: 100,
                height: 35,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: searchStone,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        size: 15,
                        color: Colors.white,
                      ),
                      Text(
                        ' Search',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Stone Search'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                if (!FocusScope.of(context).hasPrimaryFocus) {
                  FocusScope.of(context).unfocus();
                }

                // print(Navigator.of(context));
                Navigator.popUntil(context, ModalRoute.withName('/home'));
              })
        ],
      ),
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () {
          if (!FocusScope.of(context).hasPrimaryFocus) {
            FocusScope.of(context).unfocus();
            setState(() {
              if (_caratList.length < 1) {
                if (fromCaratCntrlr.text != '') {
                  if (toCaratCntrlr.text != '') {
                    _caratList.add(fromCaratCntrlr.text.trim() +
                        '-' +
                        toCaratCntrlr.text.trim());
                  } else {
                    _caratList.add(fromCaratCntrlr.text.trim() + '-' + '99');
                  }
                  fromCaratCntrlr.text = '';
                  toCaratCntrlr.text = '';
                  CaratValueCntrlr.text = _caratList.join(',');
                }
              }
            });
          }
        },
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
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

                    //Carat Selection
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Carat ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.black),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 35.0,
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      focusNode: _nodeText1,
                                      style: TextStyle(color: Colors.grey[700]),
                                      controller: fromCaratCntrlr,
                                      inputFormatters: [
                                        NumberTextInputFormatter(
                                            decimalRange: 2)
                                      ],
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              decimal: true),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'From',
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Container(
                                    height: 35.0,
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7))),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: TextFormField(
                                        focusNode: _nodeText1,
                                        style:
                                            TextStyle(color: Colors.grey[700]),
                                        controller: toCaratCntrlr,
                                        inputFormatters: [
                                          NumberTextInputFormatter(
                                              decimalRange: 2)
                                        ],
                                        keyboardType:
                                            TextInputType.numberWithOptions(
                                                decimal: true),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'To',
                                            hintStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey)),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Container(
                                      width: 50,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          if (!FocusScope.of(context)
                                              .hasPrimaryFocus) {
                                            FocusScope.of(context).unfocus();
                                          }
                                          if (!FocusScope.of(context)
                                              .hasPrimaryFocus) {
                                            FocusScope.of(context).unfocus();
                                          }
                                          if (fromCaratCntrlr.text.trim() !=
                                              '') {
                                            _caratList.add(
                                                fromCaratCntrlr.text.trim() +
                                                    '-' +
                                                    '99');
                                            setState(() {
                                              fromCaratCntrlr.text = '';
                                              toCaratCntrlr.text = '';
                                              CaratValueCntrlr.text =
                                                  _caratList.join(',');
                                            });
                                          }
                                          if (fromCaratCntrlr.text.trim() !=
                                                  '' &&
                                              toCaratCntrlr.text.trim() != '') {
                                            _caratList.add(
                                                fromCaratCntrlr.text.trim() +
                                                    '-' +
                                                    toCaratCntrlr.text.trim());

                                            setState(() {
                                              fromCaratCntrlr.text = '';
                                              toCaratCntrlr.text = '';
                                              CaratValueCntrlr.text =
                                                  _caratList.join(',');
                                            });
                                          }
                                          if (!FocusScope.of(context)
                                              .hasPrimaryFocus) {
                                            FocusScope.of(context).unfocus();
                                          }
                                          // // print(fromCaratCntrlr.text.trim() +
                                          //     '-' +
                                          //     toCaratCntrlr.text.trim());
                                          // print(MediaQuery.of(context).size.width);
                                        },
                                        elevation: 2.0,
                                        fillColor: Colors.white,
                                        child: Icon(
                                          Icons.add,
                                          size: 30,
                                          // color: Colors.white,
                                        ),
                                        shape: CircleBorder(
                                            side:
                                                BorderSide(color: Colors.grey)),
                                      ),
                                    )),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Container(
                                        // padding: EdgeInsets.only(bottom: 0, top: 0),
                                        alignment: Alignment.center,
                                        height: 35.0,
                                        // width: 100.0,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7))),
                                        child: TextFormField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          style: TextStyle(
                                              color: Colors.grey[700]),
                                          controller: CaratValueCntrlr,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 15),
                                            border: InputBorder.none,
                                          ),
                                        )),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  child: RawMaterialButton(
                                      shape: CircleBorder(
                                          side: BorderSide(color: Colors.grey)),
                                      child: Icon(Icons.close),
                                      onPressed: () {
                                        if (!FocusScope.of(context)
                                            .hasPrimaryFocus) {
                                          FocusScope.of(context).unfocus();
                                        }
                                        if (!FocusScope.of(context)
                                            .hasPrimaryFocus) {
                                          FocusScope.of(context).unfocus();
                                        }
                                        setState(() {
                                          _caratList.clear();
                                          CaratValueCntrlr.text = '';
                                        });
                                      }),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    //Carat Tags
                    // Padding(
                    //   padding:
                    //       EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    //   child: Container(
                    //     height: 30,
                    //     width: MediaQuery.of(context).size.width,
                    //     child: Row(
                    //       children: <Widget>[
                    //         Padding(
                    //           padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    //           child: Container(
                    //             color: Colors.transparent,
                    //             width: 100,
                    //             child: (_caratList.length >= 1)
                    //                 ? RaisedButton(
                    //                     // color: Colors.transparent,
                    //                     shape: Border.all(color: Colors.grey),
                    //                     onPressed: () {
                    // if (!FocusScope.of(context)
                    //     .hasPrimaryFocus) {
                    //   FocusScope.of(context).unfocus();
                    // }  if (!FocusScope.of(context).hasPrimaryFocus) {FocusScope.of(context).unfocus();}
                    //                       _caratList.clear();
                    //                       setState(() {});
                    //                     },
                    //                     child: Text(
                    //                       'Clear All',
                    //                       style: TextStyle(color: Colors.black),
                    //                     ),
                    //                   )
                    //                 : Container(),
                    //           ),
                    //         ),
                    //         Container(
                    //           width: MediaQuery.of(context).size.width - 110 - 20,
                    //           child: ListView(
                    //             shrinkWrap: true,
                    //             scrollDirection: Axis.horizontal,
                    //             children: _getCaratList(),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    //Clarity
                    ClarityChoices(
                      customFunction: updateClarity,
                    ),

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
                                  'Colour',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width,
                                  child: ColourList(
                                    customFunction: getColours,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),

                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Finishing: ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 3),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topLeft,
                                        colors: is3EXSelected
                                            ? [
                                                Colors.blue[300],
                                                Colors.blue[900]
                                              ]
                                            : [Colors.white, Colors.white]),
                                  ),
                                  width: 60,
                                  height: 35,
                                  child: FlatButton(
                                      onPressed: () {
                                        if (!FocusScope.of(context)
                                            .hasPrimaryFocus) {
                                          FocusScope.of(context).unfocus();
                                        }
                                        if (!FocusScope.of(context)
                                            .hasPrimaryFocus) {
                                          FocusScope.of(context).unfocus();
                                        }
                                        setState(() {
                                          is3EXSelected = !is3EXSelected;
                                          _cutKey.currentState
                                              .updateVal("EX", is3EXSelected);
                                          _polKey.currentState
                                              .updateVal("EX", is3EXSelected);
                                          _symmKey.currentState
                                              .updateVal("EX", is3EXSelected);
                                        });
                                      },
                                      child: Text(
                                        '3EX',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: is3EXSelected
                                                ? Colors.white
                                                : Colors.black),
                                      )),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topLeft,
                                        colors: is2VgSelected
                                            ? [
                                                Colors.blue[300],
                                                Colors.blue[900]
                                              ]
                                            : [Colors.white, Colors.white]),
                                  ),
                                  width: 80,
                                  height: 35,
                                  child: FlatButton(
                                      onPressed: () {
                                        if (!FocusScope.of(context)
                                            .hasPrimaryFocus) {
                                          FocusScope.of(context).unfocus();
                                        }
                                        if (!FocusScope.of(context)
                                            .hasPrimaryFocus) {
                                          FocusScope.of(context).unfocus();
                                        }
                                        setState(() {
                                          is2VgSelected = !is2VgSelected;
                                          _cutKey.currentState
                                              .updateVal("EX", is2VgSelected);
                                          _polKey.currentState
                                              .updateVal("EX", is2VgSelected);
                                          _symmKey.currentState
                                              .updateVal("EX", is2VgSelected);
                                          _cutKey.currentState
                                              .updateVal("VG", is2VgSelected);
                                          _polKey.currentState
                                              .updateVal("VG", is2VgSelected);
                                          _symmKey.currentState
                                              .updateVal("VG", is2VgSelected);
                                        });
                                      },
                                      child: Text('3VG+',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: is2VgSelected
                                                  ? Colors.white
                                                  : Colors.black))),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topLeft,
                                        colors: is2ExSelected
                                            ? [
                                                Colors.blue[300],
                                                Colors.blue[900]
                                              ]
                                            : [Colors.white, Colors.white]),
                                  ),
                                  width: 60,
                                  height: 35,
                                  child: FlatButton(
                                      onPressed: () {
                                        if (!FocusScope.of(context)
                                            .hasPrimaryFocus) {
                                          FocusScope.of(context).unfocus();
                                        }
                                        if (!FocusScope.of(context)
                                            .hasPrimaryFocus) {
                                          FocusScope.of(context).unfocus();
                                        }
                                        setState(() {
                                          is2ExSelected = !is2ExSelected;
                                          _cutKey.currentState
                                              .updateVal("EX", is2ExSelected);
                                          _polKey.currentState
                                              .updateVal("EX", is2ExSelected);
                                        });
                                      },
                                      child: Text('2EX',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: is2ExSelected
                                                  ? Colors.white
                                                  : Colors.black))),
                                )),
                          ],
                        ),
                      ),
                    ),

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
                                  'Cut',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Container(
                                  height: 40,
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
                                  'Polish',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Container(
                                  height: 40,
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
                                  'Symmetry',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Container(
                                  height: 40,
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
                                  'Fluorescence',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Container(
                                  height: 40,
                                  // width: MediaQuery.of(context).size.width - 125,
                                  child: FuorescenceCategory(
                                    customFunction: getSelectedFluo,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),

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
                                  'Certificate',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Container(
                                  height: 40,
                                  // width: MediaQuery.of(context).size.width - 105,
                                  child: CertificateCategory(
                                    customFunction: getSelectedCerti,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    Padding(padding: EdgeInsets.all(20))
                  ],
                ),
              ),
            )),
      ),
    ));
  }
}

class NumberTextInputFormatter extends TextInputFormatter {
  NumberTextInputFormatter({this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    TextEditingValue _newValue = this.sanitize(newValue);
    String text = _newValue.text;

    if (decimalRange == null) {
      return _newValue;
    }

    if (text == '.') {
      return TextEditingValue(
        text: '0.',
        selection: _newValue.selection.copyWith(baseOffset: 2, extentOffset: 2),
        composing: TextRange.empty,
      );
    }

    return this.isValid(text) ? _newValue : oldValue;
  }

  bool isValid(String text) {
    int dots = '.'.allMatches(text).length;

    if (dots == 0 && text.length < 4) {
      return true;
    }

    if (dots > 1 && text.length > 3) {
      return false;
    }

    return text.substring(text.indexOf('.') + 1).length <= decimalRange;
  }

  TextEditingValue sanitize(TextEditingValue value) {
    if (false == value.text.contains('-')) {
      return value;
    }

    String text = '-' + value.text.replaceAll('-', '');

    return TextEditingValue(
        text: text, selection: value.selection, composing: TextRange.empty);
  }
}
