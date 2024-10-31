import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, cinema, work }

var formatter = DateFormat.yMd();

const categoriyIcons = {
  Category.cinema: Icons.movie,
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight,
  Category.work: Icons.work,
};

class Expense {
  Expense(
      {required this.title,
      required this.category,
      required this.date,
      required this.amount})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    Category.values;
    return formatter.format(date);
  }
}

class CategoryChart {
  final Category category;
  final List<Expense> expenses; // depenses de la categories

  CategoryChart({required this.category, required this.expenses});

  CategoryChart.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpenses {
    double sum = 0;

    for (var expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
