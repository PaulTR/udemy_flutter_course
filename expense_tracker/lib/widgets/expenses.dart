import "package:expense_tracker/widgets/new_expense.dart";
import "package:flutter/material.dart";

import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import "package:expense_tracker/models/expense.dart";

class Expenses extends StatefulWidget {
  
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }

}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses = [
    Expense(title: "Flutter Course", amount: 19.99, date: DateTime.now(), category: Category.work),
    Expense(title: "Video game", amount: 13.37, date: DateTime.now(), category: Category.leisure),
    Expense(title: "Flutter Course", amount: 19.99, date: DateTime.now(), category: Category.work)
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      print("Removing");
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget mainContent = Center(child: Text('No expenses found. Start adding some!'));

    if( _registeredExpenses.isNotEmpty ) {
      mainContent = ExpensesList
            (expenses: _registeredExpenses, 
            onRemoveExpense: _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpemseOverlay, 
            icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text("The chart"),
          Expanded(
            child: mainContent
          ),
        ],
      ),
    );
  }

  void _openAddExpemseOverlay() {
    showModalBottomSheet(context: context, 
    isScrollControlled: true,
    builder: (ctx) {
        return NewExpense(onAddExpense: _addExpense);
      }
    );
  }

}