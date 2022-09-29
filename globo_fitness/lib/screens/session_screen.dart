import 'package:flutter/material.dart';
import '../data/sp_helper.dart';
import '../data/sessions.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  List<Session> sessions = [];
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SpHelper helper = SpHelper();
  @override
  void setState(VoidCallback fn) {
    // ignore: todo
    // TODO: implement setState
    helper.init();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Sessions'),
      ),
      body: ListView(children: getContent()),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showSeesionDialog(context);
          }),
    );
  }

  Future<dynamic> showSeesionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Insert Training Session'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: txtDescription,
                    decoration: const InputDecoration(
                        hintText: 'Insert Description of the Session'),
                  ),
                  TextField(
                    controller: txtDuration,
                    decoration: const InputDecoration(
                        hintText: 'Insert Duration of the Session'),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    txtDescription.text = '';
                    txtDuration.text = '';
                  },
                  child: const Text('Cancel')),
              ElevatedButton(onPressed: saveSession, child: const Text('Save'))
            ],
          );
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String date = '${now.year}-${now.month}-${now.day}';
    Session newSession = Session(
        1, date, txtDescription.text, (int.tryParse(txtDuration.text)) ?? 0);
    helper.writeSession(newSession);
    txtDescription.text = '';
    txtDuration.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    sessions.forEach((session) {
      tiles.add(ListTile(
          title: Text(session.description),
          subtitle:
              Text('${session.date} - duration:${session.duration} min')));
    });
    return tiles;
  }
}
