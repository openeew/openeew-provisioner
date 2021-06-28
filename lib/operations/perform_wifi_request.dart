import 'package:wifi_info_flutter/wifi_info_flutter.dart';
import 'package:wifi_info_plugin/wifi_info_plugin.dart';

import 'package:openeew_provisioner/operations/async_platform_operation.dart';

class PerformWifiRequest extends AsyncPlatformOperation {

  PerformWifiRequest() : super({});

  @override
  Future<Map> web() {
    return Future<Map>.value({
      'ssid': 'TEST_WIFI',
      'bssid': 'abcdefg',
      'frequency': 2440
    });
  }

  @override
  Future<Map> fallback() async {
    WifiInfoWrapper wifiObject = await WifiInfoPlugin.wifiDetails;
    print('Frequency: ${wifiObject.frequency}');
    final frequency = wifiObject.frequency;

    return Future<Map>.value({
      'ssid': await WifiInfo().getWifiName(),
      'bssid': await WifiInfo().getWifiBSSID(),
      'frequency': frequency,
    });
  }
}
