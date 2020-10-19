import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
// import 'package:flutter_share/flutter_share.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:video_player/video_player.dart';

class DnaPage extends StatefulWidget {
  final obj;
  DnaPage({Key key, this.obj}) : super(key: key);
  @override
  _DnaPageState createState() => _DnaPageState();
}

class _DnaPageState extends State<DnaPage> with SingleTickerProviderStateMixin {
  Map data;
  bool pdfLoaded;
  PDFDocument certiPdf;
  TabController myController;
  VideoPlayerController myVideoController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = widget.obj;
    pdfLoaded = false;
    myController = TabController(length: 3, vsync: this);
    myInitFunc();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    if (mounted) super.setState(fn);
  }

  var directory;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myVideoController.dispose();
  }

  bool videoLoaded = true;
  Widget noPreview = Center(
    child: Container(
      child: Text('No Preview Available'),
    ),
  );
  String dwnloadUrl;
  Widget pdfPage;
  void myInitFunc() async {
    try {
      myController.addListener(() {
        setState(() {});
      });
      dwnloadUrl = data["CERTI"];
      myVideoController = VideoPlayerController.network(data["VIDEO"]);
      myVideoController.addListener(() {
        if (myVideoController.value.hasError) {
          videoLoaded = false;
        }

        setState(() {});
        // myVideoController.setLooping(true);
      });
      myVideoController.initialize();
      myVideoController.setLooping(true);
      myVideoController.play();
      Directory androidDirectory = await getExternalStorageDirectory();
      directory = Platform.isAndroid
          ? Directory(androidDirectory.path
              .toString()
              .replaceAll('/Android/data/com.stiensgate.sugam_gems/files', ''))
          : await getApplicationDocumentsDirectory();
      print(directory.toString());
      if (!Directory(directory.path + Platform.pathSeparator + 'Downloads')
          .existsSync()) {
        Directory(directory.path + Platform.pathSeparator + 'Downloads')
            .createSync();
      }
      PDFDocument.fromURL(data["CERTI"]).then((value) {
        setState(() {
          certiPdf = value;

          certiPdf.get().then((val) {
            pdfPage = val;
            pdfLoaded = true;
          });
        });
      });
    } on NetworkImageLoadException catch (e) {
      print('NetworkImageLoadException Exception : ' + e.toString());
    } on HttpException catch (e) {
      print('HttpException Exception : ' + e.toString());
    } on PlatformException catch (e) {
      print('PlatformException Exception : ' + e.toString());
    } on Exception catch (e) {
      print('Exception Exception : ' + e.toString());
    }
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Diamond Details'),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: TabBar(
                      indicatorColor: Colors.transparent,
                      controller: myController,
                      tabs: <Widget>[
                        RaisedButton(
                          color: myController.index == 0
                              ? Colors.blue
                              : Colors.grey,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          onPressed: () {
                            if (!FocusScope.of(context).hasPrimaryFocus) {
                              FocusScope.of(context).unfocus();
                            }
                            myController.animateTo(0);
                            myController.index = 0;
                            dwnloadUrl = data["CERTI"];
                            setState(() {});
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.grade,
                                color: Colors.white,
                              ),
                              Text(
                                'Cert',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        RaisedButton(
                          color: myController.index == 1
                              ? Colors.blue
                              : Colors.grey,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          onPressed: () {
                            if (!FocusScope.of(context).hasPrimaryFocus) {
                              FocusScope.of(context).unfocus();
                            }
                            myController.animateTo(1);
                            myController.index = 1;
                            dwnloadUrl = data["VIDEO"];
                            setState(() {});
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.video_call,
                                color: Colors.white,
                              ),
                              Text(
                                'Video',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        RaisedButton(
                          color: myController.index == 2
                              ? Colors.blue
                              : Colors.grey,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          onPressed: () {
                            if (!FocusScope.of(context).hasPrimaryFocus) {
                              FocusScope.of(context).unfocus();
                            }
                            dwnloadUrl = data["IMG"];
                            myController.animateTo(2);

                            myController.index = 2;
                            setState(() {});
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.image,
                                color: Colors.white,
                              ),
                              Text(
                                'Image',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ]),
                ),
                Container(
                  height: 400,
                  child: Stack(
                    children: [
                      TabBarView(controller: myController, children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: Colors.grey),
                          child: pdfLoaded
                              ? pdfPage
                              : Center(
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                        AspectRatio(
                          aspectRatio: myVideoController.value.aspectRatio,
                          child: videoLoaded
                              ? Container(
                                  child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: VideoPlayer(myVideoController),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: PlayPauseOverlay(
                                            controller: myVideoController,
                                          ),
                                        ),
                                        VideoProgressIndicator(
                                            myVideoController,
                                            allowScrubbing: true),
                                      ]),
                                )
                              : noPreview,
                        ),
                        FadeInImage(
                          imageErrorBuilder: (context, Obj, stackTrc) {
                            return Center(
                              child: Text('Cant load imaage'),
                            );
                          },
                          image: NetworkImage(data['IMG']),
                          placeholder: AssetImage('images/placeholder.png'),
                        ),
                      ]),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: InkWell(
                          onTap: () {
                            Widget fullScreenWidget;
                            if (myController.index == 0) {
                              fullScreenWidget = Scaffold(
                                  appBar: AppBar(
                                    title: Text(data["STONE_ID"]),
                                  ),
                                  body: pdfPage);
                            } else if (myController.index == 1) {
                              fullScreenWidget = RotatedBox(
                                quarterTurns: 0,
                                child: Scaffold(
                                  appBar: AppBar(title: Text(data["STONE_ID"])),
                                  body: videoLoaded
                                      ? Center(
                                          child: AspectRatio(
                                            aspectRatio: myVideoController
                                                .value.aspectRatio,
                                            child: Container(
                                              child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: <Widget>[
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: VideoPlayer(
                                                          myVideoController),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: PlayPauseOverlay(
                                                        controller:
                                                            myVideoController,
                                                      ),
                                                    ),
                                                    VideoProgressIndicator(
                                                        myVideoController,
                                                        allowScrubbing: true),
                                                  ]),
                                            ),
                                          ),
                                        )
                                      : noPreview,
                                ),
                              );
                            } else if (myController.index == 2) {
                              fullScreenWidget = Scaffold(
                                appBar: AppBar(
                                  title: Text(data["STONE_ID"]),
                                ),
                                body: Container(
                                  child: FadeInImage(
                                    imageErrorBuilder:
                                        (context, Obj, stackTrc) {
                                      return Center(
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2,
                                          child: Scaffold(
                                              body: Center(
                                                  child: Text(
                                                      'Cant load imaage'))),
                                        ),
                                      );
                                    },
                                    image: NetworkImage(data['IMG']),
                                    placeholder:
                                        AssetImage('images/placeholder.png'),
                                  ),
                                ),
                              );
                            }
                            showDialog(
                                context: context, child: fullScreenWidget);
                          },
                          child: Icon(
                            Icons.fullscreen,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 20,
                          right: 20,
                          child: InkWell(
                            onTap: () async {
                              var mime;
                              scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content:
                                      Text('Downloading file please wait...')));
                              myController.index == 0
                                  ? mime = "appliation/pdf"
                                  : myController.index == 1
                                      ? mime = "video/mp4"
                                      : mime = "image/jpg";
                              var fileName = data["STONE_ID"] +
                                  dwnloadUrl
                                      .substring(dwnloadUrl.lastIndexOf('.'));
                              try {
                                var request = await HttpClient()
                                    .getUrl(Uri.parse(dwnloadUrl));
                                var response = await request.close();
                                Uint8List bytes =
                                    await consolidateHttpClientResponseBytes(
                                        response);
                                await Share.file(
                                    data['STONE_ID'], fileName, bytes, mime);
                              } catch (e) {
                                print('error: $e');
                              }
                            },
                            child: Icon(Icons.share),
                          ))
                    ],
                  ),
                ),
                Container(
                  child: MaterialButton(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(
                        Icons.file_download,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        var storagePermission;
                        var currIndex = myController.index;
                        switch (currIndex) {
                          case 0:
                            dwnloadUrl = data["CERTI"];
                            break;
                          case 1:
                            dwnloadUrl = data["VIDEO"];
                            break;
                          case 2:
                            dwnloadUrl = data["IMG"];
                            break;
                          default:
                        }
                        log(dwnloadUrl);
                        if (Platform.isAndroid) {
                          if (await Permission.storage.request().isGranted) {
                            final taskId = await FlutterDownloader.enqueue(
                              url: dwnloadUrl,
                              savedDir: directory.path +
                                  Platform.pathSeparator +
                                  'Downloads',
                              showNotification:
                                  true, // show download progress in status bar (for Android)
                              openFileFromNotification:
                                  true, // click on notification to open downloaded file (for Android)
                            );
                            print(directory.path +
                                Platform.pathSeparator +
                                'Downloads');
                            scaffoldKey.currentState.showSnackBar(
                                SnackBar(content: Text('Download Started')));
                          }
                        } else {
                          if (myController.index == 0 &&
                              await Permission.storage.request().isGranted) {
                            final taskId = await FlutterDownloader.enqueue(
                              url: dwnloadUrl,
                              savedDir: directory.path +
                                  Platform.pathSeparator +
                                  'Downloads',
                              showNotification:
                                  true, // show download progress in status bar (for Android)
                              openFileFromNotification:
                                  true, // click on notification to open downloaded file (for Android)
                            ).then((value) => scaffoldKey.currentState
                                .showSnackBar(SnackBar(
                                    content: Text('Download Completed'))));
                            print(directory.path +
                                Platform.pathSeparator +
                                'Downloads');
                            scaffoldKey.currentState.showSnackBar(
                                SnackBar(content: Text('Download Started')));
                          } else if (await Permission.mediaLibrary
                              .request()
                              .isGranted) {
                            if (myController.index == 1) {
                              scaffoldKey.currentState.showSnackBar(
                                  SnackBar(content: Text('Download Started')));
                              GallerySaver.saveVideo(dwnloadUrl)
                                  .then((value) => {
                                        scaffoldKey.currentState.showSnackBar(
                                            SnackBar(
                                                content:
                                                    Text('Download Complete')))
                                      })
                                  .catchError((onError) => {log(onError)});
                            }
                            if (myController.index == 2) {
                              scaffoldKey.currentState.showSnackBar(
                                  SnackBar(content: Text('Download Started')));
                              GallerySaver.saveImage(dwnloadUrl)
                                  .then((value) => {
                                        scaffoldKey.currentState.showSnackBar(
                                            SnackBar(
                                                content:
                                                    Text('Download Complete')))
                                      })
                                  .catchError((onError) => {log(onError)});
                            }
                          }
                        }
                      }),
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                  child: Center(
                      child: Text(
                    'Details',
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        // color: Colors.blue,
                        width: 200,
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 80,
                                child: Text(
                                  'Packet No',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  // width: 70,
                                  child: Text(
                                    data["STONE_ID"],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        // color: Colors.red,
                        // width: 200,
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 80,
                                child: Text(
                                  '%',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  // width: 70,
                                  child: Text(
                                    data["DISC"],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        // color: Colors.blue,
                        width: 200,
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 80,
                                child: Text(
                                  'Lab',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  // width: 70,
                                  child: Text(
                                    data["LAB"],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        // color: Colors.red,
                        // width: 200,
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 80,
                                child: Text(
                                  'Total',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  // width: 70,
                                  child: Text(
                                    data["TOTAL"],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        // color: Colors.blue,
                        width: 300,
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 80,
                                child: Text(
                                  'Certi No',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  // width: 70,
                                  child: Text(
                                    data["CERTNO"],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                              // color: Colors.red,
                              // width: 200,
                              )),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                  child: Center(
                      child: Text(
                    'Grading',
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        // color: Colors.blue,
                        width: 200,
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 80,
                                child: Text(
                                  'Shape',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  // width: 70,
                                  child: Text(
                                    data["SHAPE"],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        // color: Colors.red,
                        // width: 200,
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 80,
                                child: Text(
                                  'Cut',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  // width: 70,
                                  child: Text(
                                    data["CUT"],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        // color: Colors.blue,
                        width: 200,
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 80,
                                child: Text(
                                  'Carat',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  // width: 70,
                                  child: Text(
                                    data["CRTS"],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        // color: Colors.red,
                        // width: 200,
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 80,
                                child: Text(
                                  'Polish',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  // width: 70,
                                  child: Text(
                                    data["POL"],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        // color: Colors.blue,
                        width: 200,
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 80,
                                child: Text(
                                  'Color',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  // width: 70,
                                  child: Text(
                                    data["COL"],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        // color: Colors.red,
                        // width: 200,
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 80,
                                child: Text(
                                  'Sym',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  // width: 70,
                                  child: Text(
                                    data["SYM"],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        // color: Colors.blue,
                        width: 200,
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 80,
                                child: Text(
                                  'Clarity',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  // width: 70,
                                  child: Text(
                                    data["PUR"],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        // color: Colors.red,
                        // width: 200,
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 80,
                                child: Text(
                                  'Fls',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  // width: 70,
                                  child: Text(
                                    data["FLUO"],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                Divider()
              ],
            ),
          ),
        ),
      );
    } on NetworkImageLoadException catch (e) {
      print('NetworkImageLoadException Exception : ' + e.toString());
    } on HttpException catch (e) {
      print('HttpException Exception : ' + e.toString());
    } on PlatformException catch (e) {
      print('PlatformException Exception : ' + e.toString());
    } on Exception catch (e) {
      print('Exception Exception : ' + e.toString());
    }
  }
}

class PlayPauseOverlay extends StatelessWidget {
  const PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
