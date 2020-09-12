import 'package:flutter/material.dart';

class LusterCategory extends StatefulWidget {
  @override
  _LusterCategoryState createState() => _LusterCategoryState();
}

class _LusterCategoryState extends State<LusterCategory> {
  var lusterList = [
    'EX',
    'VG',
    'GD',
    'Milky 1',
    'Milky 2',
    'Milky 3',
  ];

  var selectedLuster = Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    lusterList.forEach((element) {
      selectedLuster[element] = false;
    });
  }

  List<Widget> _getColourList() {
    List<Widget> colourListWidget = [];

    lusterList.forEach((element) {
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
                      colors: selectedLuster[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  if (!FocusScope.of(context).hasPrimaryFocus) {
                    FocusScope.of(context).unfocus();
                  }
                  selectedLuster[element] = !selectedLuster[element];
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      color: selectedLuster[element]
                          ? Colors.white
                          : Colors.black),
                ),
                // color: selectedLuster[element]
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
                      colors: selectedLuster[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  if (!FocusScope.of(context).hasPrimaryFocus) {
                    FocusScope.of(context).unfocus();
                  }
                  selectedLuster[element] = !selectedLuster[element];
                  lusterList.forEach((el) {
                    selectedLuster[el] = selectedLuster[element];
                  });
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      color: selectedLuster[element]
                          ? Colors.white
                          : Colors.black),
                ),
                // color: selectedLuster[element]
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
