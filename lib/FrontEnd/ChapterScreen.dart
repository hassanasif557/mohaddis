import 'package:animations/animations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mohaddis/ChapterScreens/SubChapterScreen1.dart';
import 'package:mohaddis/FrontEnd/HomeScreen.dart';
import 'package:mohaddis/ModelClasses/TopicModel.dart';
import 'package:mohaddis/NavMenuScreens/AboutScreen.dart';
import 'package:mohaddis/NavMenuScreens/ContactScreen.dart';
import 'package:mohaddis/NavMenuScreens/PropertiesScreen.dart';
import 'package:mohaddis/NavMenuScreens/SupportScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_html_css/simple_html_css.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({Key? key}) : super(key: key);

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int count = 0;
  List<String> list = [];
  List<String> idlist = [];
  List<TopicModel> _completelist = [];

  late Future<pos> listUsers;
  pos posobj = new pos();

  @override
  void initState() {
    listUsers = fetchUsers();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    count = 0;
    return Scaffold(
      key: _scaffoldKey,
      drawer: _drawer(),
      backgroundColor: Color.fromARGB(255,220, 228, 241),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60), // Set this height
        child: Container(
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
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap:(){
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/group_36.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text('شجرۂ موضوعات',
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
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
      ),
      body: FutureBuilder<pos>(
        future: listUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            posobj = snapshot.data!;

            list.clear();
            idlist.clear();

            for(int i=0;i<posobj.data!.length;i++)
              {
                _completelist.add(TopicModel(posobj.data![i].iDPK.toString(), posobj.data![i].parentID.toString(), posobj.data![i].seqID.toString(), posobj.data![i].topicUrdu.toString()));

                if(posobj.data![i].parentID.toString() == '1')
                  {
                    list.add(posobj.data![i].topicUrdu.toString());
                    idlist.add(posobj.data![i].iDPK.toString());
                    print('yes present ${list.length}');
                  }

              }



            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: 'موضوع تلاش کریں',
                            hintStyle: TextStyle(
                              fontSize: 10.0,
                              fontFamily: 'NotoNastaliqUrdu'
                            ),
                            prefixIcon: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/backbutton.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Icon(Icons.search, color: Colors.white,))),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        count++;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                          child: Container(
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                            ),
                            child: ListTile(
                              leading: const Icon(Icons.arrow_back_ios_new, color: Colors.grey, size: 15.0,),
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: RichText(
                                    text: HTML.toTextSpan(context,
                                      '${count} ${list[index].toString()}',
                                      defaultTextStyle: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'NotoNastaliqUrdu',
                                        color: Colors.black,
                                      ),
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Container(
                                  width: 15,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/icon.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              selected: true,
                              onTap: () async{
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                prefs.setString('chapterID', "${idlist[index].toString()}");
                                prefs.setString('mainchapter', "${list[index].toString()}");
                                setState(() {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) => SubChapterScreen1(id: "${idlist[index].toString()}", name: '${list[index].toString()}', completelist: _completelist)));

                                });
                              },
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center( child: Text('${snapshot.error}'));
          }
          return Center(
            child: CircularProgressIndicator(backgroundColor: Colors.green),
          );
        },
      )
    );
  }



  Widget _drawer(){
    return Drawer(
      elevation: 10.0,
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {

                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          width: 150,
                          height: 220,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/vector_smart_object_1.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 110,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/layer_7_copy_2.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                _menuOptions('assets/images/l_0001nav.png', 'خصوصیات'),
                SizedBox(
                  height: 10.0,
                ),
                _menuOptions('assets/images/group_48.png', 'کچھ ہمارے بارے میں'),
                SizedBox(
                  height: 10.0,
                ),
                _menuOptions('assets/images/forma_1nav.png', 'تعاون'),
                SizedBox(
                  height: 10.0,
                ),
                _menuOptions('assets/images/l_1.png', 'رابطہ'),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 150,
                height: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/pattern.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),)
          ],

        ),
      ),
    );
  }

  Widget _menuOptions(String assetimage, String menuOptionIs) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: Duration(
        milliseconds: 500,
      ),
      closedElevation: 0.0,
      openElevation: 3.0,
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      middleColor: Colors.transparent,
      onClosed: (value) {
        // print('Profile Page Closed');
        // if (mounted) {
        //   setState(() {
        //     ImportantThings.findImageUrlAndUserName();
        //   });
        // }
      },
      openBuilder: (context, openWidget) {
        if (menuOptionIs == 'خصوصیات')
          return PropertiesScreen();
        else if (menuOptionIs == 'کچھ ہمارے بارے میں')
          return AboutScreen();
        else if (menuOptionIs == 'تعاون')
          return SupportScreen();
        else if (menuOptionIs == 'رابطہ') return ContactScreen();
        return Center();
      },
      closedBuilder: (context, closeWidget) {
        return SizedBox(
          height: 40.0,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  menuOptionIs,
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey[700],
                      fontFamily: 'NotoNastaliqUrdu'
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
                      image: AssetImage(assetimage),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}




Future<pos> fetchUsers() async {
  try {
    Response response = await Dio().get('https://api.mohaddis.com/api/TopicsTree',options: Options(
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
  int? iDPK;
  int? parentID;
  double? seqID;
  String? topicUrdu;
  String? topicArabic;
  int? level;
  String? topicsEng;

  Data(
      {this.iDPK,
        this.parentID,
        this.seqID,
        this.topicUrdu,
        this.topicArabic,
        this.level,
        this.topicsEng});

  Data.fromJson(Map<String, dynamic> json) {
    iDPK = json['IDPK'];
    parentID = json['ParentID'];
    seqID = json['SeqID'];
    topicUrdu = json['TopicUrdu'];
    topicArabic = json['TopicArabic'];
    level = json['Level'];
    topicsEng = json['TopicsEng'];
  }


}

