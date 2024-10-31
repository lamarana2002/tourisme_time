import 'package:flutter/material.dart';
import 'package:tourisme_time/constantes.dart';
import 'package:tourisme_time/models/car.dart';

class CarBlog extends StatelessWidget {
  const CarBlog({super.key, required this.car, });

  final Car car;
  // final void Function() carAlbum;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: carAlbum,
      child: Card(
        child: Stack(
          children: [
            Image.asset(
                car.image,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.5),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        car.name,
                        style: const TextStyle(color: white, fontSize: 20),
                      ),
                      Text(
                        "Model: ${car.model}",
                        style: const TextStyle(color: white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.5),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Prix: \$ ${car.price.toString()}",
                        style: const TextStyle(color: white, fontSize: 20),
                      ),
                      Text(
                        "Places: ${car.place}",
                        style: const TextStyle(color: white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
