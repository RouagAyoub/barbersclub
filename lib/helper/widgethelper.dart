import 'package:barberclube/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class maphelper {
  GoogleMapController _controller;
  Position position;
  Placemark placeMark;
  Widget _child;

  Future<void> getLocation() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);

    if (permission == PermissionStatus.denied) {
      await PermissionHandler()
          .requestPermissions([PermissionGroup.locationAlways]);
    }

    var geolocator = Geolocator();

    GeolocationStatus geolocationStatus =
        await geolocator.checkGeolocationPermissionStatus();

    switch (geolocationStatus) {
      case GeolocationStatus.denied:
        showToast('denied', Colors.red);
        break;
      case GeolocationStatus.disabled:
        showToast('disabled', Colors.red);
        break;
      case GeolocationStatus.restricted:
        showToast('restricted', Colors.red);
        break;
      case GeolocationStatus.unknown:
        showToast('unknown', Colors.red);
        break;
      case GeolocationStatus.granted:
        showToast('Access granted', Colors.green);
        _getCurrentLocation();
    }
  }

  /* Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId('home'),
          position: LatLng(position.latitude, position.longitude),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Current Location'))
    ].toSet();
  }*/

  void _getCurrentLocation() async {
    final Geolocator _geolocator = Geolocator();
    Position res = await Geolocator().getCurrentPosition();
    position = res;
    _child = _mapWidget();
    List<Placemark> newPlace =
        await _geolocator.placemarkFromCoordinates(res.latitude, res.longitude);
    placeMark = newPlace[0];
  }

  Widget _mapWidget() {
    return GoogleMap(
      mapType: MapType.normal,
      markers: null,
      initialCameraPosition: CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 12.0,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
    );
  }
}
