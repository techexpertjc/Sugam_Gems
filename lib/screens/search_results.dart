import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sugam_gems/components/call_service.dart';
import 'package:sugam_gems/components/ozone_diaicon_icons.dart';
import 'package:sugam_gems/screens/dna_page.dart';

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
    myController = ScrollController();
    myController.addListener(() {
      if (myController.offset >= myController.position.maxScrollExtent - 3 &&
          !myController.position.outOfRange) {
        print('There');
        pageCnt++;
        loadPageResults();
      }
    });
  }

  void getSearchResults() {
    dataLoaded = false;
    int strt = pageCnt * 20 - 19, end = pageCnt * 20;

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
        print(totalrecords);
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
    int strt = pageCnt * 20 - 19, end = pageCnt * 20;
    if (strt <= totalrecords && pageCnt >= 1) {
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
          searchResultList.addAll(response["GetStockappResult"]["Result"]);
          print(response["GetStockappResult"]["TotalPcs"]);
        });
      });
    } else {
      print(strt.toString() + ' ' + totalrecords.toString());

      pageCnt--;
      if (pageCnt < 1) pageCnt = 1;
    }
  }

  List<bool> isChecked = List();
  List<double> discAdded = List();
  double selectCarat = 0.00, avgDisc = 0.0, perCarat = 0, totalAmnt = 0;
  int selectStoneNo = 0;

  Widget buildSearchResultTile(BuildContext context, int i) {
    isChecked.add(false);
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DnaPage(
                    obj: searchResultList[i],
                  ))),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Container(
                width: 20,
                child: Checkbox(
                    // tristate: false,
                    value: isChecked[i],
                    onChanged: (bool val) {
                      setState(() {
                        isChecked[i] = val;
                        if (val) {
                          selectStoneNo++;
                          discAdded
                              .add(double.parse(searchResultList[i]["DISC"]));
                          selectCarat = selectCarat +
                              double.parse(searchResultList[i]["CRTS"]);
                          totalAmnt = totalAmnt +
                              double.parse(searchResultList[i]["TOTAL"]);
                        } else {
                          selectStoneNo--;
                          discAdded.remove(
                              double.parse(searchResultList[i]["DISC"]));
                          selectCarat = selectCarat -
                              double.parse(searchResultList[i]["CRTS"]);
                          totalAmnt = totalAmnt -
                              double.parse(searchResultList[i]["TOTAL"]);
                        }
                        var temp = 0.0;
                        discAdded.forEach((element) {
                          temp = temp + element;
                        });
                        avgDisc = temp / discAdded.length;
                        perCarat = totalAmnt / selectCarat;
                        if (discAdded.length == 0) {
                          avgDisc = 0.00;
                          selectCarat = 0.00;
                          totalAmnt = 0.00;
                          perCarat = 0.00;
                        }
                      });
                    }),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        searchResultList[i]["SHAPE"] +
                            ', ' +
                            searchResultList[i]["CRTS"] +
                            ' ct, ' +
                            searchResultList[i]["COL"] +
                            ', ' +
                            searchResultList[i]["PUR"] +
                            ', ' +
                            searchResultList[i]["LAB"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 100,
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 30,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 70,
                                  child: RichText(
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text: 'Cut: ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: searchResultList[i]["CUT"],
                                          style: TextStyle(color: Colors.black))
                                    ]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: RichText(
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text: 'Fluo: ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: searchResultList[i]["FLUO"],
                                          style: TextStyle(color: Colors.black))
                                    ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 70,
                                  child: RichText(
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text: 'Pol: ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: searchResultList[i]["POL"],
                                          style: TextStyle(color: Colors.black))
                                    ]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: RichText(
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text: 'Meas: ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: searchResultList[i]["M1"] +
                                              'X' +
                                              searchResultList[i]["M2"] +
                                              'X' +
                                              searchResultList[i]["M3"],
                                          style: TextStyle(color: Colors.black))
                                    ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 70,
                                  child: RichText(
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text: 'Sym: ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: searchResultList[i]["SYM"],
                                          style: TextStyle(color: Colors.black))
                                    ]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: RichText(
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text: 'Certi: ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: searchResultList[i]["CERTNO"],
                                          style: TextStyle(color: Colors.black))
                                    ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                // width: 100,
                // color: Colors.black,
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      // color: Colors.black,
                      child: Text(
                        searchResultList[i]["STONE_ID"],
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      color: Colors.blue[200],
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10, bottom: 20),
                        child: Column(children: <Widget>[
                          Text('Total'),
                          Text(
                            searchResultList[i]["TOTAL"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Discount'),
                          Text(searchResultList[i]["DISC"],
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  ScrollController myController = ScrollController();
  Widget getSearchResultsList() {
    return ListView.builder(
      itemCount: searchResultList.length,
      controller: myController,
      itemBuilder: (context, i) => buildSearchResultTile(context, i),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Container(
            height: 50,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Container(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border(top: BorderSide())),
                  padding: EdgeInsets.only(left: 10, top: 3, right: 5),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text('Stones', style: TextStyle(fontSize: 17)),
                        padding: EdgeInsets.only(bottom: 5),
                      ),
                      Container(child: Text(selectStoneNo.toString()))
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.grey,
                ),
                Container(
                  decoration: BoxDecoration(border: Border(top: BorderSide())),
                  padding: EdgeInsets.only(left: 10, top: 3, right: 5),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text('Carat', style: TextStyle(fontSize: 17)),
                        padding: EdgeInsets.only(bottom: 5),
                      ),
                      Container(child: Text(selectCarat.toStringAsFixed(2)))
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.grey,
                ),
                Container(
                  decoration: BoxDecoration(border: Border(top: BorderSide())),
                  padding: EdgeInsets.only(left: 10, top: 3, right: 5),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text('Avg. Discount',
                            style: TextStyle(fontSize: 17)),
                        padding: EdgeInsets.only(bottom: 5),
                      ),
                      Container(child: Text(avgDisc.toStringAsFixed(2)))
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.grey,
                ),
                Container(
                  decoration: BoxDecoration(border: Border(top: BorderSide())),
                  padding: EdgeInsets.only(left: 10, top: 3, right: 5),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text('Per Carat \$',
                            style: TextStyle(fontSize: 17)),
                        padding: EdgeInsets.only(bottom: 5),
                      ),
                      Container(child: Text(perCarat.toStringAsFixed(2)))
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.grey,
                ),
                Container(
                  decoration: BoxDecoration(border: Border(top: BorderSide())),
                  padding: EdgeInsets.only(left: 10, top: 3, right: 5),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Total \$',
                          style: TextStyle(fontSize: 17),
                        ),
                        padding: EdgeInsets.only(bottom: 5),
                      ),
                      Container(child: Text(totalAmnt.toString()))
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Search Results'),
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
