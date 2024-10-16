import 'package:flutter/material.dart';
import 'package:mindlink_app/screens/home_screen.dart';
import 'package:mindlink_app/utils/dynamic_link_handler.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DynamicLinkHandler.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dynamic Links App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
