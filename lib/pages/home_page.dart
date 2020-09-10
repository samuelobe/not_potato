import 'package:flutter/material.dart';
import 'package:not_potato/pages/take_picture_page.dart';
import 'package:camera/camera.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Not Potato"),
      ),
      body: Center(
        child: FlatButton(
          color: Colors.grey,
          child: Text("Take Picture"),
          onPressed: () async {
            final cameras = await availableCameras();
            final firstCamera = cameras.first;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TakePicturePage(
                          camera: firstCamera,
                        )));
          },
        ),
      ),
    );
  }
}
