import 'package:flutter/material.dart';
import 'package:tourisme_time/constantes.dart';
import 'package:tourisme_time/details_lieu.dart';
import 'package:tourisme_time/global_selected_lieu.dart';
import 'package:tourisme_time/models/lieu.dart';

class LieuItem extends StatefulWidget {
  const LieuItem({
    super.key,
    required this.lieu,
    // required this.imageLieu,
    // required this.titre,
    // required this.extraitHistorique,
    // required this.prefecture,
    // required this.sousPrefecture,
  });

  final Lieu lieu;

  @override
  State<LieuItem> createState() => _LieuItemState();
}

class _LieuItemState extends State<LieuItem> {
  // final String imageLieu;
  final IconData localisation = Icons.location_on;
  bool wantVisit = false;

  String decoupeHistoire(String extrait) {
    return '${extrait.substring(0, 100)}...';
  }

  // Ajouter le lieu à la liste des lieux à visiter
  void addToList() {
    if (selectedLieu.contains(widget.lieu)) {
      setState(() {
        wantVisit = false;
      });
      selectedLieu.remove(widget.lieu);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Vous avez retirer ce lieu à la liste des lieux à visiter',
          style: TextStyle(fontSize: 25),
        ),
      ));
    } else {
      setState(() {
        wantVisit = true;
      });
      selectedLieu.add(widget.lieu);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          'Vous avez ajouter ce lieu à la liste des lieux à visiter',
          style: TextStyle(fontSize: 25),
        ),
      ));
    }
  }

  // Le Climat la vegetation la densité et le relief

  Widget natureBox(Color colorBox) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
            color: colorBox, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  void lieuDetails() {
    showBottomSheet(
        context: context,
        builder: (ctx) {
          return SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    const SizedBox(
                      height: default_padding,
                    ),
                    Text(
                      widget.lieu.title,
                      style: TextStyle(fontSize: 25),
                    ),
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.lieu.image),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Text(
                      widget.lieu.histoire,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text("${widget.lieu.prefecture}/",
                                  style: const TextStyle(fontSize: 15)),
                              Text("${widget.lieu.sousPrefecture}/",
                                  style: const TextStyle(fontSize: 15)),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(localisation),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Stack(
        children: [
          Image.asset(
            widget.lieu.image,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              color: Colors.black54,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.lieu.title,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                  "${widget.lieu.prefecture}/${widget.lieu.sousPrefecture}/",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Icon(
                                  localisation,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                          // Spacer(flex:1),
                          Expanded(
                            // flex: 1,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                natureBox(orange),
                                natureBox(green),
                                natureBox(grey),
                                natureBox(indigo)
                              ],
                            ),
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              addToList();
                            },
                            icon: Icon(
                              wantVisit
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_outlined,
                              color: Theme.of(context).colorScheme.onPrimary,
                            )),
                        IconButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      DetailsLieu(lieu: widget.lieu))),
                          icon: const Icon(Icons.history_edu),
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: GestureDetector(
    //     onTap: lieuDetails,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(
    //             width: double.infinity,
    //             height: 300,
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   image: AssetImage(widget.lieu.image), fit: BoxFit.cover),
    //             ),
    //             child: Align(
    //               alignment: Alignment.bottomRight,
    //               child: Padding(
    //                   padding: EdgeInsets.all(8.0),
    //                   child: IconButton(
    //                     onPressed: addToList,
    //                     icon: const Icon(
    //                       Icons.visibility,
    //                       color: primary,
    //                       size: 50,
    //                     ),
    //                   )),
    //             )),
    //         Text(
    //           widget.lieu.title,
    //           style: const TextStyle(
    //             fontSize: default_title_size,
    //           ),
    //         ),
    //         Text(
    //           decoupeHistoire(widget.lieu.histoire),
    //           style: const TextStyle(
    //             fontSize: 20,
    //           ),
    //         ),
    //         Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
    //           Expanded(
    //             child: Row(
    //               children: [
    //                 Text("${widget.lieu.prefecture}/",
    //                     style: const TextStyle(fontSize: 15)),
    //                 Text("${widget.lieu.sousPrefecture}/",
    //                     style: const TextStyle(fontSize: 15)),
    //                 Padding(
    //                   padding: const EdgeInsets.only(left: 8.0),
    //                   child: Icon(localisation),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           // Spacer(flex:1),
    //           Expanded(
    //             child: Row(
    //               children: [
    //                 natureBox(orange),
    //                 natureBox(green),
    //                 natureBox(grey),
    //                 natureBox(indigo)
    //               ],
    //             ),
    //           ),
    //         ]),
    //       ],
    //     ),
    //   ),
    // );
  }
}
