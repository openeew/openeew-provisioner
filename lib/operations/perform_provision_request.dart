import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:openeew_provisioner/operations/async_platform_operation.dart';

class PerformProvisionRequest extends AsyncPlatformOperation {

  PerformProvisionRequest(Map args) : super(args);

  @override
  Future<int> web() {
    return Future<int>.delayed(
      Duration(seconds : 3),
      () => 200
    );
  }

  @override
  Future<int> fallback() async {
    var response = await http.post(
      DotEnv().env['PROVISION_ENDPOINT_URL'],
      body: jsonEncode({
        'userId': this.args['state']['user_id'],
        'macaddress': this.args['state']['macaddress'],
        'latitude': this.args['state']['latitude'],
        'longitude': this.args['state']['longitude'],
        'city': this.args['state']['city'],
        'country': this.args['state']['country'],
      })
    );

    return Future<int>.value(response.statusCode);
  }
}
