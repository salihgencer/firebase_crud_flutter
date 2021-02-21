import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:journal_app/src/models/entry.dart';
import 'package:journal_app/src/providers/entry_provider.dart';
import 'package:provider/provider.dart';

class EntryScreen extends StatefulWidget {
  final Entry entry;

  const EntryScreen({Key key, this.entry}) : super(key: key);

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  final entryController = TextEditingController();

  @override
  void dispose() {
    entryController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final entryProvider = Provider.of<EntryProvider>(context, listen: false);
    if (widget.entry != null) {
      entryController.text = widget.entry.entry;
      entryProvider.loadAll(widget.entry);
    } else {
      entryProvider.loadAll(null);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(formatDate(entryProvider.date, [MM, ' ', d, ', ', yyyy])),
        actions: [
          IconButton(
            onPressed: () {
              _picked(context).then((value) {
                entryProvider.changeDate = value;
              });
            },
            icon: Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Daily Entry",
                border: InputBorder.none,
              ),
              minLines: 10,
              maxLines: 12,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("Save"),
            ),
            widget.entry != null
                ? RaisedButton(
                    onPressed: () {},
                    child: Text("Save"),
                  )
                : SizedBox(),
          ],
        ),
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
