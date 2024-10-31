import 'package:flutter/material.dart';
import 'package:tourisme_time/screens/car/car_album_wiget.dart';
import 'package:tourisme_time/screens/car/car_blog.dart';
import 'package:tourisme_time/screens/car/car_category_widget.dart';
import 'package:tourisme_time/constantes.dart';
import 'package:tourisme_time/data/car_data.dart';
import 'package:tourisme_time/models/car_album.dart';

class CarLocation extends StatelessWidget {
  const CarLocation({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Car Location',
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: carData.length,
              itemBuilder: (context, index){
              final car = carData[index];
                return CarCategoryWidget(image: car.image, category: car.carCategory.name);
              }),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: carData.length,
                itemBuilder: (context, index){
                final car = carData[index];
                  return CarBlog(car:car);
                }),
          ),
        ],
      ),
    );
  }
  // void carAlbum(BuildContext context, List<CarAlbum> carAlbum) {
  //   showBottomSheet(context: context, builder: (ctx){
  //     return CarAlbumWiget(carAlbum: carAlbum);
  //   });
  // }
}
