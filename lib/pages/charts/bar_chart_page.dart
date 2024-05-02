import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/components/charts/bar_chart_widget.dart';

class BarChartPage extends StatelessWidget {
  const BarChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    const List<String> weeks = ['월', '화', '수', '목', '금', '토', '일'];
    List<Map<String, dynamic>> chartRows = [];
    
    for (int i = 0; i < 7; i++) {
      String weekText = weeks[i];
      chartRows.add({
        'week': i,
        'weekText': weekText,
        'walkCount': random.nextInt(15001) // 0부터 15000까지의 난수 생성
      });
    }

    return BarChartWidget(chartData: chartRows,);
  }
}
