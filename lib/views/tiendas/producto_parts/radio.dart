import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class ProductRadioOption extends StatefulWidget {
  const ProductRadioOption(this.title, this.value, {Key? key})
      : super(key: key);
  final String title;
  final String value;
  @override
  State<ProductRadioOption> createState() => _ProductRadioOptionState();
}

/// This is the private State class that goes with ProductRadioOption.
class _ProductRadioOptionState extends State<ProductRadioOption> {
  @override
  Widget build(BuildContext context) {
    String _character = widget.title;
    return ListTile(
      title: Text(widget.title),
      leading: Radio(
        value: widget.value,
        groupValue: _character,
        onChanged: (value) {
          setState(() {
            _character = value.toString();
          });
        },
      ),
    );
  }
}
