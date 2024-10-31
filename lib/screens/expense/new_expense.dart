import 'package:flutter/material.dart';
import 'package:tourisme_time/models/expense.dart';
import 'package:intl/intl.dart';

var formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense(
    this.addExpense, {
    super.key,
  });

  final Function(Expense) addExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  Category _selectedCategory = Category.cinema;

  void _pickDateTime() async {
    final now = DateTime.now();
    final firsDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firsDate,
      lastDate: now,
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _submitExpenseData() {
    final amount = double.tryParse(_amountController.text);
    final isAmountInValid = amount == null || amount < 0;
    final title = _titleController.text;

    if (isAmountInValid || title.trim() == "") {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("Erreur "),
              content: const Text("les informations ne sont pas valides"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          });
      return;
    }
    widget.addExpense(Expense(
        title: title,
        category: _selectedCategory,
        date: _selectedDate,
        amount: amount));

    Navigator.pop(context);

    ///sauvegarder
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text("Titre"),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                      prefixText: "GNF",
                      label: Text("Montant"),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        formatter.format(_selectedDate),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: _pickDateTime,
                          icon: const Icon(
                            Icons.calendar_month,
                          ))
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                DropdownButton(
                  hint: Text("Categorie4"),
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text("Annuler"),
                ),
                ElevatedButton(
                  onPressed: _submitExpenseData,
                  child: const Text("Sauvegarder"),
                )
              ],
            ),
          ],
        ));
  }
}
