import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:searchlist/Preference_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preference extends StatefulWidget {
  const Preference({super.key});

  @override
  State<Preference> createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  Future<void> preferencesave() async {
    var userDatas = json.encode({
      'fname': _controller1.text,
      'lname': _controller2.text,
    });
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('userData', userDatas);
   // print('Hello');
  }

  Future<void> prefer() async {
    final prefs = await SharedPreferences.getInstance();

    var extracteduserdata = json.decode(prefs.getString('userData')!);
    setState(() {
      fisrtname = extracteduserdata['fname'];
    });
    print(extracteduserdata);
  }

  @override
  void initState() {
    prefer();
    super.initState();
  }

  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  String? fisrtname;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller1,
        ),
        const SizedBox(
          height: 30,
        ),
        TextField(
          controller: _controller2,
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx,){
             return PreferenceScreen(fisrtname: fisrtname.toString());
            }));
            preferencesave();
          },
          child: Container(
            height: 50,
            width: 200,
            color: Colors.blue,
          ),
        ),
        Text(fisrtname.toString()),
      ],
    );
  }
}
