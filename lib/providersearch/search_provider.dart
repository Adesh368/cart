import 'dart:math';

import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  List<String> items = [
    'Select Role',
    'STATE SUPERVISOR',
    'STATE COLLATION OFFICER',
    'CSRVS (STATE)',
    'CSRVS (SENATORIAL)',
    'CONSTITUENCY SUPERVISOR',
    'CONSTITUENCY COLLATION OFFICER',
    'CONSTITUENCY TECH SUPPORT',
    'CSRVS(CONSTITUENCY)',
  ];
  List<String> founduser = [];
  String choosebank = 'Choose a Bank';

  List<String>? get listofname {
    founduser = items;
    return founduser;
  }

  Future bankname(String item) async {
    choosebank = item;
    notifyListeners();
  }

  Future newlist(String newsort) async {
    List<String> newlist = [];
    if (newsort.isEmpty) {
      newlist = items;
    } else {
      newlist = items.where((element) {
        return element.toLowerCase().contains(
              newsort.toLowerCase(),
            );
      }).toList();
      founduser = newlist;
    }
    notifyListeners();
  }
}
