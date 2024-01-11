import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/navigation/main_drawer.dart';

class CurrencyConverter {
  final Map<String, double> exchangeRates;

  CurrencyConverter(this.exchangeRates);

  double convertToUSD(double amount) {
    final double rateFrom = exchangeRates['IDR']!;
    final double rateTo = exchangeRates['USD']!;
    final double convertedAmount = amount * (rateTo / rateFrom);

    return convertedAmount;
  }
}

void main() {
  runApp(TukarUang());
}

class TukarUang extends StatelessWidget {
  const TukarUang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      home: TukarUangPage(),
    );
  }
}

class TukarUangPage extends StatefulWidget {
  @override
  _TukarUangPageState createState() => _TukarUangPageState();
}

class _TukarUangPageState extends State<TukarUangPage> {
  final TextEditingController _amountController = TextEditingController();
  final CurrencyConverter _currencyConverter = CurrencyConverter({
    'USD': 1.0,
    'IDR': 15000.0, // nilai sesuai dengan kurs terkini
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime, 
        title: Text('Currency Converter'),
      ),
      drawer: _buildDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Jumlah dalam IDR'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_amountController.text.isNotEmpty) {
                  final double amount =
                      double.parse(_amountController.text.trim());
                  final double convertedAmount =
                      _currencyConverter.convertToUSD(amount);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Hasil Konversi'),
                        content: Text(
                          '$amount IDR = $convertedAmount USD',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Konversi ke USD'),
            ),
          ],
        ),
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: MainDrawer(),
    );
  }
}