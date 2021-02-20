import 'package:flutter/material.dart';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entry Add"),
        actions: [
          IconButton(
            onPressed: () {
              _picked(context).then((value) {
                print(value);
              });
            },
            icon: Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: Center(
        child: Text("Entry page"),
      ),
    );
  }

  Future<DateTime> _picked(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2050),
    );

    if (picked != null) {
      return picked;
    }
  }
}
