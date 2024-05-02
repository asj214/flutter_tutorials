import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartWidget extends StatefulWidget {
  final List<Map<String, dynamic>> chartData;

  const BarChartWidget({
    super.key,
    required this.chartData
  });

  @override
  State<BarChartWidget> createState() => _BarChartWidget();
}

class _BarChartWidget extends State<BarChartWidget> {
  final Duration timer = const Duration(seconds: 3);
  final Color barColor = Colors.white;
  final Color touchBarColor = Colors.white70;
  final Color backGroundColor = Colors.white;
  static const Color titleTextColor = Colors.black87;
  static const Color borderColor = Colors.white;

  int touchedIndex = -1;

  late List<Map<String, dynamic>> _chartData;

  @override
  void initState() {
    super.initState();
    _chartData = widget.chartData;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: BarChart(
                barChartData(),
                swapAnimationDuration: timer,
              )
            )
          )
        ]
      )
    );
  }

  BarChartData barChartData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          String walkCount = _chartData[group.x.toInt()]['walkCount'].toInt().toString();
          return BarTooltipItem(
            walkCount, // 툴팁 내용 변경
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          );
        },
      ),
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: titleTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    String weekText = _chartData[value.toInt()]['weekText'].toString();

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(weekText, style: style),
    );
  }

  List<BarChartGroupData> showingGroups() {
    List<BarChartGroupData> groups = [];
    for (int i = 0; i < _chartData.length; i++) {
      double walkCount = _chartData[i]['walkCount'].toDouble();
      groups.add(makeGroupData(i, walkCount, isTouched: i == touchedIndex));
    }
    return groups;
  }

  BarChartGroupData makeGroupData(
    int x,
    double y,
    {
      bool isTouched = false,
      Color? barColor,
      double width = 22,
      List<int> showTooltips = const [],
    }
  ) {

    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? touchBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: touchBarColor)
              : const BorderSide(color: borderColor, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: backGroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}