import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchlist/list_items.dart';
import 'package:searchlist/provider.dart';

class ButtonController extends StatefulWidget {
  const ButtonController({super.key});

  @override
  State<ButtonController> createState() => _ButtonControllerState();
}

class _ButtonControllerState extends State<ButtonController> {
  final _controller1 = TextEditingController();

  Future addname() async {
    final authmodel = await Provider.of<Auth>(context, listen: false)
        .addname(_controller1.text);
    setState(() {
      _controller1.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _controller1,
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                addname();
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) {
                    return const ListOfItems();
                  }),
                );
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.blue,
              ),
            ),
            Text(''),
          ],
        ),
      ),
    );
  }
}
