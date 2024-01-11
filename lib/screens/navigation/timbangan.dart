import 'dart:async';
import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(WeightScaleApp());
}

class WeightScaleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STREAMING DATA',
      home: WeightScalePage(),
    );
  }
}

class WeightScalePage extends StatefulWidget {
  @override
  _WeightScalePageState createState() => _WeightScalePageState();
}

class _WeightScalePageState extends State<WeightScalePage> {
  final StreamController<double> _weightStreamController = StreamController<double>();
  List<double> streamingData = [];

  @override
  void dispose() {
    _weightStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Streaming data USD'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                children: [
                  // Replaced Expanded with SizedBox to allow proper spacing for the text
                  SizedBox(
                    height: 150,
                    child: StreamBuilder<double>(
                      stream: _weightStreamController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return buildLineChart();
                        } else {
                          return buildLoadingIndicator();
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Latest Data: ${streamingData.isNotEmpty ? streamingData.last.toString() : "-"}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChart buildLineChart() {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: _generateSpots(),
            isCurved: true,
            colors: [Colors.blue],
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.black, width: 1),
        ),
        gridData: FlGridData(show: false),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.blueAccent,
          ),
        ),
      ),
    );
  }

  Widget buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _updateStreamingData() async {
    try {
      final response = await http.get(Uri.parse('https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        double price = data['USD'];
        setState(() {
          streamingData.add(price);
        });
        _weightStreamController.add(price);
      } else {
        throw Exception('Failed to load Bitcoin price');
      }
    } catch (e) {
      print('Error fetching Bitcoin price: $e');
    }
  }

  List<FlSpot> _generateSpots() {
    List<FlSpot> spots = [];
    for (int i = 0; i < streamingData.length; i++) {
      spots.add(FlSpot(i.toDouble(), streamingData[i]));
    }
    return spots;
  }

  @override
  void initState() {
    super.initState();

    // Update streaming data every 10 seconds (adjust as needed)
    Timer.periodic(Duration(seconds: 10), (timer) {
      _updateStreamingData();
    });
  }
}
