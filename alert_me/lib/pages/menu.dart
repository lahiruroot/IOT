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
        backgroundColor: Colors.amber[600],
        child: Icon(
          Icons.info,
          size: 40,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      backgroundColor: Colors.white70,
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
          ],
        ),
      ),
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Image.asset(
            "images/titile.png",
            height: 150.0,
            width: 151.0,
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Container(
                  color: Colors.amber[600],
                  width: 500.0,
                  height: 40.0,
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
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.router, size: 50),
                      title: Text('My Device List',
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                      subtitle: Text('Device status....',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontStyle: FontStyle.italic)),
                    ),
                    Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.router),
                          title: Text('Devices 01'),
                          subtitle: Text('online'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => device()));
                          },
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.router),
                          title: Text('Devices 02'),
                          subtitle: Text('online'),
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
