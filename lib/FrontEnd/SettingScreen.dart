import 'package:flutter/material.dart';
import 'package:mohaddis/FrontEnd/HomeScreen.dart';
import 'package:mohaddis/SettingTabScreens/HukmAlHadees.dart';
import 'package:mohaddis/SettingTabScreens/Tarajum.dart';
import 'package:mohaddis/SettingTabScreens/Tarakeem.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
        body: TabBarView(
            children: [
              HukmAlHadees(),
              Tarajum(),
              Tarakeem(),
            ],
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
