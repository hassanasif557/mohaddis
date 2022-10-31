import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohaddis/BookScreens/HadithViewSubScreens/MozooAhadithList.dart';
import 'package:mohaddis/ModelClasses/AlhukmModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../ChapterScreens/SubChapterScreen1.dart';


class CustomDialogBoxAlMozoo extends StatefulWidget {
  final String hadithNumber;
  final String hadithBookID;
  final String title;

  const CustomDialogBoxAlMozoo({
    Key? key,
    required this.hadithNumber,
    required this.hadithBookID,
    required this.title,
  }) : super(key: key);


  @override
  _CustomDialogBoxAlMozooState createState() => _CustomDialogBoxAlMozooState();
}

class _CustomDialogBoxAlMozooState extends State<CustomDialogBoxAlMozoo> {

  int tabnumber = 2;

  late Future<pos> listUsers;
  pos posobj = new pos();

  @override
  void initState() {
    listUsers = fetchUsers(widget.hadithNumber, widget.hadithBookID);
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
    return FutureBuilder<pos>(
      future: listUsers,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          posobj = snapshot.data!;


          print('yes present');

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
                                              'موضوعات',
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
                                          'موضوعات',
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
                                              'موضوع',
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
                                          'موضوع',
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
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: ListView.builder(
                                        itemCount: posobj.data!.length,
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
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 8.0, right: 10.0, top: 0.0),
                                                    child: GestureDetector(
                                                      onTap:(){
                                                        setState(() {
                                                          Navigator.push(context,
                                                              MaterialPageRoute(builder: (_) => MozooAhadithList(title: posobj.data![Index].topicUrdu.toString(), topicID: posobj.data![Index].mozuID.toString())));
                                                        });
                                                      },
                                                      child: Container(
                                                        width: double.maxFinite,
                                                        child: Align(
                                                          alignment: Alignment.centerRight,
                                                          child: DefaultTextStyle(
                                                            style: TextStyle(
                                                                fontSize: 8.0,
                                                                color: Colors.black,
                                                                fontFamily: 'NotoNastaliqUrdu',
                                                                height: 4.5),
                                                            child: Text(
                                                              posobj.data![Index].topicArabic.toString(),
                                                              textAlign: TextAlign.right,

                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  )),
                            ],
                          ),
                        )
                    )
                        : Container(
                        height: 400,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: ListView.builder(
                                        itemCount: posobj.data!.length,
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
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 8.0, right: 10.0, top: 0.0),
                                                    child: GestureDetector(
                                                      onTap:(){
                                                        setState(() {
                                                          Navigator.push(context,
                                                              MaterialPageRoute(builder: (_) => MozooAhadithList(title: 'title', topicID: posobj.data![Index].mozuID.toString())));
                                                        });
                                                      },
                                                      child: Container(
                                                        width: double.maxFinite,
                                                        child: Align(
                                                          alignment: Alignment.centerRight,
                                                          child: DefaultTextStyle(
                                                            style: TextStyle(
                                                                fontSize: 8.0,
                                                                color: Colors.black,
                                                                fontFamily: 'NotoNastaliqUrdu',
                                                                height: 4.5),
                                                            child: Text(
                                                              posobj.data![Index].topicUrdu.toString(),
                                                              textAlign: TextAlign.right,

                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  )),
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center( child: Text('${snapshot.error}'));
        }
        return Center(
          child: CircularProgressIndicator(backgroundColor: Colors.green),
        );
      },
    );
  }
}





Future<pos> fetchUsers(String hadithnumber, String bookid) async {
  try {
    Response response = await Dio().get('https://api.mohaddis.com/api/HadithTopics?type=json', queryParameters: {
      'HadithNumber': hadithnumber,
      'HadithBookID': bookid,
      'DefaulTarqeem': "HadeesNumber"},options: Options(
      headers: {"X-ApiKey": "dztydmpy986xwKgCxHQHMjx1qHRrzMQN"},
    ));
    if (response.statusCode == 200) {
      print(response.data.toString());

      return pos.fromJson(response.data);;
    } else {
      throw Exception('Failed to load users');
    }
  } catch (e) {
    print(e);
    throw Exception('Failed to load users');
  }
}



class pos {
  final List<Data>? data;

  pos({this.data});

  factory pos.fromJson(List<dynamic> parsedJson){

    List<Data> data = <Data>[];
    print(data.runtimeType);
    data = parsedJson.map((i)=>Data.fromJson(i)).toList();


    return pos(
        data: data

    );
  }
}


class Data {
  int? rowNo;
  int? iD;
  int? mozuID;
  int? hadithNumber;
  int? hadithBookID;
  String? topParentUrduTopic;
  String? topParentEngTopic;
  String? topParentArabictopic;
  String? topicArabic;
  String? topicUrdu;
  String? topicsEng;
  Null? defaulTarqeem;

  Data(
      {this.rowNo,
        this.iD,
        this.mozuID,
        this.hadithNumber,
        this.hadithBookID,
        this.topParentUrduTopic,
        this.topParentEngTopic,
        this.topParentArabictopic,
        this.topicArabic,
        this.topicUrdu,
        this.topicsEng,
        this.defaulTarqeem});

  Data.fromJson(Map<String, dynamic> json) {
    rowNo = json['RowNo'];
    iD = json['ID'];
    mozuID = json['MozuID'];
    hadithNumber = json['HadithNumber'];
    hadithBookID = json['HadithBookID'];
    topParentUrduTopic = json['TopParentUrduTopic'];
    topParentEngTopic = json['TopParentEngTopic'];
    topParentArabictopic = json['TopParentArabictopic'];
    topicArabic = json['TopicArabic'];
    topicUrdu = json['TopicUrdu'];
    topicsEng = json['TopicsEng'];
    defaulTarqeem = json['DefaulTarqeem'];
  }


}


