import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tourisme_time/screens/camera/camera_blog.dart';
import 'package:tourisme_time/constantes.dart';
import 'package:tourisme_time/data/camera_blog_data.dart';
import 'package:tourisme_time/models/camera.dart';
import 'package:tourisme_time/screens/expert_photographe/expert_photo.dart';
import 'package:tourisme_time/widget/reservation_button.dart';

class CameraDetails extends StatelessWidget {
  const CameraDetails({super.key, required this.camera});

  final Camera camera;

  @override
  Widget build(BuildContext context) {
    void takeCamera(){
      print('Camera louer');
    }
    void goToExpertScreen(){
      Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const ExpertPhoto()));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          camera.nom,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Stack(
              children: [
                Image.asset(
                  camera.image,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  left: 5,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.7),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Model: ${camera.model}",
                            style: const TextStyle(color: white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  left: 5,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.7),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rayon: ${camera.rayon}",
                            style: const TextStyle(color: white, fontSize: 20),
                          ),
                          Text(
                            "Pixel: ${camera.pixel}",
                            style: const TextStyle(color: white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer)),
                child: Row(
                  children: [
                    ReservationButton(title:'Expert', onpressed: goToExpertScreen),
                    ReservationButton(title:'Louer', onpressed: takeCamera)
                  ],
                ),
              ),
            ),
            // const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 40,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(.9),
              child: Center(
                child: Text(
                  "Image prise par ${camera.nom}",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 500,
              child: ListView(
                children: List.generate(cameraBlogData.length, (cam) {
                  return CameraBlog(cameraImage: cameraBlogData[cam].image);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
