import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohaddis/ModelClasses/AlhukmModel.dart';


class CustomDialogBoxAlHukm extends StatefulWidget {
  final List<AlhukmModel> alhukmModel;
  final String title;

  const CustomDialogBoxAlHukm({
    Key? key,
    required this.alhukmModel,
    required this.title,
  }) : super(key: key);

  @override
  _CustomDialogBoxAlHukmState createState() => _CustomDialogBoxAlHukmState();
}

class _CustomDialogBoxAlHukmState extends State<CustomDialogBoxAlHukm> {
  List<AlhukmModel> _list = [];
  int tabnumber = 2;

  @override
  void initState() {
    _list = widget.alhukmModel;
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
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 60.0),
      color: Color.fromARGB(255, 220, 228, 241),
      child: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dx > 0) {
            setState(() {
              tabnumber = 1;
            });
          }

          // Swiping in left direction.
          if (details.delta.dx < 0) {
            setState(() {
              tabnumber = 2;
            });
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/rectangle_798.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 3.0, left: 45.0),
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 10.0),
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
                                  image: AssetImage('assets/images/group_38.png'),
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      tabnumber == 1
                          ? Expanded(
                              child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                  //                   <--- right side
                                  color: Color.fromARGB(255, 37, 160, 75),
                                  width: 2.0,
                                ),
                              )),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Center(
                                    child: DefaultTextStyle(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        tabnumber = 1;
                                      });
                                    },
                                    child: Text(
                                      'الحکم التفصیلی',
                                    ),
                                  ),
                                )),
                              ),
                            ))
                          : Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Center(
                                    child: DefaultTextStyle(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        tabnumber = 1;
                                      });
                                    },
                                    child: Text(
                                      'الحکم التفصیلی',
                                    ),
                                  ),
                                )),
                              ),
                            ),
                      tabnumber == 2
                          ? Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    //                   <--- right side
                                    color: Color.fromARGB(255, 37, 160, 75),
                                    width: 2.0,
                                  ),
                                )),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 15.0),
                              child: Center(
                                  child: DefaultTextStyle(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          tabnumber = 2;
                                        });
                                      },
                                      child: Text(
                                        'الحكم على الحديث',
                                      ),
                                    ),
                                  )),
                            ),
                          ))
                          : Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 15.0),
                          child: Center(
                              child: DefaultTextStyle(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      tabnumber = 2;
                                    });
                                  },
                                  child: Text(
                                    'الحكم على الحديث',
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: tabnumber == 2
                  ? Container(
                      height: 400,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: DefaultTextStyle(
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Color.fromARGB(255, 37, 160, 75),
                                    ),
                                    child: Text(
                                      'الحكم',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      DefaultTextStyle(
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Color.fromARGB(255, 37, 160, 75),
                                        ),
                                        child: Text(
                                          'اسم العالم',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: DefaultTextStyle(
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey,
                                              ),
                                              child: Text(
                                                _list[Index].hukm_name,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                DefaultTextStyle(
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.black,
                                                  ),
                                                  child: Text(
                                                    _list[Index].hukm,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            )),
                          ],
                        ),
                      ))
                  : Container(
                      height: 400,
                      color: Colors.white,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Container(
      color: Color.fromARGB(255,220, 228, 241),
      child: Column(
        children: [
          Container(
            height: 80.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/rectangle_798.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6.0, left: 45.0),
                              child: Text(widget.title.toString(),
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontFamily: 'NotoNastaliqUrdu'
                                ),),
                            )
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0,top: 20.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: 25,
                            height: 15,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/group_38.png'),
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Container(
              color: Colors.white,
              child: TabBar(
                tabs: [
                  Tab(child: Text('tab1',style: TextStyle(color: Colors.black),),),
                  Tab(child: Text('tab2',style: TextStyle(color: Colors.black),),)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.maxFinite,
              height: 500.0,
              color: Colors.white,
              child: TabBarView(
                children: [
                  AlHukmScreen(),
                  HukmTafseelScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
 */
