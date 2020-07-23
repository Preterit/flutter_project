/*
* Date:2020/7/23
* author:lwb
* Desc: 柱状图 部分
*/

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillBarChart extends StatefulWidget {
  @override
  _BillBarChartState createState() => _BillBarChartState();
}

class _BillBarChartState extends State<BillBarChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceBetween,
        maxY: 20,
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.transparent,
            tooltipPadding: const EdgeInsets.all(0),
            tooltipBottomMargin: 20,
            getTooltipItem: (
              BarChartGroupData group,
              int groupIndex,
              BarChartRodData rod,
              int rodIndex,
            ) {
              return BarTooltipItem(
                rod.y.round().toString(),
                TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            textStyle: TextStyle(
                color: const Color(0xff7589a2),
                fontWeight: FontWeight.bold,
                fontSize: 14),
            // 柱状图 距离底部 lab 的距离
            margin: 20,
            getTitles: (double value) {
              switch (value.toInt()) {
                case 0:
                  return 'Mn';
                case 1:
                  return 'Te';
                case 2:
                  return 'Wd';
                case 3:
                  return 'Tu';
                case 4:
                  return 'Fr';
                case 5:
                  return 'St';
                case 6:
                  return 'Sn';
                default:
                  return '';
              }
            },
          ),
          // Y 轴的 数值
          leftTitles: SideTitles(showTitles: false),
        ),
        // 边框
        borderData: FlBorderData(
          show: true,
        ),
        barGroups: [
          BarChartGroupData(
              x: 0,
              barRods: [BarChartRodData(y: 8, color: Colors.lightBlueAccent)],
              showingTooltipIndicators: [0]),
          BarChartGroupData(
              x: 1,
              barRods: [BarChartRodData(y: 10, color: Colors.lightBlueAccent)],
              showingTooltipIndicators: [0]),
          BarChartGroupData(
              x: 2,
              barRods: [BarChartRodData(y: 14, color: Colors.lightBlueAccent)],
              showingTooltipIndicators: [0]),
          BarChartGroupData(
              x: 3,
              barRods: [BarChartRodData(y: 15, color: Colors.lightBlueAccent)],
              showingTooltipIndicators: [0]),
          BarChartGroupData(
              x: 3,
              barRods: [BarChartRodData(y: 13, color: Colors.lightBlueAccent)],
              showingTooltipIndicators: [0]),
          BarChartGroupData(
              x: 3,
              barRods: [BarChartRodData(y: 10, color: Colors.lightBlueAccent)],
              showingTooltipIndicators: [0]),
        ],
      ),
    );
  }
}
