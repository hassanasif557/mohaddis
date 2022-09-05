import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mohaddis/FrontEnd/HomeScreen.dart';
import 'package:mohaddis/NavMenuScreens/AboutScreen.dart';
import 'package:mohaddis/NavMenuScreens/ContactScreen.dart';
import 'package:mohaddis/NavMenuScreens/PropertiesScreen.dart';
import 'package:mohaddis/NavMenuScreens/SupportScreen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late List<bool> isSelected;

  bool isUrdu = true;

  TextEditingController controller = TextEditingController();

  String dropdownvalue1 = 'احادیث';
  String dropdownvalueArabic1 = 'الأحاديث';
  final List<String> spinnerItemsUrdu = ["احادیث","کتب","ابواب" ,"موضوعات" ];
  final List<String> spinnerItemsArabic = ["الأحاديث","الكتب","الفصول" ,"المواضيع" ];
  late List<String> spinnerItems;


  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: _drawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140), // Set this height
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,

          child: Stack(
            children: [
              Container(
                height: 170.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/layer_1695.png'),
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
                                  child: Text('تلاش',
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
                                width: 30,
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white,
                        ),

                        child: ToggleButtons(
                          fillColor: Colors.green[700],
                          selectedColor: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0, bottom: 10.0,right: 20.0,left: 20.0),
                              child: Text(
                                'عربی',
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,
                                fontFamily: 'NotoNastaliqUrdu'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0, bottom: 10.0,right: 20.0,left: 20.0),
                              child: Text(
                                'اردو',
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,
                                    fontFamily: 'NotoNastaliqUrdu'),
                              ),
                            ),
                          ],
                          onPressed: (int index) {
                            setState(() {
                              for (int i = 0; i < isSelected.length; i++) {
                                isSelected[i] = i == index;
                              }
                              print('selected ${isSelected[0]}');
                            });
                          },
                          isSelected: isSelected,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: isSelected[0]
          ? Column(
        children: [
          SizedBox(height: 80,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))],
                color: Colors.white,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      showConfirmationDialog(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/menu.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 190.0,
                    height: 50.0,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 10.0,
                        ),
                        decoration: InputDecoration(
                          hintText: '            ٹائپ کریں...',
                        ),
                        controller: controller,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0, left: 10.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        width: 65.0,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Text("الأحاديث"),
                            value: dropdownvalueArabic1,
                            style: TextStyle(
                                fontSize: 8.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,),
                            onChanged: (String? data) {
                              setState(() {
                                dropdownvalueArabic1 = data!;
                              });
                            },
                            items: spinnerItemsArabic
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(value,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,),),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: 50,),
          Container(
            width: 110.0,
            height: 50.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backbutton.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/shape.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'تلا ش کریں',
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                width: double.maxFinite,
                height: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/layer_1699.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      )
          : Column(
        children: [
          SizedBox(height: 80,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3))],
                color: Colors.white,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      showConfirmationDialog(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/menu.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 190.0,
                    height: 50.0,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 10.0,
                          fontFamily: 'NotoNastaliqUrdu'
                        ),
                        decoration: InputDecoration(
                          hintText: '            ٹائپ کریں...',
                        ),
                        controller: controller,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0, left: 10.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        width: 65.0,
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
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(value,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'NotoNastaliqUrdu'),),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: 50,),
          Container(
            width: 110.0,
            height: 50.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backbutton.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/shape.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'تلا ش کریں',
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                      fontFamily: 'NotoNastaliqUrdu'
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                width: double.maxFinite,
                height: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/layer_1699.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
                      color: Colors.black,
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



  showConfirmationDialog(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return CustomDialog();
      },
    );
  }

}



class CustomDialog extends StatefulWidget {
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  List<bool> _isChecked = [false,false, false,false, false,false, false];

  List<String> _texts = [
    'تمام کتابیں',
  'صحيح البخاري',
  'صحيح مسلم',
  'سنن أبي داؤد',
  'جامع الترمذي',
  'سنن النسائي',
  'سنن ابن ماجه'
  ];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('     منتخب کریں',
        textAlign: TextAlign.right,),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(8.0),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _texts.length,
                      itemBuilder: (_, index) {
                        return CheckboxListTile(
                          title: Text(_texts[index]),
                          value: _isChecked[index],
                          onChanged: (val) {
                            setState(() {
                              if(index == 0)
                                {
                                  if(val == true)
                                    {
                                      for (int i=0;i<_isChecked.length;i++) {
                                        _isChecked[i] = true;
                                      }
                                    }
                                  else{
                                    for (int i=0;i<_isChecked.length;i++) {
                                      _isChecked[i] = false;
                                    }
                                  }
                                }
                              else{
                                _isChecked[index] = val!;
                              }

                            });
                          },
                        );
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}



//_isChecked list for alert dialog
//controller.text for edit field
//dropdownvalue1 for urdu spinner, dropdownvaluearabic1 for arabic spinner