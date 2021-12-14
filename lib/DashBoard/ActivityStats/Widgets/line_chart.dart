import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:shifftie/Theme/colors.dart';

import 'line_chart_titles.dart';

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    btnGradLeft,
    btnGradRight,
  ];

  LineChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6,
          titlesData: LineTitles.getTitleData(),
          gridData: FlGridData(
            show: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 0,
              );
            },
            drawVerticalLine: false,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 0,
              );
            },
          ),
          borderData: FlBorderData(
            show: false,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 3),
                const FlSpot(2.6, 2),
                const FlSpot(4.9, 5),
                const FlSpot(6.8, 2.5),
                const FlSpot(8, 4),
                const FlSpot(9.5, 3),
                const FlSpot(11, 4),
              ],
              isCurved: true,
              colors: gradientColors,
              barWidth: 5,
              // dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
          ],
        ),
      );
}
