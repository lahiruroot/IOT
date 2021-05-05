import 'package:alert_me/pages/login.dart';
import 'package:alert_me/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class singup extends StatefulWidget {
  @override
  _singupState createState() => _singupState();
}

class _singupState extends State<singup> {
  final email = TextEditingController();
  final phno = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  singUp() {
    var defoult = Firebase.initializeApp();
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.text, password: password.text)
        .then((value) {
      FirebaseFirestore.instance.collection("users").doc(value.user.uid).set({
        "name": name.text,
        "email": email.text,
        "phno": phno.text,
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    });
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  //variables
  String _name;
  String _phno;
  String _email;
  String _pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: Image.asset(
            "images/titile.png",
            height: 150.0,
            width: 151.0,
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment(0, -0.8),
                    child: Image.asset("images/reg.png"), //main image
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(24),
                  child: Align(
                    alignment: Alignment(0, -0.8),
                    child: Text(
                      "Register with us",
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: TextFormField(
                    maxLength: 50,
                    decoration: InputDecoration(
                      hintText: "Your Name",
                      errorMaxLines: 1,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    controller: name,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Name cannot be empty ';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _name = val;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: TextFormField(
                    maxLength: 10,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: "Phone number"),
                    controller: phno,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Phone number cannot be empty';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _phno = val;
                    },
                  ),
                ),

                //Email
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: TextFormField(
                    maxLength: 50,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: "Email"),
                    controller: email,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Email cannot be empty';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _email = val;
                    },
                  ),
                ),
                //Password
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: TextFormField(
                    maxLength: 15,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: "Password"),
                    controller: password,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _pass = val;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      singUp();
                    }
                  },
                  child: Text('Sing Up'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
