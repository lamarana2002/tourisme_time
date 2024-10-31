import 'package:flutter/material.dart';
import 'package:tourisme_time/constantes.dart';
import 'package:tourisme_time/models/expert_photo.dart';

class ExtPhotoItem extends StatelessWidget {
  const ExtPhotoItem({super.key, required this.expert});

  final ExpertPhoto expert;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(expert.image),
      ),
      title: Text(
        expert.prenom,
        style: const TextStyle(
          color: black,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),
      subtitle: Text(
        expert.profession,
        style: const TextStyle(
          color: black,
          // fontWeight: FontWeight.bold,
          fontSize: 15
        ),
      ),
    );
  }
}