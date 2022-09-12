import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ModelClasses/AltahreejModel.dart';

class CustomDialogBox extends StatefulWidget {
  final List<AltahreejModel> altahreejlist;
  final String title;

  const CustomDialogBox(
      {Key? key, required this.altahreejlist, required this.title})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  List<AltahreejModel> _list = [];

  @override
  void initState() {
    _list = widget.altahreejlist;
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
                  child: ListView.builder(
                      itemCount: _list.length,
                      itemBuilder: (BuildContext ctxt, int Index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                          child: new Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        DefaultTextStyle(
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Color.fromARGB(255, 37, 160, 75),
                                              fontFamily: 'NotoNastaliqUrdu'),
                                          child: Text(
                                            _list[Index].book_name,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Container(
                                          width: 25,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/forma_1colorless.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        DefaultTextStyle(
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,),
                                          child: Text('${_list[Index].hadees_number} : ${Index+1}',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30.0,
                                        ),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/iconpage.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ],
    );
  }
}
