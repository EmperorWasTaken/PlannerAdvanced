import 'package:flutter/material.dart';
import 'package:planner_advanced/models/classes/routing/routing_constants.dart';
import 'package:planner_advanced/screens/home/top_bar.dart';

import 'constants.dart';
import 'models/classes/routing/router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planner Advanced',
      theme: ThemeData(),
      onGenerateRoute: router.generateRoute,
      initialRoute: LoginViewRoute,
    );
  }
}

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(size: size, press: () {}),
      body: Body()
    );
  }
}

class Body extends StatelessWidget {
  final List<String> entries = ['A', 'B', 'C', 'D', 'E','A', 'B', 'C', 'D', 'E'];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
       separatorBuilder: (BuildContext context, int index) => const Divider(),
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.black,
            child: Center(child: Text('Entry ${entries[index]}', style: kHeadingextStyle,)),
          );
        });
  }
}
