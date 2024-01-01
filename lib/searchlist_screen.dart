import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var items = [
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
  final _textcontroller = TextEditingController();
  String? bankname;
  var founduser = [];
  @override
  void initState() {
    bankname = 'Choose a bank';
    founduser = items;
    super.initState();
  }

  void sortedd() {
    var newlist = [];
    if (_textcontroller.text.isEmpty) {
      newlist = items;
    } else {
      newlist = items
          .where((e) =>
              e.toLowerCase().contains(_textcontroller.text.toLowerCase()))
          .toList();
    }
    setState(() {
      founduser = newlist;
    });
  }

  void selectedbank(String bank) {
    setState(() {
      bankname = bank;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Text(
          'Select Bank'.toUpperCase(),
        ),
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            controller: _textcontroller,
            onChanged: (value) {
              sortedd();
            },
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ...founduser.map((
            banks,
          ) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  selectedbank(banks);
                },
                child: Text(
                  banks.toLowerCase(),
                ),
              ),
            );
          })
        ]),
        const SizedBox(
          height: 30,
        ),
        Text(bankname.toString().toUpperCase()),
      ]),
    );
  }
}
