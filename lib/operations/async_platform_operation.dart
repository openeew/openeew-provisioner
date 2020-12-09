import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';

abstract class AsyncPlatformOperation {
  final Map args;

  AsyncPlatformOperation(this.args);

  Future<dynamic> ios() async      => await fallback();
  Future<dynamic> android() async  => await fallback();
  Future<dynamic> web() async      => await fallback();
  Future<dynamic> fallback() async => await null;

  Future<dynamic> perform() async {
    if (kIsWeb) {
      return await web();
    } else if (Platform.isIOS) {
      return await ios();
    } else if (Platform.isAndroid) {
      return await android();
    } else {
      return await fallback();
    }
  }
}
