import 'package:flutter/material.dart';
import 'daylist.dart';
import 'graph.dart';
import 'notificationlist.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class PageInfo {
  Widget widget;
  PageInfo(this.widget);
}

class _HomeState extends State<Home> {
  final List<PageInfo> _pages = [
    PageInfo(Graph()),
    PageInfo(DayList()),
    PageInfo(NotificationList()),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.0),
          elevation: 0,
          bottom: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 4,
                )
              ],
              color: Colors.blueAccent.withOpacity(0.8),
            ),
            indicatorWeight: 3,
            labelColor: Colors.blueGrey,
            unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.list,
                  size: 30,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.featured_play_list,
                  size: 30,
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: _pages.map((PageInfo page) => page.widget).toList(),
        ),
      ),
    );
  }
}
