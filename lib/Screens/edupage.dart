import 'package:flutter/material.dart';

class EducationPage extends StatefulWidget {
  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text("Education"),
          leading: RaisedButton.icon(
            onPressed: () => {
              Navigator.pop(context),
            }, 
            icon: Icon(Icons.arrow_back),
            label: Text("Back"),
          ),
        ),
        body: Text("Education"),
      )
    );
  }
}