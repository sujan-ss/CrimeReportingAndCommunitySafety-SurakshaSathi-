// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:suraksha_saathi/features/Report%20Incident/report_incident_location.dart';

class ReportIncident extends StatefulWidget {
  const ReportIncident({Key? key}) : super(key: key);

  @override
  State<ReportIncident> createState() => ReportIncidentState();
}

class ReportIncidentState extends State<ReportIncident> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};
  final TextEditingController _incidentController = TextEditingController();
  String description = '';
  LatLng? selectedLocation;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addMarker(LatLng position) {
    setState(() {
      _markers.clear(); // Clear previous markers
      _markers.add(Marker(
        markerId: MarkerId(position.toString()),
        position: position,
        infoWindow: InfoWindow(
          title: 'Incident',
          snippet: _incidentController.text,
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      selectedLocation = position;
    });
  }

  void _submitIncident() {
    // Submit your incident here
    print('Incident submitted at location: $selectedLocation');
    print('Incident Description: ${_incidentController.text}');
    print("this is kfndaksfjnadksnfjbndfs ${selectedLocation!.latitude}");
    print("this is kfndaksfjnadksnfjbndfs ${selectedLocation!.longitude}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const ReportIncidentLocation()),
            );
          },
        ),
        title: const Text('Report Incident'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.6, // Adjust the height as needed
              child: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(27.7172, 85.3240),
                      zoom: 11.0,
                    ),
                    markers: _markers,
                    onTap: _addMarker,
                  ),
                  if (selectedLocation != null)
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Lat: ${selectedLocation!.latitude}, Lng: ${selectedLocation!.longitude}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(
                  right: 300.0), // Adjust the left padding as needed
              child: Text(
                'Descriptions',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10), // Add horizontal padding
              child: TextField(
                controller: _incidentController,
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                textAlign: TextAlign.left, // Align text to the left
                decoration: const InputDecoration(
                  hintText: 'Add your description here',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3, // Allow multiple lines for description
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: _submitIncident,
              label: const Text('Submit'),
              icon: const Icon(Icons.arrow_forward),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFFC91C1C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 150, vertical: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
