import 'package:animations/animations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mohaddis/BookScreens/SubBookScreen3.dart';
import 'package:mohaddis/ChapterScreens/SubChapterScreen2.dart';
import 'package:mohaddis/FrontEnd/HomeScreen.dart';
import 'package:mohaddis/NavMenuScreens/AboutScreen.dart';
import 'package:mohaddis/NavMenuScreens/ContactScreen.dart';
import 'package:mohaddis/NavMenuScreens/PropertiesScreen.dart';
import 'package:mohaddis/NavMenuScreens/SupportScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_html_css/simple_html_css.dart';

class SubBookScreen2 extends StatefulWidget {

  final String id;
  final String name;
  const SubBookScreen2({Key? key, required this.id, required this.name}) : super(key: key);

  @override
  State<SubBookScreen2> createState() => _SubBookScreen2State();
}

class _SubBookScreen2State extends State<SubBookScreen2> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late Future<pos> listUsers;
  pos posobj = new pos();

  List<String> dropdownTarakeemList = [];
  List<String> dropdownTarajumList = [];
  List<String> dropdownHukamList = [];

  getSP() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    dropdownTarakeemList.add(prefs.getString('tarakeem1').toString());
    dropdownTarakeemList.add(prefs.getString('tarakeem2').toString());
    dropdownTarakeemList.add(prefs.getString('tarakeem3').toString());
    dropdownTarakeemList.add(prefs.getString('tarakeem4').toString());
    dropdownTarakeemList.add(prefs.getString('tarakeem5').toString());
    dropdownTarakeemList.add(prefs.getString('tarakeem6').toString());

    dropdownTarajumList.add(prefs.getString('tarajum1').toString());
    dropdownTarajumList.add(prefs.getString('tarajum2').toString());
    dropdownTarajumList.add(prefs.getString('tarajum3').toString());
    dropdownTarajumList.add(prefs.getString('tarajum4').toString());
    dropdownTarajumList.add(prefs.getString('tarajum5').toString());
    dropdownTarajumList.add(prefs.getString('tarajum6').toString());

    dropdownHukamList.add(prefs.getString('hukam1').toString());
    dropdownHukamList.add(prefs.getString('hukam2').toString());
    dropdownHukamList.add(prefs.getString('hukam3').toString());
    dropdownHukamList.add(prefs.getString('hukam4').toString());
    dropdownHukamList.add(prefs.getString('hukam5').toString());
    dropdownHukamList.add(prefs.getString('hukam6').toString());

  }

  @override
  void initState() {
    getSP();
    listUsers = fetchUsers(widget.id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.only(left: 20.0,top: 20.0),
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
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                          child: Html(
                            data: widget.name.toString(),
                            style: {
                              "body": Style(
                                fontSize: FontSize(14.0),
                                fontFamily: 'NotoNastaliqUrdu',
                                color: Colors.white,
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
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0,top: 30.0),
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


              print('yes present');

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
                        itemCount: posobj.data?.length,
                        itemBuilder: (BuildContext context, int index) {
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
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: RichText(
                                      text: HTML.toTextSpan(context,
                                        posobj.data![index].baabNameUrdu.toString(),
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
                                onTap: () async {
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('baab', "${posobj.data![index].baabNameUrdu.toString()}");
                                  prefs.setString('baabID', "${posobj.data![index].iDPK.toString()}");

                                  String mainbookID = prefs.getString('mainbookID').toString();

                                  setState(() {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) => SubBookScreen3(id: '${posobj.data![index].iDPK.toString()}', name: '${posobj.data![index].baabNameUrdu.toString()}', defaultTarakeem: dropdownTarakeemList, defaultTranslation: dropdownTarajumList, defaultHashiya: dropdownTarajumList, defaultHukam: dropdownHukamList, mainbookID: mainbookID)));

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




Future<pos> fetchUsers(String id) async {
  try {
    Response response = await Dio().get('https://api.mohaddis.com/api/abwaabs?type=json', queryParameters: {'KitaabID': id},options: Options(
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
  int? kitaabID;
  String? baabNameArabic;
  String? baabNameUrdu;
  String? baabNameEng;
  String? tarjumatulBaabArabic;
  String? tarjumatulBaabUrdu;

  Data(
      {this.iDPK,
        this.kitaabID,
        this.baabNameArabic,
        this.baabNameUrdu,
        this.baabNameEng,
        this.tarjumatulBaabArabic,
        this.tarjumatulBaabUrdu});

  Data.fromJson(Map<String, dynamic> json) {
    iDPK = json['IDPK'];
    kitaabID = json['KitaabID'];
    baabNameArabic = json['BaabNameArabic'];
    baabNameUrdu = json['BaabNameUrdu'];
    baabNameEng = json['BaabNameEng'];
    tarjumatulBaabArabic = json['TarjumatulBaabArabic'];
    tarjumatulBaabUrdu = json['TarjumatulBaabUrdu'];
  }

}




