import 'package:wifi_info_flutter/wifi_info_flutter.dart';

import 'package:openeew_provisioner/operations/async_platform_operation.dart';

class PerformWifiRequest extends AsyncPlatformOperation {

  PerformWifiRequest() : super({});

  @override
  Future<Map> web() {
    return Future<Map>.value({
      'ssid': 'TEST_WIFI',
      'bssid': 'abcdefg',
    });
  }

  @override
  Future<Map> fallback() async {
    return Future<Map>.value({
      'ssid': await WifiInfo().getWifiName(),
      'bssid': await WifiInfo().getWifiBSSID(),
    });
  }
}
