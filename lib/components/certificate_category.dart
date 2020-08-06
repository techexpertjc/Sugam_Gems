import 'package:flutter/material.dart';

class CertificateCategory extends StatefulWidget {
  final customFunction;
  CertificateCategory({Key key, this.customFunction}) : super(key: key);
  @override
  _CertificateCategoryState createState() => _CertificateCategoryState();
}

class _CertificateCategoryState extends State<CertificateCategory> {
  var certificateList = ['GIA', 'HRD', 'IGI'];

  var selectedCertificate = Map();

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    widget.customFunction(selectedCertificate);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    certificateList.forEach((element) {
      selectedCertificate[element] = false;
    });
  }

  List<Widget> _getColourList() {
    List<Widget> colourListWidget = [];

    certificateList.forEach((element) {
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
                      colors: selectedCertificate[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  selectedCertificate[element] = !selectedCertificate[element];
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      fontSize: 15,
                      color: selectedCertificate[element]
                          ? Colors.white
                          : Colors.grey[700]),
                ),
                // color: selectedCertificate[element]
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
                      colors: selectedCertificate[element]
                          ? [Colors.blue[300], Colors.blue[900]]
                          : [Colors.transparent, Colors.transparent])),
              child: FlatButton(
                onPressed: () {
                  selectedCertificate[element] = !selectedCertificate[element];
                  certificateList.forEach((el) {
                    selectedCertificate[el] = selectedCertificate[element];
                  });
                  setState(() {});
                },
                child: Text(
                  element,
                  style: TextStyle(
                      color: selectedCertificate[element]
                          ? Colors.white
                          : Colors.grey[700]),
                ),
                // color: selectedCertificate[element]
                //     ? Colors.indigo[800]
                //     : Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(color: Colors.grey[700])),
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
