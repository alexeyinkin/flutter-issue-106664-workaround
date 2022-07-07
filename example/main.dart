import 'package:flutter/material.dart';
import 'package:flutter_issue_106664_workaround/flutter_issue_106664_workaround.dart';

void main() {
  FlutterIssue106664Workaround.instance.apply();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:TextField(),
    );
  }
}
