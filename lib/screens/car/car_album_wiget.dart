import 'package:flutter/material.dart';
import 'package:tourisme_time/constantes.dart';
import 'package:tourisme_time/models/car_album.dart';

class CarAlbumWiget extends StatelessWidget {
  const CarAlbumWiget ({super.key, required this.carAlbum});

  final List<CarAlbum> carAlbum;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height/1.5,
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
        ),
        child: ListView.builder(
          itemCount: carAlbum.length,
          itemBuilder: (contex, index){
            var albumItem = carAlbum[index];
            return Image.asset(
              albumItem.image,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          }
        ),
      );
  }
}