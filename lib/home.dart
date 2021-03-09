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
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.list,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.featured_play_list,
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
