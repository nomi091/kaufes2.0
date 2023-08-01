
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../utils/constants/constant_width.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;



class LaunchMapLocation extends StatefulWidget {
  final double latitude;
  final double longitude;

  const LaunchMapLocation({Key? key, required this.latitude, required this.longitude}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LaunchMapLocationState createState() => _LaunchMapLocationState();
}

class _LaunchMapLocationState extends State<LaunchMapLocation> {
  GoogleMapController? mapController;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        markerId: const MarkerId('location'),
        position: LatLng(widget.latitude, widget.longitude),
      ),
    );
  }


Future<void> launchGoogleMaps() async {
  final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=${widget.latitude},${widget.longitude}');

  if (await url_launcher.canLaunchUrl(url)) {
    await url_launcher.launchUrl(url);
  } else {
    throw 'Could not launch Google Maps';
  }
}


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ConstantSize.getHeight(context) * 0.15,
      width: ConstantSize.getWidth(context) * 1,
      child: InkWell(
        onTap: (){
            if (kDebugMode) {
              print('${widget.latitude}');
            }
          launchGoogleMaps();
        },
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.latitude, widget.longitude),
            zoom: 10.0,
          ),
          buildingsEnabled: true,
          myLocationEnabled: false,
          markers: _markers,
          onTap: (_) {
            if (kDebugMode) {
              print('${widget.latitude}');
            }
          launchGoogleMaps();
          },
        ),
      ),
    );
  }

}
