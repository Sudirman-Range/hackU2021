import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'main.dart';

class Graph extends StatefulWidget {
  final dynamic todaystate;
  Graph(this.todaystate);
  @override
  _GraphState createState() => _GraphState(todaystate);
}

class _GraphState extends State<Graph> {
  dynamic todaystate;
  _GraphState(this.todaystate);
  double todaygraph;
  List<double> graphnumbers = [5.0, 4.0, 3.0, 2.0, 1.0];
  double graphnumber;
  List<String> unicode = [
    '\u{1f606}',
    '\u{1f603}',
    '\u{1f610}',
    '\u{1f628}',
    '\u{1f62B}'
  ];
  List<String> days = [
    '3/13',
    '3/12',
    '3/11',
    '3/10',
    '3/9',
    '3/8',
    '3/7',
    '3/6',
    '3/5',
    '3/4',
    '3/3',
  ];
  // List<Map<int, String>> listdays = [
  //   {3: '3 /12'},
  // {1: '3 /11'},
  // {1: '3 /10'},
  // {0: '3 /9'},
  // {3: '3 /8'},
  // {2: '3 /7'},
  // {5: '3 /6'},
  // {4: '3 /5'},
  // {1: '3 /4'},
  // {0: '3 /3'},
  // ];
  List<String> dayslist = [
    '3 /12',
    '3 /11',
    '3 /10',
    '3 /9',
    '3 /8',
    '3 /7',
    '3 /6',
    '3 /5',
    '3 /4',
    '3 /3',
  ];
  List<int> dayskey = [
    3,
    1,
    1,
    0,
    3,
    2,
    4,
    4,
    1,
    0,
  ];
  List<Widget> helthLists() {
    List<Widget> healthlists = List<Widget>();
    if (todaystate == null) {
      healthlists = [];
    } else {
      healthlists.add(healthList(unicode[todaystate], '3 /13'));
    }
    for (int i = 0; i < 10; i++) {
      healthlists.add(healthList(unicode[dayskey[i]], dayslist[i]));
    }
    // healthlists = listdays.map((day) {
    //   healthList(unicode[int.parse(day.keys.toString())], day.values.toString());
    // }).toList();
    return healthlists;
  }

