import 'dart:io'; as alias asasas  as
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';




class landingScreen extends StatefulWidget {
  @override
  _landingScreenState createState() => _landingScreenState();
}

class _landingScreenState extends State<landingScreen> {

  File _image;
  final picker = ImagePicker();

   Future<void> _openGallery(BuildContext context)async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
     if(pickedImage != null){
       setState(() {
         _image = File(pickedImage.path);
       });
     }
    Navigator.of(context).pop();
  }



  Future<void> _openCamera(BuildContext context) async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
    Navigator.of(context).pop();
  }

  Future<void>_showDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
         return AlertDialog(
           title: Text("Options"),
           content: SingleChildScrollView(
             child: ListBody(
               children: [
                 GestureDetector(
                   child: Text("Open from gallery"),
                    onTap: (){
                   _openGallery(context);
                 },),
                 Padding(padding: EdgeInsets.all(10.0)),
                 GestureDetector(
                   child: Text("Open from camera"),onTap: (){
                   _openCamera(context);
                  },
                 ),
               ],
             ),
           ),
         );
         }
        );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera App"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(35.0),
            child: Column(
              children: [
                Center(child: ElevatedButton(
                  child: Text("press me here"),
                  onPressed: (){
                    _showDialog(context);
                  },
                ),
                ),
                SizedBox(height: 35,),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 300,
                  color: Colors.grey,
                  child: _image != null
                          ? Image.file(_image,fit: BoxFit.cover,)
                          : Text("Please select image"),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
