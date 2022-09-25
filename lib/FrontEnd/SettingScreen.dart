import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mohaddis/FrontEnd/HomeScreen.dart';
import 'package:mohaddis/SettingTabScreens/HukmAlHadees.dart';
import 'package:mohaddis/SettingTabScreens/Tarajum.dart';
import 'package:mohaddis/SettingTabScreens/Tarakeem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

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
    listUsers = fetchUsers();
    getSP();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(105), // Set this height
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/rectangle_798.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap:(){
                              },
                              child: Container(
                                width: 35,
                                height: 35,

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
                                  child: Text('موضوعات ',
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
                _bottom()
              ],
            ),
          ),
        ),
        body: FutureBuilder<pos>(
          future: listUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              posobj = snapshot.data!;


              print('yes present');

              return TabBarView(
                children: [
                  HukmAlHadees(settings: posobj.hukamSettings, list: dropdownHukamList),
                  Tarajum(settings: posobj.translationSettings, list: dropdownTarajumList),
                  Tarakeem(settings: posobj.taraqeemSettings, list: dropdownTarakeemList),
                ],
              );
            } else if (snapshot.hasError) {
              return Center( child: Text('${snapshot.error}'));
            }
            return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.green),
            );
          },
        ),
      ),
    );
  }



  TabBar _bottom() {
    return TabBar(
      indicatorPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white60,
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2.0, color: Colors.green),
          insets: EdgeInsets.symmetric(horizontal: 0.0)),
      automaticIndicatorColorAdjustment: true,
      labelStyle: TextStyle(
        fontFamily: 'Lora',
        fontWeight: FontWeight.w500,
        letterSpacing: 1.0,
      ),
      onTap: (index) {
        print("\nIndex is: $index");
        if (mounted) {
          setState(() {
          });
        }
      },
      tabs: [
        Tab(
          child: Text(
            "الحکم علی الحدیث",
            style: TextStyle(
              fontSize: 10.0,
              fontFamily: 'NotoNastaliqUrdu',
              fontWeight: FontWeight.w500,
              letterSpacing: 1.0,
            ),
          ),
        ),
        Tab(
          child: Text(
            "التراجم",
            style: TextStyle(
              fontSize: 10.0,
              fontFamily: 'NotoNastaliqUrdu',
              fontWeight: FontWeight.w500,
              letterSpacing: 1.0,
            ),
          ),
        ),
        Tab(
          child: Text(
            "التراقيم",
            style: TextStyle(
              fontSize: 10.0,
              fontFamily: 'NotoNastaliqUrdu',
              fontWeight: FontWeight.w500,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ],
    );
  }
}



