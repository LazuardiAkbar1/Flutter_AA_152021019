import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/navigation/main_drawer.dart';
import 'dart:math';

void main() {
  runApp(BMI());
}

class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: BMIPage(),
    );
  }
}

class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _bmiResult = '';
  String _bmiCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.purpleAccent,
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              onChanged: (_) => _clearBMIResult(),
              decoration: InputDecoration(labelText: 'Tinggi Badan (cm)'),
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              onChanged: (_) => _clearBMIResult(),
              decoration: InputDecoration(labelText: 'Berat Badan (kg)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Hitung BMI'),
            ),
            SizedBox(height: 20),
            Text('BMI: $_bmiResult'),
            Text('Kategori: $_bmiCategory'),
          ],
        ),
      ),
    );
  }

  void _calculateBMI() {
    double? height = double.tryParse(_heightController.text);
    double? weight = double.tryParse(_weightController.text);

    if (height == null || weight == null || height <= 0 || weight <= 0) {
      // Handle invalid input
      _clearBMIResult();
      return;
    }

    Calculate calculator = Calculate(height: height.toInt(), weight: weight.toInt());
    String bmi = calculator.result();
    String category = calculator.getText();

    setState(() {
      _bmiResult = bmi;
      _bmiCategory = category;
    });
  }

  void _clearBMIResult() {
    setState(() {
      _bmiResult = '';
      _bmiCategory = '';
    });
  }
}

class Calculate {
  Calculate({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi = 0;
  
  String result() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getText() {
    if (_bmi >= 25) {
      return 'Gemuk';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Kurus';
    }
  }
}
