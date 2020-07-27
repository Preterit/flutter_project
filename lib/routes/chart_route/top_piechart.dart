/*
* Date:2020/7/25
* author:lwb
* Desc: 图表页面上面的饼状图
*/
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'model.dart';

class TopPieChart extends StatefulWidget {
  final int currentMonth;

  @override
  _TopPieChartState createState() => _TopPieChartState();

  TopPieChart(this.currentMonth);
}

class _TopPieChartState extends State<TopPieChart> {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: getDefaultDoughnutChart(),
          ),
        ],
      ),
    );
  }

  SfCircularChart getDefaultDoughnutChart() {
    return SfCircularChart(
      title: ChartTitle(text: ''),
      series: getDefaultDoughnutSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns the list of doughnut series which need to be render.
  List<DoughnutSeries<ChartSampleData, String>> getDefaultDoughnutSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: '餐饮', y: 55, text: '55%'),
      ChartSampleData(x: '交通', y: 31, text: '31%'),
      ChartSampleData(x: '骑车', y: 47, text: '47%'),
      ChartSampleData(x: '娱乐', y: 50, text: '50%'),
      ChartSampleData(x: '文教', y: 29, text: '29%'),
      ChartSampleData(x: '通讯', y: 37, text: '37%'),
    ];

    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
        radius: '80%',
        dataSource: chartData,
        xValueMapper: (ChartSampleData data, _) => data.x,
        yValueMapper: (ChartSampleData data, _) => data.y,
        dataLabelMapper: (ChartSampleData data, _) => data.text,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          showZeroValue:  true,
          labelPosition: ChartDataLabelPosition.outside,
          connectorLineSettings:
              ConnectorLineSettings(type: ConnectorType.curve),
        ),
      )
    ];
  }
}
