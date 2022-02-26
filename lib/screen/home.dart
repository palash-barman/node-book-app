import 'package:crud_firestore_app/screen/add_screen.dart';
import 'package:crud_firestore_app/screen/appbar.dart';
import 'package:crud_firestore_app/screen/item_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF665AA8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xf1d1eaf),
        title: AppBarTitle(
          sectionName: ' App ',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddScreen(),),);
        },
        backgroundColor: Colors.orangeAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0,top: 10),
            child: ItemList(),
      ),
    ),
    );
  }
}
