import 'package:flutter/material.dart';

class MyTabbedPage extends StatefulWidget {
  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  TabController controller;



  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);    
  }

  @override
  Widget build(BuildContext context) {
       
controller.addListener(() {
      print("asadasd");
    });
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Tabs app'),
          backgroundColor: Colors.teal,
        ),
        bottomNavigationBar: new Material(
            color: Colors.teal,
            child: new TabBar(
              controller: controller,
              tabs: <Widget>[
                new Tab(icon: new Icon(Icons.access_alarm)),
                new Tab(icon: new Icon(Icons.account_balance)),
              ],
            )),
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            Container(
              child: Text("asdasd"),
            ),
            Container(
              child: Text("asdasd"),
            )
          ],
        ));
  }
}
