import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:preet_shah/Screens/carousel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

final projRef = FirebaseDatabase.instance.reference().child('Projects');

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Projects"),
          leading: IconButton(
            onPressed: () => {
              Navigator.pop(context),
            }, 
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
            child: FutureBuilder(
              future: projRef.once(),
              builder: (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot){
                if(snapshot.hasData){
                  List<dynamic> values = snapshot.data.value;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: values == null ? 0 : values.length,
                    padding: EdgeInsets.all(10),
                    itemBuilder: (BuildContext context, int index){
                      List<dynamic> images = values[index]["Images"];
                      return Card(
                          color: Colors.grey[700],
                          margin: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "${values[index]["Title"]}\n",
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                RichText(
                                  // textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "PlayfairDisplay"
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text:"Description: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: "${values[index]["Description"]}\n"),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "PlayfairDisplay"
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text:"Techstack: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: "${values[index]["Techstack"]}\n"),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => {
                                    launch("${values[index]["Link"]}")
                                  },
                                  child: Text(
                                    "${values[index]["Link"]}\n",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 17,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                          MyCarousel(title: values[index]["Title"], images: values[index]["Images"],)
                                      )
                                    )
                                  },
                                  child: CarouselSlider(
                                    items: images.map((e) => Container(
                                      padding: EdgeInsets.all(10),
                                      child: Center(
                                        child: Image.network(
                                          e, 
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    )).toList(),
                                    options: CarouselOptions(
                                      autoPlay: true,
                                      // height: MediaQuery.of(context).size.height*0.44,
                                      height: MediaQuery.of(context).size.height*values[index]["height"],
                                      // enableInfiniteScroll: false,
                                    )
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