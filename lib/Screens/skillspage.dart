import 'package:flutter/material.dart';

class SkillsPage extends StatefulWidget {
  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text("Skills"),
          leading: RaisedButton.icon(
            onPressed: () => {
              Navigator.pop(context),
            }, 
            icon: Icon(Icons.arrow_back),
            label: Text("Back"),
          ),
        ),
        body: Text("Skills"),
      )
    );
  }
}