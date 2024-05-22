import 'package:financial_statement/model/expense.dart';
import 'package:financial_statement/widget/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expensesList, required this.removeExpense});

  final List<Expense> expensesList;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          //margin: Theme.of(context).cardTheme.margin,
        ),
          key: ValueKey(expensesList[index]),
          onDismissed: (direction) {
            removeExpense(expensesList[index]);
          },
          child: ExpenseItem(
            expense: expensesList[index],
          )),
    );
  }
}
