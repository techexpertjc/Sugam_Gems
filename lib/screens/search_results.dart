import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sugam_gems/components/call_service.dart';
import 'package:sugam_gems/components/ozone_diaicon_icons.dart';

class SearchResults extends StatefulWidget {
  final Map reqData;
  SearchResults({Key key, this.reqData}) : super(key: key);
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  Map requestData = Map();
  Map response;
  List searchResultList;
  int pageCnt = 1, totalrecords;
  bool dataLoaded = false;
  @override
  void initState() {
    super.initState();
    requestData = widget.reqData;
    getSearchResults();
  }

  void getSearchResults() {
    dataLoaded = false;
    int strt = pageCnt * 10 - 9, end = pageCnt * 10;

    requestData["Start"] = strt.toString();
    requestData["End"] = end.toString();

    var serviceObj = CallService();
    serviceObj
        .callService('http://sugamgems.com/MobAppService.svc/GetStockapp',
            json.encode(requestData))
        .then((value) {
      setState(() {
        print(requestData);
        dataLoaded = true;
        response = json.decode(value);
        totalrecords = int.parse(response["GetStockappResult"]["TotalPcs"]);
        searchResultList = response["GetStockappResult"]["Result"];
        print(searchResultList.length);
      });
    });
  }

  Widget getShape(String shapeName) {
    switch (shapeName.toLowerCase()) {
      case 'round':
        return Column(
          children: <Widget>[
            Icon(
              OzoneDiaicon.round,
              size: 50,
            ),
            Text(shapeName)
          ],
        );
    }
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  void loadPageResults() {
    int strt = pageCnt * 10 - 9, end = pageCnt * 10;
    if (strt <= totalrecords && pageCnt >= 1) {
      setState(() {
        dataLoaded = false;
      });
      if (end > totalrecords) end = totalrecords;
      requestData["Start"] = strt.toString();
      requestData["End"] = end.toString();

      var serviceObj = CallService();
      serviceObj
          .callService('http://sugamgems.com/MobAppService.svc/GetStockapp',
              json.encode(requestData))
          .then((value) {
        setState(() {
          print(requestData);
          dataLoaded = true;
          response = json.decode(value);
          totalrecords = int.parse(response["GetStockappResult"]["TotalPcs"]);
          searchResultList = response["GetStockappResult"]["Result"];
          print(response["GetStockappResult"]["TotalPcs"]);
        });
      });
    } else {
      print(strt.toString() + ' ' + totalrecords.toString());
      if (strt > totalrecords) {
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Already on Last Page of results.'),
          duration: Duration(seconds: 2),
        ));
      } else {
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Already on First Page of results.'),
          duration: Duration(seconds: 2),
        ));
      }
      pageCnt--;
      if (pageCnt < 1) pageCnt = 1;
    }
  }

  Widget getSearchResultsList() {
    List<Widget> searchResListWidget = List();
    searchResultList.forEach((element) {
      searchResListWidget.add(InkWell(
        onTap: () {},
        child: Container(
          // height: 300,
          color: Colors.grey[200],
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        element["SHAPE"] +
                            ', ' +
                            element["CRTS"] +
                            ' ct, ' +
                            element["COL"] +
                            ' , ' +
                            element["PUR"] +
                            ' , ' +
                            element["LAB"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(element["STONE_ID"],
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            width: MediaQuery.of(context).size.width * 70 / 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(left: 28.0),
                                  child: RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: 'Cut: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                        text: element["CUT"],
                                        style:
                                            TextStyle(color: Colors.grey[600]))
                                  ])),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: 'Fluor: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                        text: element["FLUO"],
                                        style:
                                            TextStyle(color: Colors.grey[600]))
                                  ])),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            width: MediaQuery.of(context).size.width * 70 / 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(left: 28.0),
                                  child: RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: 'Pol: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                        text: element["POL"],
                                        style:
                                            TextStyle(color: Colors.grey[600]))
                                  ])),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: 'Meas: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                        text: element["M1"] +
                                            'X' +
                                            element["M2"] +
                                            'X' +
                                            element["M3"],
                                        style:
                                            TextStyle(color: Colors.grey[600]))
                                  ])),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            width: MediaQuery.of(context).size.width * 70 / 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(left: 28.0),
                                  child: RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: 'Sym: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                        text: element["SYM"],
                                        style:
                                            TextStyle(color: Colors.grey[600]))
                                  ])),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 9.0),
                                  child: RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: 'Certi: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                        text: element["CERTNO"],
                                        style:
                                            TextStyle(color: Colors.grey[600]))
                                  ])),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        color: Colors.blue[50],
                        // width: MediaQuery.of(context).size.width * 30 / 100 - 8,
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Text('Total'),
                            ),
                            Center(
                              child: Text(
                                element["TOTAL"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Center(
                              child: Text('Discounnt'),
                            ),
                            Center(
                              child: Text(
                                element["DISC"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ));
    });

    return SingleChildScrollView(
      child: Column(children: searchResListWidget),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Search Results'),
          actions: <Widget>[
          IconButton(icon: Icon(Icons.home), onPressed: () => Navigator.of(context).pushNamed('/home'))
        ],
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                pageCnt--;
                loadPageResults();
              },
              child: Text('<Prev Page'),
            ),
            RaisedButton(
              onPressed: () {
                pageCnt++;
                loadPageResults();
              },
              child: Text('Next Page>'),
            )
          ],
        ),
        body: dataLoaded
            ? Container(
                child: getSearchResultsList(),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
