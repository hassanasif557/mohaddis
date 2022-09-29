import 'package:flutter/material.dart';


class DropDownWidget2 extends StatefulWidget {
  final String title;
  final List<String> items;
  final ValueChanged<String> itemCallBack;
  final String currentItem;
  final String hintText;

  DropDownWidget2({
    required this.title,
    required this.items,
    required this.itemCallBack,
    required this.currentItem,
    required this.hintText,
  });

  @override
  State<StatefulWidget> createState() => _DropdownState(currentItem);
}

class _DropdownState extends State<DropDownWidget2> {
  List<DropdownMenuItem<String>> dropDownItems = [];
  String currentItem;

  _DropdownState(this.currentItem);

  @override
  void initState() {
    super.initState();
    for (String item in widget.items) {
      dropDownItems.add(DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ));
    }
  }

  @override
  void didUpdateWidget(DropDownWidget2 oldWidget) {
    if (this.currentItem != widget.currentItem) {
      setState(() {
        this.currentItem = widget.currentItem;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 10,
              color: Colors.white,
            ),
          ],
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: currentItem,
            isExpanded: true,
            items: dropDownItems,
            onChanged: (selectedItem) => setState(() {
              currentItem = selectedItem.toString();
              widget.itemCallBack(currentItem);
            }),
            hint: Container(
              child: Text(widget.hintText),
            ),
          ),
        ),
      ),
    );
  }
}