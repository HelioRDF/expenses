import 'dart:math';

import 'package:expenses/components/chart.dart';
import 'package:flutter/material.dart';
import 'components/transactions_form.dart';
import 'components/transactions_list.dart';
import 'models/transaction.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Trasaction> _transactions = [];

  List<Trasaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _onSubmit(descricao, valor, date) {
    Trasaction item = Trasaction(
        id: Random().nextDouble().toString(),
        title: descricao,
        value: valor,
        date: date);

    setState(() {
      _transactions.add(item);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  _showTransactionsForm(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return TransactionForm(_onSubmit);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => _showTransactionsForm(context))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Chart(_recentTransactions),
          _transactions.length == 0
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Nenhuma informação cadastrada!"),
                )
              : TransactionList(_transactions, _removeTransaction),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showTransactionsForm(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
