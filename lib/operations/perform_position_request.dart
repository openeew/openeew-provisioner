import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'package:openeew_provisioner/operations/async_platform_operation.dart';

class PerformPositionRequest extends AsyncPlatformOperation {

  PerformPositionRequest() : super({});

  @override
  Future<Map> web() {
    return Future<Map>.value({
      'latitude': '-40',
      'longitude': '125',
      'city': 'Valencia',
      'country': 'Spain',
    });
  }

  @override
  Future<Map> fallback() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    return Future<Map>.value({
      'latitude': position.latitude.toString(),
      'longitude': position.longitude.toString(),
      'city': placemarks[0].locality.toString(),
      'country': placemarks[0].country.toString(),
    });
  }
}
