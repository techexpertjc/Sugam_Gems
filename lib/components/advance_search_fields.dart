import 'package:flutter/material.dart';

class AdvanceSearchOptions extends StatefulWidget {
  @override
  _AdvanceSearchOptionsState createState() => _AdvanceSearchOptionsState();
}

class _AdvanceSearchOptionsState extends State<AdvanceSearchOptions> {
  var advanceSearchOptionList = [
    'Discount%',
    '\$/ct.%',
    'Ratio',
    'Pavilion Height',
    'Gridle%',
    'Length',
    'Pavilion Angle',
    'Table%',
    'Width',
    'Crown Height',
    'Star Length',
    'Height',
    'Crown Angle',
    'Lower Half'
  ];

  var fromToAdvanceOptions = Map();

  List<Widget> getAdvSearchOptions() {
    List<Widget> tempList = [];

    advanceSearchOptionList.forEach((element) {
      fromToAdvanceOptions[element] = Map();
      fromToAdvanceOptions[element]['fromCntrlr'] = TextEditingController();
      fromToAdvanceOptions[element]['toCntrlr'] = TextEditingController();
      tempList.add(Container(
        height: 50,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      height: 40,
                      child: Text(
                        element + ' :',
                        style: TextStyle(color: Colors.black),
                      ),
                      width:
                          ((MediaQuery.of(context).size.width - 20) / 3) - 35,
                    ),
                    Container(
                      height: 30,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: TextFormField(
                          controller: fromToAdvanceOptions[element]
                              ['fromCntrlr'] = TextEditingController(),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixText: element.contains('%') ? '%' : '',
                              hintText: 'From',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black))),
                      width: (MediaQuery.of(context).size.width - 20) / 3,
                    ),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: TextFormField(
                          controller: fromToAdvanceOptions[element]
                              ['toCntrlr'] = TextEditingController(),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixText: element.contains('%') ? '%' : '',
                              hintText: 'To',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black))),
                      width: (MediaQuery.of(context).size.width - 20) / 3,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ));
    });

    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.parse((advanceSearchOptionList.length * 50).toString()),
      child: Column(
        children: getAdvSearchOptions(),
      ),
    );
  }
}
