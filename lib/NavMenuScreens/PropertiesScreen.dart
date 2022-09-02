import 'package:flutter/material.dart';
import 'package:mohaddis/FrontEnd/HomeScreen.dart';

class PropertiesScreen extends StatefulWidget {
  const PropertiesScreen({Key? key}) : super(key: key);

  @override
  State<PropertiesScreen> createState() => _PropertiesScreenState();
}

class _PropertiesScreenState extends State<PropertiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                      color: Colors.black,
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
                      color: Colors.black,
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

        ],
      ),
    );
  }
}
