import 'package:flutter/material.dart';

class SingleButtonController extends StatefulWidget {
  const SingleButtonController({super.key});

  @override
  State<SingleButtonController> createState() => _SingleButtonControllerState();
}

class _SingleButtonControllerState extends State<SingleButtonController> {
  final _textcontroller = TextEditingController();
  bool containervisibility = true;

  @override
  void initState() {
    containervisibility = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: screenwidth - 100,
        //height: screenheight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (containervisibility == true) {
                  setState(() {
                    containervisibility = false;
                  });
                } else {
                  setState(() {
                    containervisibility = true;
                  });
                }
              },
              child: const Icon(Icons.search),
            ),
            const SizedBox(
              height: 30,
            ),
            if (containervisibility)
              Container(
                height: 50,
                // width: 300,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: _textcontroller,
                  onChanged: (value) {
                    //sorting();
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
