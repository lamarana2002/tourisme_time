import 'package:tourisme_time/constantes.dart';
import 'package:tourisme_time/details_lieu.dart';
import 'package:flutter/material.dart';
import 'package:tourisme_time/global_selected_lieu.dart';
import 'package:tourisme_time/models/lieu.dart';

class DetailsLieu extends StatelessWidget {
  DetailsLieu({super.key, required this.lieu});

  final Lieu lieu;

  @override
  Widget build(BuildContext context) {

    Widget detailHotel(String assetName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: black,
            image: DecorationImage(
                image: AssetImage(assetName), fit: BoxFit.cover)),
      ),
    );
  }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          lieu.title,
          style: const TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: default_padding,
          ),
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(lieu.image), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Text(
              lieu.histoire,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text("${lieu.prefecture}/",
                          style: const TextStyle(fontSize: 15)),
                      Text("${lieu.sousPrefecture}/",
                          style: const TextStyle(fontSize: 15)),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.location_on),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
          height: default_padding,
        ),
        Container(
          width: double.infinity,
          height: 40,
          color: Theme.of(context)
              .colorScheme
              .onPrimaryContainer
              .withOpacity(.9),
          child: Center(
            child: Text(
              "Sous un autre angle",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 150,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: selectedLieu.length,
            itemBuilder: (context, index) {
              var lieu = selectedLieu[index];
              return detailHotel(lieu.image);
            },
            // scrollDirection: Axis.horizontal,
            // children: [
            //   detailHotel("assets/images/chambre.jpg"),
            //   detailHotel("assets/images/piscine.jpeg"),
            //   detailHotel("assets/images/salle-a-manger.jpg"),
            //   detailHotel("assets/images/nourriture.jpg"),
            // ],
          ),
        ),
        ]),
      ),
    );
  }
}
