import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';

abstract class PlatformWidget extends StatelessWidget {
  const PlatformWidget();

  Widget ios(BuildContext context) {
    return fallback(context);
  }
  Widget android(BuildContext context) {
    return fallback(context);
  }
  Widget web(BuildContext context) {
    return fallback(context);
  }
  Widget fallback(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return web(context);
    } else if (Platform.isIOS) {
      return ios(context);
    } else if (Platform.isAndroid) {
      return android(context);
    } else {
      return Container();
    }
  }
}
