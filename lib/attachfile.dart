// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:suraksha_saathi/Dashboard/home.dart';
import 'package:image_picker/image_picker.dart';

class AttachFiles extends StatefulWidget {
  const AttachFiles({Key? key}) : super(key: key);

  @override
  _AttachFilesState createState() => _AttachFilesState();
}

class _AttachFilesState extends State<AttachFiles> {
  String imageFilePath = '';
  String audioFilePath = '';
  String videoFilePath = '';
  String description = ''; // Variable to hold the description

  // List of locations
  List<String> locations = ['Tripureshwor', 'Dillibazar'];
  String? selectedLocation; // No initial selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        title: const Text('Attach Media'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 2x2 grid layout for attachment buttons
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                shrinkWrap: true,
                children: [
                  buildAttachmentButton(
                    title: 'Image',
                    icon: Icons.image,
                    filePath: imageFilePath,
                    onPressed: () async {
                      final pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          imageFilePath = pickedFile.path;
                        });
                      }
                    },
                  ),
                  buildAttachmentButton(
                    title: 'Audio',
                    icon: Icons.audiotrack,
                    filePath: audioFilePath,
                    onPressed: () {
                      // Handle audio attachment
                    },
                  ),
                  buildAttachmentButton(
                    title: 'Video',
                    icon: Icons.videocam,
                    filePath: videoFilePath,
                    onPressed: () {
                      // Handle video attachment
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Heading for location selection
              const Text(
                'Select Location',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Dropdown for selecting location
              DropdownButtonFormField<String>(
                value: selectedLocation,
                items: [
                  const DropdownMenuItem<String>(
                    value: null,
                    child: Text('Select a location'),
                  ),
                  ...locations.map((location) {
                    return DropdownMenuItem<String>(
                      value: location,
                      child: Text(location),
                    );
                  }),
                ],
                onChanged: (newValue) {
                  setState(() {
                    selectedLocation = newValue;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Descriptions',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              // Description input field
              TextField(
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Add your description here',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3, // Allow multiple lines for description
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  // Handle submit button press
                  // Access the description using the 'description' variable
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: const Color(0xFF32508E),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15.0),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAttachmentButton({
    required String title,
    required IconData icon,
    required String filePath,
    required VoidCallback onPressed,
  }) {
    String buttonText = 'Attach $title';
    return Material(
      color: const Color(0xFF32508E),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF32508E),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
