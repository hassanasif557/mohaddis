import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

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
                      Container(
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
                              onTap: () {},
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
                                  Text("تلاش "), // <-- Text
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
                                  onTap: () {},
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
                                      Text("موضوعات "), // <-- Text
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
                                  onTap: () {},
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
                                      Text("کتابیں "), // <-- Text
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
                              onTap: () {},
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
                                  Text("اپڈیٹس "), // <-- Text
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
        color: Colors.black,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => HomeScreen()));
              },
              child: Center(
                child: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/images/google.png'),
                  backgroundColor: Colors.black,
                  radius: MediaQuery.of(context).orientation ==
                      Orientation.portrait
                      ? MediaQuery.of(context).size.height *
                      (1.2 / 8) /
                      2.5
                      : MediaQuery.of(context).size.height *
                      (2.5 / 8) /
                      2.5,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            _menuOptions(Icons.person_outline_rounded, 'Profile'),
            SizedBox(
              height: 10.0,
            ),
            _menuOptions(Icons.settings, 'Setting'),
            SizedBox(
              height: 10.0,
            ),
            _menuOptions(Icons.support_outlined, 'Support'),
            SizedBox(
              height: 10.0,
            ),
            _menuOptions(Icons.description_outlined, 'About'),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuOptions(IconData icon, String menuOptionIs) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: Duration(
        milliseconds: 500,
      ),
      closedElevation: 0.0,
      openElevation: 3.0,
      closedColor: Colors.black,
      openColor: Colors.black,
      middleColor: Colors.black,
      onClosed: (value) {
        // print('Profile Page Closed');
        // if (mounted) {
        //   setState(() {
        //     ImportantThings.findImageUrlAndUserName();
        //   });
        // }
      },
      openBuilder: (context, openWidget) {
        if (menuOptionIs == 'Profile')
          return HomeScreen();
        else if (menuOptionIs == 'Setting')
          return HomeScreen();
        else if (menuOptionIs == 'Support')
          return HomeScreen();
        else if (menuOptionIs == 'About') return HomeScreen();
        return Center();
      },
      closedBuilder: (context, closeWidget) {
        return SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.lightBlue,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                menuOptionIs,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
