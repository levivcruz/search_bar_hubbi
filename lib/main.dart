import 'package:flutter/material.dart';
import 'package:search_filter/ui/widget/search_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contatos',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SearchPage(),
    );
  }
}
