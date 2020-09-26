import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sugam_gems/components/call_service.dart';
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
    searchResultList = List();
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
        response["GetStockappResult"]["TotalPcs"] == null
            ? totalrecords = 0
            : totalrecords =
                int.parse(response["GetStockappResult"]["TotalPcs"]);

        searchResultList = response["GetStockappResult"]["Result"] == null
            ? []
            : response["GetStockappResult"]["Result"];
        print('search param');
        print(requestData);

        if (totalrecords == 0 ||
            response["GetStockappResult"]["TotalPcs"] == null) {
          showDialog(
              barrierDismissible: false,
              context: context,
              child: AlertDialog(
                title: Text('Sugam Gems'),
                content: Text('0 Stone(s) found for your Search Criteria'),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        if (!FocusScope.of(context).hasPrimaryFocus) {
                          FocusScope.of(context).unfocus();
                        }
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text('Ok'))
                ],
              ));
        }
      });
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  void loadPageResults() {
    int strt = pageCnt * 10 - 9, end = pageCnt * 10;
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
      onTap: () async {
        try {
          final result = await InternetAddress.lookup('google.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            print('connected');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DnaPage(
                          obj: searchResultList[i],
                        )));
          }
        } on SocketException catch (_) {
          scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Please connect the device to active Internet')));
        }
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
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
              ),
              Expanded(
                flex: 11,
                child: Container(
                  padding: EdgeInsets.only(left: 5),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        // width: 250,
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
                                            style:
                                                TextStyle(color: Colors.black))
                                      ]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: RichText(
                                      text: TextSpan(children: <TextSpan>[
                                        TextSpan(
                                            text: 'Fluo: ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: searchResultList[i]["FLUO"],
                                            style:
                                                TextStyle(color: Colors.black))
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
                                            style:
                                                TextStyle(color: Colors.black))
                                      ]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
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
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12))
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
                                            style:
                                                TextStyle(color: Colors.black))
                                      ]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: RichText(
                                      text: TextSpan(children: <TextSpan>[
                                        TextSpan(
                                            text: 'Certi: ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: searchResultList[i]["CERTNO"],
                                            style:
                                                TextStyle(color: Colors.black))
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
              ),
              Expanded(
                  flex: 6,
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
                          width: (12 * 100 / 36) * 10,
                          color: Color(0xFFF0F8FF),
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
    ;
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
        key: scaffoldKey,
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.only(left: 1.0, right: 1),
              child: Container(
                color: Color(0xFFF0F8FF),
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 70,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        padding: EdgeInsets.only(left: 0, top: 0, right: 0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey)),
                                  color: Color(0xFFF0F8FF),
                                ),
                                child: Text('Stones',
                                    style: TextStyle(fontSize: 15)),
                                padding: EdgeInsets.all(7),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(selectStoneNo.toString()))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 60,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        // padding: EdgeInsets.only(left: 10, top: 3, right: 5),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey)),
                                color: Color(0xFFF0F8FF),
                              ),
                              child:
                                  Text('Carat', style: TextStyle(fontSize: 15)),
                              padding: EdgeInsets.all(7),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(selectCarat.toStringAsFixed(2)))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 80,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        // padding: EdgeInsets.only(left: 10, top: 3, right: 5),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey)),
                                color: Color(0xFFF0F8FF),
                              ),
                              child: Text('Avg. Disc',
                                  style: TextStyle(fontSize: 15)),
                              padding: EdgeInsets.all(7),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(avgDisc.toStringAsFixed(2)))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 75,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        // padding: EdgeInsets.only(left: 10, top: 3, right: 5),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey)),
                                  color: Color(0xFFF0F8FF)),
                              child: Text('\$\/Carat',
                                  style: TextStyle(fontSize: 15)),
                              padding: EdgeInsets.all(7),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(perCarat.toStringAsFixed(2)))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 75,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        // padding: EdgeInsets.only(left: 10, top: 3, right: 5),
                        child: Column(
                          children: <Widget>[
                            Container(
                              // width: 120,
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey)),
                                color: Color(0xFFF0F8FF),
                              ),
                              child: Center(
                                child: Text('Total \$',
                                    style: TextStyle(fontSize: 15)),
                              ),
                              padding: EdgeInsets.all(7),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(totalAmnt.toString()))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          title: Text('Search Results'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () =>
                    Navigator.popUntil(context, ModalRoute.withName('/home')))
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
