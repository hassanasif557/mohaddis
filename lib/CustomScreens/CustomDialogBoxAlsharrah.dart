import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohaddis/ModelClasses/AlSharrahModel.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../ModelClasses/AltahreejModel.dart';
import '../ModelClasses/AltarakeemModel.dart';

class CustomDialogBoxAlsharrah extends StatefulWidget {
  final AlSharrahModel alSharrahModel;
  final String title;

  const CustomDialogBoxAlsharrah(
      {Key? key, required this.alSharrahModel, required this.title})
      : super(key: key);

  @override
  _CustomDialogBoxAlsharrahState createState() => _CustomDialogBoxAlsharrahState();
}

class _CustomDialogBoxAlsharrahState extends State<CustomDialogBoxAlsharrah> {
  late AlSharrahModel alSharrahModel;

  @override
  void initState() {
    alSharrahModel = widget.alSharrahModel;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: Center(
          child: contentBox(context),
        ));
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 20.0),
          margin:
          EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 60.0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromARGB(255, 220, 228, 241),
              borderRadius: BorderRadius.circular(3.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/rectangle_798.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0, left: 45.0),
                            child: DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontFamily: 'NotoNastaliqUrdu'),
                              child: Text(
                                widget.title.toString(),
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 20.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: 25,
                              height: 15,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                  AssetImage('assets/images/group_38.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            width: double.maxFinite,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: DefaultTextStyle(
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      color: Colors.black,
                                  fontFamily: 'NotoNastaliqUrdu',
                                  height: 4),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: RichText(
                                      text: HTML.toTextSpan(context,
                                        alSharrahModel.sharrah,
                                        defaultTextStyle: TextStyle(
                                          fontSize: 10,
                                          height: 4.0,
                                          fontFamily: 'NotoNastaliqUrdu',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
