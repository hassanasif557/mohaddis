import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mohaddis/FrontEnd/HomeScreen.dart';
import 'package:mohaddis/NavMenuScreens/AboutScreen.dart';
import 'package:mohaddis/NavMenuScreens/ContactScreen.dart';
import 'package:mohaddis/NavMenuScreens/PropertiesScreen.dart';
import 'package:mohaddis/NavMenuScreens/SupportScreen.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
                          'تعاون',
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
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
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
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 10.0, top: 10.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'ان عظیم الشان ویب سائٹس کے پروگرامز کو جاری رکھنے میںمجلس التحقیق الاسلامی کے ساتھ مالی تعاون فرمائیں',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontFamily: 'NotoNastaliqUrdu'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 10.0, top: 10.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'جیسا کہ آپ احباب کے علم میں ہے کہ مجلس التحقیق الاسلامی کے زیر اہتمام قائم عظیم الشان دعوتی واصلاحی ویب سائٹس کو جاری رکھنے کے لئے ایک بڑی ٹیم ہمہ وقت خدمات سرانجام دے رہی ہے۔ جن کے وظائف کے سلسلے میں ایک بڑی رقم (دو لاکھ سے زائد) ماہانہ خرچ ہو تی ہے۔ اور یہ سب اخراجات اللہ کے فضل وکرم کے بعد آپ جیسے مخلص اور مخیر حضرات کے تعاون سے پورے ہوتے ہیں۔تبلیغ دین کے یہ کام در حقیقت اللہ کے ہیں اور انہیں اللہ تعالیٰ ہی مکمل فرماتے ہیں۔ یہ تو ان لوگوں کی خوش قسمتی ہے جنہیں اللہ تعالیٰ اس سلسلے میں توفیق دیتے ہیں اور وہ ان کاموں کی تکمیل کا باعث بنتے ہیں۔ چونکہ یہ کام بہت عظیم ہے اور اس کا اجر بھی اللہ کے ہاں بہت زیادہ ہے لہٰذا اس کیلئے درمیان میں مالی ودیگر مشکلات آتی رہتی ہیں جس وجہ سے پریشانی ہوتی ہے۔  سوشل میڈیا کے اس پر فتن دور میں ان سائٹس کی دعوتی واصلاحی افادیت اور معاشرے میں ا ن کے مثبت اور تعمیری کردار سےتو ہر ذی شعور انسان بخوبی آگاہ ہے۔لیکن افسوس کی بات یہ ہے کہ جہاں مخلص احباب ان سائٹس سے خوب خوب فائدہ اٹھاتے ہیں وہیں کچھ مخالفین ان میں خرابی پیدا کرنے کی کوشش میں مصروف رہتے ہیں۔ہماری یہ ویب سائٹس اب الحمد للہ معاشرہ میں نہ صرف کافی مقبول ہوچکی ہیں ، بلکہ ان پر بہت زیادہ علمی واصلاحی ڈیٹا اور مواد بھی اپلوڈ کیا جا چکا ہے۔جنہیں باقاعدہ پروفیشنل اور اچھے انداز میں مسلسل چلانے کے آپ کے مالی تعاون کی اشد ضرورت ہے۔',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey[700],
                      fontFamily: 'NotoNastaliqUrdu'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 47.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 5.0, bottom: 10),
                            child: Text(
                              'مَنْ جَهَّزَ غَازِيًا فِي سَبِيلِ اللَّهِ فَقَدْ غَزَا، وَمَنْ خَلَفَ غَازِيًا فِي سَبِيلِ اللَّهِ بِخَيْرٍ فَقَدْ غَزَا (بخاری:2863) سدفکلجدف  جس شخص نے اللہ کی راہ میں جہاد کرنے والے کو سازوسامان دیا (گویا) اس نے خود جہاد کیا۔ اور جس شخص نے غازی کے گھر بار کی نگرانی کی گویااس نے خود جہاد کیا۔',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey[700],
                                  fontFamily: 'NotoNastaliqUrdu'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide( //                   <--- right side
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )
                        ),
                        width: double.maxFinite,
                        height: 47,
                        child: Text(
                          "حدیث نبوی ﷺہے:",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.black,
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
            padding: const EdgeInsets.only(left: 8.0, right: 10.0, top: 10.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'اس حدیث مبارکہ کے مطابق جو شخص مالی کفالت کرے گا اس کے لئے بھی اتنا ہی اجر جتنا کہ میدان عمل میں شریک شخص کے لئے ہے۔  تو آئیے! مجلس کے ساتھ ماہانہ یا سالانہ بنیادوں پر تعاون کا ایک سلسلہ شروع کریں تاکہ دین حق کے عالمگیر پیغام امن کو دنیا کے کونے کونے تک پہنچایا جا سکے۔ اللہ ہم سب حامی وناصر ہو اور ہمیں اپنے دین حنیف کی خدمت کی خدمت کی توفیق عطا فرمائے۔آمین',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey[700],
                      fontFamily: 'NotoNastaliqUrdu'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 10.0, top: 10.0),
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    top: BorderSide( //                   <--- right side
                      color: Colors.green,
                      width: 2.0,
                    ),
                  )
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'مجلس کے ساتھ تعاون کے لئے  رابطہ نمبربمعہ بینک اکاؤنٹ:',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.green[700],
                      fontFamily: 'NotoNastaliqUrdu'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 10.0, top: 0.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'ڈاکٹر حافظ انس نضر، مدیر مجلس التحقیق الاسلامی، لاہور',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontFamily: 'NotoNastaliqUrdu'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                  border: Border(
                    left: BorderSide( //                   <--- right side
                      color: Colors.green,
                      width: 2.0,
                    ),
                  )
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 10.0, bottom: 10.0),
                  child: Text(
                    '03227222288 \n\nA/c Title: Kitabosunnat.com \n\nA/c no: 0093-01875659 \n\nBank Alfalah Limited \n\nBranch Urdu Bazar, Lahore \n\n(Swift Code: ALFPKKA093) \n\nIBAN: PK73 \n\nALFH 0093 0010 0277 7251',
                    textAlign: TextAlign.left,
                    style: TextStyle(
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
