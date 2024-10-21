import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:nova_places_autocomplete/nova_places_autocomplete.dart';

import '../../../bindings/bottom_screen.dart';
import '../../../utils/const/app_color.dart';

class LocationMapScreen extends StatefulWidget {
  const LocationMapScreen({super.key});

  @override
  State<LocationMapScreen> createState() => _LocationMapScreenState();
}

class _LocationMapScreenState extends State<LocationMapScreen> {
  late MapController _mapController;
  PlaceAutocompletePrediction? _prediction;
  LatLng _currentPosition = LatLng(37.7749, -122.4194);
  NovaPlacesAutocompleteController _placesAutocompleteController =
      NovaPlacesAutocompleteController();
  bool _locationLoaded = false;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  // Future<LatLng?> getCurrentLocation() async {
  //   Location location = Location();
  //
  //   // Check if location services are enabled
  //   bool serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //     if (serviceEnabled) {
  //       return null;
  //     }
  //   }
  //
  //   // Check for permissions
  //   PermissionStatus permissionGranted = await location.hasPermission();
  //   if (permissionGranted == PermissionStatus.denied) {
  //     // Request permissions
  //     permissionGranted = await location.requestPermission();
  //     if (permissionGranted != PermissionStatus.granted) {
  //       // Permissions were denied
  //       return null;
  //     }
  //   }
  //
  //   // Get the current location
  //   LocationData locationData = await location.getLocation();
  //
  //   // Return the current location as LatLng
  //   return LatLng(locationData.latitude!, locationData.longitude!);
  // }

  void _moveToPosition(LatLng position) {
    setState(() {
      _currentPosition = position;
      _mapController.move(_currentPosition, 15.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(BottomScreen());
        },
        child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                gradient: AppColors.customGradient,
                shape: BoxShape.circle

            ),
            child: Icon(Icons.navigate_next_sharp,color: Colors.white,size: 32,)), // You can use any icon you prefer
        shape: CircleBorder(), // Ensures the button is circular
        backgroundColor: Colors.black, // Set the background color
        elevation: 6, // Add elevation for a shadow effect
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                "Where do you live?",
                style: GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 18),
              NovaPlacesAutocomplete(
                radius: 20,
                debounceTime: 2,
                apiKey: 'AIzaSyC_Rai9wBRnifJgkYzU4oK0YxyYnF5VnsE',
                controller: _placesAutocompleteController,
                detailRequired: true,
                onPicked: (prediction) {
                  setState(() {
                    _prediction = prediction;
                    _placesAutocompleteController.clear();
                  });
                },
                onSearchFailed: (error) {
                  print(error);
                },
                onPickedPlaceDetail: (detail) {
                  if (detail.geometry != null) {
                    final lat = detail.geometry!.location.lat;
                    final lng = detail.geometry!.location.lng;
                    LatLng newPosition = LatLng(lat, lng);
                    _moveToPosition(newPosition);
                  }
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width - 8,
                clipBehavior: Clip.antiAlias,
                height: Get.height * 0.77,
                decoration: BoxDecoration(),
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _currentPosition,
                    initialZoom: 15.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: _currentPosition,
                          width: 25,
                          height: 36,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 36,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
