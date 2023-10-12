import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {

  final List<Expense> expenses;

  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length, 
      itemBuilder: (ctx, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),//UniqueKey(), 
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(
            expenses[index]
            )
          );
      }
    );
  }
}