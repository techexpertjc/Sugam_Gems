import 'package:flutter/material.dart';

class BlackIncCategory extends StatefulWidget {
  @override
  _BlackIncCategoryState createState() => _BlackIncCategoryState();
}

class _BlackIncCategoryState extends State<BlackIncCategory> {
  var blackIncList = [
    'CBL-0',
    'CBL-1',
    'CBL-2',
    'SBL-0',
    'SBL-1',
  ];

  var selectedBlackInc = Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    blackIncList.forEach((element) {
      selectedBlackInc[element] = false;
    });
  }

  List<Widget> _getColourList() {
    List<Widget> colourListWidget = [];

    blackIncList.forEach((element) {
      if (element != 'All') {
        colourListWidget.add(Padding(
            padding: EdgeInsets.only(left: 5),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: selectedBlackInc[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  selectedBlackInc[element] = !selectedBlackInc[element];
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      color: selectedBlackInc[element]
                          ? Colors.white
                          : Colors.black),
                ),
                // color: selectedBlackInc[element]
                //     ? Colors.indigo[800]
                //     : Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.black)),
              ),
            )));
      } else {
        colourListWidget.add(Padding(
            padding: EdgeInsets.only(left: 5),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: selectedBlackInc[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  selectedBlackInc[element] = !selectedBlackInc[element];
                  blackIncList.forEach((el) {
                    selectedBlackInc[el] = selectedBlackInc[element];
                  });
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      color: selectedBlackInc[element]
                          ? Colors.white
                          : Colors.black),
                ),
                // color: selectedBlackInc[element]
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
