import 'package:flutter/material.dart';

class FuorescenceCategory extends StatefulWidget {
  final customFunction;
  FuorescenceCategory({Key key, this.customFunction}) : super(key: key);
  @override
  _FuorescenceCategoryState createState() => _FuorescenceCategoryState();
}

class _FuorescenceCategoryState extends State<FuorescenceCategory> {
  var fuorescenceList = [
    'NON',
    'VSL',
    'FNT',
    'MED',
    'STG',
    'VST',
  ];

  var selectedFuorescence = Map();

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    widget.customFunction(selectedFuorescence);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fuorescenceList.forEach((element) {
      selectedFuorescence[element] = false;
    });
  }

  List<Widget> _getColourList() {
    List<Widget> colourListWidget = [];

    fuorescenceList.forEach((element) {
      if (element != 'All') {
        colourListWidget.add(Padding(
            padding: EdgeInsets.only(left: 5),
            child: Container(
              width: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: selectedFuorescence[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  selectedFuorescence[element] = !selectedFuorescence[element];
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      fontSize: 15,
                      color: selectedFuorescence[element]
                          ? Colors.white
                          : Colors.grey[700]),
                ),
                // color: selectedFuorescence[element]
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
                      colors: selectedFuorescence[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  selectedFuorescence[element] = !selectedFuorescence[element];
                  fuorescenceList.forEach((el) {
                    selectedFuorescence[el] = selectedFuorescence[element];
                  });
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      color: selectedFuorescence[element]
                          ? Colors.white
                          : Colors.grey[700]),
                ),
                // color: selectedFuorescence[element]
                //     ? Colors.indigo[800]
                //     : Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(color: Colors.grey[700])),
              )),
        ));
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
