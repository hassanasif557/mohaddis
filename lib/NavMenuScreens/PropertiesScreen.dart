import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mohaddis/FrontEnd/HomeScreen.dart';
import 'package:mohaddis/NavMenuScreens/AboutScreen.dart';
import 'package:mohaddis/NavMenuScreens/ContactScreen.dart';
import 'package:mohaddis/NavMenuScreens/SupportScreen.dart';

class PropertiesScreen extends StatefulWidget {
  const PropertiesScreen({Key? key}) : super(key: key);

  @override
  State<PropertiesScreen> createState() => _PropertiesScreenState();
}

class _PropertiesScreenState extends State<PropertiesScreen> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
                            child: Text('خصوصیات',
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
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 10.0, top: 8.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('السلام علیکم ورحمۃ اللہ وبرکاتہ!',
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoNastaliqUrdu'
                  ),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 10.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('معزز قارئین کرام ۔۔!\n ہماری تمام ویب سائٹس(محدث ، محدث لائبریری، محدث فتویٰ،محدث فورم، محدث میگزین) اسلامک ویلفیئر ٹرسٹ کے زیر اہتمام قائم معروف تحقیقی ریسرچ سنٹر مجلس التحقیق الاسلامی کی عمارت میں چل رہی ہیں۔ جس کا ہیڈ آفس99۔جے ماڈل ٹاؤن، لاہور میں قائم ہے۔ٹرسٹ کے زیر اہتمام متعدد علمی، تحقیقی اور رفاہی ادارے کام کر رہے ہیں۔ اس شعبے کے نگران ڈاکٹرحافظ انس نضر صاحب، جبکہ انتظامی ذمہ دار قاری محمد مصطفی راسخ صاحب ہیں۔اس وقت مجلس التحقیق الاسلامی کی عمارت میں موجود پرشکوہ لائبریری کے ساتھ ساتھ پانچ مختلف ویب سائٹس آن لائن ہیں، جن کی تفصیل درج ذیل ہے:',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey[700],
                      fontFamily: 'NotoNastaliqUrdu'
                  ),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 10.0, top: 0.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('محدث (Mohaddis.com)',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.green[700],
                      fontFamily: 'NotoNastaliqUrdu'
                  ),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 10.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('یہ سائٹ اردو زبان میں خدمت حدیث شریف کے سلسلے میں ایک عظیم الشان قدم ہے۔یہ ویب سائٹ اہل علم کے ہاں معروف حدیث کے عربی سوفٹ وئیر مکتبۃ الحدیث المعروف بہ کتب تسعہ کی طرز پر آن لائن سہولت کے ساتھ تیار کی گئی ہے۔اس سائٹ پر احادیث مبارکہ اپنی تمام تر تفصیلات کے ساتھ موجود ہیں، تاکہ عوام الناس بھی حدیث کے حکم سے بخوبی واقف ہو سکیں۔اس سائٹ پر اب تک حدیث کی چھ معروف کتابیں (صحیح بخاری، صحیح مسلم، جامع ترمذی، سنن ابو داؤد، سنن ابن ماجہ اورسنن النسائی) صحاح ستہ اپلوڈ کی جاچکی ہیں،جامع ترمذی کے علاوہ باقی پانچ کتب کے دو دو اُردو تراجم اپلوڈ ہیں، جامع ترمذی کا فی الوقت ایک ہی اردو ترجمہ ہے۔ اس ویب سائٹ کو 2014ء میں بیس رمضان المبارک کو آن لائن کیا گیا ۔اس سائٹ پر موجود کسی بھی حدیث کو سوشل میڈیا پر شیئر کرنے کی سہولت بھی دی گئی ہے۔',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey[700],
                      fontFamily: 'NotoNastaliqUrdu'
                  ),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 10.0, top: 0.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('خصوصیات',
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                      fontFamily: 'NotoNastaliqUrdu'
                  ),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 10.0, bottom: 10.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('یہ ویب سائٹ متعدد شاندار خصوصیات کی حامل ہے جن میں قاری کو زیادہ سے زیادہ سہولیات فراہم کرنے کی کوشش کی گئی ہے۔ ان میں سے چند معروف خصوصیات درج ذیل ہیں',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey[700],
                      fontFamily: 'NotoNastaliqUrdu'
                  ),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(3))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text('احادیث مبارکہ کو چار طریقوں سے تلاش کی سہولت: 1. عربی متن ، اردو ترجمہ 2. کتاب، باب 3. حدیث نمبر 4. موضوعات حدیث',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 9.0,
                                  color: Colors.grey[700],
                                  fontFamily: 'NotoNastaliqUrdu'
                              ),),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.all(Radius.circular(3))
                        ),
                        width: 50.0,
                        height: 47,
                        child: Center(child: Text('1')),),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(3))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text('ہر کتابِ حدیث کی متعدد متداول تراقیم',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 9.0,
                                  color: Colors.grey[700],
                                  fontFamily: 'NotoNastaliqUrdu'
                              ),),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.all(Radius.circular(3))
                        ),
                        width: 50.0,
                        height: 23,
                        child: Center(child: Text('2')),),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(3))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text('ہر حدیث کے متعدد اُردو تراجم',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 9.0,
                                  color: Colors.grey[700],
                                  fontFamily: 'NotoNastaliqUrdu'
                              ),),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.all(Radius.circular(3))
                        ),
                        width: 50.0,
                        height: 23,
                        child: Center(child: Text('3')),),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(3))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text('ہر حدیث کی صحت وضعف پر متعدّد اہل علم کا حکم',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 9.0,
                                  color: Colors.grey[700],
                                  fontFamily: 'NotoNastaliqUrdu'
                              ),),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.all(Radius.circular(3))
                        ),
                        width: 50.0,
                        height: 23,
                        child: Center(child: Text('4')),),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(3))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text('تمام صحاح ستہ یا ایک یا دو منتخب کتب میں علیحدہ سے تلاش کی سہولت',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 9.0,
                                  color: Colors.grey[700],
                                  fontFamily: 'NotoNastaliqUrdu'
                              ),),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.all(Radius.circular(3))
                        ),
                        width: 50.0,
                        height: 23,
                        child: Center(child: Text('5')),),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(3))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text('ہر حدیث کے متعلق دستیاب سہولیات: (1. حکم اجمالی وتفصیلی ، 2. موضوعات، 3. شرح 4. تخریج)',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 9.0,
                                  color: Colors.grey[700],
                                  fontFamily: 'NotoNastaliqUrdu'
                              ),),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.all(Radius.circular(3))
                        ),
                        width: 50.0,
                        height: 47,
                        child: Center(child: Text('6')),),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(3))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text('ہر حدیث میں نسبت حدیث (قدسی، مرفوع، موقوف، مقطوع)، اتصال سند (متصل ، منقطع) ، اور قسم (قولی، فعلی، تقریری) کی وضاحت',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 9.0,
                                  color: Colors.grey[700],
                                  fontFamily: 'NotoNastaliqUrdu'
                              ),),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.all(Radius.circular(3))
                        ),
                        width: 50.0,
                        height: 47,
                        child: Center(child: Text('7')),),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: Container(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(3))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text('ڈیفالٹ سیٹنگ:صارفین کیلئے اپنی خاص سیٹنگ (مثلاً مخصوص ترقیم، ترجمہ یا حکم وغیرہ) متعیّن کرنے کی سہولت',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 9.0,
                                  color: Colors.grey[700],
                                  fontFamily: 'NotoNastaliqUrdu'
                              ),),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.all(Radius.circular(3))
                        ),
                        width: 50.0,
                        height: 47,
                        child: Center(child: Text('8')),),
                    )
                  ],
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
