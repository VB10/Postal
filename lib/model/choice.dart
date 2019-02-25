import 'package:flutter/material.dart';
class Choice {
 const Choice({this.id, this.title, this.icon});
  final int id;
  final String title;
  final IconData icon;
}
const List<Choice> choices = const <Choice>[
  const Choice(id: 0, title: 'CAR', icon: Icons.directions_car),
  const Choice(id: 1, title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(id: 2, title: 'BOAT', icon: Icons.directions_boat),
  const Choice(id: 3, title: 'BUS', icon: Icons.directions_bus),
  const Choice(id: 4, title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(id: 5, title: 'WALK', icon: Icons.directions_walk),
];
final dummySnapshot = [
 {"name": "Filip", "votes": 15},
 {"name": "Abraham", "votes": 14},
 {"name": "Richard", "votes": 11},
 {"name": "Ike", "votes": 10},
 {"name": "Justin", "votes": 1},
];
