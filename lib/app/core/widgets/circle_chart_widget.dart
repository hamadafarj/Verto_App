import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircleChart extends StatefulWidget {
  const CircleChart({super.key});

  @override
  State<CircleChart> createState() => _CircleChartState();
}

class _CircleChartState extends State<CircleChart> {
  late List<GDGata> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCircularChart(
        series: <CircularSeries>[
          DoughnutSeries<GDGata, String>(
            dataSource: _chartData,
            xValueMapper: (GDGata data, _) => data.continent,
            yValueMapper: (GDGata data, _) => data.gdp,
            
          ),
        ],
      ),
    );
  }

  List<GDGata> getChartData() {
    final List<GDGata> chartData = [
      GDGata("continent", 1600),
      GDGata("continent", 2490),
      GDGata("continent", 2900),
      GDGata("continent", 23050),
      GDGata("continent", 24880),
      GDGata("continent", 34390),
    ];
    return chartData;
  }
}

class GDGata {
  final String continent;
  final int gdp;

  GDGata(this.continent, this.gdp);
}