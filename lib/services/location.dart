import 'package:geolocator/geolocator.dart';

class Location {
  late double latitud;
  late double longitud;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitud = position.latitude;
      longitud = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
