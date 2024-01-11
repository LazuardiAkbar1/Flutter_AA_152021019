import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/home.dart';
import 'package:flutter_todo_app/screens/navigation/bmi.dart';
import 'package:flutter_todo_app/screens/navigation/kalkulator.dart';
import 'package:flutter_todo_app/screens/navigation/timbangan.dart';
import 'package:flutter_todo_app/screens/navigation/tukar_uang.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 139, 53, 82),
            ),
            child: Text(
              'Navigation Button',
              style: TextStyle(
                color: Colors.lime.shade400,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            leading: Icon(
              Icons.home,
              color: Colors.red,
            ),
          ),
            ListTile(
            title: Text('Kalkulator'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Kalkulator1()),
              );
            },
            leading: Icon(
              Icons.calculate,
              color: Colors.red,
            ),
          ),
            ListTile(
            title: Text('Nuker Uang'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TukarUang()),
              );
            },
            leading: Icon(
              Icons.home,
              color: Colors.red,
            ),
          ),
          ListTile(
            title: Text('BMI'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BMI()),
              );
            },
            leading: Icon(
              Icons.three_p,
              color: Colors.green,
            ),
          ),
          ListTile(
            title: Text('Streaming Data USD'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeightScaleApp()),
              );
            },
            leading: Icon(
              Icons.home,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}