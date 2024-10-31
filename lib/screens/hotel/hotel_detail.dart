import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tourisme_time/constantes.dart';
import 'package:tourisme_time/models/hotel.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key, required this.hotel});

  final Hotel hotel;

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.hotel.image),
                        )),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              widget.hotel.etoiles,
                              (int index) => const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ))),
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
                                const Color.fromARGB(114, 158, 158, 158),
                          ),
                          icon: const Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: white,
                            ),
                          )))
                ]),
                ListTile(
                  title: Text(
                    widget.hotel.nom,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: SizedBox(
                    width: 50,
                    child: Row(
                      children: [
                        const Icon(Icons.location_on),
                        Text(
                          "${widget.hotel.prefecture}/${widget.hotel.sousPrefecture}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  trailing: SizedBox(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "GNF ${widget.hotel.prixNuit}",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer),
                        ),
                        Text(
                          "NUIT",
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                contactMailBox(Icons.phone, widget.hotel.telephone),
                contactMailBox(Icons.mail, widget.hotel.email),
                const Divider(),
                Wrap(
                    spacing: 5,
                    textDirection: TextDirection.ltr,
                    children:
                        List.generate(widget.hotel.servicesDisponible.length, (index) {
                      return Card(
                        // padding: EdgeInsets.all(4),
                        color: const Color.fromARGB(126, 158, 158, 158),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            widget.hotel.servicesDisponible[index],
                            style: const TextStyle(
                              fontSize: 20,
                              color: black,
                            ),
                          ),
                        ),
                      );
                    })),
                const Divider(),
                IconButton(
                    onPressed: () {
                      _getHotelPosition();
                    },
                    icon: const Icon(Icons.location_on)),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color: Theme.of(context).colorScheme.onPrimaryContainer)),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: () {
                          reserveHotel();
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer),
                          child: Center(
                            child: Text(
                              'Reserver',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget contactMailBox(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }

  Future<Position> _getHotelPosition() async {
    LocationPermission permission;
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Localisation desactive');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.openLocationSettings();
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  void reserveHotel() async {
    final formKey = GlobalKey<FormBuilderState>();
      showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
                  child: FormBuilder(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: FormBuilderDateTimePicker(
                                  name: 'date_arrive',
                                  decoration: const InputDecoration(
                                    hintText: "Date d'arrive",
                                  )
                                      
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Expanded(
                                child: FormBuilderDateTimePicker(
                                  name: 'date_depart',
                                  decoration: const InputDecoration(
                                    hintText: "Date de depart",
                                  )
                                      
                                ),
                              ),
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  ),
            );
          });
    }
}
