import 'package:flutter/material.dart';

class HNACategory extends StatefulWidget {
  @override
  _HNACategoryState createState() => _HNACategoryState();
}

class _HNACategoryState extends State<HNACategory> {
  var hnaList = ['EX', 'VG', 'GD'];

  var selectedHNA = Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    hnaList.forEach((element) {
      selectedHNA[element] = false;
    });
  }

  List<Widget> _getColourList() {
    List<Widget> colourListWidget = [];

    hnaList.forEach((element) {
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
                      colors: selectedHNA[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  if (!FocusScope.of(context).hasPrimaryFocus) {
                    FocusScope.of(context).unfocus();
                  }
                  selectedHNA[element] = !selectedHNA[element];
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      color:
                          selectedHNA[element] ? Colors.white : Colors.black),
                ),
                // color:
                // selectedHNA[element] ? Colors.indigo[800] : Colors.transparent,
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
                      colors: selectedHNA[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  if (!FocusScope.of(context).hasPrimaryFocus) {
                    FocusScope.of(context).unfocus();
                  }
                  selectedHNA[element] = !selectedHNA[element];
                  hnaList.forEach((el) {
                    selectedHNA[el] = selectedHNA[element];
                  });
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      color:
                          selectedHNA[element] ? Colors.white : Colors.black),
                ),
                // color:
                //     selectedHNA[element] ? Colors.indigo[800] : Colors.transparent,
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
