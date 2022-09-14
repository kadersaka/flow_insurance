import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PartenairePage extends StatefulWidget {
 const PartenairePage({Key? key}) : super(key: key);
  @override
  State<PartenairePage> createState() => _PartenairePageState();
}

class _PartenairePageState extends State<PartenairePage> {
  PickResult selectedPlace = PickResult();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(onPressed: () => Navigator.pop(context), child: const Icon(Icons.arrow_back, color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("Alafia entreprise", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            Text.rich(
                TextSpan(
                    text: "Positionnez vous a l'endroit ou vous voulez faire votre activite de Mobile Money et cliquez sur le bouton",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                    children: <InlineSpan>[TextSpan(text: " Prendre ma localisation", style: TextStyle(color: Color.fromARGB(255, 166, 231, 45), fontSize: 10))]),
                maxLines: 5),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            PlacePicker(
              apiKey: "GOOGLE_CLOUD_API_KEY",
              initialPosition: const LatLng(6.371014, 2.410017),
              useCurrentLocation: true,
              selectInitialPosition: true,
              forceSearchOnZoomChanged: true,
              usePlaceDetailSearch: true,
              automaticallyImplyAppBarLeading: false,
              hintText: "Entrez une adresse",
              selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocuse) {
                return const SizedBox();
              },
              onPlacePicked: (result) {
                setState(() {
                  selectedPlace = result;
                });
              },
            ),
            FloatingCard(
              bottomPosition: 100.0,
              leftPosition: 30.0,
              rightPosition: 30.0,
              height: 40,
              width: MediaQuery.of(context).size.width * 7 / 10,
              borderRadius: BorderRadius.circular(12.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),
                onPressed: () {},
                child: const Text("Prendre ma localisation", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 166, 231, 45))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
