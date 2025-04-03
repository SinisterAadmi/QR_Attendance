import 'package:geolocator/geolocator.dart';


bool comparelocation(stdlat , stdlng , qrlat , qrlng){
  double distance = Geolocator.distanceBetween(
   stdlat,
    stdlng,
    qrlat,
    qrlng,
  );
  if(distance<=100){
    return true;
  }
  else{
    return false;
  }
}