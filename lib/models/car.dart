enum CarCategory{berline, campingCar, coupe, bus}

class Car {
  String name;
  String model;
  String place;
  double price;
  String image;
  CarCategory carCategory;
  
  Car({required this.name, required this.model, required this.place, required this.price, required this.image, required this.carCategory});
}