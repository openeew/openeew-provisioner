import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:openeew_provisioner/operations/async_platform_operation.dart';

class PerformSignupRequest extends AsyncPlatformOperation {

  PerformSignupRequest(Map args) : super(args);

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
      DotEnv().env['SIGNUP_ENDPOINT_URL'],
      body: jsonEncode(this.args)
    );

    return Future<int>.value(response.statusCode);
  }
}
