import 'package:flutter/material.dart';
import 'package:tourisme_time/screens/camera/camera_item.dart';
import 'package:tourisme_time/constantes.dart';
import 'package:tourisme_time/data/camera_data.dart';
import 'package:tourisme_time/data/lieux.dart';
import 'package:tourisme_time/lieu_item.dart';

class CameraLocation extends StatelessWidget {
  const CameraLocation({super.key});

  @override
  Widget build(BuildContext context) {
    var cameraLocated = cameraData;
    Widget detailHotel(String assetName) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(assetName), fit: BoxFit.cover)),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Camera Location',
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: TextField(
                style: TextStyle(color: black, fontSize: 20),
                decoration: InputDecoration(
                    hintText: 'Rechercher une camera',
                    suffixIcon: Icon(Icons.search),
                    hintStyle: TextStyle(color: black, fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                ),
              ),
            ),
            // SizedBox(
            //   height: 150,
            //   width: double.infinity,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       detailHotel("assets/images/chambre.jpg"),
            //       detailHotel("assets/images/piscine.jpeg"),
            //       detailHotel("assets/images/salle-a-manger.jpg"),
            //       detailHotel("assets/images/nourriture.jpg"),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 30,
            //   width: double.infinity,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       ElevatedButton(
            //         onPressed: (){},
            //         style: ElevatedButton.styleFrom(
            //             elevation: 12,
            //             backgroundColor: const Color.fromARGB(31, 0, 0, 0)),
            //         child: const Text(
            //           'Camon',
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontSize: 18,
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //       ElevatedButton(
            //         onPressed: () {},
            //         style: ElevatedButton.styleFrom(
            //             elevation: 12,
            //             backgroundColor: const Color.fromARGB(31, 0, 0, 0)),
            //         child: const Text(
            //           'Camong X',
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontSize: 18,
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //       ElevatedButton(
            //         onPressed: () {},
            //         style: ElevatedButton.styleFrom(
            //             elevation: 12,
            //             backgroundColor: const Color.fromARGB(31, 0, 0, 0)),
            //         child: const Text(
            //           'Samsung',
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontSize: 18,
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //       ElevatedButton(
            //         onPressed: () {},
            //         style: ElevatedButton.styleFrom(
            //             elevation: 12,
            //             backgroundColor: const Color.fromARGB(31, 0, 0, 0)),
            //         child: const Text(
            //           'Camera X',
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontSize: 18,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // 
            const SizedBox(height: 10,),
            ...cameraLocated.map((camera) {
              return CameraItem(
                camera: camera,
              );
            }),
          ],
        ),
      ),
    );
  }
}