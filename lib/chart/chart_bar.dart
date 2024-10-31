import 'package:flutter/material.dart';
import 'package:tourisme_time/models/expense.dart';

// TODO: Exercice - Création d'un widget ChartBar personnalisé
// [ ] Définir une classe ChartBar héritant du bon type de widget
// [ ] Implémenter le constructeur avec les paramètres nécessaires
//   - Réfléchir au(x) paramètre(s) requis pour la fonctionnalité de la barre
// [ ] Surcharger la méthode de construction du widget
// [ ] Détecter le mode d'affichage (clair/sombre) de l'appareil
// [ ] Structurer le widget avec les éléments suivants :
//   - [ ] Un composant pour occuper l'espace disponible horizontalement
//   - [ ] Ajouter un espacement horizontal
//   - [ ] Utiliser un widget pour ajuster la taille en fonction d'une fraction
//   - [ ] Créer une boîte décorée pour représenter la barre
// [ ] Styliser la barre :
//   - [ ] Définir la forme appropriée
//   - [ ] Ajouter des coins arrondis où nécessaire
//   - [ ] Appliquer une couleur basée sur le thème et le mode d'affichage
class ChartBar extends StatefulWidget {
  const ChartBar({super.key, required this.expensesChart, required this.maxAmountExpense});

  final CategoryChart expensesChart;
  final double maxAmountExpense ;

  @override
  State<ChartBar> createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
                height: 200,
                child: FractionallySizedBox(
          heightFactor: widget.expensesChart.totalExpenses/widget.maxAmountExpense,
          alignment: FractionalOffset.bottomCenter,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer
              // border: Border.all(
              //   color: Colors.blue,
              //   width: 4,
              // ),
            ),
          ),
                ),
              ),
        ));
  }
}
