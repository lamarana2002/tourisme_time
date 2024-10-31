import 'package:tourisme_time/models/expense.dart';
import 'package:tourisme_time/chart/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
   Chart({super.key, required this.allExpenses});

  final List<Expense> allExpenses;

  List<CategoryChart> get categoriesExpenses {
    // Buckets
    return [
      CategoryChart.forCategory(allExpenses, Category.food),
      CategoryChart.forCategory(allExpenses, Category.cinema),
      CategoryChart.forCategory(allExpenses, Category.travel),
      CategoryChart.forCategory(allExpenses, Category.work),
    ];
  }
//TODO:
// [ ] Implémenter une méthode pour trouver la dépense totale la plus élevée
// [ ] Utiliser une structure de boucle appropriée
  // ***  get maxTotalExpense { }

  double maxAmontExpense = 0;

  void maxTotalExpense(){
    for (var expense in categoriesExpenses) {
      if (expense.totalExpenses > maxAmontExpense) {
        maxAmontExpense = expense.totalExpenses;
      }
      
    }
  }

  @override
  Widget build(BuildContext context) {
    maxTotalExpense();
    // final isDarkMode =. //TODO:
// [ ] Créer un widget Container
// [ ] Définir la marge (margin) :
//   - EdgeInsets.all(16)
// [ ] Configurer le rembourrage (padding) :
//   - Vertical : 16
//   - Horizontal : 8
// [ ] Définir la largeur (width) :
//   - double.infinity
// [ ] Fixer la hauteur (height) :
//   - 180
// [ ] Appliquer une décoration (BoxDecoration) :
//   - Coins arrondis (borderRadius) :
//     - BorderRadius.circular(8)
//   - Dégradé linéaire (LinearGradient) :
//     - Couleurs :
//       - Début : Theme.of(context).colorScheme.primary.withOpacity(0.3)
//       - Fin : Theme.of(context).colorScheme.primary.withOpacity(0.0)
//     - Début : Alignment.bottomCenter
//     - Fin : Alignment.topCenter
    return Column(
      children: [
        // TODO: Exercice - Création d'une ligne de barres de graphique extensible
// [ ] Utiliser un widget pour occuper l'espace disponible
// [ ] Créer une ligne de widgets alignés horizontalement
//   - Réfléchir à l'alignement vertical des éléments dans la ligne
// [ ] Itérer sur la liste des buckets
//   - Considérer une alternative à la méthode map() pour la création de widgets
// [ ] Pour chaque bucket, créer un widget ChartBar
//   - [ ] Calculer le ratio de remplissage de la barre
//   - [ ] Gérer le cas où totalExpenses est 0
//   - [ ] Utiliser maxTotalExpense pour normaliser les valeurs
        Row(
          children: [for (final expense in categoriesExpenses) ChartBar(expensesChart: expense, maxAmountExpense: maxAmontExpense,)],
        ),
        const SizedBox(
          height: 12,
        ),
        // TODO: Exercice - Création d'une ligne d'icônes pour les buckets
// [ ] Utiliser un widget Row pour aligner les éléments horizontalement
// [ ] Transformer la liste de buckets en widgets
//   - Réfléchir à l'utilisation d'une méthode de transformation de liste
// [ ] Pour chaque bucket :
//   - [ ] Assurer une répartition égale de l'espace (indice : Expanded)
//   - [ ] Ajouter un espacement horizontal entre les icônes
//   - [ ] Afficher l'icône correspondant à la catégorie du bucket
// [ ] Gérer l'apparence des icônes :
//   - [ ] Adapter la couleur en fonction du mode (clair/sombre)
//   - [ ] Utiliser les couleurs du thème de manière appropriée
        Container(
          decoration: const BoxDecoration(
            
          ),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color:Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [for (final expense in categoriesExpenses) Icon(categoriyIcons[expense.category])],
            ),
          ),
        ),
      ],
    );
  }
}
