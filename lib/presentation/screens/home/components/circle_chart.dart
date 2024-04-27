
import 'package:apex_cpd/core/constant/colors.dart';
import 'package:apex_cpd/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/constant/size_config.dart';
import '../../../../domain/entities/charts/charts.dart';
 class CircleChart extends StatelessWidget {
  const CircleChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 20,top: 0),child:
    Container(
        //padding: EdgeInsets.only(left: 10,right: 10),
        child: SfCircularChart(
            legend: Legend(
                isVisible: true,
                width: "130",
                legendItemBuilder:
                    (String name, dynamic series, dynamic point, int index) {
                  return Container(
                   // width: getProportionateScreenWidth(150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      //   Icon(Icons.access_time_rounded,color: Colors.grey[500],),
                      // Text("CPD logged 2023/24",style: AppTheme.lightTheme.textTheme.headlineSmall!.copyWith(color:Colors.grey[500]),),
         
                      ],
                    ),
                  );
                }),
            series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                  dataSource: chartData,
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.mobile,
                  yValueMapper: (ChartData data, _) => data.sale,
                  innerRadius: '55%'),
            ],
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                widget: Container(
                    child:  Text(
                  '30/60',
              
                )),
              )
            ])));
  }

 }

