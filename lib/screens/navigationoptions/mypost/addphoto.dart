// addphoto.dart
import 'dart:io';
import 'package:collegenews/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:collegenews/screens/navigationoptions/mypost/post_model.dart';
import 'package:collegenews/screens/sqlite.dart';

class AddPhotosPage extends StatefulWidget {
  const AddPhotosPage({super.key});

  @override
  _AddPhotosPageState createState() => _AddPhotosPageState();
}

class _AddPhotosPageState extends State<AddPhotosPage> {
  final List<File> _selectedImages = [];
  final List<String> _descriptions = [];

  Future<void> _pickImage(ImageSource source) async {
    await _requestPermissions();
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _selectedImages.add(File(pickedImage.path));
        _descriptions.add('');
      });
    }
  }

  Future<void> _requestPermissions() async {
    var cameraStatus = await Permission.camera.request();
    var storageStatus = await Permission.storage.request();

    if (!cameraStatus.isGranted || !storageStatus.isGranted) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Permissions Required'),
            content: const Text(
                'Camera and Storage permissions are required to use this feature.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Widget _buildImagePreview(File image, int index) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Image.file(image, fit: BoxFit.cover, width: 100, height: 100),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _selectedImages.removeAt(index);
                  _descriptions.removeAt(index);
                });
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Enter description',
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  onChanged: (value) {
                    _descriptions[index] = value;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _uploadPhotos(BuildContext context) async {
    try {
      List<Post> posts = [];
      for (int i = 0; i < _selectedImages.length; i++) {
        File image = _selectedImages[i];
        String description = _descriptions[i];
        await _insertImageToDatabase(image, description);
        posts.add(Post(title: description, date: DateTime.now(), image: image));
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const HomeScreen(), // Pass the posts list to HomeScreen
        ), // Navigate to HomeScreen
      );

      setState(() {
        _selectedImages.clear();
        _descriptions.clear();
      });
    } catch (e) {
      print('Error uploading photos: $e');
      // Handle the error as needed
    }
  }

  Future<void> _insertImageToDatabase(File image, String description) async {
    await DatabaseHelper.instance
        .insertImage({'path': image.path, 'description': description});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Photos', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _selectedImages.length,
              itemBuilder: (context, index) {
                return _buildImagePreview(_selectedImages[index], index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child:
                    const Text('Take Photo', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Choose from Gallery',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _uploadPhotos(context),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Upload Photos',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
