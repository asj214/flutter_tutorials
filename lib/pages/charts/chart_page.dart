import 'package:flutter/material.dart';
import 'bar_chart_page.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tutorial',
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BarChart',
              style: TextStyle(fontSize: 20)
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: BarChartPage()
            )
          ]
        )
      )
    );
  }
}