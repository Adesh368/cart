import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchlist/button_controller.dart';
import 'package:searchlist/preference.dart';
import 'package:searchlist/provider.dart';
import 'package:searchlist/providersearch/list_items.dart';
import 'package:searchlist/providersearch/search_provider.dart';
import 'package:searchlist/searchlist_screen.dart';
import 'package:searchlist/singlebutton.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          //return ChangeNotifierProvider.value(
          create: (ctx) => Auth(),
          // value:Products(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => const MaterialApp(
          home: ButtonController(),
        ),
      ),
    ),
  );
}
