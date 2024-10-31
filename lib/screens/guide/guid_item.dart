import 'package:flutter/material.dart';
import 'package:tourisme_time/constantes.dart';
import 'package:tourisme_time/models/guide.dart';

class GuidItem extends StatelessWidget {
  const GuidItem({super.key, required this.guide});

  final Guide guide;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(guide.image),
      ),
      title: Text(
        guide.prenom,
        style: const TextStyle(
          color: black,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),
      subtitle: subtile()
    );
  }

  Widget subtile (){
    return SizedBox(
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              guide.profession,
              style: const TextStyle(
                color: black,
                // fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
          Text(
              "${guide.langue[0]} ${guide.langue[1]} ...",
              style: const TextStyle(
                color: black,
                // fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
        ],
      ),
    );
  }
}