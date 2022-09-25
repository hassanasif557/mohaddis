import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mohaddis/CustomScreens/CustomDialogBoxAlsharrah.dart';
import 'package:mohaddis/CustomScreens/CustomDialogBoxAltarakeem.dart';
import 'package:mohaddis/ModelClasses/AlSharrahModel.dart';

import '../CustomScreens/CustomDialogBox.dart';
import '../CustomScreens/CustomDialogBoxAlHukm.dart';
import '../CustomScreens/CustomDialogBoxAlMozoo.dart';
import '../CustomScreens/CustomDialogBoxAltarajum.dart';
import '../FrontEnd/HomeScreen.dart';
import '../ModelClasses/AlhukmModel.dart';
import '../ModelClasses/AltahreejModel.dart';
import '../ModelClasses/AltarajumModel.dart';
import '../ModelClasses/AltarakeemModel.dart';
import '../NavMenuScreens/AboutScreen.dart';
import '../NavMenuScreens/ContactScreen.dart';
import '../NavMenuScreens/PropertiesScreen.dart';
import '../NavMenuScreens/SupportScreen.dart';

class SubBookHomeScreen extends StatefulWidget {
  final String name;

  const SubBookHomeScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<SubBookHomeScreen> createState() => _SubBookHomeScreenState();
}

