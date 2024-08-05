import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_tale/Constants/love_tale_Sizes.dart';
import 'package:nova_places_autocomplete/nova_places_autocomplete.dart';

import '../../../utils/const/app_strings.dart';


class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  PlaceAutocompletePrediction? _prediction;
  LoveTaleSizes _sizes = LoveTaleSizes();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double contentWidth = _sizes.getscreencontentWidth();
        return Scaffold(
          body: Container(
            padding: EdgeInsets.all(LoveTaleSizes.defaultPadding),
            child: Column(
              children: [
                SizedBox(height: LoveTaleSizes.spaceBTWSections * 2),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_rounded, color: Colors.pink, size: 27),
                    ),
                    SizedBox(width: LoveTaleSizes.spaceBTWSections * 3),
                    Text(
                      'Find Places',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.5),
                NovaPlacesAutocomplete(
                  radius:20,
                  autofocus: true,
                  debounceTime:2,
                  apiKey: 'AIzaSyC_Rai9wBRnifJgkYzU4oK0YxyYnF5VnsE',
                  detailRequired: true,
                  onPicked: (prediction) {
                    setState(() {
                      _prediction = prediction;
                    });
                  },
                  onSearchFailed: (error) {
                    print(error);
                  },
                  onPickedPlaceDetail: (detail) {
                    Get.back(result:detail);
                  },
                ),
                const SizedBox(height: 140.0),
                if (_prediction != null) Text(_prediction!.description),
              ],
            ),
          ),
        );
      },
    );
  }
}