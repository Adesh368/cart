import 'package:flutter/material.dart';
import 'package:searchlist/preference.dart';

class PreferenceScreen extends StatelessWidget {
  const PreferenceScreen({
    super.key,
    required this.fisrtname,
  });

  final String fisrtname;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back)),
                  //SizedBox(width: 100,),
                Text('NewScreen',),
              ],
            ),
            Text(fisrtname),
          ],
        ),
      ),
    );
  }
}
