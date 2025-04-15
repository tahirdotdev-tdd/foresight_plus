import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class OverallSummaryWidget extends StatelessWidget {
  final int pending = 429;
  final int resolved = 117;

  const OverallSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final total = pending + resolved;
    double pendingPercent = pending / total;
    double resolvedPercent = resolved / total;
    // Adjust the percentages to ensure they are not exactly 0 or 1
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Curved Gauge
        SizedBox(
          height: 100,
          width: 130,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 1,
                startAngle: 180,
                endAngle: 0,
                showLabels: false,
                showTicks: false,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.18,
                  // Slightly thicker curve to accentuate the curve
                  cornerStyle: CornerStyle.bothCurve,
                  color: Colors.grey.shade200,
                  thicknessUnit: GaugeSizeUnit.factor,
                  // Increase this factor to see more curvature
                ),
                ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: 0,
                    endValue: pendingPercent - 0.01,
                    // Slight separation
                    color: Colors.deepOrange,
                    startWidth: 0.18,
                    endWidth: 0.18,
                    sizeUnit: GaugeSizeUnit.factor,
                  ),
                  GaugeRange(
                    startValue: pendingPercent + 0.01,
                    // Slight separation
                    endValue: pendingPercent + resolvedPercent,
                    color: Colors.lightBlue,
                    startWidth: 0.18,
                    endWidth: 0.18,
                    sizeUnit: GaugeSizeUnit.factor,
                  ),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    positionFactor: 0,
                    angle: 90,
                    widget: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$total',
                          style: GoogleFonts.inter(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 75),
        // Flat Bars with Text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Pending Bar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 10,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(
                            4,
                          ), // Increased curve
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: pendingPercent,
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(
                              4,
                            ), // Increased curve
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Pending - $pending",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              // Resolved Bar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 10,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(
                            4,
                          ), // Increased curve
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: resolvedPercent,
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(
                              4,
                            ), // Increased curve
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Resolved - $resolved",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
