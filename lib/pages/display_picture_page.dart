import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class DisplayPicturePage extends StatefulWidget {
  final String imagePath;

  const DisplayPicturePage({Key key, this.imagePath}) : super(key: key);

  @override
  _DisplayPicturePageState createState() => _DisplayPicturePageState();
}

class _DisplayPicturePageState extends State<DisplayPicturePage> {
  File imageFile;
  FirebaseVisionImage visionImage;
  final ImageLabeler labeler = FirebaseVision.instance.imageLabeler();

  @override
  void initState() {
    imageFile = File(widget.imagePath);
    visionImage = FirebaseVisionImage.fromFile(imageFile);

    super.initState();
  }

  void _checkIfPotato() async {
    var labels = await labeler.processImage(visionImage);
    for (ImageLabel label in labels) {
      final String text = label.text;
      final double confidence = label.confidence;
      print("Text: $text, Confidence: $confidence ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(imageFile),
            FlatButton(
              color: Colors.grey,
              child: Text("What is this?"),
              onPressed: _checkIfPotato,
            )
          ],
        ),
      ),
    );
  }
}
