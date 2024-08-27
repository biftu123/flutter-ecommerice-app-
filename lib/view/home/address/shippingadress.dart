import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:geolocator/geolocator.dart';

class RecordMaps extends StatefulWidget {
  @override
  _RecordMapsState createState() => _RecordMapsState();
}

class _RecordMapsState extends State<RecordMaps> {
  GoogleMapController? mapController;
  late PageController _pageController;
  LatLng? _initialLocation;
  Set<Marker> _markers = {};
  Geolocator geolocator = Geolocator();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _initializeMapRenderer();
    _pageController = PageController(initialPage: 0);
  }

  void _initializeMapRenderer() {
    final GoogleMapsFlutterPlatform mapsImplementation =
        GoogleMapsFlutterPlatform.instance;
    if (mapsImplementation is GoogleMapsFlutterAndroid) {
      mapsImplementation.useAndroidViewSurface = true;
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _updateCamera();
    _updateMyLocation();
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _initialLocation = LatLng(position.latitude, position.longitude);
    _addMarker(_initialLocation!, 'initialLocationMarker', false); // Non-draggable
  }

  void _updateCamera() {
    if (_initialLocation != null) {
      mapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _initialLocation!,
          zoom: 15.0,
        ),
      ));
    }
  }

  void _updateMyLocation() {
    Geolocator.getPositionStream().listen((Position position) {
      LatLng myLocation = LatLng(position.latitude, position.longitude);
      _addMarker(myLocation, 'myLocationMarker', true); // Draggable
    });
  }

  void _addMarker(LatLng position, String markerId, bool draggable) {
    final MarkerId id = MarkerId(markerId);
    final Marker marker = Marker(
      markerId: id,
      position: position,
      draggable: draggable,
      infoWindow: InfoWindow(title: 'My Location', snippet: 'Description'),
      icon: BitmapDescriptor.defaultMarker,
      onDragEnd: (newPosition) {
        _updateMarkerPosition(id, newPosition);
      },
    );

    setState(() {
      _markers.add(marker);
    });
  }

  void _updateMarkerPosition(MarkerId markerId, LatLng newPosition) {
    setState(() {
      _markers.removeWhere((marker) => marker.markerId == markerId);
      _markers.add(
        Marker(
          markerId: markerId,
          position: newPosition,
          draggable: true,
          infoWindow: InfoWindow(title: 'My Location', snippet: 'Description'),
          icon: BitmapDescriptor.defaultMarker,
          onDragEnd: (newPosition) {
            _updateMarkerPosition(markerId, newPosition);
          },
        ),
      );
    });
  }

  void _handleTap(LatLng tappedPoint) {
    _updateMarkerPosition(MarkerId('tappedLocationMarker'), tappedPoint);
    void _handleTap(LatLng tappedPoint) {
  print('Tapped Position: ${tappedPoint.latitude}, ${tappedPoint.longitude}');
  _updateMarkerPosition(MarkerId('tappedLocationMarker'), tappedPoint);
}
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PageView(
          controller: _pageController,
          pageSnapping: false,
          onPageChanged: (index) {
            setState(() {
              _pageController.jumpToPage(index);
            });
          },
          children: [
            Stack(
              children: [
                GoogleMap(
                  markers: _markers,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _initialLocation ?? LatLng(0.0, 0.0),
                    zoom: 15.0,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  compassEnabled: false,
                  onTap: _handleTap,
                )
              ],
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}