  Widget healthList(String unicode, String day) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 11,
        horizontal: 32,
      ),
      height: 78,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
            ),
          ]),
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Container(
            height: 85,
            width: 85,
            child: Center(
              child: Text(
                unicode,
                style: TextStyle(
                  fontSize: 55,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Center(
              child: Text(
                day,
                style: TextStyle(color: Colors.black54, fontSize: 40),
              ),
            ),
          ),
          SizedBox(
            width: 30,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (todaystate != null) {
      graphnumber = graphnumbers[todaystate];
    }
    todaygraph = todaystate == null ? 0 : graphnumber;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.white.withOpacity(0.2),
          expandedHeight: 430,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [BoxShadow(blurRadius: 3.5)]),
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
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.04)),
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
                                      return days[6];
                                    case 1:
                                      return days[5];
                                    case 2:
                                      return days[4];
                                    case 3:
                                      return days[3];
                                    case 4:
                                      return days[2];
                                    case 5:
                                      return days[1];
                                    case 6:
                                      return days[0];
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
                                border: Border.all(
                                    color: Colors.white10, width: 1)),
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
                                  FlSpot(4, 4),
                                  FlSpot(5, 2),
                                  FlSpot(6, todaygraph),
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
                Container(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Diagnosis()),
                      );
                    },
                    child: Text(
                      '今日の機嫌',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                          fontSize: 19),
                    ),
                    color: Colors.blueAccent,
                    textColor: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            helthLists(),
            // [
            //   Container(
            //     margin: EdgeInsets.symmetric(
            //       vertical: 11,
            //       horizontal: 32,
            //     ),
            //     height: 78,
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(30),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black26,
            //             blurRadius: 8,
            //           ),
            //         ]),
            //     child: Row(
            //       children: [
            //         SizedBox(
            //           width: 30,
            //         ),
            //         Container(
            //           height: 85,
            //           width: 85,
            //           child: Center(
            //             child: Text(
            //               unicode[1],
            //               style: TextStyle(
            //                 fontSize: 55,
            //               ),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Expanded(
            //           child: Center(
            //             child: Text(
            //               '3 /13',
            //               style: TextStyle(color: Colors.black54, fontSize: 40),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 30,
            //         )
            //       ],
            //     ),
            //   ),
            //   Container(
            //     margin: EdgeInsets.symmetric(
            //       vertical: 11,
            //       horizontal: 32,
            //     ),
            //     height: 78,
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(30),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black26,
            //             blurRadius: 8,
            //           ),
            //         ]),
            //     child: Row(
            //       children: [
            //         SizedBox(
            //           width: 30,
            //         ),
            //         Container(
            //           height: 85,
            //           width: 85,
            //           child: Center(
            //             child: Text(
            //               '$unicode',
            //               style: TextStyle(
            //                 color: Colors.white38,
            //                 fontSize: 55,
            //               ),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Expanded(
            //           child: Center(
            //             child: Text(
            //               'a',
            //               style: TextStyle(color: Colors.black45, fontSize: 40),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 30,
            //         )
            //       ],
            //     ),
            //   ),
            //   Container(
            //     margin: EdgeInsets.symmetric(
            //       vertical: 11,
            //       horizontal: 32,
            //     ),
            //     height: 78,
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(30),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black26,
            //             blurRadius: 8,
            //           ),
            //         ]),
            //     child: Row(
            //       children: [
            //         SizedBox(
            //           width: 30,
            //         ),
            //         Container(
            //           height: 85,
            //           width: 85,
            //           child: Center(
            //             child: Text(
            //               '$unicode',
            //               style: TextStyle(
            //                 color: Colors.white38,
            //                 fontSize: 55,
            //               ),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Expanded(
            //           child: Center(
            //             child: Text(
            //               'a',
            //               style: TextStyle(color: Colors.black45, fontSize: 40),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 30,
            //         )
            //       ],
            //     ),
            //   ),
            //   Container(
            //     margin: EdgeInsets.symmetric(
            //       vertical: 11,
            //       horizontal: 32,
            //     ),
            //     height: 78,
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(30),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black26,
            //             blurRadius: 8,
            //           ),
            //         ]),
            //     child: Row(
            //       children: [
            //         SizedBox(
            //           width: 30,
            //         ),
            //         Container(
            //           height: 85,
            //           width: 85,
            //           child: Center(
            //             child: Text(
            //               '$unicode',
            //               style: TextStyle(
            //                 color: Colors.white38,
            //                 fontSize: 55,
            //               ),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Expanded(
            //           child: Center(
            //             child: Text(
            //               'a',
            //               style: TextStyle(color: Colors.black45, fontSize: 40),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 30,
            //         )
            //       ],
            //     ),
            //   ),
            //   Container(
            //     margin: EdgeInsets.symmetric(
            //       vertical: 11,
            //       horizontal: 32,
            //     ),
            //     height: 78,
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(30),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black26,
            //             blurRadius: 8,
            //           ),
            //         ]),
            //     child: Row(
            //       children: [
            //         SizedBox(
            //           width: 30,
            //         ),
            //         Container(
            //           height: 85,
            //           width: 85,
            //           child: Center(
            //             child: Text(
            //               '$unicode',
            //               style: TextStyle(
            //                 color: Colors.white38,
            //                 fontSize: 55,
            //               ),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Expanded(
            //           child: Center(
            //             child: Text(
            //               'a',
            //               style: TextStyle(color: Colors.black45, fontSize: 40),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 30,
            //         )
            //       ],
            //     ),
            //   ),
            //   Container(
            //     margin: EdgeInsets.symmetric(
            //       vertical: 11,
            //       horizontal: 32,
            //     ),
            //     height: 78,
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(30),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black26,
            //             blurRadius: 8,
            //           ),
            //         ]),
            //     child: Row(
            //       children: [
            //         SizedBox(
            //           width: 30,
            //         ),
            //         Container(
            //           height: 85,
            //           width: 85,
            //           child: Center(
            //             child: Text(
            //               '$unicode',
            //               style: TextStyle(
            //                 color: Colors.white38,
            //                 fontSize: 55,
            //               ),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Expanded(
            //           child: Center(
            //             child: Text(
            //               'a',
            //               style: TextStyle(color: Colors.black45, fontSize: 40),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 30,
            //         )
            //       ],
            //     ),
            //   ),
            //   Container(
            //     margin: EdgeInsets.symmetric(
            //       vertical: 11,
            //       horizontal: 32,
            //     ),
            //     height: 78,
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(30),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black26,
            //             blurRadius: 8,
            //           ),
            //         ]),
            //     child: Row(
            //       children: [
            //         SizedBox(
            //           width: 30,
            //         ),
            //         Container(
            //           height: 85,
            //           width: 85,
            //           child: Center(
            //             child: Text(
            //               '$unicode',
            //               style: TextStyle(
            //                 color: Colors.white38,
            //                 fontSize: 55,
            //               ),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Expanded(
            //           child: Center(
            //             child: Text(
            //               'a',
            //               style: TextStyle(color: Colors.black45, fontSize: 40),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 30,
            //         )
            //       ],
            //     ),
            //   ),
            //   Container(
            //     margin: EdgeInsets.symmetric(
            //       vertical: 11,
            //       horizontal: 32,
            //     ),
            //     height: 78,
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(30),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black26,
            //             blurRadius: 8,
            //           ),
            //         ]),
            //     child: Row(
            //       children: [
            //         SizedBox(
            //           width: 30,
            //         ),
            //         Container(
            //           height: 85,
            //           width: 85,
            //           child: Center(
            //             child: Text(
            //               '$unicode',
            //               style: TextStyle(
            //                 color: Colors.white38,
            //                 fontSize: 55,
            //               ),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Expanded(
            //           child: Center(
            //             child: Text(
            //               'a',
            //               style: TextStyle(color: Colors.black45, fontSize: 40),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 30,
            //         )
            //       ],
            //     ),
            //   ),
            //   Container(
            //     margin: EdgeInsets.symmetric(
            //       vertical: 11,
            //       horizontal: 32,
            //     ),
            //     height: 78,
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(30),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black26,
            //             blurRadius: 8,
            //           ),
            //         ]),
            //     child: Row(
            //       children: [
            //         SizedBox(
            //           width: 30,
            //         ),
            //         Container(
            //           height: 85,
            //           width: 85,
            //           child: Center(
            //             child: Text(
            //               '$unicode',
            //               style: TextStyle(
            //                 color: Colors.white38,
            //                 fontSize: 55,
            //               ),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Expanded(
            //           child: Center(
            //             child: Text(
            //               'a',
            //               style: TextStyle(color: Colors.black45, fontSize: 40),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 30,
            //         )
            //       ],
            //     ),
            //   ),
            // ],
          ),
        )
      ],
    );
  }
}
