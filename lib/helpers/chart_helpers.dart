import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:opinions_chart/models/price_data.dart';

class ChartHelper {
  static Widget buildChart(BuildContext context, List<PriceData> priceHistory) {
    if (priceHistory.isEmpty) {
      return const Center(child: Text('No data available'));
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 18, 18, 18),
      child: SfCartesianChart(
        plotAreaBackgroundColor: Colors.white,
        primaryXAxis: NumericAxis(
          title: AxisTitle(
              text: 'Time(sec)',
              textStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          interval: 10,
          minimum: 0,
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(
              text: 'Price (₹)',
              textStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        ),
        series: <ChartSeries>[
          SplineSeries<PriceData, double>(
            dataSource: priceHistory,
            xValueMapper: (PriceData time, _) =>
            priceHistory.indexOf(time).toDouble() * 10,
            yValueMapper: (PriceData price, _) =>
                price.price.round().toDouble(),
            color: Colors.green,
            width: 3,
            opacity: 0.7,
            markerSettings: const MarkerSettings(
              isVisible: true,
              shape: DataMarkerType.circle,
              color: Colors.green,
              borderWidth: 2,
              borderColor: Colors.green,
            ),
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            enableTooltip: true,
          ),
          SplineAreaSeries<PriceData, double>(
            dataSource: priceHistory,
            xValueMapper: (PriceData time, _) =>
            priceHistory.indexOf(time).toDouble() * 10,
            yValueMapper: (PriceData price, _) =>
                price.price.round().toDouble(),
            color: Colors.green.withOpacity(0.3),
          ),
        ],
        tooltipBehavior: TooltipBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
        ),
        zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true,
          zoomMode: ZoomMode.xy,
          enablePanning: true,
        ),
      ),
    );
  }
}
