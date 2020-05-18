import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final msgRef = FirebaseDatabase.instance.reference().child('Messages');
GlobalKey<ScaffoldState> _contactKey = GlobalKey();
String contact, message;

class ContactMe extends StatefulWidget {
  @override
  _ContactMeState createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _contactKey,
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Contact Me"),
          leading: IconButton(
            onPressed: () => {
              Navigator.pop(context),
            }, 
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: new SingleChildScrollView(
            child: new Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    onSaved: (value) => contact = value,
                    toolbarOptions: ToolbarOptions(
                      paste: true,
                      selectAll: true,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      hintText: "Enter Email/Phone Number...",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.grey[800],
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.grey[800],
                        )
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.grey[800],
                        )
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    onSaved: (value) => message = value,
                    maxLines: 6,
                    textCapitalization: TextCapitalization.sentences,
                    minLines: 2,
                    toolbarOptions: ToolbarOptions(
                      paste: true,
                      selectAll: true,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      hintText: "Enter Message...",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.grey[800],
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.grey[800],
                        )
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.grey[800],
                        )
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30,),
                  RaisedButton(
                    padding: EdgeInsets.all(10),
                    onPressed: () {
                      // Validate returns true if the form is valid, otherwise false.
                      if (_formKey.currentState.validate()) {
                        final form = _formKey.currentState;
                        form.save();
                        msgRef.push().set({
                          'Contact': "${contact.toString()}",
                          'Message': "${message.toString()}"
                        })
                        .then((_){
                          _contactKey.currentState.showSnackBar(SnackBar(content: Text('Message Sent!')));
                        });
                      }
                    },
                    color: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      'Send Message',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}