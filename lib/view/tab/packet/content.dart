import 'package:flutter/material.dart';
import '../../../model/choice.dart';
import '../../../model/record.dart';

class PacketContent extends StatefulWidget {
  @override
  _PacketContentState createState() => new _PacketContentState();
}

class _PacketContentState extends State<PacketContent>
    with SingleTickerProviderStateMixin {
  TabController controller;
  int _currentID = 0;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: choices.length);
  }

 Widget _buildBody(BuildContext context) {
   return _buildList(context, dummySnapshot);
 }
  Widget _buildList(BuildContext context, List<Map> snapshot) {
    return ListView(
        padding: EdgeInsets.only(top: 10),
        children: snapshot.map((data) => _buildListItem(context, data)).toList());
  }

  Widget _buildListItem(BuildContext context, Map data) {
    final record = Record.fromMap(data);

    return Padding(
      key: ValueKey(record.name),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0)),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.votes.toString()),
          onTap: () => print(record),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() {
        _currentID = controller.index;
      });
    });
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
          body: Column(
        children: <Widget>[
          Container(
              child: Container(
            child: TabBar(
              controller: controller,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: choices.map((Choice choice) {
                return Tab(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: choice.id == _currentID
                            ? Color.fromRGBO(0, 227, 129, 1.0)
                            : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: <Widget>[
                        Icon(choice.icon,
                            color: choice.id == _currentID
                                ? Colors.white
                                : Color.fromRGBO(25, 22, 96, 1)),
                        Text(
                          choice.title,
                          style: TextStyle(
                              color: choice.id == _currentID
                                  ? Colors.white
                                  : Color.fromRGBO(25, 22, 96, 1)),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          )),
          Expanded(flex: 1, child: _buildBody(context))
        ],
      )),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
// Tabbar view 
          // Expanded(
          //     flex: 1,
          //     child: Container(
          //       color: Color.fromRGBO(246, 246, 249, 0.1),
          //       child: TabBarView(
          //         controller: controller,
          //         children: choices.map((Choice choice) {
          //           return Padding(
          //             padding: const EdgeInsets.all(16.0),
          //             child: ChoiceCard(choice: choice),
          //           );
          //         }).toList(),
          //       ),
          //     ))
