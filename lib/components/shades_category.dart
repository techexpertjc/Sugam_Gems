import 'package:flutter/material.dart';

class ShadesCategory extends StatefulWidget {
  @override
  _ShadesCategoryState createState() => _ShadesCategoryState();
}

class _ShadesCategoryState extends State<ShadesCategory> {
  var shadesList = ['None', 'Brown', 'Green', 'Mix Tings'];

  var selectedShades = Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    shadesList.forEach((element) {
      selectedShades[element] = false;
    });
  }

  List<Widget> _getColourList() {
    List<Widget> colourListWidget = [];

    shadesList.forEach((element) {
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
                      colors: selectedShades[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  if (!FocusScope.of(context).hasPrimaryFocus) {
                    FocusScope.of(context).unfocus();
                  }
                  selectedShades[element] = !selectedShades[element];
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      color: selectedShades[element]
                          ? Colors.white
                          : Colors.black),
                ),
                // color: selectedShades[element]
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
                      colors: selectedShades[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  if (!FocusScope.of(context).hasPrimaryFocus) {
                    FocusScope.of(context).unfocus();
                  }
                  selectedShades[element] = !selectedShades[element];
                  shadesList.forEach((el) {
                    selectedShades[el] = selectedShades[element];
                  });
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      color: selectedShades[element]
                          ? Colors.white
                          : Colors.black),
                ),
                // color: selectedShades[element]
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
