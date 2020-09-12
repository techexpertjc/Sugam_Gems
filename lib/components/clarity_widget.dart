import 'package:flutter/material.dart';

class ClarityChoices extends StatefulWidget {
  final customFunction;
  ClarityChoices({Key key, this.customFunction}) : super(key: key);
  @override
  _ClarityChoicesState createState() => _ClarityChoicesState();
}

class _ClarityChoicesState extends State<ClarityChoices> {
  bool flSelected = false,
      ifSelected = false,
      vvs1Selected = false,
      vvs2Selected = false,
      vs1Selected = false,
      vs2Selected = false,
      si1Selected = false,
      si2Selected = false,
      si3Selected = false,
      i1Selected = false,
      i2Selected = false,
      i3Selected = false;

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);

    widget.customFunction(
        flSelected,
        ifSelected,
        vvs1Selected,
        vvs2Selected,
        vs1Selected,
        vs2Selected,
        si1Selected,
        si2Selected,
        si3Selected,
        i1Selected,
        i2Selected,
        i3Selected);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Container(
        // height: 30.0,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
                height: 30,
                child: Text(
                  'Clarity',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topLeft,
                                  colors: flSelected
                                      ? [Colors.blue[300], Colors.blue[900]]
                                      : [
                                          Colors.transparent,
                                          Colors.transparent
                                        ])),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.grey)),
                            onPressed: () {
                              if (!FocusScope.of(context).hasPrimaryFocus) {
                                FocusScope.of(context).unfocus();
                              }
                              flSelected = !flSelected;
                              setState(() {});
                            },
                            child: Text(
                              'FL',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: flSelected
                                      ? Colors.white
                                      : Colors.grey[700]),
                            ),
                            // color: flSelected
                            //     ? Colors.indigo[800]
                            //     : Colors.transparent,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topLeft,
                                  colors: ifSelected
                                      ? [Colors.blue[300], Colors.blue[900]]
                                      : [
                                          Colors.transparent,
                                          Colors.transparent
                                        ])),
                          child: FlatButton(
                            onPressed: () {
                              if (!FocusScope.of(context).hasPrimaryFocus) {
                                FocusScope.of(context).unfocus();
                              }
                              ifSelected = !ifSelected;
                              setState(() {});
                            },
                            child: Text(
                              'IF',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: ifSelected
                                      ? Colors.white
                                      : Colors.grey[700]),
                            ),
                            // color: ifSelected
                            //     ? Colors.indigo[800]
                            //     : Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.grey)),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topLeft,
                                  colors: vvs1Selected
                                      ? [Colors.blue[300], Colors.blue[900]]
                                      : [
                                          Colors.transparent,
                                          Colors.transparent
                                        ])),
                          child: FlatButton(
                            onPressed: () {
                              if (!FocusScope.of(context).hasPrimaryFocus) {
                                FocusScope.of(context).unfocus();
                              }
                              vvs1Selected = !vvs1Selected;
                              setState(() {});
                            },
                            child: Text(
                              'VVS1',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: vvs1Selected
                                      ? Colors.white
                                      : Colors.grey[700]),
                            ),
                            // color: vvs1Selected
                            //     ? Colors.indigo[800]
                            //     : Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.grey)),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topLeft,
                                  colors: vvs2Selected
                                      ? [Colors.blue[300], Colors.blue[900]]
                                      : [
                                          Colors.transparent,
                                          Colors.transparent
                                        ])),
                          child: FlatButton(
                            onPressed: () {
                              if (!FocusScope.of(context).hasPrimaryFocus) {
                                FocusScope.of(context).unfocus();
                              }
                              vvs2Selected = !vvs2Selected;
                              setState(() {});
                            },
                            child: Text(
                              'VVS2',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: vvs2Selected
                                      ? Colors.white
                                      : Colors.grey[700]),
                            ),
                            // color: vvs2Selected
                            //     ? Colors.indigo[800]
                            //     : Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.grey)),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Container(
                          width: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topLeft,
                                  colors: vs1Selected
                                      ? [Colors.blue[300], Colors.blue[900]]
                                      : [
                                          Colors.transparent,
                                          Colors.transparent
                                        ])),
                          child: FlatButton(
                            onPressed: () {
                              if (!FocusScope.of(context).hasPrimaryFocus) {
                                FocusScope.of(context).unfocus();
                              }
                              vs1Selected = !vs1Selected;
                              setState(() {});
                            },
                            child: Text(
                              'VS1',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: vs1Selected
                                      ? Colors.white
                                      : Colors.grey[700]),
                            ),
                            // color: vs1Selected
                            //     ? Colors.indigo[800]
                            //     : Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.grey)),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Container(
                          width: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topLeft,
                                  colors: vs2Selected
                                      ? [Colors.blue[300], Colors.blue[900]]
                                      : [
                                          Colors.transparent,
                                          Colors.transparent
                                        ])),
                          child: FlatButton(
                            onPressed: () {
                              if (!FocusScope.of(context).hasPrimaryFocus) {
                                FocusScope.of(context).unfocus();
                              }
                              vs2Selected = !vs2Selected;
                              setState(() {});
                            },
                            child: Text(
                              'VS2',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: vs2Selected
                                      ? Colors.white
                                      : Colors.grey[700]),
                            ),
                            // color: vs2Selected
                            //     ? Colors.indigo[800]
                            //     : Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.grey)),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Container(
                          width: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topLeft,
                                  colors: si1Selected
                                      ? [Colors.blue[300], Colors.blue[900]]
                                      : [
                                          Colors.transparent,
                                          Colors.transparent
                                        ])),
                          child: FlatButton(
                            onPressed: () {
                              if (!FocusScope.of(context).hasPrimaryFocus) {
                                FocusScope.of(context).unfocus();
                              }
                              si1Selected = !si1Selected;
                              setState(() {});
                            },
                            child: Text(
                              'SI1',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: si1Selected
                                      ? Colors.white
                                      : Colors.grey[700]),
                            ),
                            // color: si1Selected
                            //     ? Colors.indigo[800]
                            //     : Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.grey)),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Container(
                          width: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topLeft,
                                  colors: si2Selected
                                      ? [Colors.blue[300], Colors.blue[900]]
                                      : [
                                          Colors.transparent,
                                          Colors.transparent
                                        ])),
                          child: FlatButton(
                            onPressed: () {
                              if (!FocusScope.of(context).hasPrimaryFocus) {
                                FocusScope.of(context).unfocus();
                              }
                              si2Selected = !si2Selected;
                              setState(() {});
                            },
                            child: Text(
                              'SI2',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: si2Selected
                                      ? Colors.white
                                      : Colors.grey[700]),
                            ),
                            // color: si2Selected
                            //     ? Colors.indigo[800]
                            //     : Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.grey)),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Container(
                          width: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topLeft,
                                  colors: si3Selected
                                      ? [Colors.blue[300], Colors.blue[900]]
                                      : [
                                          Colors.transparent,
                                          Colors.transparent
                                        ])),
                          child: FlatButton(
                            onPressed: () {
                              if (!FocusScope.of(context).hasPrimaryFocus) {
                                FocusScope.of(context).unfocus();
                              }
                              si3Selected = !si3Selected;
                              setState(() {});
                            },
                            child: Text(
                              'SI3',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: si3Selected
                                      ? Colors.white
                                      : Colors.grey[700]),
                            ),
                            // color: si3Selected
                            //     ? Colors.indigo[800]
                            //     : Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.grey)),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Container(
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topLeft,
                                colors: i1Selected
                                    ? [Colors.blue[300], Colors.blue[900]]
                                    : [
                                        Colors.transparent,
                                        Colors.transparent
                                      ])),
                        child: FlatButton(
                          onPressed: () {
                            if (!FocusScope.of(context).hasPrimaryFocus) {
                              FocusScope.of(context).unfocus();
                            }
                            i1Selected = !i1Selected;
                            setState(() {});
                          },
                          child: Text(
                            'I1',
                            style: TextStyle(
                                fontSize: 15,
                                color: i1Selected
                                    ? Colors.white
                                    : Colors.grey[700]),
                          ),
                          // color: i1Selected
                          //     ? Colors.indigo[800]
                          //     : Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: Colors.grey)),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topLeft,
                                  colors: i2Selected
                                      ? [Colors.blue[300], Colors.blue[900]]
                                      : [
                                          Colors.transparent,
                                          Colors.transparent
                                        ])),
                          child: FlatButton(
                            onPressed: () {
                              if (!FocusScope.of(context).hasPrimaryFocus) {
                                FocusScope.of(context).unfocus();
                              }
                              i2Selected = !i2Selected;
                              setState(() {});
                            },
                            child: Text(
                              'I2',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: i2Selected
                                      ? Colors.white
                                      : Colors.grey[700]),
                            ),
                            // color: i2Selected
                            //     ? Colors.indigo[800]
                            //     : Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.grey)),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topLeft,
                                  colors: i3Selected
                                      ? [Colors.blue[300], Colors.blue[900]]
                                      : [
                                          Colors.transparent,
                                          Colors.transparent
                                        ])),
                          child: FlatButton(
                            onPressed: () {
                              if (!FocusScope.of(context).hasPrimaryFocus) {
                                FocusScope.of(context).unfocus();
                              }
                              i3Selected = !i3Selected;
                              setState(() {});
                            },
                            child: Text(
                              'I3',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: i3Selected
                                      ? Colors.white
                                      : Colors.grey[700]),
                            ),
                            // color: i3Selected
                            //     ? Colors.indigo[800]
                            //     : Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.grey)),
                          ),
                        ))
                  ],
                ),
              ),
            ),

            //Colour Selection
          ],
        ),
      ),
    );
  }
}
