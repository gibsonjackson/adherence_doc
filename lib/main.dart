import 'package:adherence_doc/src/utils/res/res.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("meaor");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.APP_NAME,
      theme: THEME_DATA,
      // home: HomePage(),
    );
  }
}
