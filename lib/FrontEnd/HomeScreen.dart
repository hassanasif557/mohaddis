import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:mohaddis/FrontEnd/BookScreen.dart';
import 'package:mohaddis/FrontEnd/ChapterScreen.dart';
import 'package:mohaddis/FrontEnd/SearchScreen.dart';
import 'package:mohaddis/FrontEnd/UpdateScreen.dart';
import 'package:mohaddis/NavMenuScreens/AboutScreen.dart';
import 'package:mohaddis/NavMenuScreens/ContactScreen.dart';
import 'package:mohaddis/NavMenuScreens/PropertiesScreen.dart';
import 'package:mohaddis/NavMenuScreens/SupportScreen.dart';
import 'SettingScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: _drawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150), // Set this height
        child: Container(
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
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Container(
                              width: 150,
                              height: 110,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/banner.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0,top: 10.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SettingScreen()));
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/forma_1_copy.png'),
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
      body: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Container(
                width: 320,
                height: 320,
                child: Column(
                  children: [
                    Container(
                      child: SizedBox.fromSize(
                        size: Size(56, 56),
                        child: ClipOval(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.green,
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => SearchScreen()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/shape_11.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ), // <-- Icon
                                  Text("تلاش ",
                                      style: TextStyle(fontFamily: 'NotoNastaliqUrdu',fontSize: 10.0,)), // <-- Text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: SizedBox.fromSize(
                            size: Size(56, 56),
                            child: ClipOval(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.green,
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) => ChapterScreen()));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/l_0001.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ), // <-- Icon
                                      Text("موضوعات ",
                                        style: TextStyle(fontFamily: 'NotoNastaliqUrdu',fontSize: 10.0,)), // <-- Text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/rectangle_797.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/rectangle_797.png'),
                                    fit: BoxFit.fill,
                                  ),
                              ),
                              child: Center(
                                child: Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/ellipse_1.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.circle
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20,bottom: 20, left: 40, right: 40),
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/layer_7.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: SizedBox.fromSize(
                            size: Size(56, 56),
                            child: ClipOval(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.green,
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) => BookScreen()));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/l_0011.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ), // <-- Icon
                                      Text("کتابیں ",
                                          style: TextStyle(fontFamily: 'NotoNastaliqUrdu',fontSize: 10.0,)), // <-- Text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: SizedBox.fromSize(
                        size: Size(56, 56),
                        child: ClipOval(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.green,
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => UpdateScreen()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/shape_1.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ), // <-- Icon
                                  Text("اپڈیٹس ",
                                      style: TextStyle(fontFamily: 'NotoNastaliqUrdu',
                                        fontSize: 10.0,)), // <-- Text
                                ],
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
                        'assets/images/layer_1698.png'),
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

}
