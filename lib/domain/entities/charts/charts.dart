import 'dart:ui';

import '../../../core/constant/colors.dart';


class ChartData {
  ChartData({this.mobile, this.sale, this.color});

  final String ?mobile;
  final double ?sale;
  final Color? color;
}

class ChartDataInfo {
  ChartDataInfo(this.year, this.value, [this.color]);

  final String year;
  final double value;
  final Color? color;
}

final List<ChartData> chartData = [
  ChartData(mobile:'Certificate A  ',sale: 80.5, color:ResColors.primary),
  ChartData(mobile:' Certificate A',sale: 38, color:ResColors.secondary),
  ChartData(mobile:' Certificate A', sale:34, color:ResColors.darkerGrey),

];