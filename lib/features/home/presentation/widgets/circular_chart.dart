import 'package:cross_fit/core/shared/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utils/chart_items.dart';

class CircularChart extends StatelessWidget {
  final DietModel data;
  const CircularChart({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final totalResult =
        data.calories + data.proteins + data.cholesterol + data.sodium;
    final List<ChartData> chartData = [
      ChartData(
          'Calories',
          ((data.calories / totalResult) * 100).truncateToDouble(),
          HexColor('#AF17A5')),
      ChartData(
          'Cholesterol',
          ((data.cholesterol / totalResult) * 100).truncateToDouble(),
          HexColor('#2F2E41')),
      ChartData(
          'Proteins',
          ((data.proteins / totalResult) * 100).truncateToDouble(),
          HexColor('#038B9D')),
      ChartData(
          'Sodium',
          ((data.sodium / totalResult) * 100).truncateToDouble(),
          HexColor('#8146d4')),
    ];
    return SizedBox(
      height: 200.h,
      child: SfCircularChart(
          tooltipBehavior: TooltipBehavior(
            enable: true,
            format: 'point.x : point.y%',
            color: Colors.white,
            opacity: 0.8,
            header: '',
            textStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          series: <CircularSeries>[
            PieSeries<ChartData, String>(
              strokeWidth: 2,
              strokeColor: Colors.white,
              explode: true,
              explodeGesture: ActivationMode.singleTap,
              explodeOffset: '10%',
              dataSource: chartData,
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              dataLabelMapper: (ChartData data, _) =>
                  data.y > 20 ? '${data.y}%' : ' ',
              radius: '100%',
              dataLabelSettings: const DataLabelSettings(
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                isVisible: true,
                labelIntersectAction: LabelIntersectAction.none,
              ),
            )
          ]),
    );
  }
}
