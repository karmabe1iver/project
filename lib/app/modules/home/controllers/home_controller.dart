import 'package:geocoding/geocoding.dart' hide Location;
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../../../data/api_model.dart';
import '../../../data/services/remote_services.dart';

class HomeController extends GetxController {
  ///------------------Current Loctation-----------------
  Location location = new Location();

  Rx<String> address = 'Loading..........'.obs;

  void CurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    List<Placemark> placemarks = await placemarkFromCoordinates(
        locationData.latitude!, locationData.longitude!);
    address.value =
        '${placemarks[0].subLocality} , ${placemarks[0].locality} , ${placemarks[0].administrativeArea} , ${placemarks[0].country}';
  }
  ///------------------Current Loctation Ends-----------------
  List<Welcome>? Data= <Welcome>[].obs;
  getData() async {
    if (status.value == false){
      Data = (await RemoteServices().getPost());

  }else{
      Data = (await RemoteServices().getPost1());


  }


  }

  ///------------------Button Status---------------------------
  Rx<bool> status=false.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
    CurrentLocation();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class address {}
