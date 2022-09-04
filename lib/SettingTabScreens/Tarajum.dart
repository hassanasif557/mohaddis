import 'package:flutter/material.dart';

class Tarajum extends StatefulWidget {
  const Tarajum({Key? key}) : super(key: key);

  @override
  State<Tarajum> createState() => _TarajumState();
}

class _TarajumState extends State<Tarajum> {

  String dropdownvalue1 = 'احادیث مبارکہ کو چار طریقوں سے';
  String dropdownvalue2 = 'احادیث مبارکہ کو چار طریقوں سے';
  String dropdownvalue3 = 'احادیث مبارکہ کو چار طریقوں سے';
  String dropdownvalue4 = 'احادیث مبارکہ کو چار طریقوں سے';
  String dropdownvalue5 = 'احادیث مبارکہ کو چار طریقوں سے';
  String dropdownvalue6 = 'احادیث مبارکہ کو چار طریقوں سے';
  List<String> spinnerItems = ['احادیث مبارکہ کو چار طریقوں سے', 'احادیث مبارکہ', 'احادیث مبارکہ کو', 'احادیث مبارکہ کو چار', 'احادیث مبارکہ کو چار طریقوں'];

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
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: dropdownvalue1,
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'NotoNastaliqUrdu'),
                              onChanged: (String? data) {
                                setState(() {
                                  dropdownvalue1 = data!;
                                });
                              },
                              items: spinnerItems
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
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: dropdownvalue2,
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'NotoNastaliqUrdu'),
                              onChanged: (String? data) {
                                setState(() {
                                  dropdownvalue2 = data!;
                                });
                              },
                              items: spinnerItems
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
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: dropdownvalue3,
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'NotoNastaliqUrdu'),
                              onChanged: (String? data) {
                                setState(() {
                                  dropdownvalue3 = data!;
                                });
                              },
                              items: spinnerItems
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
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: dropdownvalue4,
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'NotoNastaliqUrdu'),
                              onChanged: (String? data) {
                                setState(() {
                                  dropdownvalue4 = data!;
                                });
                              },
                              items: spinnerItems
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
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: dropdownvalue5,
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'NotoNastaliqUrdu'),
                              onChanged: (String? data) {
                                setState(() {
                                  dropdownvalue5 = data!;
                                });
                              },
                              items: spinnerItems
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
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: dropdownvalue6,
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'NotoNastaliqUrdu'),
                              onChanged: (String? data) {
                                setState(() {
                                  dropdownvalue6 = data!;
                                });
                              },
                              items: spinnerItems
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
      ],
    );
  }
}
