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

import '../CustomScreens/DropDownWidget2.dart';

class SubBookScreen3 extends StatefulWidget {
  final String id;
  final String name;
  final List<String> defaultTarakeem;
  final List<String> defaultTranslation;
  final List<String> defaultHashiya;
  final List<String> defaultHukam;
  final String mainbookID;

  const SubBookScreen3(
      {Key? key,
      required this.id,
      required this.name,
      required this.defaultTarakeem,
      required this.defaultTranslation,
      required this.defaultHashiya,
      required this.defaultHukam,
      required this.mainbookID})
      : super(key: key);

  @override
  State<SubBookScreen3> createState() => _SubBookScreen3State();
}

class _SubBookScreen3State extends State<SubBookScreen3> {
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
      print(widget.defaultTarakeem.length);
      listUsers = fetchUsers(
          widget.id,
          widget.defaultTarakeem[int.parse(widget.mainbookID) - 1],
          widget.defaultTranslation[int.parse(widget.mainbookID) - 1],
          widget.defaultHashiya[int.parse(widget.mainbookID) - 1],
          widget.defaultHukam[int.parse(widget.mainbookID) - 1],
          dropdownvalue1,
          dropdownvalue2);
    });
  }

  @override
  void initState() {
    setState(() {
      print(widget.defaultTarakeem.length);
      listUsers = fetchUsers(
          widget.id,
          widget.defaultTarakeem[int.parse(widget.mainbookID) - 1],
          widget.defaultTranslation[int.parse(widget.mainbookID) - 1],
          widget.defaultHashiya[int.parse(widget.mainbookID) - 1],
          widget.defaultHukam[int.parse(widget.mainbookID) - 1],
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
                              data: widget.name.toString(),
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
                                            "${posobj.data![index].hadeesNumber.toString()}:  ${posobj.data![index].hadithUrduTextZero.toString()}",
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


                                  String tarakeem = widget.defaultTarakeem[int.parse(widget.mainbookID) - 1];
                                  String translation = widget.defaultTranslation[int.parse(widget.mainbookID) - 1];
                                  String hashiya = widget.defaultHashiya[int.parse(widget.mainbookID) - 1];
                                  String hukam = widget.defaultHukam[int.parse(widget.mainbookID) - 1];

                                   setState(() {
                                     Navigator.push(context,
                                         MaterialPageRoute(builder: (_) => SubBookHomeScreen(id: "${posobj.data![index].hadeesNumber.toString()}", name: '${mainbook}', bookid: '${mainbookID}', tarakeem: '${tarakeem}', translation: '${translation}', hashiya: '${hashiya}', hukam: '${hukam}')));

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

Future<pos> fetchUsers(String id, String tarakeem, String translation,
    String hashiya, String hukam, String pagenumber, String number) async {
  try {
    print(
        'baabid= ${id}, tarakeem= ${tarakeem}, translation= ${translation}, hashia=${hashiya}, hukam= ${hukam}, offset= ${number}');
    Response response =
        await Dio().get('https://api.mohaddis.com/api/ahadith?type=json',
            queryParameters: {
              'baabID': id,
              'DefaulTarqeem': "HadeesNumber",
              'DefaultTranslation': "HadithUrduText",
              'DefaultHashiya': "HadithHashiaText",
              'DefaultHukam': "HadithHukamAjmali",
              'OffSet': pagenumber,
              'PageSize': number
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
  double? hadeesNumber;
  int? hadeesNumberZero;
  double? hadeesNumberTOne;
  double? hadeesNumberTTwo;
  double? hadeesNumberTThree;
  double? hadeesNumberTFour;
  double? hadeesNumberTFive;
  double? hadeesNumberTSix;
  double? hadeesNumberTSeven;
  double? hadeesNumberTEight;
  double? hadeesNumberTNine;
  double? baabID;
  String? hadithArabicText;
  String? hadithBookName;
  String? hadithBookNameUrdu;
  String? hadithBookNameEng;
  String? baabNameArabic;
  String? baabNameEng;
  String? baabNameUrdu;
  String? tarjumatulBaabArabic;
  String? tarjumatulBaabUrdu;
  String? tarjumatulBaabUrduZero;
  String? tarjumatulBaabUrduOne;
  String? tarjumatulBaabUrduTwo;
  String? tarjumatulBaabUrduThree;
  String? tarjumatulBaabUrduFour;
  String? tarjumatulBaabUrduFive;
  String? tarjumatulBaabUrduSix;
  String? tarjumatulBaabUrduSeven;
  String? tarjumatulBaabUrduEight;
  String? tarjumatulBaabUrduNine;
  String? tarjumatulBaabUrduTen;
  String? hadithUrduText;
  String? hadithUrduTextZero;
  String? hadithUrduTextOne;
  String? hadithUrduTextTwo;
  String? hadithUrduTextThree;
  String? hadithUrduTextFour;
  String? hadithUrduTextFive;
  String? hadithUrduTextSix;
  String? hadithUrduTextSeven;
  String? hadithUrduTextEight;
  String? hadithUrduTextNine;
  String? hadithUrduTextTen;
  String? hadithHashiaText;
  String? hadithHashiaTextOne;
  String? hadithHashiaTextTwo;
  String? hadithHashiaTextThree;
  String? hadithHashiaTextFour;
  String? hadithHashiaTextFive;
  String? hadithHashiaTextSix;
  String? hadithHashiaTextSeven;
  String? hadithHashiaTextEight;
  String? hadithHashiaTextNine;
  String? hadithHashiaTextTen;
  String? hadithTypeAtraaf;
  String? kitaabNameARabic;
  String? kitaabNameEng;
  String? hadithTypeRawaat;
  String? hadithTypeQFT;
  String? hadithHukamAjmali;
  String? hadithHukamAjmaliOne;
  String? hadithHukamAjmaliTwo;
  String? hadithHukamAjmaliThree;
  String? hadithHukamAjmaliFour;
  String? hadithHukamAjmaliFive;
  String? hadithHukamAjmaliSix;
  String? hadithHukamAjmaliSeven;
  String? hadithHukamAjmaliEight;
  String? hadithHukamAjmaliNine;
  String? hadithHukamAjmaliTen;
  String? kitaabNameUrdu;
  String? hadithHukamTafseeli;
  String? hadithMouzuhArabic;
  String? hadithMouzuhUrdu;
  String? hadithHukamTafseeliArabic;
  String? kitaabTamheedArabic;
  String? kitaabTamheedUrdu;
  String? abwaabTamheedArabic;
  String? abwaabTamheedUrdu;
  int? totalCount;
  int? bookId;
  double? hadithNo;
  Null? defaulTarqeem;
  Null? defaultTranslation;
  Null? defaultHashiya;
  Null? defaultHukam;
  int? pageNumber;
  int? pageSize;
  Null? sortOrder;
  Null? sortColumn;
  int? offSet;

  Data(
      {this.hadeesNumber,
      this.hadeesNumberZero,
      this.hadeesNumberTOne,
      this.hadeesNumberTTwo,
      this.hadeesNumberTThree,
      this.hadeesNumberTFour,
      this.hadeesNumberTFive,
      this.hadeesNumberTSix,
      this.hadeesNumberTSeven,
      this.hadeesNumberTEight,
      this.hadeesNumberTNine,
      this.baabID,
      this.hadithArabicText,
      this.hadithBookName,
      this.hadithBookNameUrdu,
      this.hadithBookNameEng,
      this.baabNameArabic,
      this.baabNameEng,
      this.baabNameUrdu,
      this.tarjumatulBaabArabic,
      this.tarjumatulBaabUrdu,
      this.tarjumatulBaabUrduZero,
      this.tarjumatulBaabUrduOne,
      this.tarjumatulBaabUrduTwo,
      this.tarjumatulBaabUrduThree,
      this.tarjumatulBaabUrduFour,
      this.tarjumatulBaabUrduFive,
      this.tarjumatulBaabUrduSix,
      this.tarjumatulBaabUrduSeven,
      this.tarjumatulBaabUrduEight,
      this.tarjumatulBaabUrduNine,
      this.tarjumatulBaabUrduTen,
      this.hadithUrduText,
      this.hadithUrduTextZero,
      this.hadithUrduTextOne,
      this.hadithUrduTextTwo,
      this.hadithUrduTextThree,
      this.hadithUrduTextFour,
      this.hadithUrduTextFive,
      this.hadithUrduTextSix,
      this.hadithUrduTextSeven,
      this.hadithUrduTextEight,
      this.hadithUrduTextNine,
      this.hadithUrduTextTen,
      this.hadithHashiaText,
      this.hadithHashiaTextOne,
      this.hadithHashiaTextTwo,
      this.hadithHashiaTextThree,
      this.hadithHashiaTextFour,
      this.hadithHashiaTextFive,
      this.hadithHashiaTextSix,
      this.hadithHashiaTextSeven,
      this.hadithHashiaTextEight,
      this.hadithHashiaTextNine,
      this.hadithHashiaTextTen,
      this.hadithTypeAtraaf,
      this.kitaabNameARabic,
      this.kitaabNameEng,
      this.hadithTypeRawaat,
      this.hadithTypeQFT,
      this.hadithHukamAjmali,
      this.hadithHukamAjmaliOne,
      this.hadithHukamAjmaliTwo,
      this.hadithHukamAjmaliThree,
      this.hadithHukamAjmaliFour,
      this.hadithHukamAjmaliFive,
      this.hadithHukamAjmaliSix,
      this.hadithHukamAjmaliSeven,
      this.hadithHukamAjmaliEight,
      this.hadithHukamAjmaliNine,
      this.hadithHukamAjmaliTen,
      this.kitaabNameUrdu,
      this.hadithHukamTafseeli,
      this.hadithMouzuhArabic,
      this.hadithMouzuhUrdu,
      this.hadithHukamTafseeliArabic,
      this.kitaabTamheedArabic,
      this.kitaabTamheedUrdu,
      this.abwaabTamheedArabic,
      this.abwaabTamheedUrdu,
      this.totalCount,
      this.bookId,
      this.hadithNo,
      this.defaulTarqeem,
      this.defaultTranslation,
      this.defaultHashiya,
      this.defaultHukam,
      this.pageNumber,
      this.pageSize,
      this.sortOrder,
      this.sortColumn,
      this.offSet});

  Data.fromJson(Map<String, dynamic> json) {
    hadeesNumber = json['HadeesNumber'];
    hadeesNumberZero = json['HadeesNumberZero'];
    hadeesNumberTOne = json['HadeesNumberTOne'];
    hadeesNumberTTwo = json['HadeesNumberTTwo'];
    hadeesNumberTThree = json['HadeesNumberTThree'];
    hadeesNumberTFour = json['HadeesNumberTFour'];
    hadeesNumberTFive = json['HadeesNumberTFive'];
    hadeesNumberTSix = json['HadeesNumberTSix'];
    hadeesNumberTSeven = json['HadeesNumberTSeven'];
    hadeesNumberTEight = json['HadeesNumberTEight'];
    hadeesNumberTNine = json['HadeesNumberTNine'];
    baabID = json['BaabID'];
    hadithArabicText = json['HadithArabicText'];
    hadithBookName = json['HadithBookName'];
    hadithBookNameUrdu = json['HadithBookNameUrdu'];
    hadithBookNameEng = json['HadithBookNameEng'];
    baabNameArabic = json['BaabNameArabic'];
    baabNameEng = json['BaabNameEng'];
    baabNameUrdu = json['BaabNameUrdu'];
    tarjumatulBaabArabic = json['TarjumatulBaabArabic'];
    tarjumatulBaabUrdu = json['TarjumatulBaabUrdu'];
    tarjumatulBaabUrduZero = json['TarjumatulBaabUrduZero'];
    tarjumatulBaabUrduOne = json['TarjumatulBaabUrduOne'];
    tarjumatulBaabUrduTwo = json['TarjumatulBaabUrduTwo'];
    tarjumatulBaabUrduThree = json['TarjumatulBaabUrduThree'];
    tarjumatulBaabUrduFour = json['TarjumatulBaabUrduFour'];
    tarjumatulBaabUrduFive = json['TarjumatulBaabUrduFive'];
    tarjumatulBaabUrduSix = json['TarjumatulBaabUrduSix'];
    tarjumatulBaabUrduSeven = json['TarjumatulBaabUrduSeven'];
    tarjumatulBaabUrduEight = json['TarjumatulBaabUrduEight'];
    tarjumatulBaabUrduNine = json['TarjumatulBaabUrduNine'];
    tarjumatulBaabUrduTen = json['TarjumatulBaabUrduTen'];
    hadithUrduText = json['HadithUrduText'];
    hadithUrduTextZero = json['HadithUrduTextZero'];
    hadithUrduTextOne = json['HadithUrduTextOne'];
    hadithUrduTextTwo = json['HadithUrduTextTwo'];
    hadithUrduTextThree = json['HadithUrduTextThree'];
    hadithUrduTextFour = json['HadithUrduTextFour'];
    hadithUrduTextFive = json['HadithUrduTextFive'];
    hadithUrduTextSix = json['HadithUrduTextSix'];
    hadithUrduTextSeven = json['HadithUrduTextSeven'];
    hadithUrduTextEight = json['HadithUrduTextEight'];
    hadithUrduTextNine = json['HadithUrduTextNine'];
    hadithUrduTextTen = json['HadithUrduTextTen'];
    hadithHashiaText = json['HadithHashiaText'];
    hadithHashiaTextOne = json['HadithHashiaTextOne'];
    hadithHashiaTextTwo = json['HadithHashiaTextTwo'];
    hadithHashiaTextThree = json['HadithHashiaTextThree'];
    hadithHashiaTextFour = json['HadithHashiaTextFour'];
    hadithHashiaTextFive = json['HadithHashiaTextFive'];
    hadithHashiaTextSix = json['HadithHashiaTextSix'];
    hadithHashiaTextSeven = json['HadithHashiaTextSeven'];
    hadithHashiaTextEight = json['HadithHashiaTextEight'];
    hadithHashiaTextNine = json['HadithHashiaTextNine'];
    hadithHashiaTextTen = json['HadithHashiaTextTen'];
    hadithTypeAtraaf = json['HadithTypeAtraaf'];
    kitaabNameARabic = json['KitaabNameARabic'];
    kitaabNameEng = json['KitaabNameEng'];
    hadithTypeRawaat = json['HadithTypeRawaat'];
    hadithTypeQFT = json['HadithTypeQFT'];
    hadithHukamAjmali = json['HadithHukamAjmali'];
    hadithHukamAjmaliOne = json['HadithHukamAjmaliOne'];
    hadithHukamAjmaliTwo = json['HadithHukamAjmaliTwo'];
    hadithHukamAjmaliThree = json['HadithHukamAjmaliThree'];
    hadithHukamAjmaliFour = json['HadithHukamAjmaliFour'];
    hadithHukamAjmaliFive = json['HadithHukamAjmaliFive'];
    hadithHukamAjmaliSix = json['HadithHukamAjmaliSix'];
    hadithHukamAjmaliSeven = json['HadithHukamAjmaliSeven'];
    hadithHukamAjmaliEight = json['HadithHukamAjmaliEight'];
    hadithHukamAjmaliNine = json['HadithHukamAjmaliNine'];
    hadithHukamAjmaliTen = json['HadithHukamAjmaliTen'];
    kitaabNameUrdu = json['KitaabNameUrdu'];
    hadithHukamTafseeli = json['HadithHukamTafseeli'];
    hadithMouzuhArabic = json['HadithMouzuhArabic'];
    hadithMouzuhUrdu = json['HadithMouzuhUrdu'];
    hadithHukamTafseeliArabic = json['HadithHukamTafseeliArabic'];
    kitaabTamheedArabic = json['KitaabTamheedArabic'];
    kitaabTamheedUrdu = json['KitaabTamheedUrdu'];
    abwaabTamheedArabic = json['AbwaabTamheedArabic'];
    abwaabTamheedUrdu = json['AbwaabTamheedUrdu'];
    totalCount = json['TotalCount'];
    bookId = json['Book_Id'];
    hadithNo = json['Hadith_No'];
    defaulTarqeem = json['DefaulTarqeem'];
    defaultTranslation = json['DefaultTranslation'];
    defaultHashiya = json['DefaultHashiya'];
    defaultHukam = json['DefaultHukam'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    sortOrder = json['SortOrder'];
    sortColumn = json['SortColumn'];
    offSet = json['OffSet'];
  }
}


/*
"<p style='color:green;'>${posobj2.data2![0].hadithBookNameUrdu.toString()}</p>  <p style='color:red;'>${posobj2.data2![0].kitaabNameUrdu.toString()}</p>  <p style='color:black;'>${posobj2.data2![0].baabNameUrdu.toString()}</p>",

 */