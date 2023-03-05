import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:prescription_helper/api_request/admin_login_controller.dart';
import 'package:prescription_helper/api_request/medicinecontroller.dart';

class ImageUploader extends StatefulWidget {
  PatientDetails? patientDetails;
  ImageUploader({
    Key? key,
    this.patientDetails,
  }) : super(key: key);
  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  File? _imageFile;
  bool _uploading = false;
  TextEditingController qtyController = TextEditingController();
  String? selectedTime;
  var imageUrl;
  var qty;
  @override
  void initState() {
    super.initState();
  }

  final picker = ImagePicker();

  Future<void> _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera,imageQuality: 30);

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
  var urli;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.patientDetails?.username}'),
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
                onPressed: _uploading ? null : urli = _uploadImage,
                child: _uploading
                    ? CircularProgressIndicator()
                    : Text('Upload Image'),
              ),
            ] else ...[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  urli == null
                      ? Text('no image selected')
                      : SizedBox(
                          height: 250,
                          width: 300,
                          child: Image.network(imageUrl),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Text(
                        'Select Time',
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
                  SizedBox(
                    height: 20,
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
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        qty = qtyController.text;
                        addMedicine(imageUrl, selectedTime!, qty,
                            widget.patientDetails!.id);
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