Future<pos> fetchUsers() async {
  try {
    Response response = await Dio().get('https://api.mohaddis.com/api/defaultsettings?type=json');
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
  final List<TranslationSettings>? translationSettings;
  final List<TaraqeemSettings>? taraqeemSettings;
  final List<HukamSettings>? hukamSettings;
  final List<OptionsCount>? optionsCount;

  pos(
      {this.translationSettings,
        this.taraqeemSettings,
        this.hukamSettings,
        this.optionsCount});

  factory pos.fromJson(Map<String, dynamic> parsedJson){

    var translationlist = parsedJson['TranslationSettings'] as List;
    List<TranslationSettings> translationSettingsList = translationlist.map((i) => TranslationSettings.fromJson(i)).toList();

    var taraqeemlist = parsedJson['TaraqeemSettings'] as List;
    List<TaraqeemSettings> taraqeemSettingsList = taraqeemlist.map((i) => TaraqeemSettings.fromJson(i)).toList();

    var hukamlist = parsedJson['HukamSettings'] as List;
    List<HukamSettings> hukamSettingsList = hukamlist.map((i) => HukamSettings.fromJson(i)).toList();

    var optionsCountlist = parsedJson['OptionsCount'] as List;
    List<OptionsCount> optionsCountList = optionsCountlist.map((i) => OptionsCount.fromJson(i)).toList();


    return pos(
        translationSettings: translationSettingsList,
        taraqeemSettings: taraqeemSettingsList,
        hukamSettings: hukamSettingsList,
        optionsCount: optionsCountList

    );
  }
}


class TranslationSettings {
  int? srNo;
  Null? tarNo;
  String? urduSrNo;
  String? bookName;
  int? bookID;
  String? value;
  String? name;
  String? hashiyaValue;
  String? urduName;
  Null? ikhtisar;

  TranslationSettings(
      {this.srNo,
        this.tarNo,
        this.urduSrNo,
        this.bookName,
        this.bookID,
        this.value,
        this.name,
        this.hashiyaValue,
        this.urduName,
        this.ikhtisar});

  TranslationSettings.fromJson(Map<String, dynamic> json) {
    srNo = json['SrNo'];
    tarNo = json['TarNo'];
    urduSrNo = json['UrduSrNo'];
    bookName = json['BookName'];
    bookID = json['BookID'];
    value = json['Value'];
    name = json['Name'];
    hashiyaValue = json['HashiyaValue'];
    urduName = json['UrduName'];
    ikhtisar = json['Ikhtisar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SrNo'] = this.srNo;
    data['TarNo'] = this.tarNo;
    data['UrduSrNo'] = this.urduSrNo;
    data['BookName'] = this.bookName;
    data['BookID'] = this.bookID;
    data['Value'] = this.value;
    data['Name'] = this.name;
    data['HashiyaValue'] = this.hashiyaValue;
    data['UrduName'] = this.urduName;
    data['Ikhtisar'] = this.ikhtisar;
    return data;
  }
}

class TaraqeemSettings {
  int? srNo;
  String? tarNo;
  String? urduSrNo;
  String? bookName;
  int? bookID;
  String? value;
  String? name;
  Null? hashiyaValue;
  String? urduName;
  Null? ikhtisar;

  TaraqeemSettings(
      {this.srNo,
        this.tarNo,
        this.urduSrNo,
        this.bookName,
        this.bookID,
        this.value,
        this.name,
        this.hashiyaValue,
        this.urduName,
        this.ikhtisar});

  TaraqeemSettings.fromJson(Map<String, dynamic> json) {
    srNo = json['SrNo'];
    tarNo = json['TarNo'];
    urduSrNo = json['UrduSrNo'];
    bookName = json['BookName'];
    bookID = json['BookID'];
    value = json['Value'];
    name = json['Name'];
    hashiyaValue = json['HashiyaValue'];
    urduName = json['UrduName'];
    ikhtisar = json['Ikhtisar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SrNo'] = this.srNo;
    data['TarNo'] = this.tarNo;
    data['UrduSrNo'] = this.urduSrNo;
    data['BookName'] = this.bookName;
    data['BookID'] = this.bookID;
    data['Value'] = this.value;
    data['Name'] = this.name;
    data['HashiyaValue'] = this.hashiyaValue;
    data['UrduName'] = this.urduName;
    data['Ikhtisar'] = this.ikhtisar;
    return data;
  }
}

class HukamSettings {
  int? srNo;
  Null? tarNo;
  String? urduSrNo;
  String? bookName;
  int? bookID;
  String? value;
  String? name;
  Null? hashiyaValue;
  Null? urduName;
  String? ikhtisar;

  HukamSettings(
      {this.srNo,
        this.tarNo,
        this.urduSrNo,
        this.bookName,
        this.bookID,
        this.value,
        this.name,
        this.hashiyaValue,
        this.urduName,
        this.ikhtisar});

  HukamSettings.fromJson(Map<String, dynamic> json) {
    srNo = json['SrNo'];
    tarNo = json['TarNo'];
    urduSrNo = json['UrduSrNo'];
    bookName = json['BookName'];
    bookID = json['BookID'];
    value = json['Value'];
    name = json['Name'];
    hashiyaValue = json['HashiyaValue'];
    urduName = json['UrduName'];
    ikhtisar = json['Ikhtisar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SrNo'] = this.srNo;
    data['TarNo'] = this.tarNo;
    data['UrduSrNo'] = this.urduSrNo;
    data['BookName'] = this.bookName;
    data['BookID'] = this.bookID;
    data['Value'] = this.value;
    data['Name'] = this.name;
    data['HashiyaValue'] = this.hashiyaValue;
    data['UrduName'] = this.urduName;
    data['Ikhtisar'] = this.ikhtisar;
    return data;
  }
}

class OptionsCount {
  String? bookName;
  int? bookID;
  int? taraqeems;
  int? translations;
  int? hukams;

  OptionsCount(
      {this.bookName,
        this.bookID,
        this.taraqeems,
        this.translations,
        this.hukams});

  OptionsCount.fromJson(Map<String, dynamic> json) {
    bookName = json['BookName'];
    bookID = json['BookID'];
    taraqeems = json['Taraqeems'];
    translations = json['Translations'];
    hukams = json['Hukams'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BookName'] = this.bookName;
    data['BookID'] = this.bookID;
    data['Taraqeems'] = this.taraqeems;
    data['Translations'] = this.translations;
    data['Hukams'] = this.hukams;
    return data;
  }
}