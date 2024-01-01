import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchlist/providersearch/newbankscreen.dart';
import 'package:searchlist/providersearch/search_provider.dart';

class SearchScreenProvider extends StatefulWidget {
  const SearchScreenProvider({super.key});

  @override
  State<SearchScreenProvider> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreenProvider> {
  List<String> items = [];
  final _textcontroller = TextEditingController();
  String? bankname;

  @override
  void initState() {
    bankname = 'Choose a bank';

    super.initState();
  }

  Future eachbank(String item) async {
    final authmodel =
        Provider.of<SearchProvider>(context, listen: false).bankname(item);
  }

  Future newlistitem(String newsort) async {
    final authmode2 =
        Provider.of<SearchProvider>(context, listen: false).newlist(newsort);
  }

  @override
  Widget build(BuildContext context) {
    final authmodel =
        Provider.of<SearchProvider>(context, listen: true).listofname;
    items = authmodel!;
    
    return Scaffold(
      body: SafeArea(
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
                newlistitem(_textcontroller.text);
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
            ...items.map((
              banks,
            ) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    eachbank(banks);
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) {
                        return const NewBank();
                      }),
                    );
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
      ),
    );
  }
}
