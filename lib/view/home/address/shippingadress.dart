import 'package:flutter/material.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Shippingadress extends StatefulWidget {
  const Shippingadress({super.key});

  @override
  State<Shippingadress> createState() => _ShippingadressState();
}

class _ShippingadressState extends State<Shippingadress> {
  PageController _pageController = PageController(initialPage: 0);
  GoogleMapController? _mapController;
  LatLng? _selectedPosition;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    
    // Call destroyMapView only if the controller is initialized
    if (_mapController != null) {
      _mapController!.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Shipping Address',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: kgray),
        ),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
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
                  initialCameraPosition: CameraPosition(
                    target: LatLng(38.6069941, 9.0631569),
                    zoom: 15,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                  onTap: (LatLng position) {
                    setState(() {
                      _selectedPosition = position;
                    });
                  },
                  markers: _selectedPosition == null
                      ? Set.of([
                          Marker(
                              markerId: MarkerId('selected_location'),
                              position: LatLng(38.6069941, 9.0631569),
                              draggable: true,
                              onDragEnd: (LatLng position) {
                                _selectedPosition = position;
                                print(position);
                              }),
                        ])
                      : Set.of([
                          Marker(
                              markerId: MarkerId('selected_location'),
                              position: _selectedPosition!,
                              draggable: true,
                              onDragEnd: (LatLng position) {
                                _selectedPosition = position;
                                 print(position);
                              }),
                        ]),
                )
              ],
            ),
            Container(
              color: kPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
