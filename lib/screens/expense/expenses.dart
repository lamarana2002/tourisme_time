import 'package:tourisme_time/chart/chart.dart';
import 'package:tourisme_time/constantes.dart';
import 'package:tourisme_time/screens/expense/expenses_list.dart';
import 'package:tourisme_time/models/expense.dart';
import 'package:tourisme_time/screens/expense/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expenses = [
    Expense(
      title: "Forfait internet",
      amount: 140000,
      category: Category.work,
      date: DateTime.now(),
    ),
    Expense(
      title: "Forfait internet",
      amount: 140000,
      category: Category.work,
      date: DateTime.now(),
    ),
    Expense(
      title: "Cinema",
      amount: 20000,
      category: Category.cinema,
      date: DateTime.now(),
    ),
    Expense(
      title: "Burger",
      amount: 50000,
      category: Category.food,
      date: DateTime.now(),
    ),
    Expense(
      title: "Transport",
      amount: 20000,
      category: Category.travel,
      date: DateTime.now(),
    ),
    Expense(
      title: "Transport",
      amount: 20000,
      category: Category.travel,
      date: DateTime.now(),
    ),
    Expense(
      title: "Transport",
      amount: 20000,
      category: Category.travel,
      date: DateTime.now(),
    ),
    Expense(
      title: "Transport",
      amount: 20000,
      category: Category.travel,
      date: DateTime.now(),
    ),
    Expense(
      title: "Transport",
      amount: 20000,
      category: Category.travel,
      date: DateTime.now(),
    ),
    Expense(
      title: "Transport",
      amount: 20000,
      category: Category.travel,
      date: DateTime.now(),
    ),
    Expense(
      title: "Transport",
      amount: 20000,
      category: Category.travel,
      date: DateTime.now(),
    ),
    Expense(
      title: "Transport",
      amount: 20000,
      category: Category.travel,
      date: DateTime.now(),
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final index = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("success"),
        action: SnackBarAction(
            label: "Annuler",
            onPressed: () {
              setState(() {
                expenses.insert(index, expense);
              });
            }),
      ),
    );
  }

  void _showBottomModalSheet() {
    showModalBottomSheet(
        context: context, builder: (ctx) => NewExpense(_addExpense));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suivi de depenses"),
        actions: [
          IconButton(
            onPressed: _showBottomModalSheet,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Chart(allExpenses: expenses),
          SizedBox(height: default_padding,),
          Expanded(
            child: ExpensesList(
              removeExpense: _removeExpense,
              expenses: expenses,
            ),
          ),
        ],
      ),
    );
  }
}
