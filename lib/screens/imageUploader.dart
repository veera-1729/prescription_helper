import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:prescription_helper/api_request/medicinecontroller.dart';

class ImageUploader extends StatefulWidget {
  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  File? _imageFile;
  bool _uploading = false;
  TextEditingController qtyController = TextEditingController();
  String? selectedTime;
  var imageUrl =
      "https://firebasestorage.googleapis.com/v0/b/prescriptionhelper-be566.appspot.com/o/images%2F1677589531103.jpg?alt=media&token=eacf746c-be4c-46ae-b16b-404baefa387e";
  var qty;

  final picker = ImagePicker();

  Future<void> _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

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
      imageUrl = downloadUrl;
    });

    return downloadUrl;
  }

  final List<String> items = [
    '6:00 AM',
    '9:00 Am',
    '1:00 PM',
    '8:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Uploader'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('No image selected.'),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedTime,
                      onChanged: (value) {
                        setState(() {
                          selectedTime = value as String;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        height: 40,
                        width: 140,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          qty = value.toString();
                        });
                      },
                      style: TextStyle(),
                      controller: qtyController,
                      maxLength: 10,
                      decoration: InputDecoration(
                        hintText: "Quantity",
                        counterText: "",
                        border: OutlineInputBorder(),
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        qty = qtyController.text;
                        addMedicine(imageUrl, selectedTime!, qty);
                      });
                    },
                    child: Text("Save"),
                  )
                ],
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        tooltip: 'Take a Photo',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
