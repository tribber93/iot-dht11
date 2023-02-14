import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Meter extends StatelessWidget {
  String judul;
  String satuan;
  int value;

  Meter({
    this.judul = '',
    this.satuan = '',
    this.value = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: SfRadialGauge(
          title: GaugeTitle(
            text: judul,
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.black87,
            ),
            alignment: GaugeAlignment.center,
          ),
          axes: <RadialAxis>[
            RadialAxis(
                canScaleToFit: true,
                interval: 10,
                startAngle: 135,
                endAngle: 45,
                showTicks: false,
                showLabels: false,
                axisLineStyle: const AxisLineStyle(thickness: 20),
                pointers: <GaugePointer>[
                  RangePointer(
                      value: value.toDouble(),
                      width: 20,
                      color: value <= 25
                          ? const Color(0xFF00BFFF)
                          : value > 25 && value <= 30
                              ? const Color(0xFFFFCD60)
                              : const Color(0xFFF64200),
                      enableAnimation: true,
                      cornerStyle: CornerStyle.endCurve)
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                      child: SizedBox(
                        child: Text(
                            (value <= 25
                                    ? "🥶\n"
                                    : value > 25 && value <= 30
                                        ? "😎\n"
                                        : "🥵\n") +
                                value.toString() +
                                satuan,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                      ),
                    ),
                    angle: 270,
                    positionFactor: 0,
                  )
                ])
          ]),
    );
  }
}
