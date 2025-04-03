void splitQrData(String qrData) {
  // Split the string by commas
  List<String> parts = qrData.split(',');

  // Extract and parse individual components0
  double _latitude = double.parse(parts[0].split(': ')[1]);
  double _longitude = double.parse(parts[1].split(': ')[1]);
  String _classn = parts[2].split(': ')[1];
  String _currentDate = parts[3].split(': ')[1];

setQRlat(_latitude);
setQRlng(_longitude);
setQRclassn(_classn);
setQRcurrentDate(_currentDate);


}
double QRlat=0;
setQRlat(double lat){
  QRlat = lat;
}
double getQRlat(){
  return QRlat;
}

double QRlng=0;
setQRlng(double lng){
  QRlng = lng;
}
double getQRlng(){
  return QRlng;
}

String QRclassn='';
setQRclassn(String classn){
  QRclassn = classn;
}
String getQRclassn() {
  return QRclassn;
}

String QRcurrentDate='';
setQRcurrentDate(String currentDate){
  QRcurrentDate = currentDate;
}
String getQRcurrentDate() {
  return QRcurrentDate;
}

