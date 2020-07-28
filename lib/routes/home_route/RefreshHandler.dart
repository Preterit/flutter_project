/*
* Date:2020/7/20
* author:lwb
* Desc:
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/aa_syncfusion_charts_lib/charts.dart';

class RefreshHandler extends StatefulWidget {
  @override
  _RefreshHandlerState createState() => _RefreshHandlerState();
}

class _RefreshHandlerState extends State<RefreshHandler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: getCircularSelectionChart(),
      ),
    );
  }

  SfCircularChart getCircularSelectionChart() {
    return SfCircularChart(
      title: ChartTitle(text: "pie"),
      selectionGesture: ActivationMode.singleTap,
      enableMultiSelection: false,
      series: getCircularSelectionSeries(),
    );
  }

  List<PieSeries<ChartSampleData, String>> getCircularSelectionSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'CHN', y: 17, yValue2: 54, yValue3: 9, text: 'CHN : 54M'),
      ChartSampleData(
          x: 'USA', y: 19, yValue2: 67, yValue3: 14, text: 'USA : 67M'),
      ChartSampleData(
          x: 'IDN', y: 29, yValue2: 65, yValue3: 6, text: 'IDN : 65M'),
      ChartSampleData(
          x: 'JAP', y: 13, yValue2: 61, yValue3: 26, text: 'JAP : 61M'),
      ChartSampleData(
          x: 'BRZ', y: 24, yValue2: 68, yValue3: 8, text: 'BRZ : 68M')
    ];
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
        dataSource: chartData,
        radius: '70%',
        startAngle: 30,
        endAngle: 30,
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.yValue2,
        dataLabelMapper: (ChartSampleData sales, _) => sales.text,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          labelPosition: ChartDataLabelPosition.outside,
          connectorLineSettings:
              ConnectorLineSettings(type: ConnectorType.curve),
        ),

        /// To enable the selection settings and its functionalities.
        selectionSettings:
            SelectionSettings(enable: true, unselectedOpacity: 0.5),
      )
    ];
  }
}

class ChartSampleData {
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.yValue2,
      this.yValue3,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close});

  final dynamic x;
  final num y;
  final dynamic xValue;
  final num yValue;
  final num yValue2;
  final num yValue3;
  final Color pointColor;
  final num size;
  final String text;
  final num open;
  final num close;
}
