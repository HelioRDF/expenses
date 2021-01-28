import 'package:flutter/material.dart';
import 'components/transactions_form.dart';
import 'components/transactions_list.dart';
import 'models/transaction.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Trasaction> _transactions = [
    Trasaction(
        id: 't1',
        title: "Novo Tênis de corrida",
        value: 310.76,
        date: DateTime.now()),
    Trasaction(
        id: 't2', title: "Conta de Luz", value: 211.30, date: DateTime.now()),
    Trasaction(
        id: 't3', title: "Conta de Aguá", value: 78.30, date: DateTime.now()),
  ];

  _onSubmit(descricao, valor) {
    Trasaction item = Trasaction(
        id: descricao, title: descricao, value: valor, date: DateTime.now());

    setState(() {
      _transactions.add(item);
    });

    Navigator.of(context).pop();
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
          Card(
            child: Text("Gráfico"),
            elevation: 5,
            color: Colors.blue,
          ),
          TransactionList(_transactions),
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
