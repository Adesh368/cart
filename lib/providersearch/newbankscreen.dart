import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchlist/providersearch/search_provider.dart';

class NewBank extends StatefulWidget {
  const NewBank({super.key});

  @override
  State<NewBank> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<NewBank> {
  String bankname = '';
 
 
  
  
  

  @override
  Widget build(BuildContext context) {
     final authmodel =
       Provider.of<SearchProvider>(context, listen: true).choosebank;
        bankname = authmodel;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back)),
            ],
          ),
          Text(bankname.toString()),
        ]),
      ),
    );
  }
}
