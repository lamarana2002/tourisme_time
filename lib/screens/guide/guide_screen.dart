import 'package:flutter/material.dart';
import 'package:tourisme_time/constantes.dart';
import 'package:tourisme_time/data/guide_data.dart';
import 'package:tourisme_time/screens/guide/guid_item.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/hotel.jpeg'),
                    )),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(179, 0, 0, 0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 10,
                right: 10,
                child: Container(
                  // width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(176, 1, 1, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: const TextField(
                    style: TextStyle(color: black, fontSize: 20),
                    decoration: InputDecoration(
                        hintText: 'Rechercher un guide',
                        suffixIcon: Icon(Icons.search, color:white),
                        hintStyle: TextStyle(color: white, fontSize: 20),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                ),
              ),
              Positioned(
                  top: 30,
                  left: 20,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: IconButton.styleFrom(
                        backgroundColor:
                      const Color.fromARGB(176, 1, 1, 1),
                      ),
                      icon: const Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: white,
                        ),
                      ))),
            ]),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 500,
              child: ListView(
                children: List.generate(guideData.length, (cam) {
                  return GuidItem(guide: guideData[cam]);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}