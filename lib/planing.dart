import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tourisme_time/data/hotel_data.dart';
import 'package:tourisme_time/screens/camera/camera_location.dart';
import 'package:tourisme_time/screens/car/car_location.dart';
import 'package:tourisme_time/global_selected_lieu.dart';
import 'package:tourisme_time/home.dart';
import 'package:tourisme_time/models/expense.dart';
import 'package:tourisme_time/models/lieu.dart';
import 'package:tourisme_time/constantes.dart';
import 'package:tourisme_time/data/lieux.dart';
import 'package:tourisme_time/screens/guide/guide_screen.dart';
import 'package:tourisme_time/screens/hotel/hotel_in_planning.dart';

class Planing extends StatefulWidget {
  const Planing({super.key});

  @override
  State<Planing> createState() => _PlaningState();
}

class _PlaningState extends State<Planing> {
  Categorie selectedCat = Categorie.montagne;
  int nbChambreReserve = 1;
  int nbAdultes = 1;
  int nbEnfants = 1;

  // Le BOX  pour les hotels
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

  Widget regionNaturelle(String title) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              // selectedCat = categorie;
            });
          },
          child: Text(
            title,
            style: const TextStyle(
              color: white,
            ),
          ),
        )
      ],
    );
  }

  Widget lieuCategorie(IconData icon, Categorie categorie, String title) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              selectedCat = categorie;
            });
          },
          icon: Icon(
            icon,
            color: white,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: white,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // var filteredLieu = lieuxList.where((lieu) => lieu.categorie == selectedCat);
    return SingleChildScrollView(
      child: Column(
        children: [
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
                "Vous souhaitez visiter",
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
          Container(
            width: double.infinity,
            height: 40,
            color: Theme.of(context)
                .colorScheme
                .onPrimaryContainer
                .withOpacity(.9),
            child: Center(
              child: Text(
                "Trouver des hotels au tour du lieu",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotelData.length,
              itemBuilder: (context, index) {
                var hotel = hotelData[index];
                return HotelInPlanning(hotel:hotel);
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     reservationCount('Adulte', nbAdultes),
          //     reservationCount('Enfant', nbEnfants),
          //     reservationCount('Chambre', nbChambreReserve),
          //   ],
          // ),
          const SizedBox(
            height: default_padding,
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: FormBuilderDropdown(
          //         decoration: const InputDecoration(labelText: 'Hotel'),
          //         name: 'hotel',
          //         items: Category.values
          //             .map(
          //               (category) => DropdownMenuItem(
          //                 value: category,
          //                 child: Text(
          //                   category.name,
          //                 ),
          //               ),
          //             )
          //             .toList(),
          //       ),
          //     ),
          //     Expanded(
          //       child: FormBuilderDropdown(
          //         decoration: const InputDecoration(labelText: 'Restauration'),
          //         name: 'restauration',
          //         items: Category.values
          //             .map(
          //               (category) => DropdownMenuItem(
          //                 value: category,
          //                 child: Text(
          //                   category.name,
          //                 ),
          //               ),
          //             )
          //             .toList(),
          //       ),
          //     ),
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: DropdownButton(
                        onChanged: (category) {
                          print(category);
                        },
                        hint: const Text(
                          'Inviter des Amis',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                        // decoration:
                        //     const InputDecoration(
                        //       labelText: 'Inviter des Amis',
                        //       labelStyle: TextStyle(
                        //         fontSize: 18,
                        //         color: Colors.black
                        //       )
                        //     ),
                        // name: 'amis',
                        items: const [
                          DropdownMenuItem(
                               value: 'inviter',
                              child: Text(
                            'Via X',
                          )),
                          DropdownMenuItem(
                               value: 'inviter',
                              child: Text(
                            'Via Instagram',
                          )),
                          DropdownMenuItem(
                               value: 'inviter',
                              child: Text(
                            'Via Facebook',
                          )),
                          DropdownMenuItem(
                               value: 'inviter',
                              child: Text(
                            'Via WhatsApp',
                          )),
                          DropdownMenuItem(
                               value: 'inviter',
                              child: Text(
                            'Via Snapchat',
                          )),
                        ]),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const GuideScreen()));
                    }, 
                    child: const Text(
                      'Trouver un guide',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black
                      ),
                    )
                ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const CarLocation())),
                icon: const Icon(Icons.car_repair_outlined, size: 30)),
                IconButton(
                  onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const CameraLocation())),
                icon: const Icon(Icons.video_camera_front_sharp, size: 30)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget reservationCount(String gestionReserve, int nb) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: Container(
        height: 70,
        width: 120,
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Expanded(
              child: Text(
                gestionReserve,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (nb > 1) {
                              nb--;
                            }
                            ;
                          });
                        },
                        icon: const Icon(Icons.remove)),
                  ),
                  Text(
                    nb.toString(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            nb++;
                          });
                        },
                        icon: const Icon(Icons.add)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
