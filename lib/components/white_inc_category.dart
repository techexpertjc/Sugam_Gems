import 'package:flutter/material.dart';

class WhiteIncCategory extends StatefulWidget {
  @override
  _WhiteIncCategoryState createState() => _WhiteIncCategoryState();
}

class _WhiteIncCategoryState extends State<WhiteIncCategory> {
  var whiteIncList = [
    'CW-0',
    'CW-1',
    'CW-2',
    'SW-0',
    'SW-1',
    'SW-2',
    'SW-4',
  ];

  var selectedWhiteInc = Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    whiteIncList.forEach((element) {
      selectedWhiteInc[element] = false;
    });
  }

  List<Widget> _getColourList() {
    List<Widget> colourListWidget = [];

    whiteIncList.forEach((element) {
      if (element != 'All') {
        colourListWidget.add(Padding(
            padding: EdgeInsets.only(left: 5),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: selectedWhiteInc[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  selectedWhiteInc[element] = !selectedWhiteInc[element];
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      color: selectedWhiteInc[element]
                          ? Colors.white
                          : Colors.black),
                ),
                // color: selectedWhiteInc[element]
                //     ? Colors.indigo[800]
                //     : Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(color: Colors.black)),
              ),
            )));
      } else {
        colourListWidget.add(Padding(
            padding: EdgeInsets.only(left: 5),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: selectedWhiteInc[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  selectedWhiteInc[element] = !selectedWhiteInc[element];
                  whiteIncList.forEach((el) {
                    selectedWhiteInc[el] = selectedWhiteInc[element];
                  });
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      color: selectedWhiteInc[element]
                          ? Colors.white
                          : Colors.black),
                ),
                // color: selectedWhiteInc[element]
                //     ? Colors.indigo[800]
                //     : Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(color: Colors.black)),
              ),
            )));
      }
    });

    return colourListWidget;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: _getColourList(),
    );
  }
}
