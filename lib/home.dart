import 'package:flutter/material.dart';
import 'daylist.dart';
import 'graph.dart';
import 'notificationlist.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

class Home extends StatelessWidget {
  dynamic todaystate;
  Home(this.todaystate);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
            labelColor: Colors.black54,
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
                  Icons.notifications_active,
                  size: 30,
                ),
              )
            ],
          ),
        ),
        body: TabBarView(children: [Graph(todaystate), NotificationList()]),
      ),
    );
  }
}
