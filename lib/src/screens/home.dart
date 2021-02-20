import 'package:flutter/material.dart';
import 'package:journal_app/src/screens/entry.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text("Home Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EntryScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
