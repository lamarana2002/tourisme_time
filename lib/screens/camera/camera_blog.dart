import 'package:flutter/material.dart';
import 'package:tourisme_time/models/camera_blog_model.dart';

class CameraBlog extends StatelessWidget {
  const CameraBlog({super.key, required this.cameraImage});

  final String cameraImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Image.asset(
              cameraImage,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
    );
  }
}