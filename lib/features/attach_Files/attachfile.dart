// ignore_for_file: library_private_types_in_public_api
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:suraksha_saathi/data/reposotory/files_repo.dart';
import 'package:suraksha_saathi/features/Dashboard/attachfile_location.dart';
import 'package:suraksha_saathi/features/attach_Files/bloc/attachfiles_bloc.dart';

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

  String imageUrl = '';
  String audioUrl = '';
  String videoUrl = '';

  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _audioController = TextEditingController();
  final TextEditingController _videoController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
                  builder: (context) => const AttachfileLocation()),
            );
          },
        ),
        title: const Text('Attach Media'),
      ),
      body: BlocProvider(
        create: (context) => AttachfilesBloc(),
        child: BlocConsumer<AttachfilesBloc, AttachfilesState>(
          listener: (context, state) {},
          builder: (context, state) {
            return BlocBuilder<AttachfilesBloc, AttachfilesState>(
              builder: (context, state) {
                return SingleChildScrollView(
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
                              title: imageFilePath.isEmpty
                                  ? 'Attach Image'
                                  : 'Image Uploaded',
                              icon: Icons.image,
                              filePath: imageFilePath,
                              controller: _imageController,
                              onPressed: () async {
                                final pickedFile = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (pickedFile != null) {
                                  setState(() {
                                    imageFilePath = pickedFile.path;
                                    _imageController.text = pickedFile.path;
                                  });
                                  imageUrl = await FileRepo.uploadImage(
                                      imageFilePath, FileTypo.image);
                                }
                              },
                            ),
                            buildAttachmentButton(
                              title: audioFilePath.isEmpty
                                  ? 'Attach Audio'
                                  : 'Audio Uploaded',
                              icon: Icons.audiotrack,
                              filePath: audioFilePath,
                              controller: _audioController,
                              onPressed: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['mp3'],
                                );

                                if (result != null) {
                                  File file = File(result.files.single
                                      .path!); // Use the null assertion operator here
                                  setState(() {
                                    audioFilePath = file.path;
                                    _audioController.text = file.path;
                                  });
                                  audioUrl = await FileRepo.uploadImage(
                                      audioFilePath, FileTypo.audio);
                                } else {
                                  // User canceled the picker
                                }
                              },
                            ),
                            buildAttachmentButton(
                              title: videoFilePath.isEmpty
                                  ? 'Attach Video'
                                  : 'Video Uploaded',
                              icon: Icons.video_library,
                              filePath: videoFilePath,
                              controller: _videoController,
                              onPressed: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.video,
                                );

                                if (result != null) {
                                  PlatformFile file = result.files.first;
                                  setState(() {
                                    videoFilePath = file.path!;
                                    _videoController.text = file.path!;
                                  });
                                  videoUrl = await FileRepo.uploadImage(
                                      videoFilePath, FileTypo.video);
                                } else {
                                  // User canceled the picker
                                }
                              },
                            ),
                          ],
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
                          controller: _descriptionController,
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
                            if (true) {
                              BlocProvider.of<AttachfilesBloc>(context).add(
                                AddAttachFiles(
                                  photoUrl: imageUrl,
                                  audioUrl: "audioUrl",
                                  videoUrl: "videoUrl",
                                  description: description,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please attach all files'),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: const Color(0xFFC91C1C),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 15.0),
                          ),
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildAttachmentButton({
    required String title,
    required IconData icon,
    required String filePath,
    required TextEditingController controller,
    required VoidCallback onPressed,
  }) {
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
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (filePath
                  .isNotEmpty) // Display audio file name if filePath is not empty
                Text(
                  filePath.split('/').last, // Display only the file name
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
