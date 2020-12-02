import 'package:smartconfig/smartconfig.dart';

import 'package:openeew_provisioner/operations/async_platform_operation.dart';

class PerformSmartconfigRequest extends AsyncPlatformOperation {

  PerformSmartconfigRequest(Map args) : super(args);

  @override
  Future<String> web() {
    return Future<String>.value("te:st:ma:ca:dd:re:ss");
  }

  @override
  Future<String> fallback() async {
    return await Smartconfig.start(this.args['ssid'], this.args['bssid'], this.args['password']);
  }
}
