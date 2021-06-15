import 'package:flutter/material.dart';

class PhotoView extends StatelessWidget {
  final String photoUrl;
  // ignore: use_key_in_widget_constructors
  const PhotoView({required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.network(photoUrl,
            fit: BoxFit.fill,),
        ),
      ),
    );
  }
}
