import 'package:flutter/material.dart';

class ContactMe extends StatefulWidget {
  @override
  _ContactMeState createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text("Contact Me"),
          leading: RaisedButton.icon(
            onPressed: () => {
              Navigator.pop(context),
            }, 
            icon: Icon(Icons.arrow_back),
            label: Text("Back"),
          ),
        ),
        body: Text("Contact Me"),
      )
    );
  }
}