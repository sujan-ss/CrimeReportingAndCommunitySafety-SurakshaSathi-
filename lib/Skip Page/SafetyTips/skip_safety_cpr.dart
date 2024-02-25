// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:suraksha_saathi/Skip%20Page/SafetyTips/skip_safety.dart';

class SkipSafetyCPR extends StatelessWidget {
  const SkipSafetyCPR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CPR'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,
              size: 29.0, color: Color(0xFF32508E)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SkipSafety()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'CPR (Chest compression, artificial respiration)',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF32508E)),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10), // Add spacing between text and card
              buildImageInteractionCard(),
              SizedBox(height: 10), // Add spacing between card and text
              buildMiddleText(),
              SizedBox(height: 10), // Add spacing between text and card
              buildImageInteractionCard2(), // Call buildInteractionCard method
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageInteractionCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1630964046403-8b745c1e3c69?q=80&w=1420&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  child: InkWell(
                    onTap: () {},
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 10),
              child: Column(
                children: [
                  Text(
                    'Emergency medical support (in case of breathing stop or cardiac problem arrest)',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10), // Add spacing
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildImageInteractionCard2() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1564144573017-8dc932e0039e?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  child: InkWell(
                    onTap: () {},
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 10),
              child: Column(
                children: [
                  Text(
                    'First Aid Treatments',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10), // Add spacing
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildMiddleText() {
    return Column(
      children: [
        Text(
          'Injuries, burns',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF32508E),
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10), // Add spacing
      ],
    );
  }
}
