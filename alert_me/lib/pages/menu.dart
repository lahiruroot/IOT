import 'package:alert_me/external%20pages/device.dart';
import 'package:alert_me/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:alert_me/external pages/cards.dart' as Cards;
import 'package:firebase_auth/firebase_auth.dart';

class menu extends StatefulWidget {
  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[600],
        child: Icon(
          Icons.info,
          size: 25,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://picsum.photos/id/1/600/300")), //drawer image getting
                ),
                child: Text("data")),
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
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => login()));
              },
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
          elevation: 6,
          shape: ContinuousRectangleBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(90.0),
            ),
          ),
          title: Image.asset(
            "images/titile1.png",
            height: 80.0,
            width: 160.0,
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 170,
                width: 340,
                // width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/titile1.jpg')),
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
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.2)
                        ]),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'News Feed',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              (Cards.cardlist(context)),
              SizedBox(
                height: 20,
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.pink[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(
                        Icons.router,
                        size: 50,
                        color: Colors.white,
                      ),
                      title: Text('My Device List',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      subtitle: Text('Device status....',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontStyle: FontStyle.italic)),
                    ),
                    Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.router,
                            color: Colors.white,
                          ),
                          title: Text('Devices 01',
                              style: TextStyle(color: Colors.white)),
                          subtitle: Text('online',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyDevice()));
                          },
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(
                            Icons.router,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Devices 02',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text('online',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {},
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
