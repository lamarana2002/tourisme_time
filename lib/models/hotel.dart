class Hotel {
  String image;
  String nom;
  String prefecture;
  String sousPrefecture;
  String adresse;
  int nbSuite;
  int etoiles;
  double prixNuit;
  List<String> servicesDisponible;  
  String telephone;
  String email;
  DateTime dateCreation;

Hotel({
  required this.image,
  required this.nom,
  required this.prefecture,
  required this.sousPrefecture,
  required this.adresse,
  required this.nbSuite,
  required this.etoiles,
  required this.prixNuit,
  required this.servicesDisponible,
  required this.telephone,
  required this.email,
  required this.dateCreation,

});

}