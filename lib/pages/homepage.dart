import 'package:coast_hub/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  int _currentIndex = 0;

  signOut() async {
    await _firebaseAuth.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 45.0,
        title: Text("Coast Hub ChatBot",
        style: TextStyle(color: Colors.white),),
        actions: <Widget>[
           FlatButton(
             onPressed: () {
               auth.signOut().then((onValue) {
                 Navigator.of(context).pushReplacementNamed('/login');
               });
             },
            child:Text("Sair", style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),

      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('ChatBot'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            title: Text('Configurações'),
          ),
        ],
         onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        }
      ),
    );
  }
}
