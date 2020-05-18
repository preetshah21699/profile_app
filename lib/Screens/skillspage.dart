import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final skillsRef = FirebaseDatabase.instance.reference().child('Skills');

class SkillsPage extends StatefulWidget {
  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Technical Skills"),
          leading: IconButton(
            onPressed: () => {
              Navigator.pop(context),
            }, 
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
              child: FutureBuilder(
                future: skillsRef.once(),
                builder: (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot){
                  if(snapshot.hasData){
                    List<dynamic> values = snapshot.data.value;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: values == null ? 0 : values.length,
                      padding: EdgeInsets.all(10),
                      itemBuilder: (BuildContext context, int index){
                        return Card(
                          color: Colors.grey[700],
                          margin: EdgeInsets.all(7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(7),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(10),
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new NetworkImage(
                                        values[index]["Image"]
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "${values[index]["Name"]}",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontFamily: "PlayfairDisplay"
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text:"\nType: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: "${values[index]["Type"]}\n"),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontFamily: "PlayfairDisplay"
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text:"Rating: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: "${values[index]["Rating"]}\n"),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontFamily: "PlayfairDisplay"
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text:"Interest: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: "${values[index]["Interest"]}\n"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  else if(snapshot.hasError){
                    return Center(child: Text("Something went Wrong!"),);
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              ),
          //   ],
          // ),
        ),
      ),
    );
  }
}