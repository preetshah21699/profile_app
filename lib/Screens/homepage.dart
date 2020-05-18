import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';

GlobalKey<ScaffoldState> homeKey = GlobalKey();

final profRef = FirebaseDatabase.instance.reference().child('Profile');
final storeRef = FirebaseStorage.instance.ref().child('images/Preet Shah.jpg');

void getImageURL() async{
  var url;
  url = await storeRef.getDownloadURL();
  // print(url);
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        key: homeKey,
        appBar: AppBar(
          title: Text("Home Page"),
          leading: IconButton(
            onPressed: () => {
              homeKey.currentState.openDrawer(),
            },
            icon: Icon(
              Icons.menu,
            ),
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.grey[800],
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Center(
                    child: Text(
                      "Preet Shah\nWelcomes You.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  )
                ),
                ListTile(
                  title: Text("Technical Skills", style: TextStyle(fontSize: 17),),
                  leading: Icon(Icons.create, color: Colors.white,),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/skills');
                  },
                ),
                ListTile(
                  title: Text("Education", style: TextStyle(fontSize: 17),),
                  leading: Icon(Icons.school, color: Colors.white,),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/education');
                  },
                ),
                ListTile(
                  title: Text("Projects", style: TextStyle(fontSize: 17),),
                  leading: Icon(Icons.build, color: Colors.white,),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/projects');
                  },
                ),
                ListTile(
                  title: Text("Contact Me", style: TextStyle(fontSize: 17),),
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
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(7),
            child: SingleChildScrollView(
              child: FutureBuilder(
                future: profRef.once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot){
                  if(snapshot.hasData){
                    Map<dynamic, dynamic> values = snapshot.data.value;
                    // getImageURL();
                    // print(values["Image"]);
                    return Center(
                      child: Column(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)
                            ),
                            margin: EdgeInsets.all(10),
                            color: Colors.grey[800],
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(10),
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new NetworkImage(values["Image"]),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  "${values["Name"]}",
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  "${values["About"]}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 15,),
                                GestureDetector(
                                  onTap: () => {
                                    launch("tel: ${values["Contact"][0]}")
                                  },
                                  child: Text(
                                    "${values["Contact"][0]}",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15,),
                                GestureDetector(
                                  onTap: () => {
                                    launch("tel: ${values["Contact"][1]}")
                                  },
                                  child: Text(
                                    "${values["Contact"][1]}",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15,),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "PlayfairDisplay"
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text:"Soft Skills: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: "${values["SoftSkills"]}"),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15,),
                                GestureDetector(
                                  onTap: () => {
                                    launch("mailto:${values["Email"]}")
                                  },
                                  child: Text(
                                    "${values["Email"]}",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15,),
                              ],
                            ),
                          ),
                          // Card(
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(18.0)
                          //   ),
                          //   color: Colors.grey[800],
                          //   child: SizedBox(
                          //     height: MediaQuery.of(context).size.height*0.35,
                          //     width: MediaQuery.of(context).size.width*0.95,
                          //     child: GridView.count(
                          //       crossAxisCount: 3,
                          //       children: <Widget>[
                          //         GestureDetector(
                          //           onTap: () => {
                          //             // launch(values["Github"])
                          //           },
                          //           child: Text("GitHub"),
                          //         ),
                          //         GestureDetector(
                          //           onTap: () => {
                          //             // launch(values["Github"])
                          //           },
                          //           child: Text("StackOverflow"),
                          //         ),
                          //         GestureDetector(
                          //           onTap: () => {
                          //             // launch(values["Github"])
                          //           },
                          //           child: Text("LinkedIn"),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    );
                  }
                  else if(snapshot.hasError){
                    return Center(child: Text("Something went Wrong!"),);
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
      ),
    );
  }
}