import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 450,
      foregroundDecoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FlutterMap(
          options: MapOptions(
            // initialCenter: LatLng(2, 7),
            initialZoom: 15,
            initialCenter: latLng.LatLng(
              // _currentPosition?.latitude ?? 35.7006381,
              // _currentPosition?.longitude ?? 51.4089094,
              35.7006381,
              51.4089094,
            ),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              // userAgentPackageName: 'com.example.app',
              // maxZoom: 19,
            ),
            FlutterLocationPicker(
              searchBarHintText: 'جستجو',
              selectLocationButtonText: 'انتخاب آدرس',
              initPosition: LatLong(35.7006381, 51.4089094),
              initZoom: 11,
              minZoomLevel: 5,
              maxZoomLevel: 16,
              trackMyPosition: true,
              searchBarBackgroundColor: Colors.white,
              selectedLocationButtonTextstyle: const TextStyle(fontSize: 18),
              mapLanguage: 'fa',
              onError: (e) => print(e),
              selectLocationButtonLeadingIcon: const Icon(Icons.check),
              onPicked: (pickedData) {
                print(pickedData.latLong.latitude);
                print(pickedData.latLong.longitude);
                print(pickedData.address);
                print(pickedData.addressData);
              },
              onChanged: (pickedData) {
                print(pickedData.latLong.latitude);
                print(pickedData.latLong.longitude);
                print(pickedData.address);
                print(pickedData.addressData);
              },
              // showContributorBadgeForOSM: true,
            ),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () => launchUrl(
                      Uri.parse('https://openstreetmap.org/copyright')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
