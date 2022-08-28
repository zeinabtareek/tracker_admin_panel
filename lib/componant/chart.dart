import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:fl_chart/fl_chart.dart';

import '../utilities/constant.dart';



Widget getBody() {
     return  SafeArea(
        child: Directionality(

          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: K.mainColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30)),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        child: LineChart(activityData()),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "المؤشر العام للفتره الحاليه",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal,fontFamily: 'Arabic'),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      " Revenue Progress",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:  K.blackColor),
                    ),
                    Container(
                      width: 95,
                      height: 35,
                      decoration: BoxDecoration(
                          gradient:   LinearGradient(colors: [ K.mainColor, K.cardColor,]),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Weekly",
                            style: TextStyle(fontSize: 13, color: K.whiteColor,),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: K.whiteColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),

              ],
            ),
      ),
      ),

    );
  }


List<Color> gradientColors = [
  K.mainColor,
  K.cardColor
];
LineChartData activityData() {
  return LineChartData(
    gridData: FlGridData(
      show: false,
      drawVerticalLine: true,
    ),
    titlesData: FlTitlesData(
      show: false,

    ),
    borderData: FlBorderData(
      show: false,
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots:
        [
          FlSpot(0, 3),
          FlSpot(2.6, 2),
          FlSpot(4.9, 5),
          FlSpot(6.8, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          FlSpot(11, 4),
        ],
        isCurved: false,
        color: K.mainColor,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          color:K.mainColor,
        ),
      ),
    ],
  );
}
