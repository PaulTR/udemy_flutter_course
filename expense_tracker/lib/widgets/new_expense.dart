import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }

}

class _NewExpenseState extends State<NewExpense> {
  
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year-1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context, 
      initialDate: now, 
      firstDate: firstDate, 
      lastDate: now
    );
    // From here nothing executes until value comes from date
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsValid = enteredAmount != null && enteredAmount >= 0.0;

    if( _titleController.text.trim().isEmpty 
        || !amountIsValid
        || _selectedDate == null ) {
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
            icon: const Icon(Icons.error),
            title: const Text("Invalid input!"),
            content: const Text("Please make sure you are using a valid title, amount, date, and category."),
            actions: [
              TextButton(onPressed: 
              () {
                Navigator.pop(context);
              }, child: const Text("OK"))
            ],
          ),
      );
      
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text, 
        amount: enteredAmount, 
        date: _selectedDate!, 
        category: _selectedCategory)
      );

      Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text("Title")
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text("Amount") 
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text( _selectedDate == null ? "No date selected" : formatter.format(_selectedDate!)),
                    IconButton(onPressed: _presentDatePicker, 
                      icon: Icon(Icons.calendar_month)
                    )
                  ]
                )
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values.map(
                  (category) => DropdownMenuItem(child: Text(category.name.toUpperCase()), value: category)).toList(), 
                onChanged: (value) {
                  if( value == null ) {
                    return;
                  }

                  setState(() {
                    _selectedCategory = value;
                  });
                }
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
              ),
              ElevatedButton( // Save Expense button
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                    _submitExpenseData();
                  },
                  child: const Text('Save Expense'),
                ),
            ],
          ),
        ],
      )
    );
  }

}