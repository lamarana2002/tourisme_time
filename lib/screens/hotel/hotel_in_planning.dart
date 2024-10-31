import 'package:flutter/material.dart';
import 'package:tourisme_time/models/hotel.dart';
import 'package:tourisme_time/screens/hotel/hotel_detail.dart';

class HotelInPlanning extends StatelessWidget {
  const HotelInPlanning({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical:8),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>HotelDetail(hotel: hotel)));
        },
        child: Stack(
          children:[ 
            Container(
            width: 230,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(hotel.image), fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              color: Colors.black54,
              ),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(hotel.etoiles, (int index)=>const Icon(Icons.star, color: Colors.yellow,))),
            ),
          )
          ]
        ),
      ),
    );
  }
}