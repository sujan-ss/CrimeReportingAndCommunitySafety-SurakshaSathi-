// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class AttachFiles extends StatefulWidget {
  @override
  _AttachFiles createState() => _AttachFiles();
}

class _AttachFiles extends State<AttachFiles> {
  String imageFilePath = '';
  String audioFilePath = '';
  String videoFilePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('Attach Media'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildAttachmentButton(
              title: 'Image',
              icon: Icons.image,
              filePath: imageFilePath,
              onPressed: () {
                // Handle image attachment
              },
            ),
            SizedBox(height: 20),
            buildAttachmentButton(
              title: 'Audio',
              icon: Icons.audiotrack,
              filePath: audioFilePath,
              onPressed: () {
                // Handle audio attachment
              },
            ),
            SizedBox(height: 20),
            buildAttachmentButton(
              title: 'Video',
              icon: Icons.videocam,
              filePath: videoFilePath,
              onPressed: () {
                // Handle video attachment
              },
            ),
            SizedBox(height: 20),
            Text(
              'Select Location',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Add your location selection widget here
            SizedBox(height: 20),
            Text(
              'Add Descriptions',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Add your description input field here
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle submit button press
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Color(0xFF32508E),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
              ),
              child: Text('Submit'),
            ),
          ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title Attachment',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon),
          label: Text('Attach $title'),
        ),
        SizedBox(height: 5),
        Text(filePath),
      ],
    );
  }
}
