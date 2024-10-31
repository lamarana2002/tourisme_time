import 'package:tourisme_time/models/expense.dart';

List<Expense>  expenses = [
    Expense(
      title: "Forfait internet",
      amount: 140000,
      category: Category.work,
      date: DateTime.now(),
    ),
    Expense(
      title: "Transport",
      amount: 20000,
      category: Category.cinema,
      date: DateTime.now(),
    )
  ];