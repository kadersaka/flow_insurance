import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PartenairePage extends StatefulWidget {
  const PartenairePage({Key? key}) : super(key: key);

  @override
  _PartenairePageState createState() => _PartenairePageState();
}

class _PartenairePageState extends State<PartenairePage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(6.371014, 2.410017);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(onPressed: () => Navigator.pop(context), child: const Icon(Icons.arrow_back, color: Colors.black)),
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("Nos partenaires", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            Text.rich(
                TextSpan(
                  text: "Vous pouvez vous rendre chez l'un de vos partenaires pour l'achat de votre smartpone et beneficier d'une assurance",
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
                maxLines: 5,
            ),
          ],
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
