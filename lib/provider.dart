import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  List<String> names = [];

  Future addname(String name) async {
    names.add(name);
  }

  Future removename(int index) async {
    names.remove(names[index]);
    notifyListeners();
  }

  List<String>? get listofname {
    return names;
  }
}
