import 'package:flutter/material.dart';
import 'package:tourisme_time/models/lieu.dart';
import 'package:tourisme_time/lieu_item.dart';

class ListLieux extends StatelessWidget {
  const ListLieux({super.key, required this.lieux});
  final List<Lieu> lieux;

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
    // return ListView.builder(
    //   itemCount: lieux.length,
    //   itemBuilder: (BuildContext ctx, index){
    //     var lieu = lieux[index];
    //   return 
    //   LieuItem(
    //     imageLieu: lieu.image,
    //     titre: lieu.title,
    //     extraitHistorique: lieu.histoire,
    //     prefecture: lieu.prefecture,
    //     sousPrefecture: lieu.sousPrefecture);
    
  }
}