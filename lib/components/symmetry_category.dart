import 'package:flutter/material.dart';

class SymmetryCategory extends StatefulWidget {
  final customFunction;
  SymmetryCategory({Key key, this.customFunction}) : super(key: key);
  @override
  SymmetryCategoryState createState() => SymmetryCategoryState();
}

class SymmetryCategoryState extends State<SymmetryCategory> {
  var symmetryList = [
    'ID',
    'EX',
    'VG',
    'GD',
    'PR',
    'FR',
  ];

  var selectedSymmetry = Map();

  updateVal(String val, bool stateVal) => setState(() {
        selectedSymmetry[val] = stateVal;
      });

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    widget.customFunction(selectedSymmetry);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    symmetryList.forEach((element) {
      selectedSymmetry[element] = false;
    });
    widget.customFunction(selectedSymmetry);
  }

  List<Widget> _getColourList() {
    List<Widget> colourListWidget = [];

    symmetryList.forEach((element) {
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
                      colors: selectedSymmetry[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  selectedSymmetry[element] = !selectedSymmetry[element];
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      color: selectedSymmetry[element]
                          ? Colors.white
                          : Colors.black),
                ),
                // color: selectedSymmetry[element]
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
                      colors: selectedSymmetry[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  selectedSymmetry[element] = !selectedSymmetry[element];
                  symmetryList.forEach((el) {
                    selectedSymmetry[el] = selectedSymmetry[element];
                  });
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      color: selectedSymmetry[element]
                          ? Colors.white
                          : Colors.black),
                ),
                // color: selectedSymmetry[element]
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