class _SubBookHomeScreenState extends State<SubBookHomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController controller = TextEditingController();

  String dropdownvalue1 = 'احادیث';
  String dropdownvalueArabic1 = 'الأحاديث';
  final List<String> spinnerItemsUrdu = ["احادیث", "کتب", "ابواب", "موضوعات"];

  double _value = 10.0;

  bool chapterbar = true;
  List<AltahreejModel> altahreejlist = [];
  List<AlhukmModel> alhukmlist = [];
  late AltarajumModel altarajumModel;
  List<AltarakeemModel> altarakeemlist = [];
  late AlSharrahModel alSharrahModel;

  List<String> almozooList = [];
  List<String> mozooatList = [];

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
                    padding: const EdgeInsets.only(left: 20.0, top: 10.0),
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
                    child: Column(
                      children: [
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            'کتب احادیث',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontFamily: 'NotoNastaliqUrdu'),
                          ),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 20.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
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
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/l_0001copy.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
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
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/forma_1sharee.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
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
                      )),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3))
                  ],
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0, left: 10.0),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            width: 150,
                            height: 50,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                hint: Text("احادیث"),
                                value: dropdownvalue1,
                                style: TextStyle(
                                    fontSize: 8.0,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'NotoNastaliqUrdu'),
                                onChanged: (String? data) {
                                  setState(() {
                                    dropdownvalue1 = data!;
                                  });
                                },
                                items: spinnerItemsUrdu
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        value,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'NotoNastaliqUrdu'),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 40.0),
                      child: Container(
                        width: 110.0,
                        height: 50.0,
                        child: Row(
                          children: [
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      bottom: BorderSide(
                                        //                   <--- right side
                                        color: Colors.green,
                                        width: 1.0,
                                      ),
                                      top: BorderSide(
                                        //                   <--- right side
                                        color:
                                            Color.fromARGB(255, 220, 228, 241),
                                        width: 1.0,
                                      ),
                                      left: BorderSide(
                                        //                   <--- right side
                                        color:
                                            Color.fromARGB(255, 220, 228, 241),
                                        width: 1.0,
                                      ),
                                      right: BorderSide(
                                        //                   <--- right side
                                        color:
                                            Color.fromARGB(255, 220, 228, 241),
                                        width: 1.0,
                                      ),
                                    )),
                                width: 60.0,
                                height: 30.0,
                                child: Center(
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.black),
                                    decoration: InputDecoration(
                                      hintText: '3346.0',
                                    ),
                                    controller: controller,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 50.0,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  'حدیث نمبر ',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontFamily: 'NotoNastaliqUrdu'),
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
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 10.0, right: 10.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'کتب',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color.fromARGB(255, 37, 160, 75),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'ابواب',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'موضوعات',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10.0, right: 10.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                width: double.maxFinite,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'السلام علیکم ورحمۃ اللہ وبرکاتہ!',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color.fromARGB(255, 37, 160, 75),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10.0, right: 10.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                width: double.maxFinite,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'مَنْ جَهَّزَ غَازِيًا فِي سَبِيلِ اللَّهِ فَقَدْ غَزَا، وَمَنْ خَلَفَ غَازِيًا فِي سَبِيلِ اللَّهِ بِخَيْرٍ فَقَدْ غَزَا (بخاری:2863) سدفکلجدف  جس شخص نے اللہ کی راہ میں جہاد کرنے والے کو سازوسامان دیا (گویا) اس نے خود جہاد کیا۔ اور جس شخص نے غازی کے گھر بار کی نگرانی کی گویااس نے خود جہاد کیا۔',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      height: 2.0,
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 10.0, right: 10.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'کتب',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color.fromARGB(255, 37, 160, 75),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'ابواب',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 14.0,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'موضوعات',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10.0, right: 10.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                width: double.maxFinite,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'مَنْ جَهَّزَ غَازِيًا فِي سَبِيلِ اللَّهِ فَقَدْ غَزَا، وَمَنْ خَلَفَ غَازِيًا فِي سَبِيلِ اللَّهِ بِخَيْرٍ فَقَدْ غَزَا (بخاری:2863) سدفکلجدف  جس شخص نے اللہ کی راہ میں جہاد کرنے والے کو سازوسامان دیا (گویا) اس نے خود جہاد کیا۔ اور جس شخص نے غازی کے گھر بار کی نگرانی کی گویااس نے خود جہاد کیا) سدفکلجدف  جس شخص نے اللہ کی راہ میں جہاد کرنے والے کو سازوسامان دیا (گویا) اس نے خود جہاد کیا۔ اور جس شخص نے غازی کے گھر بار کی نگرانی کی گویااس نے خود جہاد کیا۔',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      height: 2.0,
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            //                   <--- right side
                            color: Colors.green,
                            width: 1.0,
                          ),
                        )),
                    height: 50.0,
                    width: double.maxFinite,
                    child: chapterbar
                        ? new Expanded(
                            child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Slider(
                                value: _value.toDouble(),
                                min: 1.0,
                                max: 20.0,
                                divisions: 100,
                                activeColor: Colors.green,
                                inactiveColor:
                                    Color.fromARGB(255, 220, 228, 241),
                                label: 'Set volume value',
                                onChanged: (double newValue) {
                                  setState(() {
                                    _value = newValue;
                                  });
                                },
                                semanticFormatterCallback: (double newValue) {
                                  return '${newValue.round()} dollars';
                                }),
                          ))
                        : Center(
                            child: InkWell(
                              splashColor: Colors.green,
                              onTap: () {

                                almozooList.clear();
                                almozooList.add('الحكم على الحديث الحكم على الحديث الحكم على الحديث الحكم على الحديث');
                                almozooList.add('الحكم على الحديث ى الحديث الحكم على الحديث');
                                almozooList.add('الحكم على الحديث حكم على الحديث');

                                mozooatList.clear();
                                mozooatList.add('الحكم على الحديث الحكم على الحديث الحكم على الحديث الحكم على الحديث');
                                mozooatList.add('الحكم على الحديث ى الحديث الحكم على الحديث');
                                mozooatList.add('الحكم على الحديث حكم على الحديث');

                                showDialog(context: context,
                                    builder: (BuildContext context){
                                      return CustomDialogBoxAlMozoo(
                                          almozooList: almozooList,
                                          mozooatList: mozooatList,
                                          title: 'موضوعات '
                                      );
                                    }
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 15.0,
                                    width: 15.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/l_0001.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ), // <-- Icon
                                  Text(
                                    "موضوعات ",
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.black),
                                  ), // <-- Text
                                ],
                              ),
                            ),
                          )),
                Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/rectangle_798.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.green,
                            onTap: () {
                              setState(() {
                                if (chapterbar == true)
                                  chapterbar = false;
                                else
                                  chapterbar = true;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/dotss.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ), // <-- Icon
                                // <-- Text
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.green,
                            onTap: () {
                              altahreejlist.clear();
                              altahreejlist.add(AltahreejModel('book_name', '234454'));
                              altahreejlist.add(AltahreejModel('book_name', '23443354'));
                              altahreejlist.add(AltahreejModel('book_name', '2354'));
                              altahreejlist.add(AltahreejModel('book_name', '454'));
                              showDialog(context: context,
                                  builder: (BuildContext context){
                                    return CustomDialogBox(
                                      altahreejlist: altahreejlist,
                                      title: 'التخريج'
                                    );
                                  }
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 15.0,
                                  width: 15.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/forma_1tkh.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ), // <-- Icon
                                Text(
                                  "التخريج",
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.white),
                                ), // <-- Text
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.green,
                            onTap: () {

                              alhukmlist.clear();
                              alhukmlist.add(AlhukmModel('الحكم على الحديث الحكم على الحديث الحكم على الحديث الحكم على الحديث', 'الحكم يث'));
                              alhukmlist.add(AlhukmModel('الحكم على الحديث', 'الحكم يث'));
                              alhukmlist.add(AlhukmModel('الحكم على الحديث', 'الحكم يث'));
                              alhukmlist.add(AlhukmModel('الحكم على الحديث', 'الحكم يث'));
                              showDialog(context: context,
                                  builder: (BuildContext context){
                                    return CustomDialogBoxAlHukm(
                                        alhukmModel: alhukmlist,
                                        title: 'الحکم'
                                    );
                                  }
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 15.0,
                                  width: 15.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/forma_1huk.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ), // <-- Icon
                                Text(
                                  "الحکم ",
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.white),
                                ), // <-- Text
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.green,
                            onTap: () {

                              altarajumModel = AltarajumModel('tab1', 'tab2');
                              showDialog(context: context,
                                  builder: (BuildContext context){
                                    return CustomDialogBoxAltarajum(
                                        altarajumModel: altarajumModel,
                                        title: 'التراجم'
                                    );
                                  }
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 15.0,
                                  width: 15.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/forma_1tar.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ), // <-- Icon
                                Text(
                                  "التراجم",
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.white),
                                ), // <-- Text
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.green,
                            onTap: () {

                              altarakeemlist.clear();
                              altarakeemlist.add(AltarakeemModel('الحكم على الحديث الحكم على الحديث الحكم على الحديث الحكم على الحديث', '454'));
                              altarakeemlist.add(AltarakeemModel('الحكم على الحديث', '23454'));
                              altarakeemlist.add(AltarakeemModel('الحكم على الحديث', '234454'));
                              altarakeemlist.add(AltarakeemModel('الحكم على الحديث', '2354'));
                              showDialog(context: context,
                                  builder: (BuildContext context){
                                    return CustomDialogBoxAltarakeem(
                                        altarakeemlist: altarakeemlist,
                                        title: 'التراقيم'
                                    );
                                  }
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 15.0,
                                  width: 15.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/forma_1qim.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ), // <-- Icon
                                Text(
                                  "التراقيم",
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.white),
                                ), // <-- Text
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.green,
                            onTap: () {
                              alSharrahModel = AlSharrahModel('اس حدیث مبارکہ کے مطابق جو شخص مالی کفالت کرے گا اس کے لئے بھی اتنا ہی اجر جتنا کہ میدان عمل میں شریک شخص کے لئے ہے۔  تو آئیے! مجلس کے ساتھ ماہانہ یا سالانہ بنیادوں پر تعاون کا ایک سلسلہ شروع کریں تاکہ دین حق کے عالمگیر پیغام امن کو دنیا کے کونے کونے تک پہنچایا جا سکے۔ اللہ ہم سب حامی وناصر ہو اور ہمیں اپنے دین حنیف کی خدمت کی خدمت کی توفیق عطا فرمائے۔آمین');
                              showDialog(context: context,
                                  builder: (BuildContext context){
                                    return CustomDialogBoxAlsharrah(
                                        alSharrahModel: alSharrahModel,
                                        title: 'شرح '
                                    );
                                  }
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 15.0,
                                  width: 15.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/forma_1sar.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ), // <-- Icon
                                Text(
                                  "شرح ",
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.white),
                                ), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
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
