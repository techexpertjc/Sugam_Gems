import 'package:flutter/material.dart';

class CutCategory extends StatefulWidget {
  final customFunction;
  CutCategory({Key key, this.customFunction}) : super(key: key);
  @override
  CutCategoryState createState() => CutCategoryState();
}

class CutCategoryState extends State<CutCategory> {
  var cutList = [
    'ID',
    'EX',
    'VG',
    'GD',
    'PR',
    'FR',
  ];

  var selectedCut = Map();

  updateVal(String val, bool stateVal) => setState(() {
        selectedCut[val] = stateVal;
      });

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    widget.customFunction(selectedCut);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    cutList.forEach((element) {
      selectedCut[element] = false;
    });
    widget.customFunction(selectedCut);
  }

  List<Widget> _getColourList() {
    List<Widget> colourListWidget = [];

    cutList.forEach((element) {
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
                      colors: selectedCut[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  if (!FocusScope.of(context).hasPrimaryFocus) {
                    FocusScope.of(context).unfocus();
                  }
                  selectedCut[element] = !selectedCut[element];
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      fontSize: 15,
                      color: selectedCut[element]
                          ? Colors.white
                          : Colors.grey[700]),
                ),
                // color: selectedCut[element]
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
                      colors: selectedCut[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  if (!FocusScope.of(context).hasPrimaryFocus) {
                    FocusScope.of(context).unfocus();
                  }
                  selectedCut[element] = !selectedCut[element];
                  cutList.forEach((el) {
                    selectedCut[el] = selectedCut[element];
                  });
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      color: selectedCut[element]
                          ? Colors.white
                          : Colors.grey[700]),
                ),
                // color:
                //     selectedCut[element] ? Colors.indigo[800] : Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(color: Colors.grey[700])),
              ),
            )));
      }
    });

    return colourListWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: _getColourList(),
      ),
    );
  }
}
