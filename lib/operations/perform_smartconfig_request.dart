import 'package:smartconfig/smartconfig.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'package:openeew_provisioner/operations/async_platform_operation.dart';

class PerformSmartconfigRequest extends AsyncPlatformOperation {

  PerformSmartconfigRequest(Map args) : super(args);

  @override
  Future<String> web() {
    return Future<String>.delayed(
      Duration(seconds : 3),
      () => "te:st:ma:ca:dd:re:ss"
    );
  }

  @override
  Future<String> fallback() async {
    Map<String, List<String>> result = await Smartconfig.start(this.args['ssid'], this.args['bssid'], this.args['password']);

    if (result != null) {
      return Future<String>.value(result.entries.toList().first.toString());
    } else {
      return Future<String>.value("");
    }
  }
}
