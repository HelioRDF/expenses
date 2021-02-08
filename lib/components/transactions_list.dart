import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Trasaction> _transactions = [];
  final Function(String) _removeTransaction;

  TransactionList(this._transactions, this._removeTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
          child: Column(
            children: [
              Container(
                  height: 350,

                  // color: Color(0xFFDADBE4),
                  child: ListView.builder(
                      itemCount: _transactions.length,
                      itemBuilder: (ctx, indice) {
                        Trasaction tr = _transactions[indice];

                        return Card(
                          elevation: 5,
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FittedBox(child: Text('R\$${tr.value}')),
                              ),
                            ),
                            title: Text(
                              tr.title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            subtitle: Text(
                              DateFormat('d-MMM-y').format(tr.date),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              // color: Theme.of(context).errorColor,
                              color: Colors.grey,
                              onPressed: () => _removeTransaction(tr.id),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
