import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function(String, double, DateTime) onsubmit;
  TransactionForm(this.onsubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _textoController = TextEditingController();

  final _valorController = TextEditingController();
  DateTime _dataSelecionada = DateTime.now();

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((value) => {
              setState(() {
                _dataSelecionada = value;
              })
            });
  }

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
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _dataSelecionada == null
                      ? Text("Nenhuma data Selecionada")
                      : Text("Data: " +
                          DateFormat("dd/MM/y").format(_dataSelecionada)),
                  FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _showDatePicker,
                      child: Text(
                        "Selecionar Data",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  child: Text(
                    "Salvar",
                  ),
                  onPressed: () {
                    String texto = _textoController.text;
                    double valor = double.parse(_valorController.text);
                    widget.onsubmit(texto, valor, _dataSelecionada);
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
