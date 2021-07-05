import 'package:flutter/material.dart';

class RadioOption extends StatefulWidget {
  RadioOption(this.options,
      {this.productColor = const Color(0xffFF830F), Key? key})
      : super(key: key);
  final List options;
  final productColor;
  @override
  _RadioOptionState createState() => _RadioOptionState();
}

class _RadioOptionState extends State<RadioOption> {
  late String _radioSelected;
  @override
  void initState() {
    super.initState();
    _radioSelected = widget.options[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.options.map((index) => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio<String>(
                    activeColor: widget.productColor,
                    value: index,
                    groupValue: this._radioSelected,
                    onChanged: (newValue) => {
                          setState(() => this._radioSelected = newValue!),
                        }),
                Text(index)
              ],
            )),
        Text(_radioSelected)
      ],
    );
  }
}
