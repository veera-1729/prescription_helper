import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploader extends StatefulWidget {
  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  File? _imageFile;
  bool _uploading = false;

  final picker = ImagePicker();

  Future<void> _getImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 60);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  Future<String> _uploadImage() async {
    // Show a progress indicator while uploading
    setState(() {
      _uploading = true;
    });

    // Create a unique file name for the image
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    print(fileName);

    // Create a reference to the Firebase storage location
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('images/$fileName.jpg');

    // Upload the image file to Firebase storage
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile!);

    // Wait for the upload to complete
    TaskSnapshot taskSnapshot = await uploadTask;

    // Get the download URL for the uploaded image
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    // Reset the state
    setState(() {
      _uploading = false;
      _imageFile = null;
    });
    print("Download url $downloadUrl");
    return downloadUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Uploader'),
      ),
      body: Column(
        children: [
          if (_imageFile != null) ...[
            Image.file(_imageFile!),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _uploading ? null : _uploadImage,
              child: _uploading
                  ? CircularProgressIndicator()
                  : Text('Upload Image'),
            ),
          ] else ...[
            Text('No image selected.'),
          ],
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        tooltip: 'Take a Photo',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
