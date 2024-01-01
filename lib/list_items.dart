import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchlist/provider.dart';

class ListOfItems extends StatefulWidget {
  const ListOfItems({super.key});

  @override
  State<ListOfItems> createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  List<String> fistnames = [];

  Future removename(int index) async {
    final authmodel = await Provider.of<Auth>(context, listen: false).removename(index);
  }

  @override
  Widget build(BuildContext context) {
    final authmodel = Provider.of<Auth>(context, listen: true).listofname;
    fistnames = authmodel!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: fistnames.length,
                  itemBuilder: (ctx, index) {
                    return Column(children: [
                      Row(children: [
                        Text(fistnames[index]),
                        InkWell(
                          onTap: () {
                            removename(index);
                          },
                          child: const Icon(Icons.delete),
                        ),
                      ]),
                    ]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
