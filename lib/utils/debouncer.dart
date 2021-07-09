import 'dart:async';

import 'package:flutter/cupertino.dart';

class Debouncer {
  final int milliseconds;
  late VoidCallback action;
  Timer _timer = Timer(Duration(milliseconds: 500), () => {});

  Debouncer({this.milliseconds = 500});

  run(VoidCallback action) {
    // ignore: unnecessary_null_comparison
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
