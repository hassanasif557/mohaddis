
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../CustomScreens/DropDownWidget.dart';
import '../FrontEnd/SettingScreen.dart';

class HukmAlHadees extends StatefulWidget {

  final List<HukamSettings>? settings;
  final List<String> list;
  const HukmAlHadees({Key? key, required this.settings, required this.list}) : super(key: key);

  @override
  State<HukmAlHadees> createState() => _HukmAlHadeesState();
}

class _HukmAlHadeesState extends State<HukmAlHadees> {

  late String dropdownvalue1;
  late String dropdownvalue2;
  late String dropdownvalue3;
  late String dropdownvalue4;
  late String dropdownvalue5;
  late String dropdownvalue6;

  List<String> spinnerItems1 = [];
  List<String> spinnerItems2 = [];
  List<String> spinnerItems3 = [];
  List<String> spinnerItems4 = [];
  List<String> spinnerItems5 = [];
  List<String> spinnerItems6 = [];



  @override
  void initState() {

    for(int i=0;i<widget.settings!.length;i++)
    {
      if(widget.settings![i].bookID == 1)
      {
        spinnerItems1.add(widget.settings![i].name.toString());
      }
    }
    for(int i=0;i<widget.settings!.length;i++)
    {
      if(widget.settings![i].bookID == 2)
      {
        spinnerItems2.add(widget.settings![i].name.toString());
      }
    }
    for(int i=0;i<widget.settings!.length;i++)
    {
      if(widget.settings![i].bookID == 3)
      {
        spinnerItems3.add(widget.settings![i].name.toString());
      }
    }
    for(int i=0;i<widget.settings!.length;i++)
    {
      if(widget.settings![i].bookID == 4)
      {
        spinnerItems4.add(widget.settings![i].name.toString());
      }
    }
    for(int i=0;i<widget.settings!.length;i++)
    {
      if(widget.settings![i].bookID == 5)
      {
        spinnerItems5.add(widget.settings![i].name.toString());
      }
    }
    for(int i=0;i<widget.settings!.length;i++)
    {
      if(widget.settings![i].bookID == 6)
      {
        spinnerItems6.add(widget.settings![i].name.toString());
      }
    }


    dropdownvalue1 = widget.list[0];
    dropdownvalue2 = widget.list[1];
    dropdownvalue3 = widget.list[2];
    dropdownvalue4 = widget.list[3];
    dropdownvalue5 = widget.list[4];
    dropdownvalue6 = widget.list[5];




    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 20.0, bottom: 0.0),
          child: Container(
            width: double.maxFinite,
            child: Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 30.0,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border:
                            Border.all(color: Colors.black, width: 1.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: DropdownWidget(
                              title: '',
                              items: spinnerItems1,
                              currentItem: spinnerItems1.contains(dropdownvalue1) ? dropdownvalue1 : spinnerItems1[0],
                              hintText: 'hint',
                              itemCallBack: (String status) {
                                this.dropdownvalue1 = status;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      width: 60.0,
                      height: 50,
                      child: Text(
                        'صحيح البخاري',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoNastaliqUrdu'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 5.0, bottom: 0.0),
          child: Container(
            width: double.maxFinite,
            child: Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 30.0,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border:
                            Border.all(color: Colors.black, width: 1.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: DropdownWidget(
                              title: '',
                              items: spinnerItems2,
                              currentItem: spinnerItems2.contains(dropdownvalue2) ? dropdownvalue2 : spinnerItems2[0],
                              hintText: 'hint',
                              itemCallBack: (String status) {
                                this.dropdownvalue2 = status;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      width: 60.0,
                      height: 50,
                      child: Text(
                        'صحيح مسلم',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoNastaliqUrdu'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 5.0, bottom: 0.0),
          child: Container(
            width: double.maxFinite,
            child: Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 30.0,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border:
                            Border.all(color: Colors.black, width: 1.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: DropdownWidget(
                              title: '',
                              items: spinnerItems3,
                              currentItem: spinnerItems3.contains(dropdownvalue3) ? dropdownvalue3 : spinnerItems3[0],
                              hintText: 'hint',
                              itemCallBack: (String status) {
                                this.dropdownvalue3 = status;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      width: 60.0,
                      height: 50,
                      child: Text(
                        'سنن أبي داؤد',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoNastaliqUrdu'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 5.0, bottom: 0.0),
          child: Container(
            width: double.maxFinite,
            child: Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 30.0,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border:
                            Border.all(color: Colors.black, width: 1.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: DropdownWidget(
                              title: '',
                              items: spinnerItems4,
                              currentItem: spinnerItems4.contains(dropdownvalue4) ? dropdownvalue4 : spinnerItems4[0],
                              hintText: 'hint',
                              itemCallBack: (String status) {
                                this.dropdownvalue4 = status;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      width: 60.0,
                      height: 50,
                      child: Text(
                        'جامع الترمذي',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoNastaliqUrdu'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 5.0, bottom: 0.0),
          child: Container(
            width: double.maxFinite,
            child: Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 30.0,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border:
                            Border.all(color: Colors.black, width: 1.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: DropdownWidget(
                              title: '',
                              items: spinnerItems5,
                              currentItem: spinnerItems5.contains(dropdownvalue5) ? dropdownvalue5 : spinnerItems5[0],
                              hintText: 'hint',
                              itemCallBack: (String status) {
                                this.dropdownvalue5 = status;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      width: 60.0,
                      height: 50,
                      child: Text(
                        'سنن النسائي',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoNastaliqUrdu'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 5.0, bottom: 0.0),
          child: Container(
            width: double.maxFinite,
            child: Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 30.0,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border:
                            Border.all(color: Colors.black, width: 1.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: DropdownWidget(
                              title: '',
                              items: spinnerItems6,
                              currentItem: spinnerItems6.contains(dropdownvalue6) ? dropdownvalue6 : spinnerItems6[0],
                              hintText: 'hint',
                              itemCallBack: (String status) {
                                this.dropdownvalue6 = status;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      width: 60.0,
                      height: 50,
                      child: Text(
                        'سنن ابن ماجه',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoNastaliqUrdu'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
          child: GestureDetector(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('hukam1', dropdownvalue1);
              prefs.setString('hukam2', dropdownvalue2);
              prefs.setString('hukam3', dropdownvalue3);
              prefs.setString('hukam4', dropdownvalue4);
              prefs.setString('hukam5', dropdownvalue5);
              prefs.setString('hukam6', dropdownvalue6);
            },
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.black, width: 1.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'محفوظ کریں',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.black,
                                  fontFamily: 'NotoNastaliqUrdu'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
