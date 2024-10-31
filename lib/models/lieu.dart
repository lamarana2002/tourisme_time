import 'package:flutter/material.dart';

enum Categorie{montagne, fleuve, chute, foret}
enum CategorieRegion{BG, MG, HG, GF}

const categorieIcons = {
  Categorie.montagne:Icons.landscape,
  Categorie.fleuve:Icons.waves,
  Categorie.chute:Icons.waterfall_chart,
  Categorie.foret:Icons.park,
};

const cti = [
  {'montagne':Categorie.montagne,
  'icon':Icons.landscape,
  },
  {'montagne':Categorie.fleuve,
  'icon':Icons.waves,
  },
  {'montagne':Categorie.chute,
  'icon':Icons.waterfall_chart,
  },
  {'montagne':Categorie.foret,
  'icon':Icons.park,
  },
];

class Lieu {
  String image;
  String title;
  String histoire;
  String prefecture;
  String sousPrefecture;
  Categorie categorie;
  CategorieRegion regionNaturelle;
  
  Lieu({
    required this.image,
    required this.title,
    required this.histoire,
    required this.prefecture,
    required this.sousPrefecture,
    required this.categorie,
    required this.regionNaturelle,
  });

}