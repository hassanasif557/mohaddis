import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ModelClasses/AltahreejModel.dart';
import '../ModelClasses/AltarakeemModel.dart';

class CustomDialogBoxAltarakeem extends StatefulWidget {
  final List<AltarakeemModel> altarakeemlist;
  final String title;

  const CustomDialogBoxAltarakeem(
      {Key? key, required this.altarakeemlist, required this.title})
      : super(key: key);

  @override
  _CustomDialogBoxAltarakeemState createState() => _CustomDialogBoxAltarakeemState();
}

class _CustomDialogBoxAltarakeemState extends State<CustomDialogBoxAltarakeem> {
  List<AltarakeemModel> _list = [];

  @override
  void initState() {
    _list = widget.altarakeemlist;
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
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                            itemCount: _list.length,
                            itemBuilder: (BuildContext ctxt, int Index) {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        //                   <--- right side
                                        color: Colors.black12,
                                        width: 1.0,
                                      ),
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: DefaultTextStyle(
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey,
                                          ),
                                          child: Text(
                                            _list[Index].tarakeemNumber,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 8.0, right: 10.0, top: 0.0),
                                          child: Container(
                                            width: double.maxFinite,
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: DefaultTextStyle(
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.black),
                                                child: Text(
                                                  _list[Index].tarakeem,
                                                  textAlign: TextAlign.right,

                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
