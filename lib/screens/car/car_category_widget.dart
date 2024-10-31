import 'package:flutter/material.dart';

class CarCategoryWidget extends StatelessWidget {
  const CarCategoryWidget(
      {super.key, required this.image, required this.category});

  final String image;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 200,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
        ),
        Text(
          category,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
