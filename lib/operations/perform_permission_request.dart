import 'package:permission_handler/permission_handler.dart';

import 'package:openeew_provisioner/operations/async_platform_operation.dart';

class PerformPermissionRequest extends AsyncPlatformOperation {

  PerformPermissionRequest() : super({});

  @override
  Future<bool> web() {
    return Future<bool>.value(true);
  }

  @override
  Future<bool> fallback() {
    return Permission.location.request().isGranted;
  }
}
