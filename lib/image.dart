import 'package:flutter/material.dart';
import 'dart:io';

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  FullScreenImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Screen Image'),
      ),
      body: Center(
        child: Image.file(
          File(imagePath), // Assuming imagePath is a valid file path
          fit: BoxFit.cover, // Adjust the fit as needed
        ),
      ),
    );
  }
}
