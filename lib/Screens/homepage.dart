import 'package:flutter/material.dart';

GlobalKey<ScaffoldState> homeKey = GlobalKey();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Scaffold(
        key: homeKey,
        appBar: AppBar(
          title: Text("Home Page"),
          backgroundColor: Colors.grey[800],
          leading: RaisedButton.icon(
            onPressed: () => {
              homeKey.currentState.openDrawer(),
            },
            icon: Icon(
              Icons.menu,
            ),
            label: Text("Menu"),
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.grey[800],
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Text("Preet Shah\nWelcomes you.")
                ),
                ListTile(
                  title: Text("Profile"),
                  leading: Icon(Icons.person, color: Colors.white,),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/profile');
                  },
                ),
                ListTile(
                  title: Text("Skills"),
                  leading: Icon(Icons.create, color: Colors.white,),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/skills');
                  },
                ),
                ListTile(
                  title: Text("Education"),
                  leading: Icon(Icons.school, color: Colors.white,),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/education');
                  },
                ),
                ListTile(
                  title: Text("Projects"),
                  leading: Icon(Icons.build, color: Colors.white,),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/projects');
                  },
                ),
                ListTile(
                  title: Text("Contact Me"),
                  leading: Icon(Icons.phone, color: Colors.white,),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/contact');
                  },
                )
              ],
            ),
          ),
        ),
        body: Text("Home Page"),
      ),
    );
  }
}