import 'package:geolocator/geolocator.dart';

class Location{
  late double latitude;
  late double longatude;

  Future<void> getLocation()async{
    try{
      await Geolocator.requestPermission();
      Position position=await Geolocator.getCurrentPosition();
      latitude=position.latitude;
      longatude=position.longitude;

    }catch(e){
      print(e);
    }

  }
}