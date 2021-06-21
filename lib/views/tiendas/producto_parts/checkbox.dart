import 'package:flutter/material.dart';

class CheckOption extends StatefulWidget {
  CheckOption(this.title, this.onChanged,
      {this.productColor = "0xffFF830F", this.subTitle = '', Key? key})
      : super(key: key);
  final String title;
  final String subTitle;
  final productColor;
  final onChanged;
  @override
  _CheckOptionState createState() => _CheckOptionState();
}

class _CheckOptionState extends State<CheckOption> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        subtitle: widget.subTitle != '' ? Text(widget.subTitle) : null,
        title: Text(
          widget.title,
          style: TextStyle(color: checked ? Colors.white : Colors.black),
        ),
        selectedTileColor: Colors.green,
        selected: checked,
        tileColor: Color(int.parse(widget.productColor)),
        value: checked,
        onChanged: (newValue) {
          setState(() {
            checked = newValue!;
          });
          widget.onChanged(widget.title, checked);
        });
  }
}
