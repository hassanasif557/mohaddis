import 'package:animations/animations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mohaddis/BookScreens/SubBookHomeScreen.dart';
import 'package:mohaddis/ChapterScreens/SubChapterScreen2.dart';
import 'package:mohaddis/FrontEnd/HomeScreen.dart';
import 'package:mohaddis/NavMenuScreens/AboutScreen.dart';
import 'package:mohaddis/NavMenuScreens/ContactScreen.dart';
import 'package:mohaddis/NavMenuScreens/PropertiesScreen.dart';
import 'package:mohaddis/NavMenuScreens/SupportScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../CustomScreens/DropDownWidget2.dart';

class MozooAhadithList extends StatefulWidget {

  final String title;
  final String topicID;

  const MozooAhadithList({Key? key, required this.title, required this.topicID}) : super(key: key);

  @override
  State<MozooAhadithList> createState() => _MozooAhadithListState();
}

class _MozooAhadithListState extends State<MozooAhadithList> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  List<String> spinnerItems1 = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  List<String> spinnerItems2 = [
    '20',
    '30',
    '40',
    '50',
    '60',
    '70',
    '80',
    '90',
    '100'
  ];
  String dropdownvalue1 = '1';
  String dropdownvalue2 = '20';

  late Future<pos> listUsers;
  pos posobj = new pos();


  void updater()
  {
    setState(() {
      listUsers = fetchUsers(
          widget.topicID,
          dropdownvalue1,
          dropdownvalue2);
    });
  }

  @override
  void initState() {
    setState(() {
      listUsers = fetchUsers(
          widget.topicID,
          dropdownvalue1,
          dropdownvalue2);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: _drawer(),
        backgroundColor: Color.fromARGB(255, 220, 228, 241),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), // Set this height
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/rectangle_798.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/group_36.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                        child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Html(
                              data: widget.title.toString(),
                              style: {
                                "body": Style(
                                  fontSize: FontSize(14.0),
                                  color: Colors.white,
                                  fontFamily: 'NotoNastaliqUrdu',
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                                "p": Style(
                                  fontSize: FontSize(14.0),
                                  fontFamily: 'NotoNastaliqUrdu',
                                  color: Colors.white,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                              },
                            )
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 30.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => HomeScreen()));
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
        ),
        body: FutureBuilder<pos>(
          future: listUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              posobj = snapshot.data!;

              print('yes present');

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
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
                                  fontFamily: 'NotoNastaliqUrdu'),
                              prefixIcon: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/backbutton.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ))),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 2),
                                        blurRadius: 10,
                                        color: Color(0x19000000),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: DropDownWidget2(
                                              title: 'page',
                                              items: spinnerItems1,
                                              currentItem: spinnerItems1
                                                  .contains(dropdownvalue1)
                                                  ? dropdownvalue1
                                                  : spinnerItems1[0],
                                              hintText: 'hint',
                                              itemCallBack: (String status) {
                                                setState(() {
                                                  print('drop1');
                                                  this.dropdownvalue1 = status;
                                                  updater();
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Container(
                                          width: 100,
                                          height: 50,
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                'صفحہ نمبر',
                                                style: TextStyle(
                                                    fontFamily: 'NotoNastaliqUrdu',
                                                    fontSize: 10.0),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 2),
                                        blurRadius: 10,
                                        color: Color(0x19000000),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: DropDownWidget2(
                                              title: 'page',
                                              items: spinnerItems2,
                                              currentItem: spinnerItems2
                                                  .contains(dropdownvalue2)
                                                  ? dropdownvalue2
                                                  : spinnerItems2[0],
                                              hintText: 'hint',
                                              itemCallBack: (String status) {
                                                setState(() {
                                                  print('drop2');
                                                  this.dropdownvalue2 = status;
                                                  updater();
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Container(
                                          width: 100,
                                          height: 50,
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                'تعداد',
                                                style: TextStyle(
                                                    fontFamily: 'NotoNastaliqUrdu',
                                                    fontSize: 10.0),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        )),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: posobj.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          print('list length ${posobj.data?.length}');
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 20.0),
                            child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.white,
                              ),
                              child: ListTile(
                                leading: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.grey,
                                  size: 15.0,
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: RichText(
                                      text: HTML.toTextSpan(context,
                                        "${posobj.data![index].hadeesNumber.toString()}:  ${posobj.data![index].hadithUrduText.toString()}",
                                        defaultTextStyle: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'NotoNastaliqUrdu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      maxLines: 1,
                                    ),),
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
                                onTap: () async {

                                  SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                                  prefs.setString('hadith',
                                      "${posobj.data![index].hadithUrduText.toString()}");
                                  prefs.setString('HadithNumber',
                                      "${posobj.data![index].hadeesNumber.toString()}");
                                  String? mainbookID = prefs.getString('mainbookID');
                                  String? mainbook = prefs.getString('mainbookName');

                                  setState(() {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) => MozooAhadithList(title: 'title', topicID: '')));

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
              return Center(child: Text('${snapshot.error}'));
            }
            return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.green),
            );
          },
        ));
  }

  Widget _drawer() {
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
                  onTap: () {},
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
                            image:
                            AssetImage('assets/images/layer_7_copy_2.png'),
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
                _menuOptions(
                    'assets/images/group_48.png', 'کچھ ہمارے بارے میں'),
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
                    image: AssetImage('assets/images/pattern.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )
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
                      fontFamily: 'NotoNastaliqUrdu'),
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


Future<pos> fetchUsers(String id, String pagenumber, String number) async {
  try {

    Response response =
    await Dio().get('https://api.mohaddis.com/api/TopicAhadith?type=json',
        queryParameters: {
          'TopicId': id,
          'IsEnglish': "false",
          'BookList': "1,2,3,4,5,6",
          'pNo': pagenumber,
          'pSize': number,
          'TarBukhari': "HadeesNumber",
          'TarMuslim': "HadeesNumber",
          'TarDaud': "HadeesNumber",
          'TarNisai': "HadeesNumber",
          'TarTrimzi': "HadeesNumber",
          'TarMajah': "HadeesNumber",
          'TransBukhari': "HadithUrduText",
          'TransMuslim': "HadithUrduText",
          'TransDaud': "HadithUrduText",
          'TransNisai': "HadithUrduText",
          'TransTrimzi': "HadithUrduText",
          'TransMajah': "HadithUrduText",
        },
        options: Options(
          headers: {"X-ApiKey": "dztydmpy986xwKgCxHQHMjx1qHRrzMQN"},
        ));
    if (response.statusCode == 200) {
      print(response.data.toString());

      return pos.fromJson(response.data);
      ;
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

  factory pos.fromJson(List<dynamic> parsedJson) {
    List<Data> data = <Data>[];
    print(data.runtimeType);
    data = parsedJson.map((i) => Data.fromJson(i)).toList();

    return pos(data: data);
  }
}



class Data {
  String? topicsUrduCSV;
  String? topicsArabicCSV;
  int? rowNo;
  int? hadithBookID;
  String? hadithBookName;
  String? hadithBookNameUrdu;
  String? hadithBookNameEng;
  String? kitaabNameEng;
  int? iDPKkutab;
  String? kitaabNameArabic;
  String? kitaabNameUrdu;
  int? iDPKAbwaab;
  String? baabNameArabic;
  String? baabNameUrdu;
  String? baabNameEng;
  double? hadeesNumber;
  int? mohaddisHadeesNumber;
  String? hadithArabicText;
  String? hadithUrduText;
  String? hadithHashiaText;
  String? hadithTypeAtraaf;
  String? hadithTypeRawaat;
  String? hadithTypeQFT;
  String? hadithHukamAjmali;
  String? hadithHukamTafseeli;
  String? hadithMouzuhArabic;
  String? hadithMouzuhUrdu;
  String? hadithHukamTafseeliArabic;
  int? idAhadith;
  int? totalRecords;

  Data(
      {this.topicsUrduCSV,
        this.topicsArabicCSV,
        this.rowNo,
        this.hadithBookID,
        this.hadithBookName,
        this.hadithBookNameUrdu,
        this.hadithBookNameEng,
        this.kitaabNameEng,
        this.iDPKkutab,
        this.kitaabNameArabic,
        this.kitaabNameUrdu,
        this.iDPKAbwaab,
        this.baabNameArabic,
        this.baabNameUrdu,
        this.baabNameEng,
        this.hadeesNumber,
        this.mohaddisHadeesNumber,
        this.hadithArabicText,
        this.hadithUrduText,
        this.hadithHashiaText,
        this.hadithTypeAtraaf,
        this.hadithTypeRawaat,
        this.hadithTypeQFT,
        this.hadithHukamAjmali,
        this.hadithHukamTafseeli,
        this.hadithMouzuhArabic,
        this.hadithMouzuhUrdu,
        this.hadithHukamTafseeliArabic,
        this.idAhadith,
        this.totalRecords});

  Data.fromJson(Map<String, dynamic> json) {
    topicsUrduCSV = json['TopicsUrduCSV'];
    topicsArabicCSV = json['TopicsArabicCSV'];
    rowNo = json['RowNo'];
    hadithBookID = json['HadithBookID'];
    hadithBookName = json['HadithBookName'];
    hadithBookNameUrdu = json['HadithBookNameUrdu'];
    hadithBookNameEng = json['HadithBookNameEng'];
    kitaabNameEng = json['KitaabNameEng'];
    iDPKkutab = json['IDPKkutab'];
    kitaabNameArabic = json['kitaabNameArabic'];
    kitaabNameUrdu = json['kitaabNameUrdu'];
    iDPKAbwaab = json['IDPKAbwaab'];
    baabNameArabic = json['BaabNameArabic'];
    baabNameUrdu = json['BaabNameUrdu'];
    baabNameEng = json['BaabNameEng'];
    hadeesNumber = json['HadeesNumber'];
    mohaddisHadeesNumber = json['MohaddisHadeesNumber'];
    hadithArabicText = json['HadithArabicText'];
    hadithUrduText = json['HadithUrduText'];
    hadithHashiaText = json['HadithHashiaText'];
    hadithTypeAtraaf = json['HadithTypeAtraaf'];
    hadithTypeRawaat = json['HadithTypeRawaat'];
    hadithTypeQFT = json['HadithTypeQFT'];
    hadithHukamAjmali = json['HadithHukamAjmali'];
    hadithHukamTafseeli = json['HadithHukamTafseeli'];
    hadithMouzuhArabic = json['HadithMouzuhArabic'];
    hadithMouzuhUrdu = json['HadithMouzuhUrdu'];
    hadithHukamTafseeliArabic = json['HadithHukamTafseeliArabic'];
    idAhadith = json['IdAhadith'];
    totalRecords = json['TotalRecords'];
  }

}
