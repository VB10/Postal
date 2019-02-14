import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Tabs Demo'),
            ),
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.rss_feed),
                ),
                Tab(
                  icon: Icon(
                    Icons.perm_identity,
                    size: 30,
                  ),
                ),
              ],
              labelColor: Colors.yellow,
              unselectedLabelColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.red,
            ),
            body: TabBarView(
              children: [
                Icon(Icons.directions_car),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
