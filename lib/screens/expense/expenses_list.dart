import 'package:tourisme_time/models/expense.dart';
import 'package:tourisme_time/screens/expense/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  final Function(Expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        final expense = expenses[index];
        return Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            // margin: EdgeInsets.symmetric(
            //     horizontal: Theme.of(context).cardTheme.margin!),
          ),
          key: ValueKey(expense),
          child: ExpenseItem(expense),
          onDismissed: (DismissDirection direction) {
            removeExpense(expense);
          },
        );
      },
    );
  }
}
