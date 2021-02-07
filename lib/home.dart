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
  final List<Trasaction> _transactions = [
    Trasaction(
        id: 't1',
        title: "Novo Tênis de corrida",
        value: 310.76,
        date: DateTime.now().subtract(Duration(days: 33))),
    Trasaction(
        id: 't2',
        title: "Conta de Luz",
        value: 211.30,
        date: DateTime.now().subtract(Duration(days: 3))),
    Trasaction(
        id: 't3',
        title: "Conta de Aguá",
        value: 78.30,
        date: DateTime.now().subtract(Duration(days: 4))),
    Trasaction(
        id: 't4',
        title: "Internet",
        value: 110.30,
        date: DateTime.now().subtract(Duration(days: 5))),
    Trasaction(
        id: 't4',
        title: "Whey",
        value: 140.30,
        date: DateTime.now().subtract(Duration(days: 7))),
  ];

  List<Trasaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

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
    var appBar = AppBar(
      title: Text("Despesas"),
      actions: [
        IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => _showTransactionsForm(context))
      ],
    );
    var alturaTela = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container( height: alturaTela*0.34, child: Chart(_recentTransactions)),
          Container(height: alturaTela*0.64, child: TransactionList(_transactions)),
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
