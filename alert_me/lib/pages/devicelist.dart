import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class setTime1 extends StatefulWidget {
  @override
  _setTime1State createState() => _setTime1State();
}

class _setTime1State extends State<setTime1> {
  final devicenic = TextEditingController();
  final deviceid = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  setTimer() {
    var defoult = Firebase.initializeApp();
    FirebaseFirestore.instance.collection("mydevice").doc().set({
      "date": devicenic.text,
      "time": deviceid.text,
    });
  }

  void clearText() {
    devicenic.clear();
    deviceid.clear();
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  //variables
  String _devicenic;
  String _deviceid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        AssetImage('images/titile.png')), //drawer image getting
              ),
            ),
            ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => profile()));
                }),
            ListTile(
              leading: Icon(Icons.router),
              title: Text("My Devices"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.closed_caption),
              title: Text("Policyes"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text("Sign Out"),
              // onTap: () {
              //   FirebaseAuth.instance.signOut();
              //   Navigator.push(
              //       context, MaterialPageRoute(builder: (context) => login()));
              // },
            ),
            SizedBox(
              height: 80,
            ),
            ListTile(
              leading: Icon(Icons.verified_user_outlined),
              title: Text(
                "Version 1.0",
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Image.asset(
            "images/titile1.png",
            height: 150.0,
            width: 151.0,
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 170,
                width: 340,
                // width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/titile.png')),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        stops: [
                          0.3,
                          0.9
                        ],
                        colors: [
                          Colors.black87.withOpacity(.3),
                          Colors.black87.withOpacity(.1)
                        ]),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        '',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 480,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            TextFormField(
                              cursorColor: Theme.of(context).canvasColor,
                              cursorWidth: 100,
                              maxLength: 10,
                              decoration: InputDecoration(
                                labelText: 'Device Nic Name',
                                labelStyle: TextStyle(
                                  color: Colors.green.shade700,
                                ),
                              ),
                              controller: devicenic,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Give a device nic name';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                _devicenic = val;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              cursorColor: Theme.of(context).canvasColor,
                              cursorWidth: 100,
                              maxLength: 10,
                              decoration: InputDecoration(
                                labelText: 'Device ID',
                                labelStyle: TextStyle(
                                  color: Colors.green.shade700,
                                ),
                              ),
                              controller: deviceid,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Device ID is requried';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                _deviceid = val;
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 40,
                              width: 5,
                              child: MaterialButton(
                                color: Colors.pink,
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setTimer();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.green.shade700,
                                      content: Text(
                                        'Timer set successfully',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      action: SnackBarAction(
                                        label: 'OK',
                                        textColor: Colors.white,
                                        onPressed: () {
                                          clearText();
                                        },
                                      ),
                                    ));
                                  }
                                },
                                height: 65,
                                child: Text(
                                  'Add New Device',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
