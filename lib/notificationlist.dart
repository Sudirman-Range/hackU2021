import 'package:flutter/material.dart';

class NotificationList extends StatefulWidget {
  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  List<String> notificationlist = [
    '近所の公園まで散歩',
    '筋トレする',
    '外食に行く',
    '本屋に行く',
    '買いたかった技術書を買う',
    'エ◯ァン◯リ◯ンの映画を見に行く',
  ];
  void deletelist(String text) {
    for (int i = 0; i < notificationlist.length; i++) {
      String delete = notificationlist[i];
      if (delete == text) {
        notificationlist.remove(delete);
      }
    }
  }

  Widget notificationList(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.16),
              blurRadius: 10,
            )
          ]),
      height: 60,
      child: Row(children: [
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Container(
          // color: Colors.green,
          alignment: Alignment.center,
          child: IconButton(
            icon: Icon(Icons.indeterminate_check_box_outlined),
            onPressed: () {
              setState(() {
                deletelist(text);
              });
            },
          ),
        ),
        SizedBox(
          width: 10,
        )
      ]),
    );
  }

  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          child: ListView.builder(
              itemCount: notificationlist.length,
              itemBuilder: (context, index) {
                return notificationList(notificationlist[index]);
              }),
        )),
        Container(
          height: 75,
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                      )
                    ]),
                width: 300,
                padding: EdgeInsets.fromLTRB(2, 0, 2, 5),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  controller: controller,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  icon: Icon(Icons.add_box_outlined),
                  onPressed: () {
                    setState(() {
                      notificationlist.add(controller.text);
                      controller.text = '';
                    });
                  }),
            ],
          ),
          // child: Row([]),
        )
      ],
    );
  }
}
