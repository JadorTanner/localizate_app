import 'package:flutter/material.dart';

class DropdownProduct extends StatefulWidget {
  const DropdownProduct(this.values, {Key? key}) : super(key: key);

  final List<String> values;
  @override
  State<DropdownProduct> createState() => _DropdownProductState();
}

/// This is the private State class that goes with DropdownProduct.
class _DropdownProductState extends State<DropdownProduct> {
  late String dropdownValue;
  @override
  void initState() {
    super.initState();
    dropdownValue = widget.values[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.amber),
      underline: Container(
        height: 2,
        color: Colors.amber,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: widget.values.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
