import 'package:tourisme_time/models/car.dart';
import 'package:tourisme_time/models/car_album.dart';

final carData = [
  Car(
    name: 'lamborghini',
    model: 'aventador',
    place: '4',
    price: 400,
    image: 'assets/images/hotel2.jpg',
    carCategory: CarCategory.berline
  ),
  Car(
    name: 'camping world',
    model: 'balise',
    place: '10',
    price: 300,
    image: 'assets/images/hotel.jpeg',
    carCategory: CarCategory.campingCar
  ),
  Car(
    name: 'lexus',
    model: 'zt',
    place: '6',
    price: 250,
    image: 'assets/images/hotel3.jpeg',
    carCategory: CarCategory.coupe
  ),
  Car(
    name: 'school bus',
    model: 'sb',
    place: '24',
    price: 300,
    image: 'assets/images/hotel4.jpeg',
    carCategory: CarCategory.bus
  ),
];
