import 'package:smartconfig/smartconfig.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'package:openeew_provisioner/operations/async_platform_operation.dart';

class PerformSmartconfigRequest extends AsyncPlatformOperation {

  PerformSmartconfigRequest(Map args) : super(args);

  @override
  Future<String> web() {
    return Future<String>.value("te:st:ma:ca:dd:re:ss");
  }

  @override
  Future<String> fallback() async {
    try {
      Map<String, dynamic> result = await Smartconfig.start(this.args['ssid'], this.args['bssid'], this.args['password']);
      if( result != null ) {
        // returns {246f28cce88c: 192.168.1.246}
        debugPrint(result.toString());
        // Grab the first key in the Map Iterable:
        var _list = result.entries.toList();
        String response = _list[0].key;  // first key is the mac address
        debugPrint(response);
        return response;
      } else {
        return null; // SmartConfig failed / timed out
      }
    } on PlatformException {
      return null; // SmartConfig failed / timed out
    }
  }
}
