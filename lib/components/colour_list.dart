import 'package:flutter/material.dart';

class ColourList extends StatefulWidget {
  final customFunction;
  ColourList({Key key, this.customFunction}) : super(key: key);
  @override
  _ColourListState createState() => _ColourListState();
}

class _ColourListState extends State<ColourList> {
  var colourList = [
    'All',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'Fancy'
  ];

  var selectedColour = Map();

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    widget.customFunction(selectedColour);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    colourList.forEach((element) {
      selectedColour[element] = false;
    });
  }

  List<Widget> _getColourList() {
    List<Widget> colourListWidget = [];

    colourList.forEach((element) {
      if (element != 'All') {
        colourListWidget.add(Padding(
            padding: EdgeInsets.only(left: 5),
            child: Container(
              // height: 40,
              width: element.toLowerCase() == 'fancy' ? 80 : 50,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: selectedColour[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  selectedColour[element] = !selectedColour[element];
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      fontFamily: 'ClearSansLight',
                      fontSize: 15,
                      color: selectedColour[element]
                          ? Colors.white
                          : Colors.grey[700]),
                ),
                // color: selectedColour[element]
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
              height: 50,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: selectedColour[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  selectedColour[element] = !selectedColour[element];
                  colourList.forEach((el) {
                    selectedColour[el] = selectedColour[element];
                  });
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      fontFamily: 'ClearSansLight',
                      fontSize: 15,
                      color: selectedColour[element]
                          ? Colors.white
                          : Colors.grey[700]),
                ),
                // color: selectedColour[element]
                //     ? Colors.indigo[800]
                //     : Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
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
