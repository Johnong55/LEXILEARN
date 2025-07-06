import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget customLibraryContainer({
  required String title,
  required int completed,
  required int total,
  required Color color,
}) {
  double percent = completed / total;

  return Container(
    width: 160,
 
    decoration: BoxDecoration(
      color: color.withOpacity(0.15),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          radius: 46,
          lineWidth: 8,
          percent: percent,
          center: Text(
            "$completed/$total",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          progressColor: color,
          backgroundColor: Colors.white10,
          circularStrokeCap: CircularStrokeCap.round,
        ),
        SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17
          ),
        ),
        SizedBox(height: 4),
        Text(
          "$total Classes • Easy",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
