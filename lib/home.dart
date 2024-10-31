import 'package:flutter/material.dart';
import 'package:tourisme_time/models/lieu.dart';
import 'package:tourisme_time/constantes.dart';
import 'package:tourisme_time/lieux.dart';
import 'package:tourisme_time/planing.dart';
import 'package:tourisme_time/start_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  
 //pour le changement de page
int currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: double.infinity,
          width: double.infinity,
        child: Scaffold(
          // appBar: AppBar(
          //   // backgroundColor: primary,
          //   title: const Text(
          //     "LSI Tourisme",
          //   ),
          //   actions: const [
          //     Padding(
          //       padding: EdgeInsets.only(right: 10.0),
          //       child: Icon(
          //         Icons.person,
          //         color: Colors.white,
          //         size: 30,
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.only(right: 10.0),
          //       child: Icon(Icons.notifications, color: Colors.white, size: 30),
          //     ),
          //   ],
          // ),
          body: IndexedStack(
            index: currentScreen,
            children: [
              const StartScreen(),
              Lieux(),
               Planing(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              setState(() {
                currentScreen = index;
              });
            },
            currentIndex: currentScreen,
            selectedFontSize: 17,
            items:const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Lieux"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Planing"
              ),
              
            ]
            ),
        ),
      ),
    );
  }
}
