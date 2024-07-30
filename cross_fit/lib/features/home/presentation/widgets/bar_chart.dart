import 'package:cross_fit/core/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../utils/chart_items.dart';
import '../../../../core/shared/diet_model.dart';

class BarChart extends StatelessWidget {
  final DietModel nutritionalModel;
  const BarChart({Key? key, required this.nutritionalModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<BarData> data = [
      BarData('Total calories', nutritionalModel.calories, AppColors.kGreen),
      BarData('Weight loss', nutritionalModel.weightLoss, AppColors.kPurple),
    ];
    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        margin: EdgeInsets.only(right: 10.w, top: 5.h),
        primaryXAxis: CategoryAxis(
          majorTickLines: const MajorTickLines(size: 0),
          majorGridLines: const MajorGridLines(width: 0),
          labelStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 2600,
          interval: 200,
          labelStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          format: 'point.y',
          color: Colors.white,
          opacity: 0.8,
          header: '',
          textStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        series: <ChartSeries<BarData, String>>[
          ColumnSeries<BarData, String>(
            dataSource: data,
            borderColor: Colors.white,
            width: 0.5,
            borderWidth: 2,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            pointColorMapper: (BarData data, _) => data.color,
            xValueMapper: (BarData data, _) => data.x,
            yValueMapper: (BarData data, _) => data.y,
          )
        ]);
  }
}
