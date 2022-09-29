import 'package:shared_preferences/shared_preferences.dart';
import './sessions.dart';
import 'dart:convert';

class SpHelper<T> {
  static late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future writeSession(Session session) async {
    prefs.setString(session.id.toString(), json.encode(session.toJson()));
  }

  List<Session> getSessions() {
    Set<String> keys = prefs.getKeys();

    //for (var key in keys) {

    // }

    return keys
        .map((String key) =>
            Session.fromJson(json.decode(prefs.getString(key) ?? '')))
        .toList();
  }
}
