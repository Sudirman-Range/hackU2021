import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  static List<String> unicode = [
    '\u{1f606}',
    '\u{1f603}',
    '\u{1f610}',
    '\u{1f628}',
    '\u{1f62B}'
  ];
  List<String> week = [
    '3/7',
    '3/8',
    '3/9',
    '3/10',
    '3/11',
    '3/12',
    '3/13',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.7),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [BoxShadow(blurRadius: 3)]),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                height: 40,
                width: 80,
                child: Text(
                  'week',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(color: Colors.green.withOpacity(0.04)),
                padding: EdgeInsets.fromLTRB(15, 40, 22, 10),
                child: AspectRatio(
                  aspectRatio: 1.6,
                  child: LineChart(LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.black38,
                          strokeWidth: 1,
                        );
                      },
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: Colors.black38,
                          strokeWidth: 1,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 22,
                        getTextStyles: (value) => const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 0:
                              return week[0];
                            case 1:
                              return week[1];
                            case 2:
                              return week[2];
                            case 3:
                              return week[3];
                            case 4:
                              return week[4];
                            case 5:
                              return week[5];
                            case 6:
                              return week[6];
                          }
                          return '';
                        },
                        margin: 5,
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) => const TextStyle(
                          fontSize: 18,
                        ),
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 1:
                              return unicode[4];
                            case 2:
                              return unicode[3];
                            case 3:
                              return unicode[2];
                            case 4:
                              return unicode[1];
                            case 5:
                              return unicode[0];
                          }
                          return '';
                        },
                        reservedSize: 10,
                        margin: 5,
                      ),
                    ),
                    borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Colors.white10, width: 1)),
                    minX: 0,
                    maxX: 6,
                    minY: 0,
                    maxY: 6,
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 3),
                          FlSpot(1, 2),
                          FlSpot(2, 5),
                          FlSpot(3, 4),
                          FlSpot(4, 1),
                          FlSpot(5, 2),
                          FlSpot(6, 2),
                        ],
                        isCurved: false,
                        colors: [Colors.blueAccent],
                        barWidth: 5,
                        dotData: FlDotData(
                          show: true,
                        ),
                        belowBarData: BarAreaData(show: true, colors: [
                          Colors.blue.withOpacity(0.4),
                          Colors.blue.withOpacity(0.4)
                        ]),
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
