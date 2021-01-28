import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function(String, double) onsubmit;
  TransactionForm(this.onsubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _textoController = TextEditingController();

  final _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _textoController,
              decoration: InputDecoration(labelText: "Titulo"),
            ),
            TextField(
              controller: _valorController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: "Valor R\$"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text("Salvar",
                      style: TextStyle(color: Colors.purple, fontSize: 16)),
                  onPressed: () {
                    String texto = _textoController.text;
                    double valor = double.parse(_valorController.text);
                    widget.onsubmit(texto, valor);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
