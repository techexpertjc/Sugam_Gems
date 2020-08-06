import 'package:flutter/material.dart';

class PolishCategory extends StatefulWidget {
  final customFunction;
  PolishCategory({Key key, this.customFunction}) : super(key: key);
  @override
  PolishCategoryState createState() => PolishCategoryState();
}

class PolishCategoryState extends State<PolishCategory> {
  var polishList = [
    'ID',
    'EX',
    'VG',
    'GD',
    'PR',
    'FR',
  ];

  var selectedPolish = Map();

  updateVal(String val, bool stateVal) => setState(() {
        selectedPolish[val] = stateVal;
      });

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    widget.customFunction(selectedPolish);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    polishList.forEach((element) {
      selectedPolish[element] = false;
    });
    widget.customFunction(selectedPolish);
  }

  List<Widget> _getColourList() {
    List<Widget> colourListWidget = [];

    polishList.forEach((element) {
      if (element != 'All') {
        colourListWidget.add(Padding(
            padding: EdgeInsets.only(left: 5),
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: selectedPolish[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  selectedPolish[element] = !selectedPolish[element];
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      fontSize: 15,
                      color: selectedPolish[element]
                          ? Colors.white
                          : Colors.grey[700]),
                ),
                // color: selectedPolish[element]
                //     ? Colors.indigo[800]
                //     : Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.grey)),
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
                      colors: selectedPolish[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  selectedPolish[element] = !selectedPolish[element];
                  polishList.forEach((el) {
                    selectedPolish[el] = selectedPolish[element];
                  });
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      fontSize: 15,
                      color: selectedPolish[element]
                          ? Colors.white
                          : Colors.grey[700]),
                ),
                // color: selectedPolish[element]
                //     ? Colors.indigo[800]
                //     : Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(color: Colors.grey)),
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
