import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

final eduRef = FirebaseDatabase.instance.reference().child('Education');

class EducationPage extends StatefulWidget {
  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Education"),
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
                future: eduRef.once(),
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
                                Text(
                                  "${values[index]["Class"]}\n",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "PlayfairDisplay"
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text:"Institution: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: "${values[index]["Institution"]}\n"),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "PlayfairDisplay"
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text:"Percentage/CGPA: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: "${values[index]["Score"]}\n"),
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
        ),
      )
    );
  }
}