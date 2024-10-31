import 'package:flutter/material.dart';
import 'package:tourisme_time/constantes.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  // Le BOX  pour les lieux
  Widget lieuBox(String assetName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(assetName), fit: BoxFit.cover)),
      ),
    );
  }

  // Le BOX  pour les hotels
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
  Widget guideBox(String guideProfilImage, String guideName) {
    return 
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 90,
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Text(
              guideName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            // backgroundColor: primary,
            title: const Text(
              "LSI Tourisme",
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(Icons.notifications, color: Colors.white, size: 30),
              ),
            ],
          ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 40,
                color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(.9),
                child: Center(
                  child: Text(
                    "Lieux Souvenir",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 420,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    lieuBox("assets/images/paris.jpg"),
                    lieuBox("assets/images/Miami.jpg"),
                    lieuBox("assets/images/moscou.jpg"),
                    lieuBox("assets/images/rome.jpg"),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(.9),
                child: Center(
                  child: Text(
                    "Pour la Nuit",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/hotel.jpeg",
                  // height: 200,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Hotel : Savourez l'enventure dans le Hilton 5 étoiles",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    detailHotel("assets/images/chambre.jpg"),
                    detailHotel("assets/images/piscine.jpeg"),
                    detailHotel("assets/images/salle-a-manger.jpg"),
                    detailHotel("assets/images/nourriture.jpg"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/hotel4.jpeg",
                  // height: 200,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Hotel : Savourez l'enventure dans le Holding Hall 5 étoiles",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    detailHotel("assets/images/chambre.jpg"),
                    detailHotel("assets/images/piscine.jpeg"),
                    detailHotel("assets/images/salle-a-manger.jpg"),
                    detailHotel("assets/images/nourriture.jpg"),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(.9),
                child: Center(
                  child: Text(
                    "Nos Guides",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    guideBox("assets/images/paris.jpg","name name"),
                    guideBox("assets/images/Miami.jpg", "name name"),
                    guideBox("assets/images/moscou.jpg", "name name"),
                    guideBox("assets/images/rome.jpg", "name name"),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}