import 'package:flutter/material.dart';
import 'package:tourisme_time/home.dart';
import 'package:tourisme_time/models/lieu.dart';
import 'package:tourisme_time/constantes.dart';
import 'package:tourisme_time/data/expenses_data.dart';
import 'package:tourisme_time/data/lieux.dart';
import 'package:tourisme_time/lieu_item.dart';
import 'package:tourisme_time/screens/lieux/list_lieux.dart';

class Lieux extends StatefulWidget {
  Lieux({super.key});

  @override
  State<Lieux> createState() => _LieuxState();
}

class _LieuxState extends State<Lieux> {
  Categorie selectedCat = Categorie.montagne;
  CategorieRegion selectedRegion = CategorieRegion.BG;
  @override
  Widget build(BuildContext context) {
    // Le Climat la vegetation la densité et le relief

    Widget natureBox(String titre, Color colorBox, Color colorText) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: colorBox, ),
          child: Center(
              child: Text(
            titre,
            style: TextStyle(color: colorText, fontSize: 25),
          )),
        ),
      );
    }

    // Passez par

    Widget passerPar(String assetName) {
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

    // Filtrer la liste

    var filteredByLieu = lieuxList.where((lieu) =>
        lieu.categorie == selectedCat ||
        lieu.regionNaturelle == selectedRegion);

    // Lieu Categorie

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

    Widget regionNaturelle(CategorieRegion categorie, String title) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              selectedRegion = categorie;
            });
          },
          style: ElevatedButton.styleFrom(
            elevation: 10
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: black,
              fontSize: 18
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/hotel.jpeg'),
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 10,
              right: 10,
              child: Container(
                // width: 300,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(139, 158, 158, 158),
                    borderRadius: BorderRadius.circular(20)),
                child: const TextField(
                  style: TextStyle(color: black, fontSize: 20),
                  decoration: InputDecoration(
                      hintText: 'Rechercher un lieu',
                      suffixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(color: black, fontSize: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
              ),
            ),
            // Positioned(
            //     top: 30,
            //     left: 20,
            //     child: IconButton(
            //         onPressed: () {
            //           Navigator.pop(context);
            //         },
            //         style: IconButton.styleFrom(
            //           backgroundColor:
            //               const Color.fromARGB(114, 158, 158, 158),
            //         ),
            //         icon: const Padding(
            //           padding: const EdgeInsets.all(10.0),
            //           child: const Icon(
            //             Icons.arrow_back_ios,
            //             size: 30,
            //             color: white,
            //           ),
            //         )))
          ]),
          const SizedBox(
            height: default_padding,
          ),

          // Lieux touristique

          // Container(
          //   width: double.infinity,
          //   height: 40,
          //   color: primary,
          //   child: const Center(
          //     child: Text(
          //       "Lieux Touristiques",
          //       style: TextStyle(
          //         color: white,
          //         fontSize: 25,
          //       ),
          //     ),
          //   ),
          // ),

          // Nature Item

          Row(
            children: [
              Flexible(
                flex: 2,
                child: natureBox('Climat', orange, black),
              ),
              Flexible(
                flex: 3,
                child: natureBox('Vegetation', green, white),
              )
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: natureBox('Relief', grey, black),
              ),
              Flexible(
                flex: 2,
                child: natureBox('Densité', indigo, white),
              )
            ],
          ),

          const SizedBox(
            height: default_padding,
          ),
          // Region categorie

          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  regionNaturelle(CategorieRegion.BG, 'Basse Guinee'),
                  regionNaturelle(CategorieRegion.MG, 'Moyenne Guinee'),
                  regionNaturelle(CategorieRegion.HG, 'Haute Guinee'),
                  regionNaturelle(CategorieRegion.GF, 'Guinee Forestiere'),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: default_padding,
          ),

          // Lieu Categorie

          Container(
            width: double.infinity,
            // height: 60,
            color: Colors.black54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ...categorieIcons.map((catIcons){
                //   return 'salut';
                // })
                lieuCategorie(Icons.landscape, Categorie.montagne, 'montagne'),
                lieuCategorie(Icons.waves, Categorie.fleuve, 'fleuve'),
                lieuCategorie(Icons.waterfall_chart, Categorie.chute, 'chute'),
                lieuCategorie(Icons.park, Categorie.foret, 'foret'),
              ],
            ),
          ),

          // SizedBox(
          //   height: 300,
          //   child: Expanded(child: ListLieux(lieux: lieuxList))),

          ...filteredByLieu.map((lieu) {
            return LieuItem(
              lieu: lieu,
              // imageLieu: lieu.image,
              // titre: lieu.title,
              // extraitHistorique: lieu.histoire,
              // prefecture: lieu.prefecture,
              // sousPrefecture: lieu.sousPrefecture,
            );
          }),

          const SizedBox(height: default_padding),

          // Passer par

          Container(
            width: double.infinity,
            height: 40,
            color: primary,
            child: const Center(
              child: Text(
                "Passez Par",
                style: TextStyle(
                  color: white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                passerPar("assets/images/chambre.jpg"),
                passerPar("assets/images/piscine.jpeg"),
                passerPar("assets/images/salle-a-manger.jpg"),
                passerPar("assets/images/nourriture.jpg"),
              ],
            ),
          ),

          SizedBox(height: default_padding),

          // Decourvrez Aussi

          Container(
            width: double.infinity,
            height: 40,
            color: primary,
            child: const Center(
              child: Text(
                "Decouvrez Aussi",
                style: TextStyle(
                  color: white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                passerPar("assets/images/chambre.jpg"),
                passerPar("assets/images/piscine.jpeg"),
                passerPar("assets/images/salle-a-manger.jpg"),
                passerPar("assets/images/nourriture.jpg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
