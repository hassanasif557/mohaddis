import 'package:animations/animations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mohaddis/CustomScreens/CustomDialogBoxAlsharrah.dart';
import 'package:mohaddis/CustomScreens/CustomDialogBoxAltarakeem.dart';
import 'package:mohaddis/ModelClasses/AlSharrahModel.dart';

import '../CustomScreens/CustomDialogBox.dart';
import '../CustomScreens/CustomDialogBoxAlHukm.dart';
import '../CustomScreens/CustomDialogBoxAlMozoo.dart';
import '../CustomScreens/CustomDialogBoxAltarajum.dart';
import '../CustomScreens/DropDownWidget2.dart';
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
  final String id;
  final String name;
  final String bookid;
  final String tarakeem;
  final String translation;
  final String hashiya;
  final String hukam;


  const SubBookHomeScreen({Key? key, required this.id, required this.name, required this.bookid, required this.tarakeem, required this.translation, required this.hashiya, required this.hukam}) : super(key: key);

  @override
  State<SubBookHomeScreen> createState() => _SubBookHomeScreenState();
}

class _SubBookHomeScreenState extends State<SubBookHomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController controller = TextEditingController();

  String dropdownvalue1 = 'احادیث';
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

  late Future<pos> listUsers;
  pos posobj = new pos();

  late Future<pos2> listUsers2;
  pos2 posobj2 = new pos2();

  @override
  void initState() {
    listUsers = fetchUsers();
    listUsers2 = fetchUsers2(widget.bookid, widget.id, widget.tarakeem, widget.translation, widget.hashiya, widget.hukam);
    dropdownvalue1 = widget.tarakeem;
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
                            widget.name,
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
        body: FutureBuilder<pos>(
          future: listUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              posobj = snapshot.data!;

              spinnerItemsUrdu.clear();
              for(int i=0;i<posobj.taraqeemSettings!.length;i++)
              {
                if(posobj.taraqeemSettings![i].bookID == 1)
                {
                  spinnerItemsUrdu.add(posobj.taraqeemSettings![i].name.toString());
                }
              }


              print('yes present');

              return FutureBuilder<pos2>(
                future: listUsers2,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    posobj2 = snapshot.data!;


                    print('yes present');

                    return Column(
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
                                          child: DropDownWidget2(
                                            title: 'page',
                                            items: spinnerItemsUrdu,
                                            currentItem: spinnerItemsUrdu
                                                .contains(dropdownvalue1)
                                                ? dropdownvalue1
                                                : spinnerItemsUrdu[0],
                                            hintText: 'hint',
                                            itemCallBack: (String status) {
                                              setState(() {
                                                print('drop1');
                                                this.dropdownvalue1 = status;
                                                //updater();
                                              });
                                            },
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
                                                  hintText: posobj2.data2![0].hadeesNumber.toString(),
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
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    posobj2.data2![0].hadithBookName.toString(),
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Color.fromARGB(255, 37, 160, 75),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding( 
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    posobj2.data2![0].kitaabNameARabic.toString(),
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding( 
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    posobj2.data2![0].baabNameArabic.toString(),
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.black,
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
                                            top: 10.0, left: 10.0, right: 10.0),
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Container(
                                            width: double.maxFinite,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                posobj2.data2![0].hadithHukamAjmali.toString(),
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
                                                posobj2.data2![0].hadithArabicText.toString(),
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
                                                child: Html(
                                                  data:
                                                  "<p style='color:green;'>${posobj2.data2![0].hadithBookNameUrdu.toString()}</p>  <p style='color:red;'>${posobj2.data2![0].kitaabNameUrdu.toString()}</p>  <p style='color:black;'>${posobj2.data2![0].baabNameUrdu.toString()}</p>",
                                                  style: {
                                                    "body": Style(
                                                      fontSize: FontSize(10.0),
                                                      fontFamily: 'NotoNastaliqUrdu',
                                                    ),
                                                    "p": Style(
                                                      fontSize: FontSize(10.0),
                                                      fontFamily: 'NotoNastaliqUrdu',
                                                    ),
                                                  },
                                                )
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
                                                posobj2.data2![0].hadithUrduText.toString(),
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
                    );
                  } else if (snapshot.hasError) {
                    return Center( child: Text('${snapshot.error}'));
                  }
                  return Center(
                    child: CircularProgressIndicator(backgroundColor: Colors.green),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center( child: Text('${snapshot.error}'));
            }
            return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.green),
            );
          },
        ),
    );
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






Future<pos2> fetchUsers2(String bookid, String hadithnumber, String tarakeem, String translation, String hashiya, String hukam) async {
  try {
    Response response = await Dio().get('https://api.mohaddis.com/api/ahadith?type=json',
        queryParameters: {
      'BookID': bookid,
          'HadithNo': hadithnumber,
      'DefaulTarqeem': "HadeesNumber",
      'DefaultTranslation': "HadithUrduText",
      'DefaultHashiya': "HadithHashiaText",
      'DefaultHukam': "HadithHukamAjmali",
      'OffSet': '0',
      'PageSize': '20'},options: Options(
      headers: {"X-ApiKey": "dztydmpy986xwKgCxHQHMjx1qHRrzMQN"},
    ));
    if (response.statusCode == 200) {
      print(response.data.toString());

      return pos2.fromJson(response.data);;
    } else {
      throw Exception('Failed to load users');
    }
  } catch (e) {
    print(e);
    throw Exception('Failed to load users');
  }
}




class pos2 {
  final List<Data2>? data2;

  pos2({this.data2});

  factory pos2.fromJson(List<dynamic> parsedJson){

    List<Data2> data2 = <Data2>[];
    print(data2.runtimeType);
    data2 = parsedJson.map((i)=>Data2.fromJson(i)).toList();


    return pos2(
        data2: data2

    );
  }
}


class Data2 {
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

  Data2(
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

  Data2.fromJson(Map<String, dynamic> json) {
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












Future<pos> fetchUsers() async {
  try {
    Response response = await Dio().get('https://api.mohaddis.com/api/defaultsettings?type=json',options: Options(
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