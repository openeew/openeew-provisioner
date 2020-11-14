import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';

abstract class PlatformOperation {
  final Map args;

  PlatformOperation(this.args);

  void ios()      => fallback();
  void android()  => fallback();
  void web()      => fallback();
  void fallback() => null;

  void perform() {
    if (kIsWeb) {
      web();
    } else if (Platform.isIOS) {
      ios();
    } else if (Platform.isAndroid) {
      android();
    } else {
      fallback();
    }
  }
}
