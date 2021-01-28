import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Trasaction> _transactions = [];

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
              height: 470,

              // color: Color(0xFFDADBE4),
              child: ListView.builder(
                  itemCount: _transactions.length,
                  itemBuilder: (ctx, indice) {
                    Trasaction tr = _transactions[indice];

                    return Card(
                        elevation: 20,
                        child: Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.purple, width: 2)),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "R\$ " + tr.value.toStringAsFixed(2),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.purple),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  tr.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(DateFormat('d-MMM-y').format(tr.date),
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            )
                          ],
                        ));
                  }))
        ],
      ),
    );
  }
}
