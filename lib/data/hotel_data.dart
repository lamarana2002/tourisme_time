import 'package:tourisme_time/models/hotel.dart';

final hotelData = [
  Hotel(
      image: "assets/images/hotel/hotel1FormatMobile.jpg",
      nom: "Hôtel Kaloum Palace",
      prefecture: "Conakry",
      sousPrefecture: "Kaloum",
      adresse: "Avenue de la République, Kaloum, Conakry",
      nbSuite: 20,
      etoiles: 5,
      prixNuit: 500000,
      servicesDisponible:[
        "Wi-Fi", "Piscine", "Spa", "Salle de conférence", "Restaurant", "Parking gratuit"
      ]
          ,
      telephone: "+224 622 00 00 00",
      email: "contact@kaloumpalace.com",
      dateCreation: DateTime(2015, 06, 15)),
  Hotel(
      image: "assets/images/hotel/hotel2FormatMobile.jpg",
      nom: "Hôtel Riviera Royal",
      prefecture: "Conakry",
      sousPrefecture: "Dixinn",
      adresse: "Route du Niger, Dixinn, Conakry",
      nbSuite: 10,
      etoiles: 4,
      prixNuit: 400000,
      servicesDisponible: [ "Wi-Fi", "Gym", "Restaurant", "Bar", "Spa"],
      telephone: "+224 623 11 11 11",
      email: "info@rivieraroyal.com",
      dateCreation: DateTime(2010, 09, 23)),
  Hotel(
      image: "assets/images/hotel/hotel3FormatMobile.jpeg",
      nom: "Hôtel Noom Conakry",
      prefecture: "Conakry",
      sousPrefecture: "Kaloum",
      adresse: "Corniche Nord, Kaloum, Conakry",
      nbSuite: 30,
      etoiles: 5,
      prixNuit: 600000,
      servicesDisponible:
          ["Wi-Fi", "Piscine", "Bar sur le toit", "Salle de conférence", "Gym"],
      telephone: "+224 624 22 22 22",
      email: "reservation@noomconakry.com",
      dateCreation: DateTime(2018, 02, 10)),
  Hotel(
      image: "assets/images/hotel/hotel4FormatMobile.jpeg",
      nom: "Hôtel Millenium Suites",
      prefecture: "Conakry",
      sousPrefecture: "Ratoma",
      adresse: "Ratoma, Conakry",
      nbSuite: 12,
      etoiles: 3,
      prixNuit: 350000,
      servicesDisponible: ["Wi-Fi", "Piscine", "Restaurant", "Parking gratuit"],
      telephone: "+224 625 33 33 33",
      email: "millenium@conakryhotels.com",
      dateCreation: DateTime(2012, 11, 07)),
  Hotel(
      image: "assets/images/hotel/hotel5FormatMobile.jpeg",
      nom: "Hôtel Mariador Palace",
      prefecture: "Conakry",
      sousPrefecture: "Matam",
      adresse: "Matam, Conakry",
      nbSuite: 8,
      etoiles: 4,
      prixNuit: 450000,
      servicesDisponible:
          ["Wi-Fi", "Piscine", "Spa", "Restaurant", "Bar", "Salle de conférence"],
      telephone: "+224 626 44 44 44",
      email: "contact@mariadorpalace.com",
      dateCreation: DateTime(2009, 03, 12))
];
