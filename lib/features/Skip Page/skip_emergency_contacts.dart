// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, prefer_const_declarations, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:suraksha_saathi/features/Skip%20Page/skip_home.dart';

class SkipEmergencyContacts extends StatefulWidget {
  const SkipEmergencyContacts({Key? key}) : super(key: key);

  @override
  State<SkipEmergencyContacts> createState() => _SkipEmergencyContactsState();
}

class _SkipEmergencyContactsState extends State<SkipEmergencyContacts> {
  final Completer<GoogleMapController> _mapcontroller = Completer();

  static const CameraPosition _center =
      CameraPosition(target: LatLng(27.7172, 85.3240), zoom: 14);

  final Map<MarkerId, Marker> _markers = {};

  MapType _currentMapType = MapType.normal;

  @override
  void initState() {
    super.initState();
    _markers[MarkerId('1')] = Marker(
      markerId: MarkerId('1'),
      position: LatLng(27.69423219906247, 85.3110184398006),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueGreen,
      ),
      infoWindow: InfoWindow(
        title: 'Teku Hospital',
        snippet: '01 4222292, 01-4229656, 01-4262194, 01-4228746',
      ),
    );
    _markers[MarkerId('2')] = Marker(
      markerId: MarkerId('2'),
      position: LatLng(27.69315482185094, 85.31384195606995),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueGreen,
      ),
      infoWindow: InfoWindow(
        title: 'Nepal Eye Hospital',
        snippet: '01-4260813, 01-4250691',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,
              size: 30.0, color: Color(0xFF32508E)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SkipHomeScreen()),
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Green markers represent hospitals on the map',
              style: TextStyle(
                color: Color(0xFF32508E),
                fontSize: 17.0,
              ),
            ),
          ),
        ),
      ),
      body: GoogleMap(
        mapType: _currentMapType,
        markers: _markers.values.toSet(),
        onMapCreated: (GoogleMapController controller) {
          _mapcontroller.complete(controller);
        },
        initialCameraPosition: _center,
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            top: 150,
            left: 5,
            child: DropdownButton<MapType>(
              value: _currentMapType,
              icon: Icon(
                Icons.maps_ugc,
                color: Color(0xFF32508E),
                size: 32,
              ),
              onChanged: (MapType? newValue) {
                setState(() {
                  _currentMapType = newValue!;
                });
              },
              items: <MapType>[
                MapType.normal,
                MapType.hybrid,
                MapType.satellite,
                MapType.terrain,
              ].map<DropdownMenuItem<MapType>>((MapType value) {
                return DropdownMenuItem<MapType>(
                  value: value,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the radius as needed
                    child: Container(
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8.0),
                        child: Text(
                          value.toString().split('.').last,
                          style: TextStyle(
                            color: Color(0xFF32508E),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 160,
                height: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        Future<void> _hospital1() async {
                          final GoogleMapController controller =
                              await _mapcontroller.future;
                          final MarkerId markerId = MarkerId('1');
                          final Marker marker = _markers[markerId]!;
                          final LatLng position = marker.position;
                          final double zoomLevel = 17;

                          await controller.animateCamera(
                            CameraUpdate.newLatLngZoom(position, zoomLevel),
                          );
                        }

                        Future<void> _hospital2() async {
                          final GoogleMapController controller =
                              await _mapcontroller.future;
                          final MarkerId markerId = MarkerId('2');
                          final Marker marker = _markers[markerId]!;
                          final LatLng position = marker.position;
                          final double zoomLevel = 20;

                          await controller.animateCamera(
                            CameraUpdate.newLatLngZoom(position, zoomLevel),
                          );
                        }

                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                onTap: () async {
                                  await _hospital1();
                                  Navigator.pop(context);
                                },
                                title: Text(
                                  "Teku Hospital",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  "Location: Tripureshwor, Kathmandu",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Text(
                                  "01-4222292, 01-4229656",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                leading: Icon(Icons.home_rounded),
                              ),
                              ListTile(
                                onTap: () async {
                                  await _hospital2();
                                  Navigator.pop(context);
                                },
                                title: Text(
                                  "Nepal Eye Hospital",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  "Location: Tripureshwor, Kathmandu",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Text(
                                  "01-4260813, 01-4250691",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                leading: Icon(Icons.home_rounded),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  backgroundColor: Color(0xFF32508E),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'View Contacts',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
