/*
* Date:2020/7/23
* author:lwb
* Desc: 柱状图 部分
*/

import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillBarChart extends StatefulWidget {
  final int currentMonth;

  BillBarChart(this.currentMonth);

  @override
  _BillBarChartState createState() => _BillBarChartState();
}

class _BillBarChartState extends State<BillBarChart> {

  @override
  void initState() {
    DateTime time = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BarChart(lineBarData()),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BarChart(mainBarData()),
          ),
        ],
      ),
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      alignment: BarChartAlignment.spaceAround,
      barTouchData: BarTouchData(
        /// 点击之后显示在 该点的 Mark
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.green,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay = "测试";
              return BarTooltipItem(weekDay + (rod.y - 1).toString(),
                  TextStyle(color: Colors.yellow));
            }),

        /// 点击 图标数据的回调
        touchCallback: (barTouchResponse) {},
      ),

      /// X / Y 轴的属性 配置.
      titlesData: FlTitlesData(
        show: true,

        /// X轴属性
        bottomTitles: _getBottomSide(),

        /// 左侧 Y轴属性
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),

      /// 柱状图边框
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: _showingGroups(),
    );
  }

  /*
   * 柱状图数据
   */
  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.red,
    double width = 5,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          width: width,
          color: barColor,
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  /*
   *  底部 X 轴显示的 label
   */
  SideTitles _getBottomSide() {
    return SideTitles(
      showTitles: true,
      textStyle: TextStyle(
          color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 9),
      margin: 8,
      getTitles: (double value) {
        String result = "";
        switch (value.toInt()) {
          case 0:
          case 15:
          case 30:
            result = "${widget.currentMonth} - ${value.toInt() + 1}";
            break;
          default:
            result = "";
            break;
        }
        return result;
      },
    );
  }

  /*
   * 获取 该月的 天数
   */
  List<BarChartGroupData> _showingGroups() => List.generate(31, (i) {
        return makeGroupData(i, Random().nextInt(50).toDouble());
      });

  /*
   * 柱状图后面的线
   */
  BarChartData lineBarData() {
    return BarChartData(
      alignment: BarChartAlignment.spaceAround,
      barTouchData: BarTouchData(
        enabled: false,
      ),

      /// X / Y 轴的属性 配置.
      titlesData: FlTitlesData(
        show: true,

        /// X轴属性
        bottomTitles: _getBottomSide(),

        /// 左侧 Y轴属性
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),

      /// 柱状图边框
      borderData: FlBorderData(
        show: false,
      ),

      barGroups: _showingLines(),
    );
  }

  /*
   * 获取 柱状图 背景的 线
   */
  List<BarChartGroupData> _showingLines() => List.generate(31, (i) {
        return BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              y: 100,
              width: 1,
              color: Color.fromARGB(255, 230, 230, 230),
            ),
          ],
          showingTooltipIndicators: [],
        );
      });
}
